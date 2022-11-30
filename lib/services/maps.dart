import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

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
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              GoogleMap(
                onMapCreated: onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(20.27774, 85.77761),
                  zoom: 15,
                ),
                myLocationEnabled: true,
                mapType: MapType.hybrid,
                mapToolbarEnabled: true,
                compassEnabled: true,
                markers: Set<Marker>.of(markers.values),
                onCameraMove: (CameraPosition cp) {
                  LatLng center = cp.target;
                  poslong = center.longitude;
                  poslat = center.latitude;
                },
              ),
              const Center(child: Icon(Icons.add)),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 10,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Icon(Icons.pin_drop),
            onPressed: () => _addPoint(poslat!, poslong!),
          ),
        ),
      ],
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
//      _showHome();
      //start listening after map is created
      stream.listen((List<DocumentSnapshot> documentList) {
        _updateMarkers(documentList);
      });
    });
  }

  void _addPoint(double lat, double lng) {
    GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
    _firestore
        .collection('locations')
        .add({'longitude': lng, 'latitude': lat}).then((_) {
      // ignore: avoid_print
      print('added ${geoFirePoint.hash} successfully');
    });
  }

  void _addMarker(double lat, double lng) {
    final id = MarkerId(lat.toString() + lng.toString());
    final marker = Marker(
      markerId: id,
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: 'Tree Location', snippet: '$lat,$lng'),
    );

    setState(() {
      markers[id] = marker;
    });
  }

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('locations');

  Future<void> _updateMarkers(List<DocumentSnapshot> documentList) async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allData = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    for (int i = 0; i < allData.length; i++) {
      double latitude = allData[i].values.first;
      double longitude = allData[i].values.last;
      _addMarker(latitude, longitude);
    }
  }
}
