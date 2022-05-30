import 'package:flutter/material.dart';
import 'package:future_job/services/themes.dart';

class DetailItem extends StatelessWidget {
  final String? description;
  DetailItem({this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(
            Icons.stop_rounded,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              description ?? '-',
              style: poppinsBlack300,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
