import 'package:moviedb_flutter/application/business_logic/view_model/movie_view_model.dart';
import 'package:moviedb_flutter/application/repository/movie_repository.dart';
import 'package:moviedb_flutter/application/service/service_interface.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/content_provider/movie_content_provider.dart';

class ServiceLocator{

  IService? _iService;
  MovieViewModel? _movieViewModel;
  MovieFavoritesRepository? _movieRepository;
  MovieContentProvider? _movieContentProvider;

  static final ServiceLocator instance = ServiceLocator();

  IService get service {
    if(_iService == null)
      _iService = IService();
    return _iService!;
  }

  MovieViewModel get movieViewModel{
    if(_movieViewModel == null)
      _movieViewModel = MovieViewModel();
    return _movieViewModel!;
  }

  MovieContentProvider get movieContentProvider{
    if(_movieContentProvider == null)
      _movieContentProvider = MovieContentProvider();
    return _movieContentProvider!;
  }

  MovieFavoritesRepository get movieRepository{
    if(_movieRepository == null)
      _movieRepository = MovieFavoritesRepository(
          movieContentProvider: movieContentProvider
      );
    return _movieRepository!;
  }
}