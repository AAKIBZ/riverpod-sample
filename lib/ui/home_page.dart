import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/providers/user_data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data1 = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('users'),
        ),
        body: data1.when(
            data: (data1) {
              return Column(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: ListTile(
                          title: Text(data1[index]['first_name'],style: const TextStyle(color: Colors.white),),
                          subtitle: Text(data1[index]['last_name'],style: const TextStyle(color: Colors.white),),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data1[index]['avatar']),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    itemCount: data1.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                  )
                ],
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
