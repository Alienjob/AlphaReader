import 'package:alpha_reader/features/core/data/user_data_repository.dart';
import 'package:flutter_html/flutter_html.dart';

class ChangeFontSize {
  final IUserDataRepository repository;
  final FontSize size;

  ChangeFontSize({required this.size, required this.repository});

  Future<void> call() async {
    await repository.setFontSize(size: size);
  }
}
