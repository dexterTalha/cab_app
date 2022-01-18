import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:cab_app/widgets/bubble_layer.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> genderItems = ["Select Gender", "Male", "Female", "Not to disclose"];
  String _selectedGender = "Select Gender";

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
                        //image will be taken from profile page
                        const AppTextBold(text: "Registration"),

                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Name",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "*Required";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //dropdown
                        Container(
                          color: bubbleColor,
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButton<String>(
                            underline: Container(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            isExpanded: true,
                            value: _selectedGender,
                            hint: const Text("Select Gender"),
                            items: genderItems
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                _selectedGender = val.toString();
                              });
                            },
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
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Center(
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ),
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
