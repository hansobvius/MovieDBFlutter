import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/repository/MovieRepository.dart';
import 'package:moviedb_flutter/application/service/IService.dart';
import 'package:moviedb_flutter/application/storage/tables/movies/content_provider/MoviesContentProvider.dart';

class ServiceLocator{

  late IService _iService;
  late MovieViewModel _movieViewModel;
  late MovieFavoritesRepository _movieRepository;
  late MovieContentProvider _movieContentProvider;

  static final ServiceLocator instance = ServiceLocator();

  IService get service {
    // if(_iService == null)
    _iService = IService();
    return _iService;
  }

  MovieViewModel get movieViewModel{
    // if(_movieViewModel == null)
    _movieViewModel = MovieViewModel();
    return _movieViewModel;
  }

  MovieContentProvider get movieContentProvider{
    // if(_movieContentProvider == null)
    _movieContentProvider = MovieContentProvider();
    return _movieContentProvider;
  }

  MovieFavoritesRepository get movieRepository{
    // if(_movieRepository == null)
      _movieRepository = MovieFavoritesRepository(
          movieContentProvider: movieContentProvider
      );
    return _movieRepository;
  }
}