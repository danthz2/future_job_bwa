import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:future_job/services/themes.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel? category;
  CategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(category?.name ?? '-');
        try {
          Navigator.pushNamed(
            context,
            '/category',
            arguments: category,
          );
        } catch (e) {
          Navigator.pop(context);
          throw e.toString();
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            color: redC,
            image:
                DecorationImage(image: NetworkImage(category?.imageUrl ?? '-')),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                category?.name ?? '-',
                style: poppinsWhite500.copyWith(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
