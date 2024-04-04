import 'package:flutter/material.dart';
import 'package:qr_care/config/Localization/AppLocalizations.dart';

String? getTranslated(String key, BuildContext context) {
  return AppLocalizations.of(context)!.translate(key);
}
