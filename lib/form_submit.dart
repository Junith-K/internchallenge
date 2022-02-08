import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'movie.dart';
import 'dart:io';

class FormSubmit extends StatefulWidget {
  const FormSubmit({Key? key}) : super(key: key);

  @override
  _FormSubmitState createState() => _FormSubmitState();
}

class _FormSubmitState extends State<FormSubmit> {

  List<Movie> movies =[];
  File? _imageFile;
  final picker = ImagePicker();
  bool checkAll = false;

  TextEditingController name_controller = TextEditingController();
  TextEditingController director_controller = TextEditingController();

  showAlertDialog(BuildContext context) {
    Widget button = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(240, 128, 128, 1),),
      ),
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Missing!!", textAlign: TextAlign.center,),
      content: const Text("One or more fields are missing, please make sure to fill them ", textAlign: TextAlign.center,),
      actions: [
        button,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final imageTemp = File(pickedFile.path);
    setState(() {
      _imageFile = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(240, 128, 128, 1),
        title: const Text("Add Movie",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.height*0.03, MediaQuery.of(context).size.width*0.04, 0.0),
            child: TextField(
              cursorColor: const Color.fromRGBO(240, 128, 128, 1),
              controller: name_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(240, 128, 128, 1),
                    style: BorderStyle.solid,
                    width: 3.0,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(240, 128, 128, 1),
                      style: BorderStyle.solid,
                      width: 3.0,
                    )
                ),
                prefixIcon: Icon(Icons.movie_outlined, color: Color.fromRGBO(240, 128, 128, 1),),
                labelText: "Movie Name",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(240, 128, 128, 1),
                  fontWeight: FontWeight.w800
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.height*0.03, MediaQuery.of(context).size.width*0.04, 0.0),
            child: TextField(
              cursorColor: const Color.fromRGBO(240, 128, 128, 1),
              controller: director_controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(240, 128, 128, 1),
                        style: BorderStyle.solid,
                        width: 3.0,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(240, 128, 128, 1),
                        style: BorderStyle.solid,
                        width: 3.0,
                      )
                  ),
                  prefixIcon: Icon(Icons.person, color: Color.fromRGBO(240, 128, 128, 1),),
                  labelText: "Director Name",
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(240, 128, 128, 1),
                      fontWeight: FontWeight.w800
                  )
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          _imageFile != null
                ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.file(_imageFile!, height: MediaQuery.of(context).size.height*0.15,),
                )
              : ElevatedButton.icon(onPressed: pickImage, icon: const Icon(Icons.image, color: Colors.white), label: const Text("Add Poster Image"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(240, 128, 128, 1),),
                ),
          ),
          ElevatedButton(
            onPressed: (){
              if(name_controller.text.isNotEmpty && director_controller.text.isNotEmpty && _imageFile!=null) {
                Navigator.pop(context, {
                  "name": name_controller.text,
                  "director": director_controller.text,
                  "image": _imageFile,
                });
              }
              else{
                showAlertDialog(context);
              }
            },
            child: const Text("Submit"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(240, 128, 128, 1),),
            ) ,
          )
        ],
      ),
    );
  }
}
