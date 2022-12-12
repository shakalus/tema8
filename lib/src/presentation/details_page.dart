import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tema7/src/models/index.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) => store.state.selectedMovie!,
      builder: (BuildContext context, Movie movie) {
        final Movie movie = store.state.selectedMovie!;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${movie.title} (${movie.year})',
              style: const TextStyle(color: Colors.white),
            ),
            elevation: 0,
          ),
          body: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      movie.mediumImage,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        ' rating: ${movie.rating.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' runtime: ${movie.runtime.toString()} minutes',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    movie.summary,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Available in:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              for (final Torrent torrent in movie.torrents)
                ListTile(
                  title: Column(
                    children: <Widget>[
                      Text(
                        '${torrent.quality} ${torrent.type}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                        ),
                        child: const Text(
                          'Download',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
