import 'package:cached_network_image/cached_network_image.dart';
import 'package:m_core/m_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/tv/tv_detail.dart';
import '../../domain/entities/tv/tv_season.dart';
import '../../presentation/cubit/tv/tv_series_episode_season_cbt.dart';

class TVEpisodeSeasonPage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/episode-season-tv';

  /// [tv, season]
  final Map<String, dynamic> param;

  const TVEpisodeSeasonPage({
    Key? key,
    required this.param,
  }) : super(key: key);

  @override
  State<TVEpisodeSeasonPage> createState() => _TVEpisodeSeasonPageState();
}

class _TVEpisodeSeasonPageState extends State<TVEpisodeSeasonPage> {
  late final TVDetail tv;
  late final Season season;

  @override
  void initState() {
    super.initState();

    tv = widget.param['tv'];
    season = widget.param['season'];

    Future.microtask(() {
      context.read<TVSeriesEpisodeSeasonCbt>().get(
            id: tv.id,
            seasonNumber: season.seasonNumber,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOceanBlue,
        title: Text('${season.name}'),
      ),
      body: SizedBox.expand(
        child: BlocBuilder<TVSeriesEpisodeSeasonCbt, TVSeriesEpisodeSeasonState>(
          builder: (context, state) {
            if (state is TVSeriesEpisodeSeasonLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TVSeriesEpisodeSeasonLoadedState) {
              if (state.items.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text('Episode ${tv.name} ${season.name} Not Found'),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.items.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final episode = state.items[index];
                  return ListTile(
                    leading: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: episode.stillPath == null ? Image.asset("assets/not-found-small.png"): CachedNetworkImage(
                          imageUrl: '$BASE_IMAGE_URL/${episode.stillPath}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    title: Text('${episode.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Builder(builder: (context) {
                          DateTime? date;
                          if (episode.airDate != null) {
                            date = episode.airDate;
                          }
                          if (date == null) {
                            return const SizedBox();
                          }

                          return Text(
                            date.day.toString()+"-"+date.month.toString()+"-"+date.year.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          );
                        }),
                        Text(
                            (episode.overview ?? ""),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      child: Text((episode.voteAverage ?? 0).toStringAsFixed(1)),
                    ),
                  );
                },
              );
            } else if (state is TVSeriesEpisodeSeasonErrorState) {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  state.message,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}