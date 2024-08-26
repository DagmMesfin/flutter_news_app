import 'package:flutter/material.dart';
import 'package:news_app/widgets/imagecollage.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bookmarks',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Text(
              'Personal collection of noteworthy reads',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle menu actions here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search "Collection"',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Categories Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 80,
                children: [
                  buildCategoryCard(context, 'Business', '5 News', [
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg"
                  ]),
                  buildCategoryCard(context, 'Sports', '3 News', [
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg"
                  ]),
                  buildCategoryCard(context, 'Sports', '3 News', [
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg"
                  ]),
                  buildCategoryCard(context, 'Sports', '3 News', [
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg",
                    "https://res.cloudinary.com/dnwep8w04/image/upload/v1724441830/images/mptft8nrddwlozu1xmsb.jpg"
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, String title, String subtitle,
      List<String> imagePaths) {
    return GestureDetector(
      onTap: () {
        // Handle navigation to the category's news list
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCollage(imagePaths: imagePaths),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
