import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DWidget()
    );
  }
}

class DWidget extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(),
      // New Line
      appBar: new AppBar(
        title: new Text("Gear Design"),
        backgroundColor: Colors.black87,
      ),
      body: new Text(""),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(),    // new Line
      appBar: new AppBar(
        title: new Text("Nuevo"),
        backgroundColor: Colors.black87,),
      body: new MaterialApp(home: new MyCard()),
    );
  }
}

class MyCard extends StatelessWidget {
  List cards = new List.generate(10, (i) => new CustomCard()).toList();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: new ListView(
              children: cards,
            )
        )
    );
  }
}

class CustomCard extends StatelessWidget{

  int exodo=0;
  @override
  Widget build(BuildContext context) {
    exodo++;
    return new Card(
      // Los hijos dentro de card en columnas, debajo de otro
      child: new Column(
        children: <Widget>[
          // Agregamos una imagen consumida desde internet
          new Image.network('https://previews.123rf.com/images/djvstock/djvstock1612/djvstock161208276/67274563-dise%C3%B1o-gr%C3%A1fico-aislado-del-ejemplo-del-vector-del-icono-del-s%C3%ADmbolo-del-engranaje.jpg'),
          // Agregamos un contenedor para el texto
          new Container(
            padding: const EdgeInsets.all(10.0), // Un padding para todo
            child: Text(
              'Paso $exodo',
              softWrap: true,

            ),
          ),
          new Padding(
            // Esta seccion sera para los botones de acciones
              padding: new EdgeInsets.all(7.0), // Un padding general entre cada elemento
              child: new Row(
                // mainAxisAlignment permite alinear el contenido dentro de Row
                // en este caso le digo que use spaceBetwee, esto hara que
                // cualquier espacio horizontal que no se haya asignado dentro de children
                // se divida de manera uniforme y se coloca entre los elementos secundarios.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Agregamos los botones de tipo Flat, un icono, un texto y un evento
                  new FlatButton.icon(
                    // Un icono puede recibir muchos atributos, aqui solo usaremos icono, tamaño y color
                    icon: const Icon(Icons.favorite, size: 18.0, color: Colors.redAccent),
                    label: const Text('Like'),
                    // Esto mostrara 'Me encanta' por la terminal
                    onPressed: () {
                      print('Me encanta');
                    },
                  ),
                  new FlatButton.icon(
                    icon: const Icon(Icons.comment, size: 18.0, color: Colors.brown),
                    label: const Text('Comment'),
                    onPressed: () {
                      print('Comenta algo');
                    },
                  ),
                  new FlatButton.icon(
                    icon: const Icon(Icons.share, size: 18.0, color: Colors.blueAccent),
                    label: const Text('Share'),
                    onPressed: () {
                      print('Compartelo');
                    },
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(), // New Line
      appBar: new AppBar(
        title: new Text("Anteriores"),
        backgroundColor: Colors.black87,),
      body: new Text(""),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new DrawerOnly(), // New Line
      appBar: new AppBar(
        title: new Text("Galeria"),
        backgroundColor: Colors.black87,),
      body: new Text(""),
    );
  }
}

class DrawerOnly extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text(""),
              decoration: new BoxDecoration(
                  color: Colors.black87
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.create_new_folder),
              title: new Text("Nuevo"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new FirstPage()));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.history),
              title: new Text("Anteriores"),
              onTap: () {
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new SecondPage()));
              },
            ),
            new ListTile(
              leading: new Icon(Icons.videogame_asset),
              title: new Text("Galeria"),
              onTap: (){
                Navigator.pop(ctxt);
                Navigator.push(ctxt,
                    new MaterialPageRoute(builder: (ctxt) => new ThirdPage()));
              },
            ),
          ],
        ),

    );
  }
}