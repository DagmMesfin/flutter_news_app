import 'package:flutter/material.dart';

class ImageCollage extends StatelessWidget {
  final List<String> imagePaths;

  ImageCollage({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imagePaths[0],
            width: double.infinity, // Full width
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        // Bottom Images in a Row
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imagePaths[1],
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imagePaths[2],
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
