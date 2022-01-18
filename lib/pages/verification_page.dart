import 'package:cab_app/pages/registration_page.dart';
import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:cab_app/widgets/app_text_normal.dart';
import 'package:cab_app/widgets/bubble_layer.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubbleLayer(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //making close icon clickable
              GestureDetector(
                onTap: () {
                  //handle close
                  print("close");
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppTextBold(text: "Verification"),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Enter the 6 digit OTP sent to your\nmobile number",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _codeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Required";
                              }
                              if (value.length < 6) {
                                return "Invalid OTP";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            maxLength: 6,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "6 digit OTP",
                              hintStyle: const TextStyle(color: Colors.black54),
                              counterText: "",
                            ),
                          ),
                        ),
                        //button
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                          child: Container(
                            height: 40,
                            color: buttonColor,
                            child: ElevatedButton(
                              onPressed: () {
                                //handle click of button
                                if (_formKey.currentState!.validate()) {
                                  print("Code is ${_codeController.text}");
                                }
                              },
                              child: const Center(
                                child: Text("Verify"),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationPage()));
                            },
                            child: Text(
                              "Resend OTP?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.red,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
