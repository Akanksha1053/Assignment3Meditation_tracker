import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/widget/time_container.dart';
import 'function_button.dart';
import 'list_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          color: Color(0xFFF4F4F4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Column(
                  children: const [
                    TimeContainer(),
                    FunctionButton(),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const ListContainer(),
      ],
    ));
  }
}
