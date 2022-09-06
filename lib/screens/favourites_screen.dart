import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/data/list_items.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<PreviousTimers>(context);
    return ListView.builder(
        itemCount: fav.favouriteCount,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Text(
                  '${fav.favouriteItems(index).hour}:${fav.favouriteItems(index).minute}:${fav.favouriteItems(index).second}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    fav.deleteFav(index);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ),
              Divider(thickness: 1),
            ],
          );
        },
    );
  }
}
