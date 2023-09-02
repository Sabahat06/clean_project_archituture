import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/colors.dart';

showToast({@required String? message}) {
  Fluttertoast.showToast(
    msg: message!,
    timeInSecForIosWeb: 3,
    fontSize: 16,
    textColor: whitePrimary,
    backgroundColor: textFieldColor
  );
}