import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Application()));
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => new _ApplicationState();
}

class _ApplicationState extends State<Application> {

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text( "Calculo de Areas")),
        body:
        Container(
          child: new ListView(
            children: <Widget>[

              new Card(
                child: new ListTile(
                  leading: Icon(Icons.eject),
                  title: Text('Triangulo',style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Triangulo()),
                    );
                  },
                ),
              ),

              new Card(
                child: new ListTile(
                  leading: Icon(Icons.add_to_queue),
                  title: Text('Rectangulo',style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rectangulo()),
                    );
                  },
                ),
              ),
              new Card(
                child: new ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('Circulo',style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Circulo()),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}

//----------------------------Área de un Circulo-------------------------------------
class Circulo extends StatefulWidget {
  @override
  _CirculoState createState() => _CirculoState();
}

class _CirculoState extends State<Circulo> {
  TextEditingController radioController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "El área es:";

  void _resetFields(){
    radioController.text = "";
    setState(() {
      _infoText = "El área es:";
    });
  }

  void _calculate(){
    setState(() {
      double radio = double.parse(radioController.text);
      double area = 3.14159 * radio * radio;
      _infoText = "El área es: (${area.toString()})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo Área de Círculo'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.access_time, size: 120.0, color: Colors.blue),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  controller: radioController ,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Ingrese el radio del Círculo";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Radio Círculo",
                      labelStyle: TextStyle(color: Colors.blue))),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------Área de triangulo-------------------------------------
class Triangulo extends StatefulWidget {
  @override
  _TrianguloState createState() => _TrianguloState();
}

class _TrianguloState extends State<Triangulo> {
  TextEditingController baseController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "El área es:";

  void _resetFields(){
    baseController.text = "";
    alturaController.text = "";
    setState(() {
      _infoText = "El área es:";
    });
  }

  void _calculate(){
    setState(() {
      double base = double.parse(baseController.text);
      double altura = double.parse(alturaController.text);
      double area = base * altura / 2;
      _infoText = "El área es: (${area.toString()})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo Área Triangulo'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.eject, size: 120.0, color: Colors.blue),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  controller: baseController ,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Ingrese base del triangulo";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Base triangulo",
                      labelStyle: TextStyle(color: Colors.blue))),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  controller: alturaController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Ingresa la altura del triangulo";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Altura triangulo",
                      labelStyle: TextStyle(color: Colors.blue))),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------Área de Rectangulo-------------------------------------
class Rectangulo extends StatefulWidget {
  @override
  _RectanguloState createState() => _RectanguloState();
}

class _RectanguloState extends State<Rectangulo> {
  TextEditingController baseController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "El área es:";

  void _resetFields(){
    baseController.text = "";
    alturaController.text = "";
    setState(() {
      _infoText = "El área es:";
    });
  }

  void _calculate(){
    setState(() {
      double base = double.parse(baseController.text);
      double altura = double.parse(alturaController.text);
      double area = base * altura;
      _infoText = "El área es: (${area.toString()})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo Área Rectangulo'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.airplay, size: 120.0, color: Colors.blue),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  controller: baseController ,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Ingrese base del rectangulo";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Base rectangulo",
                      labelStyle: TextStyle(color: Colors.blue))),
              TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  controller: alturaController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Ingresa la altura del rectangulo";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Altura rectangulo",
                      labelStyle: TextStyle(color: Colors.blue))),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                      _calculate();
                      }
                    },
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
