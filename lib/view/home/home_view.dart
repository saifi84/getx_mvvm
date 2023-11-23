import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_controller.dart';
import 'package:getx_mvvm/view_models/controller/user_prefrence/user_prefrence_controller.dart';

import '../../data/response/status.dart';
import '../../res/components/exaption_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPrefrence userPrefrence = UserPrefrence();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPrefrence
                    .removeUser()
                    .then((value) => {Get.toNamed(RoutesName.loginView)});
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("Home"),
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            return ExceaptonWidget(
              errorMessage: homeController.error.toString(),
              onRetry: () {
                homeController.userListRefreshApi();
              },
            );
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController
                              .userList.value.data![index].avatar
                              .toString())),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
