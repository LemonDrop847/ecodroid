import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

import '../components/buttondecor.dart';
import 'ProfilePage.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 71, 68),
      // ignore: prefer_const_constructors
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
            ),
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 100.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.id);
                },
                icon: Icon(Icons.person))
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FireMap(),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: ButtonDecor(
                width: 257,
                height: 59,
                title: 'Report',
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                colour: const Color.fromARGB(255, 84, 160, 56),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FireMap extends StatefulWidget {
  const FireMap({super.key});

  @override
  State<FireMap> createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  late GoogleMapController _mapController;
  late TextEditingController _latitudeController, _longitudeController;

  // firestore init
  final _firestore = FirebaseFirestore.instance;
  late GeoFlutterFire geo;
  double? poslong, poslat;
  late Stream<List<DocumentSnapshot>> stream;
  final radius = BehaviorSubject<double>.seeded(1.0);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    _latitudeController = TextEditingController();
    _longitudeController = TextEditingController();

    geo = GeoFlutterFire();
    GeoFirePoint center = geo.point(latitude: 20, longitude: 20);
    stream = radius.switchMap((rad) {
      var collectionReference = _firestore.collection('locations');
      return geo.collection(collectionRef: collectionReference).within(
          center: center, radius: rad, field: 'position', strictMode: true);
    });
  }

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    radius.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(20.27774, 85.77761),
              zoom: 15,
            ),
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            compassEnabled: true,
            onCameraMove: (CameraPosition cp) {
              LatLng center = cp.target;
              poslong = center.longitude;
              poslat = center.latitude;
            },
          ),
          Positioned(
              bottom: 50,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.pin_drop),
                onPressed: () => _addPoint(poslat!, poslong!),
              ))
        ],
      ),
    );
  }

  void _addPoint(double lat, double lng) {
    GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
    _firestore
        .collection('locations')
        .add({'name': 'random name', 'position': geoFirePoint.data}).then((_) {
      print('added ${geoFirePoint.hash} successfully');
    });
  }

  void _addMarker(double lat, double lng) {
    final id = MarkerId(lat.toString() + lng.toString());
    final _marker = Marker(
      markerId: id,
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      infoWindow: InfoWindow(title: 'latLng', snippet: '$lat,$lng'),
    );
    setState(() {
      markers[id] = _marker;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
//      _showHome();
      //start listening after map is created
      stream.listen((List<DocumentSnapshot> documentList) {
        _updateMarkers(documentList);
      });
    });
  }

  void _updateMarkers(List<DocumentSnapshot> documentList) {
    for (var document in documentList) {
      Map<String, dynamic>? snapData = document.data() as Map<String, dynamic>?;
      final GeoPoint point = snapData!['position']['geopoint'];
      _addMarker(point.latitude, point.longitude);
    }
  }
}
