import 'package:flutter_web/material.dart';

class NoteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ValueKey(1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Body",
                    labelStyle: TextStyle(color: Colors.black)),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Use the form above to create a post. Make sure you fill the required title and body fields and press submit.",
                  style: TextStyle(color: Color(0xff717A81)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff007bff),
                onPressed: () {
                  print("Submit pressed");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
