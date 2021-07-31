import 'package:get/get.dart';

class SetController extends GetxController {
  bool error1 = false;
  bool error2 = false;

  updateUserChoose({bool newError1Status, bool newError2Status}) {
    error1 = newError1Status != null ? newError1Status : error1;
    error2 = newError2Status != null ? newError2Status : error2;
    update();
  }
}
