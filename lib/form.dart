import 'dart:math';

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? chooseCountry, gender;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void chooseGender(String? value) {
    setState(() {
      gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY FORM"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    return username.value.text.isEmpty
                        ? "Field must be fill"
                        : null;
                  },
                  controller: username,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Username"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    return email.value.text.isEmpty
                        ? "Field must be fill"
                        : null;
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    return password.value.text.isEmpty
                        ? "Field must be fill"
                        : null;
                  },
                  controller: password,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey[200],
                  ),
                  padding: const EdgeInsets.all(12),
                  height: 50,
                  width: double.infinity,
                  child: DropdownButton(
                      hint: const Text('Choose Country'),
                      value: chooseCountry,
                      isExpanded: true,
                      items: ["Malaysia", "Indonesia", "China", "Thailand"]
                          .map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          chooseCountry = value;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                        activeColor: Colors.red,
                        title: const Text("Man"),
                        value: "Man",
                        groupValue: gender,
                        onChanged: (valueGender) {
                          chooseGender(valueGender);
                        },
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        activeColor: Colors.yellow,
                        title: const Text("Woman"),
                        value: "Woman",
                        groupValue: gender,
                        onChanged: (valueGender) {
                          chooseGender(valueGender);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (chooseCountry != null && gender != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("DISMISS"))
                                ],
                                content: SizedBox(
                                  height:
                                  MediaQuery.maybeOf(context)!.size.height *
                                      0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Username: ${username.text}"),
                                      Text("Email: ${email.text}"),
                                      Text("Password: ${password.text}"),
                                      Text("Country: $chooseCountry"),
                                      Text("Gender: $gender")
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }
                  },
                  color: Colors.blueGrey,
                  height: 50,
                  minWidth: double.infinity,
                  child: const Text("SUBMIT"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
