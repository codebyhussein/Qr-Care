part of 'change_lang_cubit.dart';
enum EventToChangeLang{
  initChangeLange,
  arabicLang,
  englishLang,
}
@immutable
abstract class ChangeLangState {}

class ChangeLangInitial extends ChangeLangState {}
class ChangeLang extends ChangeLangState {
  final String language;

  ChangeLang({required this.language});

}