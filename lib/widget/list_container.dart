import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meditation_tracker_assignment3/data/list_items.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getTime = Provider.of<PreviousTimers>(context).itemFromList;
    final fav = Provider.of<PreviousTimers>(context);
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemCount: Provider.of<PreviousTimers>(context).itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Text(
                  '${getTime(index).hour}:${getTime(index).minute}:${getTime(index).second}',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                title: TextButton(
                  onPressed: () {
                    fav.addFavourites(fav.itemFromList(index));
                  },
                  child: const Text('Add',
                      style: TextStyle(color: Colors.red, fontSize: 20)),
                ),
                trailing: TextButton(
                  onPressed: () {
                    fav.delete(index);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
            ],
          );
        },
      ),
    );
  }
}
