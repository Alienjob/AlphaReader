// ignore_for_file: use_build_context_synchronously

import '/injection_container.dart';
import 'package:flutter/material.dart';
import '/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowedExtensions: ['fb2', 'zip'],
    type: FileType.custom,
    lockParentWindow: true,
    initialDirectory: '/storage/emulated/0/Download',
  );
  if (result == null) return null;
  if (result.files.first.extension != 'fb2' &&
      result.files.first.extension != 'zip') return null;

  /// path to the picked file
  String path = result.paths.first!;
  String pathOut = (await getApplicationDocumentsDirectory()).path;
  final bytes = File(result.files.first.path!).readAsBytesSync();

  /// encode zip
  if (result.files.first.extension == 'zip') {
    final archive = ZipDecoder().decodeBytes(bytes);
    File file = File(pathOut + archive.first.name)
      ..createSync()
      ..writeAsBytesSync(archive.first.content);
    path = file.path;
  } else {
    File file = File(pathOut + result.files.first.name)
      ..createSync()
      ..writeAsBytesSync(bytes);
    path = file.path;
  }

  return path;
}

class FB2FilePicker extends StatelessWidget {
  const FB2FilePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      tooltip: 'Open fb2 book',
      onPressed: () async {
        String? path = await pickFile();
        if (path == null) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Книга не добавлена')));
        } else {
          sl<BookListBloc>().add(BookListEventAddFB2Book(path: path));
        }
      },
    );
  }
}
