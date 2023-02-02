import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsline/constants.dart';

class ListViewWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final List<dynamic> data;
  const ListViewWidget(
      {super.key, required this.constraints, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index > data.length - 1) {
          data.insertAll(0, data);
          data.shuffle();
        }

        return ListTile(
          minVerticalPadding: 20,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          visualDensity: const VisualDensity(vertical: 4),
          leading: SizedBox(
            width: constraints.maxWidth / 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                data[index]['image_url'],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              data[index]['description'],
              style: const TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            DateFormat('hh:mm   yyyy-MM-dd ')
                .format(DateTime.parse(data[index]['pubDate'])),
            style: const TextStyle(color: AppColors.subtitleColor),
          ),
        );
      },
    );
  }
}
