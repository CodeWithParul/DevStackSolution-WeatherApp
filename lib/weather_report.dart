import 'package:climex/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherReport extends StatefulWidget {
  WeatherReport({this.locationWeather});

  final locationWeather;

  @override
  _WeatherReportState createState() => _WeatherReportState();
}

class _WeatherReportState extends State<WeatherReport> {
  WeatherModel weather = WeatherModel();

  num temperature;
  String weatherIcon;
  String cityName;
  num humidity;
  num feels;
  AssetImage image;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData['main'] == null) {
        temperature = 0;
        weatherIcon = "";
        cityName = "";
        humidity = 0;
        feels = 0;
        image = AssetImage('assets/images/eight.jpg');
      } else {
        // double
        temperature = weatherData['main']['temp'];
        temperature = temperature.toInt();
        // temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        cityName = weatherData['name'];
        humidity = weatherData['main']['humidity'];
        // humidity = hum.toInt();
        feels = weatherData['main']['feels_like'];
        feels = feels.toInt();
        image = AssetImage('assets/images/bgg.jpg');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: image,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: TextButton(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                  //   child: TextButton(
                  //     child: Icon(
                  //       Icons.home,
                  //       color: Colors.white,
                  //       size: 30.0,
                  //     ),
                  //     onPressed: () async {
                  //       var weatherData = await weather.getLocationWeather();
                  //       updateUI(weatherData);
                  //     },
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    // color: Color(0xFF89c2d9),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$cityName\n'
                        '$temperature° C\n'
                        '$weatherIcon',
                        textAlign: TextAlign.center,
                        style: kTempTextStyle,
                      ),
                      // Text(
                      //   '$weatherIcon',
                      //   textAlign: TextAlign.center,
                      //   style: kTempTextStyle,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 35.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFb7b7a4),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Humidity\n'
                            '$humidity %',
                            textAlign: TextAlign.center,
                            style: kMessageTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 35.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFb7b7a4),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Feels Like\n'
                            '$feels°C',
                            textAlign: TextAlign.center,
                            style: kMessageTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   color: Color(0xFFFFFFFF),
//                   height: 200.0,
//                   width: double.minPositive,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'London\n'
//                         '\t\t24 C\n'
//                         '\t\t\t☀',
//                         style: TextStyle(
//                           color: Colors.lightBlueAccent,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 50.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10.0, right: 10.0, bottom: 70.0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   color: Color(0xFFFFFFFF),
//                   height: 200.0,
//                   width: 100.0,
//                   child: Row(
//                     children: <Widget>[
//                       Column(),
//
//                       Column(),
//                     ],
//                   ),
//                 ),
//               ),

// decoration: BoxDecoration(
//   image: DecorationImage(
//     fit: BoxFit.fill,
//     image: AssetImage('assets/images/background.jpg'),
//   ),
// ),
