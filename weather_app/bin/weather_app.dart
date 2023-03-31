import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  // Display welcome message
  print('Welcome to the weather app!');
  print('Please enter a location:');
  
  final location = getUserInput();

// Get weather data from API
  getWeatherData(location).then((weatherData) {
    // If weather data is null, display error message
    if (weatherData == null) {
      print('Sorry, unable to get weather data for $location');
      // Display weather data
    } else {
      print('The current time in $location is $time');
      print('The current weather in $location is ${weatherData['weather']}');

      print('The temperature is ${weatherData['temp']} degrees Celsius');
      print('The humidity is ${weatherData['humidity']}%');
      print('The wind speed is ${weatherData['wind_speed']} km/h');
      
      // Prompt user to view 5-day forecast
      print('Would you like to view the 5-day forecast? (y/n)');
       
      final input = getUserInput();
      if (input.toLowerCase() == 'y') {
        // Get forecast data from API
        getForecastData(location).then((forecastData) {
          if (forecastData == null) {
            print('Sorry, unable to get forecast data for $location');
          } else {
            for (final data in forecastData) {
              final date = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
              final weather = data['weather'][0]['main'];
              final temp = data['temp']['day'];
              print('${date.year}-${date.month}-${date.day}: $weather, $temp°C');
            }
          }
        });
      } else {
        print('Goodbye!');
      }
    }
  });
}


Future<Map<String, dynamic>?> getWeatherData(String location) async {
  final apiKey = 'a4cf88a1c0e23be7d553698884b687de';
  final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=$apiKey';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return {
      'weather': data['weather'][0]['main'],
      'temp': data['main']['temp'],
      'humidity': data['main']['humidity'],
      'wind_speed': data['wind']['speed']
    };
  } else {
    return null;
  }
}

Future<List<Map<String, dynamic>>?> getForecastData(String location) async {
  final apiKey = 'a4cf88a1c0e23be7d553698884b687de';
  final apiUrl = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=$location&units=metric&cnt=5&appid=$apiKey';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['list'].cast<Map<String, dynamic>>();
  } else {
    return null;
  }
}

// Get user input

String getUserInput() {
  final input = stdin.readLineSync();
  return input ?? '';
}

var time = DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour;

