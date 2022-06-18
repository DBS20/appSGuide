class Places {
  bool? isSuccess;
  String? message;
  List<Result>? result;

  Places({this.isSuccess, this.message, this.result});

  Places.fromJson(Map<String, dynamic> json) {
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
  int? idLugar;
  String? nombre;
  String? descripcion;
  String? imgMapa;
  String? linkMapa;

  Result(
      {this.idLugar,
      this.nombre,
      this.descripcion,
      this.imgMapa,
      this.linkMapa});

  Result.fromJson(Map<String, dynamic> json) {
    idLugar = json['idLugar'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    imgMapa = json['imgMapa'];
    linkMapa = json['linkMapa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLugar'] = this.idLugar;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['imgMapa'] = this.imgMapa;
    data['linkMapa'] = this.linkMapa;
    return data;
  }
}
