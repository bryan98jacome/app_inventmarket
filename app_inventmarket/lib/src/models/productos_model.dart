class Productos {
  

  Productos({this.id, this.nombre, this.valor, this.stock});

  int? id;
  String? nombre;
  double? valor;
  int? stock;

  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
        id: json['id'],
        nombre: json['name'],
        valor: json['valor'],
        stock: json['stock']);
  }
}
