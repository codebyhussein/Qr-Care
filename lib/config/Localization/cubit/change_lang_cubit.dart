import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';

part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit() : super(ChangeLangInitial());
  appLanguage(EventToChangeLang type) async {
    switch (type) {
      case EventToChangeLang.initChangeLange:
        if (CacheHelper.getData(key: "isLang") != null) {
          if (CacheHelper.getData(key: "isLang") == "ar") {
            emit(ChangeLang(language: "ar"));
          }
          else{
            emit(ChangeLang(language: "en"));

          }
        }
        break;
      case EventToChangeLang.arabicLang:
        await CacheHelper.saveData(key: "isLang", value: "ar");
        emit(ChangeLang(language: "ar"));
        break;
      case EventToChangeLang.englishLang:
        await CacheHelper.saveData(key: "isLang", value: "en");
        emit(ChangeLang(language: "en"));
        break;
      default:
    }
  }

}
