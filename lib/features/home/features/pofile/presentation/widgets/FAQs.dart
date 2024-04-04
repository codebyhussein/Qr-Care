import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/features/home/widgets/CustomText.dart';

class Faqs extends StatelessWidget {
  Faqs(
      {super.key,
      this.isVisible,
      this.onPressed,
      required this.content,
      required this.title});
  bool? isVisible;
  Function()? onPressed;
  String content;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 7.w),
              child: CustomText(
                text: title,
                alignment: AlignmentDirectional.topStart,

                color: Colors.grey,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: isVisible!
                    ? const Icon(IconlyBroken.edit_square)
                    : const Icon(Icons.add)),
          ],
        ),
        const Divider(),
        Visibility(
            visible: isVisible!,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  textAlign: TextAlign.start,
                  content,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ),
            )),
      ],
    );
  }
}
