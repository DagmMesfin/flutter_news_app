import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _sortValue = 'Latest';
  List<String> filters = [
    'This week',
    'Politics',
    'Health',
    'World',
    'Asia',
    'South America',
    'add filter'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      _sortValue = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Latest', 'Oldest'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  child: Row(
                    children: [
                      Text('Sort by: $_sortValue'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Filter Chips
            Wrap(
              spacing: 8.0,
              children: filters.map((filter) {
                return FilterChip(
                  label: Text(filter),
                  onSelected: (bool selected) {
                    if (filter == 'add filter') {
                      _showFilterBottomSheet(context);
                    }
                    setState(() {
                      // Add filter selection logic here
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),

            // Search Results
            Expanded(
              child: ListView(
                children: [
                  _buildSearchResult(
                    'Global Summit on Climate Change: Historic Agreement Reached',
                    'BBC News',
                    'Jun 9, 2023',
                    'assets/climate_change.png',
                  ),
                  _buildSearchResult(
                    'Climate Change Impact on Agriculture: Farmers Seek Solutions',
                    'Reuters',
                    'Jun 8, 2023',
                    'assets/drought.png',
                  ),
                  _buildSearchResult(
                    'Trade Wars and Climate Change: The Global Economy\'s Dual Challenges',
                    'The NYT',
                    'Jun 6, 2023',
                    'assets/coldwar.png',
                  ),
                  _buildSearchResult(
                    'Rising Sea Levels Threaten Coastal Cities\' Economies',
                    'The NYT',
                    'Jun 5, 2023',
                    'assets/sealevel.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResult(
      String title, String source, String date, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/forbes_logo.png', // Replace with your source logo
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      source,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '· $date',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Works only for news',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),

                // Date Range
                Text(
                  'Date Range',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile<String>(
                  title: Text('Today'),
                  value: 'Today',
                  groupValue: 'This week',
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  title: Text('This week'),
                  value: 'This week',
                  groupValue: 'This week',
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  title: Text('This month'),
                  value: 'This month',
                  groupValue: 'This week',
                  onChanged: (value) {},
                ),
                SizedBox(height: 16),

                // Category Chips
                Text(
                  'Category (3)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    'Business',
                    'Politics',
                    'Lifestyle',
                    'Art',
                    'Health',
                    'Tech',
                    'Travel',
                    'Fashion',
                    'Sports',
                    'Food',
                    'World',
                    'Science'
                  ].map((String name) {
                    return FilterChip(
                      label: Text(name),
                      selected: ['Politics', 'Health', 'World'].contains(name),
                      onSelected: (bool selected) {},
                      selectedColor: Colors.blue.shade100,
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Location Chips
                Text(
                  'Location (2)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    'Global',
                    'North America',
                    'Europe',
                    'Asia',
                    'Africa',
                    'Australia',
                    'South America'
                  ].map((String name) {
                    return FilterChip(
                      label: Text(name),
                      selected: ['Asia', 'South America'].contains(name),
                      onSelected: (bool selected) {},
                      selectedColor: Colors.blue.shade100,
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Reset and Done buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Reset logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Done'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
