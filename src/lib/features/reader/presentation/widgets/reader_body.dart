import '/features/admob/presentation/banner_tile.dart';
import '/features/reader/application/bloc/reader_bloc.dart';
import '/features/reader/presentation/widgets/reader_html_view.dart';
import '/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderBody extends StatefulWidget {
  const ReaderBody({
    Key? key,
    required this.htmlAncor,
  }) : super(key: key);
  final GlobalKey htmlAncor;

  @override
  State<ReaderBody> createState() => _ReaderBodyState();
}

class _ReaderBodyState extends State<ReaderBody> {
  late PageController _pageController;
  final Map<int, ScrollController> _scrollControllers = {};
  late ReaderBloc _bloc;

  ScrollController _getScrollController(int pageIndex) {
    if (!_scrollControllers.containsKey(pageIndex)) {
      _scrollControllers[pageIndex] = ScrollController();
      _scrollControllers[pageIndex]!.addListener(() {
        _bloc.add(ReaderEventSetOffset(_scrollControllers[pageIndex]!.offset));
      });
    }
    return _scrollControllers[pageIndex]!;
  }

  @override
  void initState() {
    _bloc = sl<ReaderBloc>();
    int initialPage = 0;
    if (_bloc.state is ReaderLoaded) {
      initialPage = (_bloc.state as ReaderLoaded).pageIndex;
    }
    _pageController = PageController(initialPage: initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _scrollControllers.values) {
      controller.dispose();
    }
    _scrollControllers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: BlocBuilder<ReaderBloc, ReaderState>(
            buildWhen: (previous, current) {
              // Always rebuild for initial load with content
              if (current is! ReaderLoaded) return false;
              final curr = current as ReaderLoaded;

              // Always rebuild for initial load with content
              if (previous is! ReaderLoaded) {
                return curr.pageText.isNotEmpty;
              }
              final prev = previous as ReaderLoaded;

              bool shouldRebuild = curr.pageText != prev.pageText ||
                  curr.font != prev.font ||
                  curr.bookmark != prev.bookmark ||
                  curr.fontSize != prev.fontSize ||
                  curr.pageIndex != prev.pageIndex;

              if (shouldRebuild) {
                if (curr.pageIndex != prev.pageIndex) {
                  _pageController.jumpToPage(curr.pageIndex);
                } else if (_scrollControllers.containsKey(curr.pageIndex)) {
                  setState(() {
                    _scrollControllers[curr.pageIndex]!.jumpTo(curr.offset);
                  });
                }
              }

              return shouldRebuild || curr.pageText.isNotEmpty;
            },
            builder: (context, state) {
              if (state is! ReaderLoaded) return Container();

              return PageView.builder(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                onPageChanged: (index) {
                  _bloc.add(ReaderEventChoosePage(pageIndex: index));
                },
                itemCount: state.pageCount,
                itemBuilder: (context, index) {
                  final readerState = state as ReaderLoaded;

                  // Only show content for current page when it's ready
                  if (index == readerState.pageIndex) {
                    if (readerState.pageText.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      );
                    }

                    return Scrollbar(
                      controller: _getScrollController(index),
                      child: SingleChildScrollView(
                        controller: _getScrollController(index),
                        child: ReaderHtmlView(
                          state: readerState.copyWith(pageIndex: index),
                        ),
                      ),
                    );
                  }

                  // Show placeholder for other pages
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const BannerTile(),
      ],
    );
  }

  // Scroll listener is now handled in _getScrollController
}
