import 'package:flutter/material.dart';
import 'package:flutter_base/src/presentation/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onLogoutPressed(BuildContext context, WidgetRef ref) {
    ref.read(homeViewModelProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            
            // SliverAppBar
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Sliver Example'),
                background: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Welcome to the Sliver Example',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => onLogoutPressed(context, ref),
              ),
            ),
            // SliverList
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Item #$index'),
                  );
                },
                childCount: 10, // Số lượng phần tử trong danh sách
              ),
            ),
            // SliverGrid
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Số cột trong lưới
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Grid Item #$index'),
                    ),
                  );
                },
                childCount: 4, // Số lượng phần tử trong lưới
              ),
            ),
            // SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.green,
                child: Center(
                  child:
                      Text('This is a normal widget inside SliverToBoxAdapter'),
                ),
              ),
            ),
          ],
        ),
      );
}
