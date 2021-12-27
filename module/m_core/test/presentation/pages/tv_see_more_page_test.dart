import 'package:bloc_test/bloc_test.dart';
import 'package:m_core/m_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class TVSeriesPopularCbtMock extends MockCubit<TVSeriesPopularState>
    implements TVSeriesPopularCbt {}

class TVSeriesTopRatedCbtMock extends MockCubit<TVSeriesTopRatedState>
    implements TVSeriesTopRatedCbt {}

void main() {
  late TVSeriesPopularCbtMock tvSeriesPopularCbtMock;
  late TVSeriesTopRatedCbtMock tvSeriesTopRatedCbtMock;

  setUp(() {
    tvSeriesPopularCbtMock = TVSeriesPopularCbtMock();
    tvSeriesTopRatedCbtMock = TVSeriesTopRatedCbtMock();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        BlocProvider<TVSeriesPopularCbt>(
          create: (context) => tvSeriesPopularCbtMock,
        ),
        BlocProvider<TVSeriesTopRatedCbt>(
          create: (context) => tvSeriesTopRatedCbtMock,
        ),
      ],
      child: MaterialApp(home: body),
    );
  }

  void initializeFunction() {
    when(() => tvSeriesPopularCbtMock.get()).thenAnswer((_) async => {});
    when(() => tvSeriesTopRatedCbtMock.get()).thenAnswer((_) async => {});
  }

  group('TV Series Popular', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      initializeFunction();

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      when(() => tvSeriesPopularCbtMock.state)
          .thenAnswer((_) => const TVSeriesPopularLoadingState());
      await tester
          .pumpWidget(_makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.Popular)));

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
      /// Find Widget
      final listViewFinder = find.byType(ListView);

      initializeFunction();
      when(() => tvSeriesPopularCbtMock.state)
          .thenAnswer((_) => const TVSeriesPopularLoadedState(items: []));

      await tester
          .pumpWidget(_makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.Popular)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
      /// Find Widget
      final textFinder = find.byKey(const Key('error_message'));

      initializeFunction();
      when(() => tvSeriesPopularCbtMock.state)
          .thenAnswer((_) => const TVSeriesPopularErrorState('error'));

      await tester
          .pumpWidget(_makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.Popular)));

      expect(textFinder, findsOneWidget);
    });
  });

  group(
    'TV Series Top Rated',
    () {
      testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        initializeFunction();

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        when(() => tvSeriesTopRatedCbtMock.state)
            .thenAnswer((_) => const TVSeriesTopRatedLoadingState());
        await tester.pumpWidget(
            _makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.TopRated)));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

      testWidgets('Page should display ListView when data is loaded', (WidgetTester tester) async {
        /// Find Widget
        final listViewFinder = find.byType(ListView);

        initializeFunction();
        when(() => tvSeriesTopRatedCbtMock.state)
            .thenAnswer((_) => const TVSeriesTopRatedLoadedState(items: []));

        await tester.pumpWidget(
            _makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.TopRated)));

        expect(listViewFinder, findsOneWidget);
      });

      testWidgets('Page should display text with message when Error', (WidgetTester tester) async {
        /// Find Widget
        final textFinder = find.byKey(const Key('error_message'));

        initializeFunction();
        when(() => tvSeriesTopRatedCbtMock.state)
            .thenAnswer((_) => const TVSeriesTopRatedErrorState('error'));

        await tester.pumpWidget(
            _makeTestableWidget(const TVSeeMorePage(seeMoreState: SeeMoreState.TopRated)));

        expect(textFinder, findsOneWidget);
      });
    },
  );
}
