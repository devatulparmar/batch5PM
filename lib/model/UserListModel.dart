class UserListModel {
  UserListModel({
      this.success, 
      this.message, 
      this.totalUsers, 
      this.offset, 
      this.limit, 
      this.users,});

  UserListModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    totalUsers = json['total_users'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(UserData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  int? totalUsers;
  int? offset;
  int? limit;
  List<UserData>? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['total_users'] = totalUsers;
    map['offset'] = offset;
    map['limit'] = limit;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserData {
  UserData({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.street, 
      this.state, 
      this.country, 
      this.longitude, 
      this.profilePicture, 
      this.gender, 
      this.id, 
      this.dateOfBirth, 
      this.job, 
      this.city, 
      this.zipcode, 
      this.latitude,});

  UserData.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    street = json['street'];
    state = json['state'];
    country = json['country'];
    longitude = json['longitude'];
    profilePicture = json['profile_picture'];
    gender = json['gender'];
    id = json['id'];
    dateOfBirth = json['date_of_birth'];
    job = json['job'];
    city = json['city'];
    zipcode = json['zipcode'];
    latitude = json['latitude'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? street;
  String? state;
  String? country;
  double? longitude;
  String? profilePicture;
  String? gender;
  int? id;
  String? dateOfBirth;
  String? job;
  String? city;
  String? zipcode;
  double? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['street'] = street;
    map['state'] = state;
    map['country'] = country;
    map['longitude'] = longitude;
    map['profile_picture'] = profilePicture;
    map['gender'] = gender;
    map['id'] = id;
    map['date_of_birth'] = dateOfBirth;
    map['job'] = job;
    map['city'] = city;
    map['zipcode'] = zipcode;
    map['latitude'] = latitude;
    return map;
  }

}