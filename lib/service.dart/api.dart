import 'dart:convert';
import 'package:api_consume_task/config.dart';
import 'package:api_consume_task/model/geoCodeModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeoCodeProvider with ChangeNotifier {
  static Future getGeoCode() async {
    const String url =
        '$G_API_BASE_URL/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json';

    final Uri uriWithParams = Uri.parse(url).replace(queryParameters: {
      'alt': 'media',
      'token': 'bfd28b0f-06d7-4d25-8d45-e218466c7449',
    });
    final response = await http.get(uriWithParams);

    var responseBody = json.decode(response.body);
    GeoCodeDetailsModel geoCodeDetails =
        GeoCodeDetailsModel.fromJson(responseBody);

    return geoCodeDetails;
  }
}
