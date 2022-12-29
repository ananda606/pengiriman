import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pengiriman/common/constants.dart';
import 'package:pengiriman/widgets/map_arguments.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class DeliveryMaps extends StatefulWidget {
  static const routeName = '/delivery_map';
  
  double latDes, lngDes, latLoc, lngLoc;
  DeliveryMaps(this.latDes, this.lngDes, this.latLoc, this.lngLoc);
  @override
  _DeliveryMapsState createState() => _DeliveryMapsState();
}

class _DeliveryMapsState extends State<DeliveryMaps> {
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  //late MapArguments mapArguments = widget.mapArguments;

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  double distance = 0.0;

  @override
  void initState() {
    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(LatLng(widget.latLoc, widget.lngLoc).toString()),
      position: LatLng(widget.latLoc, widget.lngLoc), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Starting Point ',
        snippet: '$distance',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(2), //Icon for Marker
    ));

    markers.add(Marker(
      //add distination location marker
      markerId: MarkerId(LatLng(widget.latDes, widget.lngDes).toString()),
      position: LatLng(widget.latDes, widget.lngDes), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Destination Point ',
        snippet: '$distance',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    getDirections(); //fetch direction polylines from Google API

    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(widget.latLoc, widget.lngLoc),
      PointLatLng(widget.latDes, widget.lngDes),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    // print('latDes in maparguments ${widget.mapArguments.latDes}');
    return Scaffold(
        body: Stack(children: [
      GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: LatLng(widget.latLoc, widget.lngLoc), //initial position
          zoom: 14.0, //initial zoom level
        ),
        markers: markers, //markers to show on map
        polylines: Set<Polyline>.of(polylines.values), //polylines
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
      Positioned(
          bottom: 100,
          left: 90,
          child: Container(
              child: Card(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "total jarak: " + distance.toStringAsFixed(2) + " KM",
                    )),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.timer_sharp),
                      Text((distance / 80).toStringAsFixed(2)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.monetization_on),
                      Text((distance*2000).toStringAsFixed(2)),
                    ],
                  ),
                )
              ],
            ),
          ))),
      Positioned(
        bottom: 10,
        left: 10,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Center(
              child: IconButton(
            onPressed: () async {
              await launchUrl(Uri.parse(
                  'google.navigation:q= ${widget.latDes}, ${widget.lngDes}'));
              // await launchUrl(Uri.parse(
              //     'google.navigation:q=${widget.lat}, ${widget.lng}AIzaSyBjKu1K9-Dwi1eM59G6hVkm16sEMadwz1M'));
            },
            icon: Icon(Icons.navigation_rounded),
            color: Colors.white,
          )),
        ),
      )
    ]));
  }
}
