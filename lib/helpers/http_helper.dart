import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const DOMAINHOST = 'http://10.0.2.2:8000/';
const ATTENDANCE_ENDPOINT = DOMAINHOST + 'attendance';
const PURCHASE_REQUEST_ENDPOINT = DOMAINHOST + 'purchaseRequest';
const LOGIN_ENDPOINT = DOMAINHOST + 'login';
const PROJECTS_ENDPOINT = DOMAINHOST + 'projects';
const WORKMENS_ENDPOINT = DOMAINHOST + 'workmens';
const REQUEST_ENDPOINT = DOMAINHOST + 'request';

class HttpHelper {
  static Future<http.Response> post(Uri url, Map<String, dynamic> body,
      {String? bearerToken}) async {
//    print('HTTP POST: $url');
    return (await http.post(url, body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }

  static Future<http.Response> put(Uri url, Map<String, dynamic> body,
      {String? bearerToken}) async {
    return (await http.put(url, body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }

  static Future<http.Response> get(Uri url, {String? bearerToken}) async {
    return await http.get(url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $bearerToken'});
  }
}
