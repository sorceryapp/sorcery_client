import 'package:dio/dio.dart';

class Client {
  Client({Dio? httpClient}) : httpClient = httpClient ?? Dio();
  final Dio httpClient;
  final baseUrl = 'http://localhost:3000';
}
