import 'package:redux/redux.dart';
import 'package:tema7/src/actions/index.dart';
import 'package:tema7/src/models/index.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMovieStart>(_getMovieStart),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
  TypedReducer<AppState, SetSelectedMovie>(_setSelectedMovie),
  TypedReducer<AppState, UpdateLikeSuccessful>(_updateLikeSuccessful),
]);
AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  return state.copyWith(
    isLoading: false,
    page: state.page + 1,
    movies: <Movie>[
      if (state.page != 1) ...state.movies,
      ...action.movies,
    ],
  );
}

AppState _getMovieStart(AppState state, GetMovieStart action) {
  return state.copyWith(
    isLoading: true,
  );
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  return state.copyWith(
    isLoading: false,
  );
}

AppState _setSelectedMovie(AppState state, SetSelectedMovie action) {
  return state.copyWith(
    selectedMovie: action.movie,
  );
}

AppState _updateLikeSuccessful(AppState state, UpdateLikeSuccessful action) {
  final List<int> liked = <int>[...state.liked, if (action.like) action.id];
  if (!action.like) {
    liked.remove(action.id);
  }
  return state.copyWith(
    liked: liked,
  );
}
