import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({super.key, required this.text});
  TextEditingController passwordController = TextEditingController();
  String text;

  TextEditingController ConfirmPasswordController = TextEditingController();
  bool passwordVisiable = false;
  bool confirmPasswordVisiable = false;
  bool isLoading = false;
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        iconColor: Colors.white,
        content: Container(
          height: 366.h,
          width: 335.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.mainColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 235.w),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        IconlyLight.close_square,
                        color: Colors.white,
                      )),
                ),
                AppWidgets.titleDialog(
                    text: 'Your app ID has been created which is'),
                Text(widget.text,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30.h,
                ),
                AppWidgets.descriptionDialog(
                    text: 'Your app ID has been created which is'),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  errorMassage: 'please enter vaild password',
                  regEx: AppConst.passwordPattern,
                  helpText:
                      "Min. 8 chars, 1 upper, 1 lower, 1 number, 1 special char.",
                  hintText: 'Password',
                  nameofController: widget.passwordController,
                  isvisble: !widget.passwordVisiable,
                  keyBoredType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                      color: AppColors.mainColor,
                      onPressed: () {
                        setState(() {
                          widget.passwordVisiable = !widget.passwordVisiable;
                        });
                      },
                      icon: widget.passwordVisiable
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_rounded)),
                  prefixIcon: const Icon(IconlyBold.lock),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  errorMassage: 'password not matched',
                  regEx: AppConst.passwordPattern,
                  hintText: 'Confirm Password',
                  nameofController: widget.ConfirmPasswordController,
                  isvisble: !widget.confirmPasswordVisiable,
                  keyBoredType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(IconlyBold.lock),
                  suffixIcon: IconButton(
                      color: AppColors.mainColor,
                      onPressed: () {
                        setState(() {
                          widget.confirmPasswordVisiable =
                              !widget.confirmPasswordVisiable;
                        });
                      },
                      icon: widget.confirmPasswordVisiable
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_rounded)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    height: 38.h,
                    width: 149.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [AppColors.defaultBoxShadow],
                        color: Colors.white),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (widget.passwordController.text ==
                              widget.ConfirmPasswordController.text) {
                            Navigator.of(context).pop();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LayoutScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'App ID created with password ${widget.passwordController.text}'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Passwords do not match'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Confirm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff004854),
                            fontFamily: 'Montserrat semibold',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
