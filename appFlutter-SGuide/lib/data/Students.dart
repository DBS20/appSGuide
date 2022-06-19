class Students {
  bool? isSuccess;
  String? message;
  List<Result>? result;

  Students({this.isSuccess, this.message, this.result});

  Students.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? matricula;
  String? nombre;
  String? correo;
  String? contrasena;

  Result({this.matricula, this.nombre, this.correo, this.contrasena});

  Result.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    nombre = json['nombre'];
    correo = json['correo'];
    contrasena = json['contraseña'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nombre'] = this.nombre;
    data['correo'] = this.correo;
    data['contraseña'] = this.contrasena;
    return data;
  }
}
