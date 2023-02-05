import 'package:http/http.dart' as http;
import 'dart:convert';
class GetSeekerInfoResponse {
  String message;
  SeekerData data;

  GetSeekerInfoResponse({required this.message, required this.data});

  GetSeekerInfoResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = (json['data'] != null ? new SeekerData.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class SeekerData {
  String name;
  String gender;
  String photo;
  dynamic portfolioURL;
  String topEducationLevel;
  int age;
  String bio;
  dynamic experience;
  List<Education> education;

  SeekerData(
      {required this.name,
        required this.gender,
        required this.photo,
        this.portfolioURL,
        required this.topEducationLevel,
        required this.age,
        required this.bio,
        this.experience,
        required this.education});

  SeekerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    photo = json['photo'];
    portfolioURL = json['portfolioURL'];
    topEducationLevel = json['topEducationLevel'];
    age = json['age'];
    bio = json['bio'];
    experience = json['experience'];
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education.add(new Education.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['photo'] = this.photo;
    data['portfolioURL'] = this.portfolioURL;
    data['topEducationLevel'] = this.topEducationLevel;
    data['age'] = this.age;
    data['bio'] = this.bio;
    data['experience'] = this.experience;
    if (this.education != null) {
      data['education'] = this.education.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Education {


  Education(
  {required this.id,
  required this.userId,
  required this.educationLevel,
  required this.institute,
  required this.subject,
    required this.startDate,
    required this.endDate,
    required this.grade,
    required this.experience,
    required this.createdAt,
    required this.updatedAt});

  final int id;
  final int userId;
  final String educationLevel;
  final String institute;
  final String subject;
  final String startDate;
  final String endDate;
  final String grade;
  final String experience;
  final String createdAt;
  final String updatedAt;

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
        id: json['id'],
        userId: json['user_id'],
        educationLevel: json['education_level'],
        institute: json['institute'],
        subject: json['subject'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        grade: json['grade'],
        experience: json['experience'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}

class GetSeekerInfoResponse {
  GetSeekerInfoResponse({required this.message, required this.data});

  final String message;
  final Data data;

  factory GetSeekerInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetSeekerInfoResponse(
        message: json['message'],
        data: Data.fromJson(json['data']));
  }
}

class Data {
  Data(
      {required this.name,
        required this.gender,
        required this.photo,
        required this.portfolioURL,
        required this.topEducationLevel,
        required this.age,
        required this.bio,
        required this.experience,
        required this.education});

  final String name;
  final String gender;
  final String photo;
  final String portfolioURL;
  final String topEducationLevel;
  final int age;
  final String bio;
  final String experience;
  final List<Education> education;

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['education'] as List;
    List<Education> educationList =
    list.map((i) => Education.fromJson(i)).toList();
    return Data(
        name: json['name'],
        gender: json['gender'],
        photo: json['photo'],
        portfolioURL: json['portfolioURL'],
        topEducationLevel: json['topEducationLevel'],
        age: json['age'],
        bio: json['bio'],
        experience: json['experience'],
        education: educationList);
  }
}
