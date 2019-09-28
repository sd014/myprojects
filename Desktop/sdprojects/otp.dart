import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class OTPPAGE extends StatelessWidget {
  const OTPPAGE({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'otp page',
      home: Otp(),
    );
  }
}

final TextEditingController phnctlr = new TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class Otp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    final APPTitle = "otp";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(APPTitle),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.white30,
                  Colors.red[20],
                  Colors.red[30],
                  Colors.orange[30],
                  Colors.red[40],
                  Colors.red[50],
                ],
              ),
            ),
            child: Form(
              key: _formkey,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 25,
                    child: new Scaffold(
                      body: new Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.green,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(1, 0, 2, 19),
                            child: CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'IN',
                              favorite: ['+91', 'India'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                          ),
                          SizedBox(height: 20),
                          new Container(
                              height: 110,
                              width: (MediaQuery.of(context).size.width) * 0.6,
                              child: new TextFormField(
                                controller: phnctlr,
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                onEditingComplete: checkvalue,
                                validator: (value) {
                                  if (value.length != 10) {
                                    return ('enter a 10 digit moble no. please!');
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Contact No.',

                                  // helperText: "enter mob.",
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: 'enter Contact No. number',
                                  suffix: Text('*'),
                                  helperText: 'please enter your Contact No.',
                                  helperStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                  suffixStyle: TextStyle(color: Colors.red),
                                  prefixStyle:
                                      TextStyle(color: Colors.green, fontSize: 20),
                                  labelStyle: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigo,
                                      width: 1.5,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigo,
                                      width: 1.5,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text("send"),
                    onPressed: checkvalue,
                  )
                ],
                
              ),
              
            ),
                
          ),
        
        ),
      ),
    );
  }

  checkvalue() {
    if(_formkey.currentState.validate())
    {
      print("your phone no is +91$phnctlr");
    }
  }
}
