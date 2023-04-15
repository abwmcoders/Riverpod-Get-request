import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/models/user_models.dart';

import '../controller/user_controller.dart';

final userDataProvider = FutureProvider<List<UserModel>>(
  (ref) async {
    return ref.watch(userProvider).getUser();
  },
);
