import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:tema7/src/actions/index.dart';
import 'package:tema7/src/data/movie_api.dart';
import 'package:tema7/src/epics/app_epics.dart';
import 'package:tema7/src/models/index.dart';
import 'package:tema7/src/presentation/details_page.dart';
import 'package:tema7/src/presentation/home_page.dart';
import 'package:tema7/src/reducer/reducer.dart';

Future<void> main() async {
  final Client client = Client();
  final MovieApi api = MovieApi(client);
  final AppEpics epics = AppEpics(api);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: const AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epics.epic),
    ],
  )..dispatch(const GetMovies(1));
  runApp(MovieApp(store: store));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlue,
        ),
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          '/movieDetails': (BuildContext context) => const DetailsPage(),
        },
      ),
    );
  }
}
