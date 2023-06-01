import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/services/services.dart';

final userDataProvider = FutureProvider<List>((ref) async {
  return ref.watch(serviceProvider).getUsers();
});
