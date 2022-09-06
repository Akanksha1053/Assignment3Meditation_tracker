import 'package:flutter/material.dart';

class Time{
  final String hour;
  final String minute;
  final String second;
  Time({required this.hour,required this.minute,required this.second});
}
class PreviousTimers extends ChangeNotifier{
  final List<Time> _list = [Time(hour: '01', minute: '20', second: '33'),
    Time(hour: '01', minute: '10', second: '33'),
    Time(hour: '01', minute: '20', second: '05'),
    Time(hour: '01', minute: '50', second: '10'),

  ];

  List<Time> _favouriteList =[];

  void addFavourites(Time favourite)
  {
    _favouriteList.insert(0, favourite);
  }

  int get favouriteCount{
    return _favouriteList.length;
  }

  Time favouriteItems(int index)
  {
    return _favouriteList.elementAt(index);
  }
  void deleteFav(int index)
  {
    _favouriteList.removeAt(index);
    notifyListeners();
  }


  int get itemCount{
    return _list.length;
  }
  Time itemFromList(int index)
  {
    return _list.elementAt(index);
  }
  void addList(String hours, String minutes, String seconds){
    _list.insert(0, Time(hour: hours,minute: minutes,second: seconds));
    notifyListeners();
  }
  void delete(int index)
  {
    _list.removeAt(index);
    notifyListeners();
  }


}
