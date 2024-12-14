import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubit/sign_up_cubit.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Page'), backgroundColor: Colors.blueGrey),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if(state is SignUpLoading)
                    {
                      return CircularProgressIndicator();
                    }

                  return Column(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 200.0,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(height: 40.0),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          String username = nameController.text;
                          String email = emailController.text;
                          String phoneNumber = phoneNumberController.text;
                          String password = passwordController.text;

                          SignUpCubit cubit = context.read<SignUpCubit>();
                          SignUpInitial user = SignUpInitial(
                            name: username,
                            email: email,
                            phoneNumber: phoneNumber,
                            password: password,
                          );
                          cubit.SignUpSubmit(user);
                        },
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                      if (state is SignUpSuccess)
                        Text('Sign Up Successful!', style: TextStyle(color: Colors.green)),
                      if (state is SignUpFailed)
                        Text('Sign Up Failed! Please fill in all fields correctly', style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
  }
}
