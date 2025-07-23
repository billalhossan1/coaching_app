class ProfileModel {

  CouchProfileModel? profileModel;

  ProfileModel({this.profileModel});

  ProfileModel.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      profileModel = CouchProfileModel.fromJson(json['data']);
    } else {
      profileModel = null;
    }
  }

}

class CouchProfileModel {
  String? sId;
  String? name;
  String? role;
  String? email;
  String? image;
  String? status;
  bool? verified;
  String? createdAt;
  String? updatedAt;
  String? address;
  String? contact;
  String? dob;
  String? nationality;

  CouchProfileModel(
      {this.sId,
        this.name,
        this.role,
        this.email,
        this.image,
        this.status,
        this.verified,
        this.createdAt,
        this.updatedAt,
        this.address,
        this.contact,
        this.dob,
        this.nationality});

  CouchProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    image = json['image'];
    status = json['status'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = json['address'];
    contact = json['contact'];
    dob = json['dob'];
    nationality = json['nationality'];
  }

}
