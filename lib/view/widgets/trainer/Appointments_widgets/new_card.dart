import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const NewCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353.w,
      child: Card(
        clipBehavior: Clip.none,
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  "assets/images/abc.png",
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              title: Text(
                title, 
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              subtitle: Text(
                subtitle, 
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              trailing: Container(
                width: 80.w,
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: Colors.amber,
                  // status == "Pending" ? Colors.amber : Colors.green,
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                child: Center(
                  child: Text(status), // Status text
                ),
              ),
            ),
            SizedBox(height: 10.h), // Adding some spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight, // Align the buttons to the right
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Align buttons at the end
                      children: [
                        // Decline Button
                        GestureDetector(
                          onTap: () {
                            // Handle Decline button press
                            print('Decline pressed');
                          },
                          child: Container(
                            width: 125.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.black), // Border color
                            ),
                            child: Center(
                              child: Text("Decline"),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w), // Spacing between buttons
                        // Accept Button
                        GestureDetector(
                          onTap: () {
                            // Handle Accept button press
                            print('Accept pressed');
                          },
                          child: Container(
                            width: 125.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "Accept",
                                style: TextStyle(color: Colors.white), // Change text color to white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class NewCardListView extends StatelessWidget {
  const NewCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for 3 cards
    List<Map<String, String>> cardData = [
      {
        'title': 'Item Title 1',
        'subtitle': 'Item Subtitle 1',
        'status': 'Pending',
      },
      // {
      //   'title': 'Item Title 2',
      //   'subtitle': 'Item Subtitle 2',
      //   'status': 'Accepted',
      // },
      // {
      //   'title': 'Item Title 3',
      //   'subtitle': 'Item Subtitle 3',
      //   'status': 'Pending',
      // },
    ];

    return Scaffold(
      
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: cardData.length, // The number of items to display
        itemBuilder: (context, index) {
          var card = cardData[index];
          return NewCard(
            title: card['title']!,
            subtitle: card['subtitle']!,
            status: card['status']!,
          );
        },
      ),
    );
  }
}

