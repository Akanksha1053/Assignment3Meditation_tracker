
import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/constants.dart';
import 'package:meditation_tracker_assignment3/data/button_state.dart';
import 'package:meditation_tracker_assignment3/data/current_time.dart';
import 'dart:async';
import 'package:meditation_tracker_assignment3/data/list_items.dart';
import 'package:provider/provider.dart';


class Timerr extends StatefulWidget {
  const Timerr({Key? key}) : super(key: key);


  @override
  State<Timerr> createState() => _TimerrState();
}

class _TimerrState extends State<Timerr> {
  String hours = '0';
  String minutes='0';
  String seconds='0';
  Duration duration = const Duration();
  Timer? timer;
  void startTimer() {
      timer = Timer.periodic(const Duration(milliseconds: 1000),(timer) => addTime());

  }
  @override
  void initState(){
    super.initState();
      startTimer();
  }
  void addTime() {
    const addSecond = 1;
    if(mounted)
      {
        setState(() {
          final seconds = duration.inSeconds + addSecond;
          duration = Duration(seconds: seconds);
        });
      }
  }
  Widget buildTime(){
      String twoDigit(int n) => n.toString().padLeft(2, '0');
      hours = twoDigit(duration.inHours);
      minutes = twoDigit(duration.inMinutes.remainder(60));
      seconds = twoDigit(duration.inSeconds.remainder(60));
      Provider.of<CurrentTime>(context).currHour = hours;
      Provider.of<CurrentTime>(context).currMinute = minutes;
      Provider.of<CurrentTime>(context).currSecond = seconds;

      return Text(
          '$hours:$minutes:$seconds', style: timeContainerStyle);
  }
  @override
  Widget build(BuildContext context) {
    return buildTime();
    }

}
