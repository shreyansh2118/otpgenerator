import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'numberinputpage.dart';

class verifyPage extends StatefulWidget {
  final String verificationId;

  const verifyPage(
      {Key? key, required this.verificationId, required this.phone})
      : super(key: key);

  final String phone;

  @override
  State<verifyPage> createState() => _verifyPageState();
}

class _verifyPageState extends State<verifyPage> {
  var code = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  final verifyCodeController = TextEditingController();

  getMobileformWidget(context) {}

  getotpformwidget(context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF035AA6),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 105,
                    width: 25,
                  ),
                  Container(
                    child: InkWell(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  "Verify Phone",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Text('code is sent to ${widget.phone}'),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PinFieldAutoFill(
                  codeLength: 6,
                  // cursor: true,
                  autoFocus: true,
                  decoration: UnderlineDecoration(
                    lineHeight: 2,
                    lineStrokeCap: StrokeCap.square,
                    bgColorBuilder: PinListenColorBuilder(
                        Colors.greenAccent.shade200, Colors.blue.shade200),
                    colorBuilder: FixedColorBuilder(Colors.transparent),
                  ),
                  onCodeChanged: (value) {
                    code = value!;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text("Dont't receive the code?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Request Again",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Loginpage.verify, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "option", (route) => false);
                    } catch (e) {
                      // print("wrong otp");
                    }
                  },
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90, top: 15),
                      child: Text("VERIFY AND CONTINUE"),
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
