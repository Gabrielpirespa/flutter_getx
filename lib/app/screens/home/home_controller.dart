import 'package:flutter_getx/app/data/repositories/github_repository.dart';
import 'package:get/get.dart';
import '../../data/models/github_user_model.dart';

class HomeController extends GetxController{
  final GithubRepository repository;

  final List<GithubUserModel> _users = <GithubUserModel>[].obs; //sempre colocar o tipo da lista antes do obs
  List<GithubUserModel> get users => _users; //Getter da lista encapsulada.

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading; //Getter da variável encapsulada.

  HomeController({required this.repository});

  getGithubUsers() async{
    _isLoading.value = true;

    final response = await repository.getGithubUsers();

    _users.addAll(response);

    _isLoading.value = false;
  }
}