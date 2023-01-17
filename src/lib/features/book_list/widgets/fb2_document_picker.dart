import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:alpha_reader/features/book_list/presentation/bloc/book_list_bloc.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<void> requestPermission() async {
  var status = await Permission.storage.status;
  if ((status.isPermanentlyDenied) ||
      (status.isGranted) ||
      (status.isLimited)) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  } else {
    await Permission.storage.request();
  }
}

Future<String?> pickDocument(BuildContext context) async {
  await requestPermission();
  Directory rootDirectory = Directory('/storage/emulated/0');
  Directory downloadDirectory = Directory('/storage/emulated/0/Download');
  bool exist = await rootDirectory.exists();
  String? path = await FilesystemPicker.open(
//    title: 'Open file',
    context: context,
    directory: downloadDirectory,
    rootDirectory: rootDirectory, //rootPath,
//    fsType: FilesystemType.all,
//    allowedExtensions: ['.fb2', '.zip'],
//    fileTileSelectMode: FileTileSelectMode.wholeTile,
  );
  if (path == null) return null;

  File result = File(path);
  if (!await result.exists()) return null;

  /// path to the picked file
  String pathOut = (await getApplicationDocumentsDirectory()).path;
  final bytes = result.readAsBytesSync();

  late String newPath;

  /// encode zip
  if (p.extension(path) == '.zip') {
    final archive = ZipDecoder().decodeBytes(bytes);
    File file = File(pathOut + archive.first.name)
      ..createSync()
      ..writeAsBytesSync(archive.first.content);
    newPath = file.path;
  } else {
    File file = File(pathOut + p.basename(path))
      ..createSync()
      ..writeAsBytesSync(bytes);
    newPath = file.path;
  }

  return newPath;
}

class FB2DocumentPicker extends StatelessWidget {
  const FB2DocumentPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_box),
      tooltip: 'Open fb2',
      onPressed: () async {
        String? path = await pickDocument(context);
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
