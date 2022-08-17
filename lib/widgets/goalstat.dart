import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget goalStat(int expandedTime, int homeGoal, int awayGoal, String date) {
  var home = homeGoal;
  var away = awayGoal;
  var elapsed = expandedTime;
  // var dateTime = date;
  if (home == null) home = 0;
  if (away == null) away = 0;
  if (elapsed == null) elapsed = 0;

  // int ts = 1638592424384;
  // DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
  // DateTime tsdate = DateTime.parse(date);
  // String fdatetime = DateFormat('EEE, MMM d, ' 'yy', 'es_MX').format(tsdate);
  // print(fdatetime);
  // String fdate = DateFormat('h:mm a', 'es_MX').format(tsdate);
  // print(fdate);

  // String day = DateFormat('EEE, 2 MMMM ' 'yy', 'es_MX').format(tsdate);

  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          DateFormat('EEE, 2 MMMM ' 'yy', 'es_MX')
              .format(DateTime.parse(date))
              .toUpperCase(),
          style: const TextStyle(fontSize: 10.0),
        ),
        Text(
          "${elapsed}'",
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
