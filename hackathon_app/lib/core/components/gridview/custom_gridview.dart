import 'package:flutter/material.dart';

class CustomGridView {
  Padding gridView(int itemCount, String pathJpg) {
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
          String tempImage = '$pathJpg${index + 1}.png';
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop<String>(index.toString());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(tempImage, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
