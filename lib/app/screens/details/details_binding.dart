import 'package:dio/dio.dart';
import 'package:flutter_getx/app/screens/details/details_controller.dart';
import 'package:get/get.dart';

import '../../data/repositories/github_repository.dart';
import '../home/home_controller.dart';

setupDetails() {
  Get.put<DetailsController>(
    DetailsController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}