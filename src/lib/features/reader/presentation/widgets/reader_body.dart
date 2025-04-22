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
  late ScrollController _scrollController;
  late ReaderBloc _bloc;

  @override
  void initState() {
    _bloc = sl<ReaderBloc>();
    double initialOffset = 0;
    if (_bloc.state is ReaderLoaded) {
      initialOffset = (_bloc.state as ReaderLoaded).offset;
    }
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
    _scrollController.addListener(_scrollListener);

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: BlocBuilder<ReaderBloc, ReaderState>(
            buildWhen: (previous, current) {
              if (current is! ReaderLoaded) return false;
              if (previous is! ReaderLoaded) return true;

              bool shouldRebuild = current.pageText != previous.pageText ||
                  current.font != previous.font ||
                  current.bookmark != previous.bookmark ||
                  current.fontSize != previous.fontSize ||
                  current.pageIndex != previous.pageIndex;

              if (shouldRebuild) {
                setState(() {
                  _scrollController.jumpTo(current.offset);
                });

                if (current.pageIndex != previous.pageIndex) {
                  _pageController.jumpToPage(current.pageIndex);
                }
              }

              return shouldRebuild;
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
                  return Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: ReaderHtmlView(
                        state: state.copyWith(pageIndex: index),
                      ),
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

  _scrollListener() {
    _bloc.add(ReaderEventSetOffset(_scrollController.offset));
  }
}
