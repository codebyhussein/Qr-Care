import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.regEx,
    required this.nameofController,
    required this.keyBoredType,
    this.prefixIcon,
    this.enable,
    this.suffixIcon,
    required this.isvisble,
    required this.errorMassage,
    this.helpText,
    this.height = 46,
  });
  String hintText;
  bool? enable;
  String regEx;
  TextEditingController nameofController;
  TextInputType keyBoredType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isvisble = false;
  String errorMassage;
  String? helpText;
  double? height = 46.h;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final textPainter = TextPainter()
        ..text = TextSpan(
          text: widget.errorMassage,
          style: TextStyle(
              fontSize: 10.sp,
              color: Colors.red,
              fontFamily: 'Montserrat semibold'),
        )
        ..textDirection = TextDirection.ltr
        ..layout(maxWidth: constraints.maxWidth);

      final heightErrorMessage = textPainter.size.height + 8;
      final helpMessage = textPainter.size.height + 8;
      return Stack(
        children: [
          Container(
            height: widget.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [AppColors.defaultBoxShadow]),
          ),
          SizedBox(
            width: 330.w,
            height: errorMessage != null
                ? widget.height! + heightErrorMessage
                : widget.height! + helpMessage,
            child: TextFormField(
              // enabled: widget.enable == null ? true : widget.enable!,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.nameofController,
              keyboardType: widget.keyBoredType,
              obscureText: widget.isvisble,
              cursorColor: AppColors.mainColor,
              decoration: InputDecoration(
                  helperText: widget.helpText,
                  helperStyle: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey,
                      fontFamily: 'Montserrat semibold'),
                  contentPadding:
                      EdgeInsets.only(left: 10.w, bottom: 10.h, top: 8.h),
                  prefixIcon: widget.prefixIcon,
                  prefixIconColor: AppColors.mainColor,
                  suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  errorStyle: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.red,
                      fontFamily: 'Montserrat semibold'),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat semibold',
                    fontSize: 12.sp,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  )),
              onChanged: (value) {
                widget.nameofController.text = value;
              },
              validator: (value) {
                errorMessage = RegExp(widget.regEx).hasMatch(value!)
                    ? null
                    : widget.errorMassage;
                return errorMessage;
                // return errorMessage;
              },
            ),
          ),
        ],
      );
    });
  }
}
