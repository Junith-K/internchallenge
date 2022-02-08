import 'package:flutter/material.dart';
import 'movie.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  List<Movie> movies =[];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: const Color.fromRGBO(240, 128, 128, 1),
      ),
      body: movies.isEmpty? const Center(child: Text("No Movies Found!!!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 128, 128, 1),),),): ListView.builder(
        itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 128, 128, 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(
                      10.0,
                      10.0,
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Movie :    ", style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                    ),
                        ),
                        Text(movies[index].moviename, style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Director :    ", style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        ),
                        Text(movies[index].director, style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.file(movies[index].image),
                    ),
                    ElevatedButton.icon(onPressed: (){
                          setState(() {
                            movies.removeAt(index);
                          });
                        }, icon: const Icon(Icons.delete_forever, color: Color.fromRGBO(240, 128, 128, 1)), label: const Text("Delete Movie", style: TextStyle(
                      color: Color.fromRGBO(240, 128, 128, 1),
                    ),),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 255, 255, 1),),
                            ),
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, "/form");
          setState(() {
            movies.add(Movie(moviename: result["name"],director: result["director"], image: result["image"]));
          });
        },
        child: const Icon(Icons.add,color: Color.fromRGBO(240, 128, 128, 1),),
        tooltip: "Add Movie",
      ),
    );
  }
}
