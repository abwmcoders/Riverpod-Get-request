import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services.dart';

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final stringProvider = Provider<String>((ref) => "Hello there, learning riverpod");
