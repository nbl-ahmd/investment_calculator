MaterialApp(
title: "Expense Tracker App",
home: Scaffold(
body: home_screen(),
),
),





//Navigator.of(context).pop(_textcontrollerAmount.text);
if (_formKey.currentState!.validate()) {}

child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [








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
onPressed: () => nameWidget.setName(_textcontrollerAmount.text),
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











////////////////





class appbar extends StatelessWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            height: 50.0,
            padding: EdgeInsets.only(right: 40.0),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Align(
              alignment: Alignment.centerRight,

              child: home_screen(),
            ),
          ),

        ],
      ),
    );
  }
}