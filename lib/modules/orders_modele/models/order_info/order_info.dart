class OrderInfo {
  final Map<String, OrderData> data;

  OrderInfo({required this.data});

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    final data = <String, OrderData>{};
    json.forEach((key, value) {
      data[key] = OrderData.fromJson(value);
    });

    return OrderInfo(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    data.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
  }
}

class OrderData {
  final Product product;
  final Map<String, OrderPatient> patients;

  OrderData({required this.product, required this.patients});

  // Factory constructor to create ProductInfo from JSON
  factory OrderData.fromJson(Map<String, dynamic> json) {
    final product = Product.fromJson(json['PRD']);
    final patients = <String, OrderPatient>{};
    (json['PTNT'] as Map<String, dynamic>).forEach((key, value) {
      patients[key] = OrderPatient.fromJson(value);
    });

    return OrderData(product: product, patients: patients);
  }

  // Convert ProductInfo instance to JSON
  Map<String, dynamic> toJson() {
    final json = {
      'PRD': product.toJson(),
      'PTNT': patients.map((key, value) => MapEntry(key, value.toJson())),
    };
    return json;
  }
}

class Product {
  final String title;
  final String id;
  final String price;
  final int quantity;
  final String? sampleType;
  final String? tubeType;

  Product(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity,
      required this.sampleType,
      required this.tubeType});

  // Factory constructor to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'],
        id: json['id'],
        price: json['price'],
        quantity: json['quantity'],
        sampleType: json['sample_type'],
        tubeType: json['tube_type']);
  }

  // Convert Product instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'price': price,
      'quantity': quantity,
      'sample_type': sampleType,
      'tube_type': tubeType
    };
  }
}

class OrderPatient {
  final String name;
  final String id;
  final String gender;
  final String dob;
  final String mobile;

  OrderPatient(
      {required this.name,
      required this.id,
      required this.gender,
      required this.dob,
      required this.mobile});

  // Factory constructor to create Patient from JSON
  factory OrderPatient.fromJson(Map<String, dynamic> json) {
    return OrderPatient(
        name: json['name'],
        id: json['id'],
        gender: json['gender'],
        dob: json['dob'],
        mobile: json['mobile'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'gender': gender,
      'dob': dob,
      'mobile': mobile
    };
  }
}
