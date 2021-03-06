library m_core;

export './src/styles/colors.dart';
export './src/styles/text_styles.dart';

export './src/utils/constants.dart';
export './src/utils/exception.dart';
export './src/utils/failure.dart';
export './src/utils/state_enum.dart';
export './src/utils/shared.dart';
export './src/utils/ssl_pinning.dart';

export './src/presentation/cubit/tv/tv_series_on_the_air_cbt.dart';
export './src/presentation/cubit/tv/tv_series_detail_cbt.dart';
export './src/presentation/cubit/tv/tv_series_episode_season_cbt.dart';
export './src/presentation/cubit/tv/tv_series_popular_cbt.dart';
export './src/presentation/cubit/tv/tv_series_recommendations_cbt.dart';
export './src/presentation/cubit/tv/tv_series_top_rated_cbt.dart';

export './src/presentation/cubit/movie/movie_detail_cbt.dart';
export './src/presentation/cubit/movie/movie_now_playing_cbt.dart';
export './src/presentation/cubit/movie/movie_popular_cbt.dart';
export './src/presentation/cubit/movie/movie_recommendations_cbt.dart';
export './src/presentation/cubit/movie/movie_top_rated_cbt.dart';

export './src/presentation/pages/home_movie_page.dart';
export './src/presentation/pages/movie_detail_page.dart';
export './src/presentation/pages/popular_movies_page.dart';
export './src/presentation/pages/top_rated_movies_page.dart';
export './src/presentation/pages/tv_detail_page.dart' hide DetailContent;
export './src/presentation/pages/tv_episode_season_page.dart';
export './src/presentation/pages/tv_see_more_page.dart';

export './src/domain/usecases/get_movie_detail.dart';
export './src/domain/usecases/get_movie_recommendations.dart';
export './src/domain/usecases/get_now_playing_movies.dart';
export './src/domain/usecases/get_popular_movies.dart';
export './src/domain/usecases/get_top_rated_movies.dart';
export './src/domain/usecases/get_watchlist_status.dart';
export './src/domain/usecases/save_watchlist.dart';
export './src/domain/usecases/remove_watchlist.dart';

export './src/domain/usecases/tv/get_on_the_air_tv_series.dart';
export './src/domain/usecases/tv/get_detail_tv_series.dart';
export './src/domain/usecases/tv/get_episode_season_tv_series.dart';
export './src/domain/usecases/tv/get_popular_tv_series.dart';
export './src/domain/usecases/tv/get_recommendation_tv_series.dart';
export './src/domain/usecases/tv/get_top_rated_tv_series.dart';
export './src/domain/usecases/tv/get_watch_list_status_tv_series.dart';
export './src/domain/usecases/tv/remove_watchlist_tv_series.dart';
export './src/domain/usecases/tv/save_watchlist_tv_series.dart';

export './src/domain/repositories/movie_repository.dart';
export './src/domain/repositories/tv_repository.dart';
export './src/data/repositories/movie_repository_impl.dart';
export './src/data/repositories/tv_repository_impl.dart';

export './src/domain/entities/movie.dart';
export './src/domain/entities/tv/tv.dart';

export './src/data/datasources/db/database_helper.dart';
export './src/data/datasources/movie_local_data_source.dart';
export './src/data/datasources/movie_remote_data_source.dart';
export './src/data/datasources/tv_local_data_source.dart';
export './src/data/datasources/tv_remote_data_source.dart';

export './src/presentation/widgets/movie_card_list.dart';
export './src/presentation/widgets/tv_card_list.dart';
