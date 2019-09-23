import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.url, this.flag });

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');

    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset']; // +05:30 for Asia/Kolkata

    String offsetHours = offset.substring(1, 3); // 05
    String offsetMinutes = offset.substring(4); // 30
    
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

    // Set time property
    time = now.toString();

  }

}