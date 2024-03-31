import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/core/app_color.dart';

String? selectedItem;

Widget DefaultDropdown(
        {required List<String> listName,
        required void Function(String?) onChanged,
        required String errorMassage,
        required TextEditingController controllerName,
        required String hintText}) =>
    Container(
      width: 330.w,
      height: 46.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [AppColors.defaultBoxShadow]),
      child: Center(
          child: DropdownButtonFormField2<String>(
        isExpanded: false,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(
          hintText,
          style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontFamily: 'Montserrat semibold'),
        ),
        items: listName
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return errorMassage;
          }
          return null;
        },
        onChanged: onChanged,
        onSaved: (value) {
          controllerName.text = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            IconlyBold.arrow_down_2,
            color: AppColors.mainColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250.h,
          isOverButton: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      )),
    );
