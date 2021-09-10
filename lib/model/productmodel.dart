// To parse this JSON data, do
//
//     final studentDetail = studentDetailFromJson(jsonString);

import 'dart:convert';

StudentDetail studentDetailFromJson(String str) => StudentDetail.fromJson(json.decode(str));

String studentDetailToJson(StudentDetail data) => json.encode(data.toJson());

class StudentDetail {
  StudentDetail({
    this.result,
  });

  List<Result> result;

  factory StudentDetail.fromJson(Map<String, dynamic> json) => StudentDetail(
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.empCode,
    this.date,
    this.inTime,
    this.outtime,
    this.empImage,
    this.empImage2,
    this.price,
    this.image,
    this.resultType,
    this.status,
    this.gameName,
    this.type,
    this.num,
    this.amount,
    this.phNumber,
    this.dat,
  });

  dynamic empCode;
  dynamic date;
  dynamic inTime;
  dynamic outtime;
  dynamic empImage;
  dynamic empImage2;
  dynamic price;
  dynamic image;
  dynamic resultType;
  dynamic status;
  String gameName;
  String type;
  String num;
  dynamic amount;
  dynamic phNumber;
  dynamic dat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    empCode: json["EmpCode"],
    date: json["Date"],
    inTime: json["InTime"],
    outtime: json["Outtime"],
    empImage: json["EmpImage"],
    empImage2: json["EmpImage2"],
    price: json["price"],
    image: json["image"],
    resultType: json["type"],
    status: json["status"],
    gameName: json["GameName"],
    type: json["Type"],
    num: json["Num"],
    amount: json["amount"],
    phNumber: json["PHNumber"],
    dat: json["dat"],
  );

  Map<String, dynamic> toJson() => {
    "EmpCode": empCode,
    "Date": date,
    "InTime": inTime,
    "Outtime": outtime,
    "EmpImage": empImage,
    "EmpImage2": empImage2,
    "price": price,
    "image": image,
    "type": resultType,
    "status": status,
    "GameName": gameName,
    "Type": type,
    "Num": num,
    "amount": amount,
    "PHNumber": phNumber,
    "dat": dat,
  };
}
