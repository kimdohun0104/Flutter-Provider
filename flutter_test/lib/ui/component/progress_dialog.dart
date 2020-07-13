import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog getProgressDialog(BuildContext context, String message) {
  var progressDialog = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
    showLogs: false,
  );
  progressDialog.style(message: message);
  return progressDialog;
}
