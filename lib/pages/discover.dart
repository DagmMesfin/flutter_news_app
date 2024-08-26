import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_post.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Discover'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              "Uncover a world of captivating stories and stay informed",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search “News”',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
            SizedBox(height: 20),
            // Publishers Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Publishers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PublisherCard(
                    logoUrl:
                        'https://iconape.com/wp-content/files/lc/120694/png/BBC_One_logo__colour_.png',
                    name: 'BBC News',
                  ),
                  PublisherCard(
                    logoUrl:
                        'https://iconape.com/wp-content/files/lc/120694/png/BBC_One_logo__colour_.png',
                    name: 'Fox News',
                  ),
                  PublisherCard(
                    logoUrl:
                        'https://iconape.com/wp-content/files/lc/120694/png/BBC_One_logo__colour_.png',
                    name: 'ABC News',
                  ),
                  // Add more PublisherCards as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            // News Tabs
            DefaultTabController(
              length: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Recommended'),
                      Tab(text: 'Popular'),
                      Tab(text: 'Most visited'),
                      Tab(text: 'Trending'),
                    ],
                  ),
                  SizedBox(height: 20),
                  // News Section (List of News Cards)
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
                  SizedBox(height: 10),
                  // Add more NewsCards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Publisher Card Widget
class PublisherCard extends StatelessWidget {
  final String logoUrl;
  final String name;

  const PublisherCard({
    Key? key,
    required this.logoUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(logoUrl),
            radius: 25,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Follow',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
