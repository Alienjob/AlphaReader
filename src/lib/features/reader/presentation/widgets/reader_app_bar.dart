import '/features/core/presentation/loading.dart';
import '/features/reader/application/bloc/reader_bloc.dart';
import '/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderBloc, ReaderState>(builder: (context, state) {
      if (state is ReaderLoaded) {
        return AppBar(
          title: Text(
            state.title,
          ),
          actions: [
            IconButton(
              onPressed: () {
                sl<ReaderBloc>().add(ReaderEventShowHideUI());
              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {
                sl<ReaderBloc>().add(ReaderEventSaveOffset());
              },
              icon: const Icon(Icons.bookmark),
            ),
          ],
        );
      } else {
        return const LoadingAppBar();
      }
    });
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
