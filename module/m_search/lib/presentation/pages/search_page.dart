import 'package:m_core/m_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_search/presentation/cubit/movie/movie_search_cbt.dart';
import 'package:m_search/presentation/cubit/tv/tv_series_search_cbt.dart';


class SearchCategory {
  final String title;
  final CategoryMenu category;

  SearchCategory({
    required this.title,
    required this.category,
  });
}

final _categories = <SearchCategory>[
  SearchCategory(
    title: 'Movie',
    category: CategoryMenu.Movie,
  ),
  SearchCategory(
    title: 'TV Series',
    category: CategoryMenu.TVSeries,
  ),
];

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCategory _selectedCategory;
  late final TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<SearchCategory>(
              isExpanded : true,
              value: _selectedCategory,
              onChanged: (value) async {
                if (_searchController.text.isNotEmpty) {
                  if (value!.category == CategoryMenu.Movie) {
                    await context.read<MovieSearchCbt>().get(_searchController.text);
                  } else {
                    await context.read<TVSeriesSearchCbt>().get(_searchController.text);
                  }
                }
                setState(() => _selectedCategory = value!);
              },
              items: _categories
                  .map(
                    (e) => DropdownMenuItem<SearchCategory>(
                  child: Text(e.title),
                  value: e,
                ),
              )
                  .toList(),
            ),
            TextField(
              controller: _searchController,
              onSubmitted: (query) async {
                if (_selectedCategory.category == CategoryMenu.Movie) {
                  await context.read<MovieSearchCbt>().get(_searchController.text);
                } else {
                  await context.read<TVSeriesSearchCbt>().get(_searchController.text);
                }
              },
              decoration: const InputDecoration(
                hintText: "Search title ",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            if (_selectedCategory.category == CategoryMenu.Movie) ...[
              BlocBuilder<MovieSearchCbt, MovieSearchState>(
                builder: (context, state) {
                  return _buildMovieSearch(state);
                },
              ),
            ] else ...[
              BlocBuilder<TVSeriesSearchCbt, TVSeriesSearchState>(
                builder: (context, state) {
                  return _buildTVSeriesSearch(state);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  _buildMovieSearch(MovieSearchState state) {
    if (state is MovieSearchLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is MovieSearchLoadedState) {
      const msg = "Sorry, Keyword not match any title TV Series";
      if (state.items.isEmpty){
        return const Center(child: Text(msg));
      }else{
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final movie = state.items[index];
              return MovieCard(movie: movie);
            },
            itemCount: state.items.length,
          ),
        );
      }
    } else {
      return Expanded(
        child: Container(),
      );
    }
  }

  _buildTVSeriesSearch(TVSeriesSearchState state) {
    if (state is TVSeriesSearchLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TVSeriesSearchLoadedState) {
      final result = state.items;
      const msg = "Sorry, Keyword not match any title TV Series";
      if (result.isEmpty){
        return const Center(child: Text(msg));
      }else{
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final tv = state.items[index];
              return TVCard(tv: tv);
            },
            itemCount: result.length,
          ),
        );
      }
    } else if (state is TVSeriesSearchErrorState) {
      return Center(child: Text(state.message));
    } else {
      return Expanded(
        child: Container(),
      );
    }
  }
}
