import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/repositories/github_repository.dart';
import 'package:flutter_getx/app/screens/details/details_page.dart';
import 'package:flutter_getx/app/screens/home/home_binding.dart';
import 'package:flutter_getx/app/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    setupHome(); //Antes de injetar a dependência a função deve ser chamada para realizar a configuração.
    _controller = Get.find<HomeController>();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github users'),
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _controller.users.isEmpty
                ? const Center(
                    child: Text("Nenhum usuário foi encontrado"),
                  )
                : ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _controller.users.length,
                    itemBuilder: (_, index) {
                      final user = _controller.users[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(user.avatarUrl),
                            ),
                          ),
                        ),
                        title: const Text(
                          'usuário',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        subtitle: Text(
                          user.login,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: (){
                          Get.to(DetailsPage(username: user.login));
                        },
                      );
                    },
                  );
      }),
    );
  }
}
