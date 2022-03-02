//import 'package:climex/weather_report.dart';
import 'package:climex/networking.dart';
import 'package:climex/weather_report.dart';
import 'package:flutter/material.dart';
//import 'package:climex/location.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'bd391812ac57455c07f97db879e9f57b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherFront extends StatefulWidget {
  @override
  _WeatherFrontState createState() => _WeatherFrontState();
}

class _WeatherFrontState extends State<WeatherFront> {
  String cityname = "";

  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherReport(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  // void getLocationData() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   var url = Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
  //
  //   NetworkHelper networkHelper = NetworkHelper(url);
  //
  //   var weatherData = await networkHelper.getData();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return WeatherReport(
  //           locationWeather: weatherData,
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/city_background.jpg'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(25.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey,
                    hintText: 'Enter City Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    cityname = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  if (cityname == "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherFront()));
                  } else {
                    getCityWeather(cityname);
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WeatherReport()),
                  // );
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
