import 'package:chaussure/models/models.dart';
import 'package:flutter/material.dart';

final List<ShoeModel> availableShoe = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAdress: "images/c1.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN MID",
      price: 190.00,
      imgAdress: "images/c2.png",
      modelColor: const Color(0xff3f7943)),
  // ShoeModel(
  //     name: "NIKE",
  //     model: "ZOOM",
  //     price: 160.00,
  //     imgAdress: "images/c3.png",
  //     modelColor: const Color(0xffE66863)),
  ShoeModel(
      name: "NIKE",
      model: "ZOOM",
      price: 160.00,
      imgAdress: "images/c3.png",
      modelColor: const Color(0xffE66863)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAdress: "images/c5.png",
      modelColor: const Color(0xff37376B)),
  ShoeModel(
      name: "NIKE",
      model: "ZOOM",
      price: 115.00,
      imgAdress: "images/c6.png",
      modelColor: const Color(0xffE4E3E8)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAdress: "images/c7.png",
      modelColor: const Color(0xffD68043)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAdress: "images/c8.png",
      modelColor: const Color(0xffE2E3E5)),
];

// *******************

List<ShoeModel> itemsOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
      emoji: Icons.person,
      text: "Aways",
      selecteColor: const Color(0xff121212),
      unSelecteColor: const Color(0xffbfbfbf)),
  UserStatus(
      emoji: Icons.work,
      text: "At Work",
      selecteColor: const Color(0xff05a35c),
      unSelecteColor: const Color(0xffCEEBD9)),
  UserStatus(
      emoji: Icons.gamepad,
      text: "Gaming",
      selecteColor: const Color(0xffFFD237),
      unSelecteColor: const Color(0xffFDDFBB)),
  UserStatus(
      emoji: Icons.gamepad,
      text: "Busy",
      selecteColor: const Color(0xffBa3a3a),
      unSelecteColor: const Color(0xffdb9797)),
];

// *********************
final List categories = [
  "Nike",
  "Adidas",
  "Jordan",
  "Puma",
  "Gucci",
  "Tom Ford",
  "Koio",
];

final List featured = [
  "New",
  "Featured",
  "Upcoming",
];

final List<double> sizes = [6, 7.5, 8, 9, 5];
