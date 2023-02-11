import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.bgColor,
  });

  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(0.4),
              bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
