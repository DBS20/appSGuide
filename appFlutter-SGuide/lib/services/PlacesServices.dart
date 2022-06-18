import 'dart:async';
import 'package:appsguide/data/Places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacesService {
  Future<List<Result>> getPlaces() async {
    var url = Uri.parse('https://schoolguideapi.azurewebsites.net/Lugar');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    print(parsed);
    List<Result> result =
        parsed["result"].map<Result>((json) => Result.fromJson(json)).toList();
    print(result);
    return result;
  }
}
