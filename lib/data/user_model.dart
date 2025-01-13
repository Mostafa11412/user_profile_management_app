
class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["address"] is Map) {
      address = json["address"] == null ? null : Address.fromJson(json["address"]);
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["website"] is String) {
      website = json["website"];
    }
    if(json["company"] is Map) {
      company = json["company"] == null ? null : Company.fromJson(json["company"]);
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["username"] = username;
    _data["email"] = email;
    if(address != null) {
      _data["address"] = address?.toJson();
    }
    _data["phone"] = phone;
    _data["website"] = website;
    if(company != null) {
      _data["company"] = company?.toJson();
    }
    return _data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["catchPhrase"] is String) {
      catchPhrase = json["catchPhrase"];
    }
    if(json["bs"] is String) {
      bs = json["bs"];
    }
  }

  static List<Company> fromList(List<Map<String, dynamic>> list) {
    return list.map(Company.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["catchPhrase"] = catchPhrase;
    _data["bs"] = bs;
    return _data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    if(json["street"] is String) {
      street = json["street"];
    }
    if(json["suite"] is String) {
      suite = json["suite"];
    }
    if(json["city"] is String) {
      city = json["city"];
    }
    if(json["zipcode"] is String) {
      zipcode = json["zipcode"];
    }
    if(json["geo"] is Map) {
      geo = json["geo"] == null ? null : Geo.fromJson(json["geo"]);
    }
  }

  static List<Address> fromList(List<Map<String, dynamic>> list) {
    return list.map(Address.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["street"] = street;
    _data["suite"] = suite;
    _data["city"] = city;
    _data["zipcode"] = zipcode;
    if(geo != null) {
      _data["geo"] = geo?.toJson();
    }
    return _data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    if(json["lat"] is String) {
      lat = json["lat"];
    }
    if(json["lng"] is String) {
      lng = json["lng"];
    }
  }

  static List<Geo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Geo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}