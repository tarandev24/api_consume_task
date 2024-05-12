import 'package:api_consume_task/common_widgets/infoTile.dart';
import 'package:api_consume_task/model/geoCodeModel.dart';
import 'package:api_consume_task/service.dart/api.dart';
import 'package:api_consume_task/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeographicalCodeScreen extends StatefulWidget {
  const GeographicalCodeScreen({super.key});
  static const routeName = '/geo_code';

  @override
  State<GeographicalCodeScreen> createState() => _GeographicalCodeScreenState();
}

class _GeographicalCodeScreenState extends State<GeographicalCodeScreen> {
  Future<GeoCodeDetailsModel> _getGeoCode() async {
    GeoCodeDetailsModel geoInfo = await GeoCodeProvider.getGeoCode();
    return geoInfo;
  }

  @override
  Widget build(BuildContext context) {
    CommonMediaQuery.initialize(context);
    return Scaffold(
      body: FutureBuilder(
          future: _getGeoCode(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              GeoCodeDetailsModel geoCodeDetails = snapshot.data;

              return ListView.builder(
                itemCount: geoCodeDetails.routes!.length,
                itemBuilder: (context, index) {
                  var route = geoCodeDetails.routes![index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bounds',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'North East',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lat: ${route.bounds!.northeast!.lat}'),
                            Text('Lng: ${route.bounds!.northeast!.lng}'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'South West',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lat: ${route.bounds!.southwest!.lat}'),
                            Text('Lng: ${route.bounds!.southwest!.lng}'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Legs',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: CommonMediaQuery.screenHeight / 2,
                          child: ListView.builder(
                              itemCount: route.legs?.length,
                              itemBuilder: (context, index) {
                                var leg = route.legs![index];
                                return Column(
                                  children: [
                                    InfoTile(
                                        label: 'Start Address',
                                        value: '${leg.startAddress}'),
                                    InfoTile(
                                        label: 'End Address',
                                        value: '${leg.endAddress}'),
                                    InfoTile(
                                        label: 'Distance',
                                        value: '${leg.distance!.text}'),
                                    InfoTile(
                                        label: 'Duration',
                                        value: '${leg.duration!.text}'),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
    );
  }
}
