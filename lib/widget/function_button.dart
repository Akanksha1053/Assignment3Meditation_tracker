import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/constants.dart';
import 'package:provider/provider.dart';
import 'package:meditation_tracker_assignment3/data/button_state.dart';
import 'package:meditation_tracker_assignment3/data/list_items.dart';
import 'package:meditation_tracker_assignment3/data/current_time.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonState = Provider.of<ButtonState>(context);
    final fav = Provider.of<PreviousTimers>(context);
    final updateTime = Provider.of<CurrentTime>(context);
    return GestureDetector(
      onTap: () {
        buttonState.toggleButton();
        if (!buttonState.isStarted) {
          fav.addList(updateTime.currHour, updateTime.currMinute,
              updateTime.currSecond);
        }
      },
      child: buttonState.isStarted
          ? Container(
              width: 130,
              decoration: funButtonBoxDecoration,
              padding: const EdgeInsets.all(5),
              child: const Center(
                child: Text(
                  'Stop',
                  style: funButtonStyle,
                ),
              ),
            )
          : Container(
              width: 130,
              decoration: funButtonBoxDecoration,
              padding: const EdgeInsets.all(5),
              child: const Center(
                child: Text('Start',
                    style: funButtonStyle),
              ),
            ),
    );
  }
}
