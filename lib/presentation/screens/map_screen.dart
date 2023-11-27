import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grs/utils/app_colors.dart';
import 'package:grs/utils/app_icons.dart';
import 'package:grs/utils/app_images.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ValueNotifier<String> _deviceID = ValueNotifier<String>("");
  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  void initState() {
    super.initState();

    myDeviceId();
  }

  void myDeviceId() async {
    String id = "";
    _deviceID.value = await _getDeviceId();
  }

  Future<String> _getDeviceId() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId; // Número de série
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // Número de série
      } else {
        return "ERROR";
      }
    } catch (e) {
      return "Error";
    }
  }

  List<Marker> getMarkers() {
    List<Marker> markers = [
      Marker(
        markerId: MarkerId("Marker 1"),
        position: LatLng(-8.9039071, 13.1833099),
      ),
      Marker(
        markerId: MarkerId("Marker 2"),
        position: LatLng(-8.9039072, 13.1853990),
      ),
      Marker(
        markerId: MarkerId("Marker 3"),
        position: LatLng(-8.9039072, 13.1863990),
      ),
      Marker(
        markerId: MarkerId("Marker 4"),
        position: LatLng(-8.9139072, 13.1963990),
      ),
    ];

    return markers;
  }

  final _databaseReference =
      FirebaseFirestore.instance.collection('geolocation');

  late StreamSubscription<Position> _positionStream;
  Position? _currentPosition;

  void _initLocationStream() async {
    var status = await Geolocator.requestPermission();
    if (_deviceID.value != "" && status != LocationPermission.deniedForever) {
      _positionStream =
          Geolocator.getPositionStream().listen((Position position) {
        _databaseReference
            .where("device_id",
                isEqualTo: _deviceID.value.toString().toUpperCase())
            .limit(1)
            .get()
            .then((snapshot) async {
          String docId = "";
          if (snapshot.docs.length == 0) {
            final data = _databaseReference.add({
              'device_id': _deviceID.value.toString().toUpperCase(),
              'latitude': position.latitude,
              'longitude': position.longitude,
              'date': DateTime.now(),
              'id': "",
            });

            String documentId = await data.then((value) => value.id);
            docId = documentId;
            _databaseReference.doc(docId.toString()).update({
              'id': docId,
            });
          } else {
            _databaseReference.doc(snapshot.docs.single.data()['id']).update({
              'latitude': position.latitude,
              'longitude': position.longitude,
            });
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _initLocationStream();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.ARROW_LEFT,
              width: 40,
              color: Colors.white,
            ),
            Text(
              "DISPOSITIVOS/VIGILANTES",
              style: GoogleFonts.russoOne(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("geolocation")
                  .where("device_id", isEqualTo: "D2E42F4F8FB0290D")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("PROCESSANDO...");
                }

                double latitude = double.parse(
                    snapshot.data!.docs.single['latitude'].toString());
                double longitude = double.parse(
                    snapshot.data!.docs.single['longitude'].toString());

                // print("Latitude ${snapshot.data!.docs.single['latitude']}");
                // //print("Latitude $longitude");

                // print("Docs ${snapshot.data!.docs.single.toString()}");

                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-8.9039071, 13.1833099),
                    zoom: 14,
                  ),
                  circles: Set<Circle>.of([
                    Circle(
                      circleId: CircleId("myCircle"),
                      center: LatLng(-8.9040067, 13.18331),
                      radius: 10,
                      fillColor: Colors.red.withOpacity(0.8),
                      strokeWidth: 2,
                      strokeColor: Colors.red,
                      onTap: () {
                        print("AGÊNCIA");
                      },
                    ),
                    Circle(
                      circleId: CircleId("myCircle2"),
                      center: LatLng(-8.9039072, 13.1999999),
                      radius: 200,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeWidth: 2,
                      strokeColor: Colors.blue,
                    ),
                    Circle(
                      circleId: CircleId("myCircle3"),
                      center: LatLng(-8.9039072, 13.1953990),
                      radius: 200,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeWidth: 2,
                      strokeColor: Colors.blue,
                    ),
                    Circle(
                      circleId: CircleId("myCircle4"),
                      center: LatLng(-8.9139072, 13.1963990),
                      radius: 200,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeWidth: 2,
                      strokeColor: Colors.blue,
                    ),
                    Circle(
                      circleId: CircleId("myCircle5"),
                      center: LatLng(-8.9339072, 13.1963990),
                      radius: 200,
                      fillColor: Colors.blue.withOpacity(0.5),
                      strokeWidth: 2,
                      strokeColor: Colors.blue,
                    ),
                  ]),
                  mapType: MapType.satellite,
                  myLocationEnabled: false,
                  markers: {
                    Marker(
                      markerId: MarkerId("Marker 1"),
                      position: LatLng(latitude, longitude),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              height: 150,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.black12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "LELA FIETA",
                                            style: GoogleFonts.rammettoOne(
                                              color: AppColors.MAIN_COLOR,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "ONLINE",
                                              style: GoogleFonts.russoOne(
                                                color: AppColors.GREEN_COLOR,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColors.MAIN_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          "AVALIAR",
                                          style: GoogleFonts.russoOne(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: AppColors.MAIN_COLOR,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          side: BorderSide(
                                              width: 2,
                                              color: AppColors.MAIN_COLOR),
                                        ),
                                        minimumSize: Size(200, 0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "CONTACTAR",
                                              style: GoogleFonts.rajdhani(
                                                color: AppColors.WHITE_COLOR,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          FittedBox(
                                            child: SvgPicture.asset(
                                              AppIcons.PHONE_CALLING,
                                              width: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Marker(
                      markerId: MarkerId("Marker 2"),
                      position: LatLng(-8.9039072, 13.1999999),
                    ),
                    Marker(
                      markerId: MarkerId("Marker 3"),
                      position: LatLng(-8.9039072, 13.1953990),
                    ),
                    Marker(
                      markerId: MarkerId("Marker 4"),
                      position: LatLng(-8.9139072, 13.1963990),
                    ),
                    Marker(
                      markerId: MarkerId("Marker 5"),
                      position: LatLng(-8.9339072, 13.1963990),
                    ),
                  },
                );
              }),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Cor da sombra
                    spreadRadius: 1, // Espalhamento da sombra
                    blurRadius: 3, // Desfoque da sombra
                    offset:
                        Offset(0, 4), // Deslocamento da sombra (eixo x, eixo y)
                  )
                ],
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Dispositivos Fora do raio: ',
                        style: GoogleFonts.russoOne(
                          color: AppColors.MAIN_COLOR,
                        ), // Estilo de texto padrão
                        children: <TextSpan>[
                          TextSpan(
                            text: '3',
                            style: GoogleFonts.russoOne(
                              color: AppColors.RED_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Dispositivos Dentro do raio: ',
                        style: GoogleFonts.russoOne(
                          color: AppColors.MAIN_COLOR,
                        ), // Estilo de texto padrão
                        children: <TextSpan>[
                          TextSpan(
                            text: '30',
                            style: GoogleFonts.russoOne(
                              color: Color.fromARGB(255, 16, 106, 19),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
