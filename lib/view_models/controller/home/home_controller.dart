import 'package:get/get.dart';
import 'package:getx_mvvm/repository/home_repository/home_repositroy.dart';

import '../../../data/response/status.dart';
import '../../../models/home/user_list_model.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UsersListModel().obs;

  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UsersListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void userListRefreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
