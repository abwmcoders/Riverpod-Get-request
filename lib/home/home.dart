import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/models/user_models.dart';
import 'package:riverpod_api/screens/details_screen.dart';

import '../api/data_api.dart';

class MyHome extends ConsumerWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Riverpod",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: _data.when(
        data: (dataApi) {
          List<UserModel> usersList = dataApi.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(e: usersList[index],))),
                    child: Card(
                      color: Colors.amber,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: ListTile(
                        title: Text(
                          usersList[index].firstName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          usersList[index].lastName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(usersList[index].avatar),
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          );
        },
        error: (error, st) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
