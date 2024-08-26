import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String logoUrl;
  final String sourceName;
  final String postDate;
  final String title;
  final String category;
  final String imageUrl;
  final Function()? onFollowPressed;

  const NewsCard({
    Key? key,
    required this.logoUrl,
    required this.sourceName,
    required this.postDate,
    required this.title,
    required this.category,
    required this.imageUrl,
    this.onFollowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                // Logo Image
                CircleAvatar(
                  backgroundImage: NetworkImage(logoUrl),
                  radius: 18,
                ),
                SizedBox(width: 10),
                // Source Name and Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          sourceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.verified,
                          color: Colors.blueAccent,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      postDate,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                // Follow Button and Menu Icon
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: onFollowPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.more_vert),
                  ],
                ),
              ],
            ),
          ),
          // Title Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 5),
          // Category Tag
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                category,
                style: TextStyle(color: Colors.blueAccent, fontSize: 12),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
