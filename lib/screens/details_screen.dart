import 'package:flutter/material.dart';
import 'package:riverpod_api/models/user_models.dart';



class DetailsScreen extends StatelessWidget {

  // ignore: prefer_const_constructors_in_immutables
  DetailsScreen({super.key, required this.e});

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
              Text("${e.firstName} ${e.lastName}"),
              Text(e.email),
            ],
          ),
        ),
      ),
    );
  }
}
