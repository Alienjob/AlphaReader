import 'package:alpha_reader/features/fonts/bloc/font_bloc.dart';
import 'package:alpha_reader/features/fonts/repository.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ShopForm(),
      appBar: AppBar(),
    );
  }
}

class ShopForm extends StatelessWidget {
  const ShopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
