import 'package:ecom_app/utils/theme.dart';
import 'package:ecom_app/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Column(children: [
                Row(
                  children: [
                    TextUtils(
                        text: 'SGIN',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: mainColor,
                        underLine: TextDecoration.none),
                        SizedBox(width: 3,),
                        TextUtils(
                        text: 'UP',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        underLine: TextDecoration.none),
                  ],
                )
              ]),
            ),
          )
        ]),
      ),
    ));
  }
}
