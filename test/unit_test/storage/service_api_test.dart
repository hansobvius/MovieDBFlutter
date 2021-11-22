import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb_flutter/application/service/ServiceApi.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/table_helper/MoviesResultsTable.dart';

import 'service_api_test.mocks.dart';

const List<String> categories = ["popular", "top_rated", "upcoming"];
const String TOKEN = '38eeef9aa65a725363ccb5cde9df6342';
const String BASE_URL = 'https://api.themoviedb.org/3/movie/';
const String DEFAULT_LANGUAGE = 'en-US';
const int DEFAULT_PAGE = 1;

@GenerateMocks([ServiceApi])
void main() {



  MockServiceApi? api;

  group('SERVICE API GROUP TEST', () {

    setUp(() {
      api = MockServiceApi();
    });

    test('MOVIE REQUEST TEST', () async {
      // when(api!.serviceApi('popular')).thenAnswer((movies) {
      //   expect((movies as List<MoviesResultsTable>).isNotEmpty, true);
      // });
    });

    tearDown(() {
      api = null;
    });
  });
}