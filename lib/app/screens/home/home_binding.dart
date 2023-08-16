import 'package:dio/dio.dart';
import 'package:flutter_getx/app/screens/home/home_controller.dart';
import 'package:get/get.dart';

import '../../data/repositories/github_repository.dart';

setupHome() {
  Get.put<HomeController>(
    HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
