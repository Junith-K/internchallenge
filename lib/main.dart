import 'package:flutter/material.dart';
import 'package:internchallenge/form_submit.dart';
import 'package:internchallenge/movie_view.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/" : (context)=>const MovieView(),
      "/form": (context)=>const FormSubmit(),
    },
  ));
}
