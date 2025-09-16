import 'package:first_app/constants/constants.dart';
import 'package:first_app/constants/states.dart';
import 'package:first_app/provider/movies_provider.dart';
import 'package:first_app/widgets/bottom_navigation.dart';
import 'package:first_app/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List angka = [1, 2, 3, 4, 5];
  @override
  void initState() {
    Future.microtask(
        () => context.read<MoviesProvider>().getListTrendingMovies());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sedang Tren",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<MoviesProvider>(builder: (context, movieProvider, child) {
              if (movieProvider.state == ResultState.Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (movieProvider.state == ResultState.HasData) {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: angka.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        final item =
                            movieProvider.respTrendingMovies?.results[index];
                        return MovieCard(
                            imageUrl:
                                '$BASE_URL_IMAGE${item?.posterPath ?? ''}',
                            title: item?.title ?? '',
                            imageHeight: 100,
                            year: DateFormat('yyyy').format(
                              DateTime.tryParse(item?.releaseDate ?? '') ??
                                  DateTime.now(),
                            ));
                      }),
                );
              } else if (movieProvider.state == ResultState.Error) {
                return Text(movieProvider.errorMessage ?? 'Error');
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavMain()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
