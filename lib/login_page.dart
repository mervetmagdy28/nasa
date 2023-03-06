import 'package:flutter/material.dart';
import 'package:nasa/constants.dart';
import 'package:nasa/widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChange = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 60,
              ),
               Image(
                image: AssetImage(
                  nasaImage,
                ),
                height: 180,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(Controller: emailController, label: "Email",),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(Controller: passwordController, label: "Password"),
              Row(
                children: [
                  Checkbox(
                      value: isChange,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          isChange = value!;
                        });
                      }),
                  Text(
                    "remember me",
                    style: TextStyle(fontSize: 15, color: kPrimaryColor),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .09),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()){
                        Navigator.of(context).pushNamed(homeId);
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      maximumSize: MaterialStateProperty.all(const Size(100, 40))),
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "forget your password?",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

