import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// A reusable widget to display a card with a title and a list of children widgets
class InfoCard extends StatelessWidget {
  final String title; // The title of the card
  final List<Widget> children; // The list of widgets to display inside the card

  // Constructor to initialize the InfoCard with required parameters
  const InfoCard({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // A card widget to display content with a shadow and rounded corners
      child: Padding(
        padding: REdgeInsets.all(16), // Padding around the content inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
          children: [
            // Display the title of the card using the app's theme
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16.h), // Add vertical spacing between the title and the children
            // Spread the list of children widgets inside the column
            ...children,
          ],
        ),
      ),
    );
  }
}
