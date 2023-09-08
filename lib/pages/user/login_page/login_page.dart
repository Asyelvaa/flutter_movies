import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: 
              [
                // HEADER
                Text('Welcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                // FORM 
                Form(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: ('Email'),
                          border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: ('Password'),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {}, child: const Text("ForgetPassword")),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/signUp');
                              },
                              child: Text('LOGIN'),
                            ),
                          ),
                      ]
                    ),
                  )
                ),
                // FOOTER
                // const Text("OR"),
                // const SizedBox(height: 20),
                // SizedBox(
                //   width: double.infinity,
                //   child: OutlinedButton.icon(
                //     icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
                //     onPressed: () {},
                //     label: const Text('SignInWithGoogle'),
                //   ),
                // ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text.rich(
                    TextSpan(
                        text: 'DontHaveAnAccount',
                        // style: Theme.of(context).textTheme.bodyText1,
                        children: const [
                          TextSpan(text: 'Signup', style: TextStyle(color: Colors.blue))
                        ]),
                  ),
                ),
              ]),
          ),
        )
      ),
    );
  }
}