import 'package:flutter/material.dart';
import 'package:flutter_rest_api_getx/widgets/user_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggeredGridView extends StatelessWidget {
  List list;

  CustomStaggeredGridView({
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (BuildContext context, int index) {
        return UserTile(
          user: list[index],
        );
      },
      itemCount: list.length,
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(1);
      },
      crossAxisCount: 2,
    );
  }
}
