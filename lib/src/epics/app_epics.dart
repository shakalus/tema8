import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/transformers.dart';
import 'package:tema7/src/actions/index.dart';
import 'package:tema7/src/data/movie_api.dart';
import 'package:tema7/src/models/index.dart';

class AppEpics {
  AppEpics(this._api);
  final MovieApi _api;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMovieStart>(_getMovieStart),
      TypedEpic<AppState, UpdateLikeStart>(_updateLikeStart),
    ]);
  }

  Stream<dynamic> _getMovieStart(Stream<GetMovieStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMovieStart action) => _api.getMovies(action.page))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((Object error, StackTrace stacktrace) => GetMovies.error(error, stacktrace));
  }

  Stream<dynamic> _updateLikeStart(Stream<UpdateLikeStart> actions, EpicStore<AppState> store) {
    return actions.flatMap((UpdateLikeStart action)
    {
      return _api
          .updateLike(action.id, like: action.like)
          .asStream()
          .map((_) => UpdateLike.successful(action.id, like: action.like))
          .onErrorReturnWith((Object error, StackTrace stacktrace) => UpdateLike.error(error, stacktrace));
    });



  }
}
