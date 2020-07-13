import 'package:flutter/cupertino.dart';
import 'package:flutter_tdd_example/provider/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState viewState = ViewState.IDLE;

  void setState(ViewState viewState) {
    this.viewState = viewState;
    notifyListeners();
  }
}
