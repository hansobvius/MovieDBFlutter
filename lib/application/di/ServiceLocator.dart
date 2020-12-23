import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/repository/MovieRepository.dart';
import 'package:moviedb_flutter/application/service/IService.dart';

abstract class ServiceLocator{

  static IService provideIService() => IService();

  static MovieViewModel provideMovieViewModel() => MovieViewModel();

  static MovieRepository provideMovieRepository() => MovieRepository();
}