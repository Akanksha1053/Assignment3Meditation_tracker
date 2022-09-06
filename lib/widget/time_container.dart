import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/constants.dart';
import 'package:meditation_tracker_assignment3/widget/timer_widget.dart';
import 'package:provider/provider.dart';
import 'package:meditation_tracker_assignment3/data/button_state.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonState = Provider.of<ButtonState>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: Color(0xFFF4F4F4),
      alignment: Alignment.center,
      child: Center(
          child: buttonState.isStarted
              ? Timerr()
              : const Text(
                  '00:00:00',
                  style: timeContainerStyle,
                )),
    );
  }
}
