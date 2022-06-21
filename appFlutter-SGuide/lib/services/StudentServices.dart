import 'dart:async';
import 'package:appsguide/data/Students.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentsService {
  Future<List<Result>> getStudents() async {
    var url = Uri.parse('https://schoolguideapi.azurewebsites.net/Persona');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    print(parsed);
    List<Result> result =
        parsed["result"].map<Result>((json) => Result.fromJson(json)).toList();
    print(result);
    return result;
  }

  Future<Result> getStudentById(int? ID) async {
    var url = Uri.parse('https://schoolguideapi.azurewebsites.net/Persona/$ID');
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    print(parsed);
    Result result =
        parsed["result"].map<Result>((json) => Result.fromJson(json));
    print(result);
    return result;
  }

  Future<http.Response> addStudent(Result alumno) async {
    return http.post(
      Uri.parse('https://schoolguideapi.azurewebsites.net/Persona'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'matricula': alumno.matricula!,
        'nombre': alumno.nombre!,
        'correo': alumno.correo!,
        'contraseña': alumno.contrasena!,
        'rol': alumno.rol!
      }),
    );
  }
}
