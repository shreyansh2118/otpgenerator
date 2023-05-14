import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'verifypage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var phone = "";
  var code = "+91";

  getMobileformWidget(context) {}

  getotpformwidget(context) {}
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF035AA6),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 130,
                    width: 25,
                  ),
                  Container(
                    child: InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homepage()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Text("You'll receive a 6 digit code"),
                    Text("to verify next."),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 360,
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "img/flag.png",
                        width: 20,
                        height: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+91 -   "),
                    Container(
                      width: 240,
                      height: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          phone = value;
                        },
                        keyboardType: TextInputType.number,
                        controller: _phone,
                        decoration: InputDecoration(hintText: "Mobile Number"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${code + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Loginpage.verify = verificationId;

                        // Navigator.pushNamed(context, "verify");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => verifyPage(
                                  verificationId: '',
                                  phone: _phone.text,
                                )));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Container(
                    width: 390,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, top: 10),
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF035AA6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
