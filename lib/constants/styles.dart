import 'package:flutter/material.dart';
import 'package:userlogin/constants/colors.dart';

const TextStyle descriptionStyle =
    TextStyle(fontSize: 16, color: textLight, fontWeight: FontWeight.w200);

const inputFormDecoration = InputDecoration(
  hintText: 'Enter Password',
  hintStyle: TextStyle(color: textLight, fontSize: 12),
  fillColor: bgBlack,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.amber, width: 1)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.amber, width: 1)),
);
