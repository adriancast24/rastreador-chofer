import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'login_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.width * 0.1),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    labelText: 'usuario',
                    labelStyle: TextStyle(
                      color: Color(0xFFBEBCBC),
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * .1,
                  bottom: size.height * 0.05),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    labelText: 'usuario',
                    labelStyle: TextStyle(
                      color: Color(0xFFBEBCBC),
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () => {}, child: Text('iniciar sesion'))
          ],
        ),
      ),
    );
  }
}
