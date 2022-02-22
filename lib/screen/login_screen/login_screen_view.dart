import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  String _name = "";
  String email = "";
  String password = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Username", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 4) {
                      return "Enter at least 4 character";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !GetUtils.isEmail(value)) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => email = value!,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextFormFieldPassword(),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                    onPressed: () {
                      bool isValidate = formKey.currentState!.validate();
                      if (isValidate) {
                        formKey.currentState!.save();
                        print(_name);
                        print(password);
                        print(email);
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          )),
    );
  }

  TextFormField buildTextFormFieldPassword() => TextFormField(
        maxLength: 20,
        obscureText: !_passwordVisible, //This will obscure text dynamically
        enableSuggestions: false,
        autocorrect: false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toggle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

          if (value == null || value.isEmpty || !regex.hasMatch(value)) {
            return "Enter valid password";
          } else {
            return null;
          }
        },
        onSaved: (value) => password = value!,
      );

//    r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
//    $
}
