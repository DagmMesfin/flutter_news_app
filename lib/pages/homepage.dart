import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Tyler!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "Discover a world of news that matters to you",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Trending News Section
              Text(
                'Trending news',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 220, // Adjust based on your image size
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TrendingNewsCard(
                      tag: "Environment",
                      title:
                          'Global Summit on Climate Change: Historic Agreement Reached',
                      source: 'BBC News',
                      date: 'Jun 9, 2023',
                      image:
                          'assets/funding_image.png', // Replace with your image asset
                    ),
                    TrendingNewsCard(
                      tag: "Technology",
                      title: 'Tech Giants Unveil AI-powered Innovations',
                      source: 'The NY Times',
                      date: 'Jun 10, 2023',
                      image:
                          'assets/onboarding_1.png', // Replace with your image asset
                    ),
                    // Add more cards as needed
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Recommendation Section
              Text(
                'Recommendation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              NewsCard(
                logoUrl:
                    'https://iconape.com/wp-content/files/lc/120694/png/BBC_One_logo__colour_.png', // Replace with the logo URL
                sourceName: 'Forbes',
                postDate: 'Jun 11, 2023',
                title:
                    'Tech Startup Secures \$50 Million Funding for Expansion',
                category: 'Business',
                imageUrl:
                    'assets/onboarding_1.png', // Replace with the image URL
                onFollowPressed: () {
                  // Handle the follow button press
                },
              ),
              NewsCard(
                logoUrl:
                    'https://iconape.com/wp-content/files/lc/120694/png/BBC_One_logo__colour_.png', // Replace with the logo URL
                sourceName: 'Forbes',
                postDate: 'Jun 11, 2023',
                title:
                    'Tech Startup Secures \$50 Million Funding for Expansion',
                category: 'Business',
                imageUrl:
                    'assets/onboarding_1.png', // Replace with the image URL
                onFollowPressed: () {
                  // Handle the follow button press
                },
              ),
              // Add more RecommendationCards if needed
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingNewsCard extends StatelessWidget {
  final String title;
  final String source;
  final String date;
  final String image;
  final String tag;

  TrendingNewsCard(
      {required this.title,
      required this.source,
      required this.date,
      required this.image,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250, // Adjust the width as needed
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image,
                      fit: BoxFit.cover, height: 120, width: double.infinity),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(source,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(date,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 10,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  width: 80,
                  height: 25,
                  child: Center(
                      child: Text(
                    this.tag,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )),
                ))
          ],
        ));
  }
}

class RecommendationCard extends StatelessWidget {
  final String title;
  final String source;
  final String image;
  final String date;

  RecommendationCard(
      {required this.title,
      required this.source,
      required this.image,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forbes"),
              Image.asset(image,
                  fit: BoxFit.cover, width: double.infinity, height: 150),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(source,
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(date,
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
