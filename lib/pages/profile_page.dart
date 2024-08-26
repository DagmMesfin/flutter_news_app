import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_post.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('forbesnews'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
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
              // Profile Section
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/forbes_logo.png'))),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileStat(title: '6.8k', subtitle: 'News'),
                            ProfileStat(title: '2.5k', subtitle: 'Followers'),
                            ProfileStat(title: '100', subtitle: 'Following'),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Follow',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size(double.infinity, 36),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Description Section
              Row(
                children: [
                  Text(
                    'Forbes',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.verified,
                    color: Colors.blueAccent,
                    size: 22,
                  ),
                ],
              ),
              Text(
                'Empowering your business journey with expert insights and influential perspectives.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              // News Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News by Forbes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: 'Newest',
                    items: [
                      DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                      DropdownMenuItem(value: 'Oldest', child: Text('Oldest')),
                    ],
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      Icon(Icons.grid_view, color: Colors.grey),
                      SizedBox(width: 10),
                      Icon(Icons.view_list, color: Colors.black),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search "News"',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // News Feed
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
              // Add more NewsFeedCards as needed
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  ProfileStat({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class NewsFeedCard extends StatelessWidget {
  final String title;
  final String source;
  final String date;
  final String image;

  NewsFeedCard(
      {required this.title,
      required this.source,
      required this.date,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image,
              fit: BoxFit.cover, width: double.infinity, height: 150),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(source,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text(date, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
