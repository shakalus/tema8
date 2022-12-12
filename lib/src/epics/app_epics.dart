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
    ]);
  }

  Stream<dynamic> _getMovieStart(Stream<GetMovieStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMovieStart action) => _api.getMovies(action.page))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((Object error, StackTrace stacktrace) => GetMovies.error(error, stacktrace));
  }
}
