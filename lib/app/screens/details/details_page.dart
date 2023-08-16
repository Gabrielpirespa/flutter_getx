import 'package:flutter/material.dart';
import 'package:flutter_getx/app/Components/details_list_tile.dart';
import 'package:flutter_getx/app/screens/details/details_binding.dart';
import 'package:flutter_getx/app/screens/details/details_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DetailsPage extends StatefulWidget {
  final String username;

  const DetailsPage({required this.username, Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final DetailsController _controller;

  @override
  void initState() {
    super.initState();
    setupDetails(); //Antes de injetar a dependência a função deve ser chamada para realizar a configuração.
    _controller = Get.find<DetailsController>();
    _controller.getGithubUser(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _controller.githubUser == null
                ? const Center(
                    child: Text('Nenhum usuário encontrado'),
                  )
                : _buildUserInfo();
      }),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                _controller.githubUser!.avatarUrl,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 32,
          ),
          DetailsListTile(
              icon: Icons.emoji_people_rounded,
              title: 'Nome',
              detail: _controller.githubUser!.name),
          DetailsListTile(
              icon: Icons.short_text_rounded,
              title: 'Login',
              detail: _controller.githubUser!.login),
          DetailsListTile(
              icon: Icons.grain_outlined,
              title: 'Repositórios públicos',
              detail: _controller.githubUser!.publicRepos.toString()),
          DetailsListTile(
              icon: Icons.grain_outlined,
              title: 'Seguidores',
              detail: _controller.githubUser!.followers.toString()),
          DetailsListTile(
              icon: Icons.flag_rounded,
              title: 'Local',
              detail: _controller.githubUser!.location),
        ],
      ),
    );
  }
}
