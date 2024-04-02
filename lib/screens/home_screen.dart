import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gamma_test/config/colors.dart';
import 'package:gamma_test/config/sizes.dart';
import 'package:gamma_test/config/spacing.dart';
import 'package:gamma_test/config/text_styles.dart';
import 'package:gamma_test/logic/movies_cubit.dart';
import 'package:gamma_test/models/film.dart';
import 'package:gamma_test/models/series.dart';
import 'package:gamma_test/widgets/content_image_poster.dart';
import 'package:gamma_test/widgets/dark_overlay_gradient.dart';
import 'package:gamma_test/widgets/loading_image_poster.dart';
import 'package:gamma_test/widgets/watch_now_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) => state.maybeWhen(
            // putting an empty widget here because this cubit can never get to
            // a 'failed' state in this example as there are no network calls or
            //external factors
            orElse: () => const SizedBox.shrink(),
            loading: () => _buildLoadingWidget(context),
            loaded: (allFilms, allSeries) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLargeFilmPreview(films: allFilms, context: context),
                _buildScrollableFilmRow(
                    films: allFilms.reversed.toList(),
                    sectionTitle: 'Recently added',
                    context: context),
                _buildContinueWatching(context: context, series: allSeries),
                _buildScrollableFilmRow(
                    films: allFilms,
                    context: context,
                    sectionTitle: 'Most Watched'),
                kVerticalSpace24,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          kVerticalSpace12,
          const LoadingImagePoster(),
          kVerticalSpace12,
          ...List.generate(
            3,
            (index) => SizedBox(
              height: displayHeight(context) * .3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const LoadingImagePoster(),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeFilmPreview(
      {required BuildContext context, required List<Film> films}) {
    return SizedBox(
      height: displayHeight(context) * .75,
      child: Stack(
        children: [
          FlutterCarousel(
            options: CarouselOptions(
              height: displayHeight(context) * .75,
              showIndicator: true,
              slideIndicator: const CircularSlideIndicator(
                itemSpacing: 16,
                indicatorRadius: 4,
                currentIndicatorColor: AppColors.white,
                indicatorBackgroundColor: AppColors.gray,
              ),
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
            ),
            items: films.map((film) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: AppColors.black),
                    child: Stack(
                      children: [
                        Image.asset(
                          film.imageUrl,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                        DarkOverlayGradient(
                            height: displayHeight(context) * .3),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: displayHeight(context) * .05),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: WatchNowButton(
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableFilmRow(
      {required BuildContext context,
      required List<Film> films,
      required String sectionTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title: sectionTitle),
          SizedBox(
            height: displayHeight(context) * .25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  ContentImagePoster(imageUrl: films[index].imageUrl),
              itemCount: films.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueWatching(
      {required BuildContext context, required List<Series> series}) {
    final random = Random();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title: 'Continue watching'),
          SizedBox(
            height: displayHeight(context) * .25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: series.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  ContentImagePoster(
                      imageUrl: series[index].imageUrl,
                      hasDarkBottomGradient: true),
                  AspectRatio(
                    aspectRatio: 15 / 22,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: AppColors.white.withOpacity(.2),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: AppColors.white,
                                  size: 34,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          // selecting a random episode just for the sake of this test,
                          // in a real world use, we'd likely get this data from the backend as well
                          'S${random.nextInt(series[index].numberOfSeasons) + 1}:E${random.nextInt(series[index].numberOfEpisodesPerSeason) + 1}',
                          style: TextStyles.titleSmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: LinearProgressIndicator(
                            value: 1 / (random.nextInt(10) + 1),
                            color: AppColors.white,
                            backgroundColor: Colors.white.withOpacity(.38),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        kVerticalSpace12,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title}) {
    return Column(
      children: [
        kVerticalSpace16,
        Text(
          title,
          style: TextStyles.headlineSmall,
        ),
        kVerticalSpace12,
      ],
    );
  }
}
