IconButton(
icon: Icon(Icons.add),
onPressed: (){
showDialog(
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
},
);