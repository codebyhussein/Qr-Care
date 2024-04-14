import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailureWidget extends StatelessWidget {
  FailureWidget({super.key, required this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: 'Montserrat semibold',
                ),
              ),
              backgroundColor: Colors.black,
            ),
          );
          return const SizedBox.shrink(); // Placeholder widget
        },
      ),
    );
  }
}
