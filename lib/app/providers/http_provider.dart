import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

// Resources
import 'package:ceiba/app/resources/http_resource.dart';

// Stores
import 'package:ceiba/app/store/config.dart';

class HttpProvider implements HttpResource {

  final Client _client = Client();
  final Config _config = Config();

  String _baseUrl = '';
  
  HttpProvider() {
    _baseUrl = _config.prod ? _config.urlBackProd : _config.urlBackDev;
  }

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> _headers = {
      "content-type": "application/json; charset=UTF-8",
      "Accept": "application/json"
    };
    return _headers;
  }


  @override
  Future<Response> httpGet(String url) async {
    final Uri uri = Uri.parse(_baseUrl + url);
    return _client.get(
      uri,
      headers: await _getHeaders(),
    );
  }
  
  @override
  Future<Response> httpPost(String url, Map body) async {
    final Uri uri = Uri.parse(_baseUrl + url);
    return _client.post(
      uri,
      headers: await _getHeaders(),
      body: json.encode(body)
    );
  }

  
}