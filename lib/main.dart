import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageListView(),
    );
  }
}

class MyImageListView extends StatefulWidget {
  @override
  _MyImageListViewState createState() => _MyImageListViewState();
}

class _MyImageListViewState extends State<MyImageListView> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
    'assets/image4.jpg',
    // Add more image paths
  ];

  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(images.length, (index) => index == 0);

    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
        _isSelected = List.generate(images.length, (i) => i == _currentIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List View'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle image selection, e.g., navigate to a new page
                    // You can use Navigator to navigate to a new page or perform a specific action.
                    // For example: Navigator.push(...)
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 80.0, // Height for the image thumbnails
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: _isSelected[index]
                            ? Colors.blueAccent
                            : Colors.grey,
                        width: 2.0,
                      ),
                      boxShadow: _isSelected[index]
                          ? [
                              BoxShadow(
                                color: Colors.blueAccent,
                                blurRadius: 5.0,
                              )
                            ]
                          : null,
                    ),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
