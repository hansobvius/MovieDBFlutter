import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/table_helper/MoviesResultsTable.dart';
import 'package:http/http.dart' as http;


import 'service_api_test.mocks.dart';

const List<String> categories = ["popular", "top_rated", "upcoming"];
const String TOKEN = '38eeef9aa65a725363ccb5cde9df6342';
const String BASE_URL = 'https://api.themoviedb.org/3/movie/';
const String DEFAULT_LANGUAGE = 'en-US';
const int DEFAULT_PAGE = 1;

class _MyHttpOverrides extends HttpOverrides {}

@GenerateMocks([ServiceApi])
void main() {

  MockServiceApi? mockApi;
  ServiceApi? api;
  HttpOverrides.global = _MyHttpOverrides();

  group('SERVICE API GROUP TEST', () {

    setUp(() {
      mockApi = MockServiceApi();
      api = ServiceApi();
    });

    test('MOVIE REQUEST OBJECT TYPE TEST', () async {
      when(mockApi!.serviceApi('popular')).thenAnswer((movies) async =>
          Future.value(movies as MovieModel));
    });

    test('MOVIE REQUEST OBJECT RESPONSE TEST', () async {
      await api!.serviceApi("popular").then((value) => {
        expect(value.results.isNotEmpty, true)
      });
    });

    tearDown(() {
      api = null;
      mockApi = null;
    });
  });
}