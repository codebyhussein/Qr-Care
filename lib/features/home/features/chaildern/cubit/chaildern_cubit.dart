import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepo.dart';
import 'package:qr_care/features/home/features/chaildern/Model/ChildInfoModel.dart';

part 'chaildern_state.dart';

class ChaildernCubit extends Cubit<ChaildernState> {
  ChaildernCubit({required this.addChildRepo}) : super(ChaildernInitial());

  static ChaildernCubit get(context) => BlocProvider.of(context);

  AddChildRepo addChildRepo;

  Future<void> addChild(
      {required String childId,
      required File childImageFile,
      required File idImageFile}) async {
    try {
      var response = await addChildRepo.addChild(
        childId: childId,
        childImageFile: childImageFile,
        idImageFile: idImageFile,
      );
      if (response.statusCode == 200) {
        // print(response.statusCode);

        var responseBody = jsonDecode(response.body);
        if (responseBody["status"] == "success") {
          // await CacheHelper.saveData(
          //     key: "image", value: responseBody["entered_data"]["child_id"]);
          // await CacheHelper.saveData(
          //     key: "image1",
          //     value: responseBody["entered_data"]["child_image"]);
          // // print("the data is ${CacheHelper.getData(key: "image")}");
          // // print("the data is ${CacheHelper.getData(key: "image1")}");
          emit(SuccessAddChild());
        } else {
          emit(ErrorAddChild(error: responseBody["message"]));
        }
      } else {
        emit(ErrorAddChild(
            error: 'Failed to add child. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(ErrorAddChild(error: 'Error: $e'));
    }
  }
  Future<void> getChildInfo() async {
    emit(LoadingGetChild());
    try {
      childInfoModel = await addChildRepo.getDataChild();
      print(childInfoModel);
      emit(SuccessGetChild());
    } catch (e) {
      emit(ErrorGetChild(error: e.toString()));
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  File? childImage;
  File? idImage;

  void getImageChildImage() async {
    final pickedChildImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedChildImage != null) {
      childImage = File(pickedChildImage.path);
      emit(SuccessSelectChildImage());
    }
  }

  void getImageIdImage() async {
    final pickedChildImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedChildImage != null) {
      idImage = File(pickedChildImage.path);
      emit(SuccessSelectIdImage());
    }
  }
ChildInfoModel ?childInfoModel;

}
