import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsline/cubit/news_cubit.dart';
import 'package:newsline/pages/newsline_page.dart';
import 'injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsline',
      home: BlocProvider(
        create: (context) => di.sl<NewsCubit>(),
        child: const NewslinePage(),
      ),
    );
  }
}
