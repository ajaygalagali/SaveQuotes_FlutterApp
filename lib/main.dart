import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/quote_card.dart';
import 'QuoteList.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<QuoteList> list = [
    QuoteList(text: "A friend is someone who knows all about you and still loves you.",author: "Elbert Hubbard"),
    QuoteList(text: "Always forgive your enemies; nothing annoys them so much.",author: "Oscar Wilde"),
    QuoteList(text: "Live as if you were to die tomorrow. Learn as if you were to live forever.",author: "Mahatma Gandhi"),
    QuoteList(text: "You only live once, but if you do it right, once is enough.",author: "Mae West"),

  ];
  final _formKey = GlobalKey<FormState>();
//  QuoteList iQuote;
  String iText="";
  String iAuthor="";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SaveQuotes"),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 16),
            child: GestureDetector(onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Quote",
                              labelText: "Quote",
                              icon: Icon(Icons.format_quote)
                            ),
                            validator:(String value){
                              if(value.isEmpty){
                                return "Enter quote";
                              }
                            } ,
                            onSaved: (String value){
                              print("Quote :"+value);
                              setState(() {
                                iText = value;
                              });
                            },

                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Author",
                              labelText: "Author",
                              icon: Icon(Icons.person)
                            ),
                            validator: (String value){
                              if(value.isEmpty){
                                return "Enter author name";
                              }
                            },
                            onSaved: (String value){
                              print("Author :"+value);
                              setState(() {
                                iAuthor = value;
                              });
                            },
                          ),
                          SizedBox(height: 20,),
                          FlatButton.icon(
                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                  setState(() {
                                    list.add(new QuoteList(text: iText,author: iAuthor));
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(Icons.add),
                              label: Text("Add"),
                              color: Colors.black54,
                            textColor: Colors.white,

                          ),
                        ],
                        mainAxisSize: MainAxisSize.min,

                      ),
                    ),
                  );
                }
                
              );
            },
            child: Icon(Icons.add_comment),
            ),
          )
        ],
        ),


      body:Column(children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:list.map((er) => quote_card(
              e:er,
            delete: (){
                setState(() {
                  list.remove(er);
                  print("Heelo");
                });
            },
          )).toList(),
          ),
        ),


      ],)
    );
  }
}




