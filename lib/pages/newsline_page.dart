import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsline/constants.dart';
import 'package:newsline/cubit/news_cubit.dart';
import 'package:newsline/pages/loading_page.dart';
import 'package:newsline/pages/widgets/grid_view_widget.dart';
import 'package:newsline/pages/widgets/list_view_widget.dart';

class NewslinePage extends StatefulWidget {
  const NewslinePage({super.key});

  @override
  State<NewslinePage> createState() => _NewslinePageState();
}

class _NewslinePageState extends State<NewslinePage> {
  var isGrid = false;
  late List<dynamic> newsArticles;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NewsCubit>(context).getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          newsArticles = state.articles;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                'News',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              backgroundColor: AppColors.pageColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: Icon(
                      isGrid ? Icons.view_stream_rounded : Icons.grid_view_rounded,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
            body: LayoutBuilder(
              builder: (layoutContext, constraints) {
                return Container(
                  color: AppColors.pageColor,
                  height: constraints.maxHeight,
                  child: isGrid
                      ? GridViewWidget(
                          constraints: constraints,
                          data: newsArticles,
                        )
                      : ListViewWidget(
                          constraints: constraints,
                          data: newsArticles,
                        ),
                );
              },
            ),
          );
        } else {
          return const LoadingPage();
        }
      },
    );
  }
}
