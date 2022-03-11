import 'dart:html';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    App()
  );
}



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text('Flutter App');

    //var appBody = home_body();

   /** var appBar = AppBar(
      title: appTitle,
      backgroundColor: Colors.grey,
      actions: [
        appbar(),
      ],

    );
       **/

    var app = MaterialApp(
      home: home_screen(),

      /**Scaffold(
        //appBar: appBar,
        //body: appBody,
      ),
          **/
    );

    return app;
  }
}






class home_screen extends StatelessWidget{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final  _textcontrollerAmount = TextEditingController();
    final _textcontrollerDescription = TextEditingController();
    final nameWidget = home_body(GlobalKey<home_bodyState>());
    var value = nameWidget;

    return Scaffold(
        body: Column(
        children: [
        Container(

        height: 50.0,
        padding: EdgeInsets.only(right: 40.0),
    decoration: BoxDecoration(color: Colors.transparent),
    child: Align(
    alignment: Alignment.centerRight,

    child:
      IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('enter input'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter amount',
                          ),
                          controller: _textcontrollerAmount,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
                            }
                            return null;
                          },
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _textcontrollerDescription,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "expense";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: MaterialButton(
                            color: Colors.blueGrey,
                            child: Text('Submit',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                nameWidget.setName(_textcontrollerAmount.text);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),

    ),
    ),
            Container(
              margin: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-60.0,
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.90,
                      height: MediaQuery.of(context).size.height*.30,
                      margin: EdgeInsets.all(5.0),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Balance",
                            ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: nameWidget,
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
      ],
    ),
    );
  }
  


}

class home_body extends StatefulWidget {
  final GlobalKey<home_bodyState> _key;

  home_body(this._key): super (key: _key);
  @override
  State<StatefulWidget> createState() => home_bodyState();

  setName(String name) {
    _key.currentState?.setName(name);
  }
}


class home_bodyState extends State<home_body> {
  String _name = '';
  @override
  Widget build(BuildContext context) {
    final widget = Text('\u{20B9}$_name',
        style: const TextStyle(fontSize: 50,
        color: Colors.black87));
    return widget;
  }
  setName(String name) {
    setState(() {
      _name = name;
    });
  }

}

