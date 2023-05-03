import 'dart:io';
import 'dart:ui';

import 'package:alpha_reader/features/book_list/data/fb2/fb2_buffer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_manager/worker_manager.dart';

import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';

class FB2Executor {
  static FB2Executor? _instance;

  final Map<String, String> cache;
  final Set<Cancelable> tasks;
  RootIsolateToken token;

  FB2Executor._()
      : cache = {},
        tasks = {},
        token = RootIsolateToken.instance!;

  factory FB2Executor.instance() {
    _instance ??= FB2Executor._();
    return _instance!;
  }

  static Future<int> buffering(
      String bookId, String path, RootIsolateToken token) async {
    int? result;
    try {
      FB2Executor i = FB2Executor.instance();

      Cancelable task = Executor()
          .execute(arg1: bookId, arg2: path, arg3: token, fun3: _buffering);
      result = await task;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
    return result ?? 0;
  }

  static Future<int> _buffering(
    String bookId,
    String path,
    RootIsolateToken token,
    TypeSendPort port,
  ) async {
    try {
      BackgroundIsolateBinaryMessenger.ensureInitialized(token);

      if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
      if (Platform.isIOS) SharedPreferencesIOS.registerWith();

      final sharedPreferences = await SharedPreferences.getInstance();
      final buffer = FB2Buffer(sharedPreferences: sharedPreferences);

      return await buffer.buffering(bookId, path);
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }
}
