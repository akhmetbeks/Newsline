import 'package:flutter/material.dart';
import 'package:newsline/constants.dart';

class GridViewWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final List<dynamic> data;

  const GridViewWidget(
      {super.key, required this.constraints, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: constraints.maxHeight / 3,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        if (index > data.length - 1) {
          data.insertAll(0, data);
          data.shuffle();
        }
        return Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    data[index]['image_url'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(data[index]['title'],
                    style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                data[index]['country'].first,
                style: const TextStyle(color: AppColors.countryColor),
              )
            ],
          ),
        );
      },
    );
  }
}
