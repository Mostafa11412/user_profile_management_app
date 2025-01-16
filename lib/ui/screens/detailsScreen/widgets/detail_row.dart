import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// A widget to display a row with a label and a corresponding value
class DetailRow extends StatelessWidget {
  final String label; // The label to display (e.g., "Name:")
  final String value; // The value corresponding to the label (e.g., "John Doe")

  // Constructor to initialize the DetailRow with required parameters
  const DetailRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8), // Padding around each row
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the row
        children: [
          // A fixed-width widget to display the label
          SizedBox(
            width: 120.w, // Set a fixed width for the label to keep alignment consistent
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold), // Bold text for the label
            ),
          ),
          // Expanded widget to ensure the value takes up remaining space
          Expanded(
            child: Text(value), // Display the value
          ),
        ],
      ),
    );
  }
}
