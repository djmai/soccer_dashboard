import 'package:flutter/material.dart';
// import 'soccermodel.dart';
import 'package:soccer_demo/models/soccermodel.dart';
import 'package:intl/intl.dart';

Widget matchTile(SoccerMatch match) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var date = match.fixture.date;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.home.logoUrl,
          width: 36.0,
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              DateFormat('EEE, 2 MMMM ' 'yy', 'es_MX')
                  .format(DateTime.parse(date))
                  .toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8.0,
              ),
            ),
            Text(
              "${homeGoal} - ${awayGoal}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        )),
        Image.network(
          match.away.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.away.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}
