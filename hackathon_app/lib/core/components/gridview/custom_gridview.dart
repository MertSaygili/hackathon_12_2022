import 'package:flutter/material.dart';

class CustomGridView {
  Padding gridView(int itemCount, List<String> avatars) {
    double itemSpacing = 30;
    int axisCount = 2;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: itemSpacing,
          mainAxisSpacing: itemSpacing / 2,
          crossAxisCount: axisCount,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop<int>(index);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(avatars[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
