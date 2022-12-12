import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tema7/src/actions/index.dart';
import 'package:tema7/src/models/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (BuildContext context, AppState state) {
        final List<Movie> movies = store.state.movies;
        final bool isLoading = store.state.isLoading;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Center(
              child: Text(
                'Movies',
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: movies.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (movies.length == index) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
              final Movie movie = movies[index];
              return GestureDetector(
                onTap: () {
                  store.dispatch(SetSelectedMovie(movie));
                  Navigator.pushNamed(
                    context,
                    '/movieDetails',
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(
                    movie.mediumImage,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
