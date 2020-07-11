import 'package:flutter/material.dart';
import 'package:mhealth/dialog/exitConf.dart';

class DialogHelper {
  static exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog());
}