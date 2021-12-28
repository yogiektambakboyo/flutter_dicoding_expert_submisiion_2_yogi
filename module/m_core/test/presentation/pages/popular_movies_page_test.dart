import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MoviePopularCbtMock extends MockCubit<MoviePopularState> implements MoviePopularCbt {}

void main() {
  late MoviePopularCbtMock mockMoviePopularCbt;

  setUp(() {
    mockMoviePopularCbt = MoviePopularCbtMock();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        BlocProvider<MoviePopularCbt>(
          create: (context) => mockMoviePopularCbt,
        ),
      ],
      child: MaterialApp(home: body),
    );
  }

  void initializeFunction() {
    when(() => mockMoviePopularCbt.get()).thenAnswer((_) async => {});
  }

  testWidgets('Page should display center progress bar when loading', (WidgetTester tester) async {
    initializeFunction();

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    when(() => mockMoviePopularCbt.state).thenAnswer((_) => const MoviePopularLoadingState());
    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
    /// Find Widget
    final listViewFinder = find.byType(ListView);

    initializeFunction();
    when(() => mockMoviePopularCbt.state)
        .thenAnswer((_) => const MoviePopularLoadedState(items: []));

    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
    /// Find Widget
    final textFinder = find.byKey(const Key('error_message'));

    initializeFunction();
    when(() => mockMoviePopularCbt.state)
        .thenAnswer((_) => const MoviePopularErrorState('error'));

    await tester.pumpWidget(_makeTestableWidget(const PopularMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
