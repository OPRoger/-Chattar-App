
import 'package:chat_application/pages/Auth/widgets/login_form.dart';
import 'package:chat_application/pages/Auth/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          padding: const EdgeInsets.only( top: 15),
          // height: MediaQuery.of(context).size.height*0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              isLogin.value = true;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Column(
                                children: [
                                  Text("LOGIN",
                                    style: isLogin.value? Theme.of(context).textTheme.headlineSmall : Theme.of(context).textTheme.labelLarge,
                                  ),
                                  AnimatedContainer(duration: Duration(milliseconds: 300),
                                    height: 5,
                                    width: isLogin.value? 90 : 0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.orange
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              isLogin.value = false;

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Column(
                                children: [
                                  Text("SIGN UP",
                                    style: isLogin.value ? Theme.of(context).textTheme.labelLarge: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  AnimatedContainer(duration: Duration(milliseconds: 300),
                                    height: 5,
                                    width: isLogin.value ? 0 : 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.orange
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                      Obx(() => isLogin.value ? LoginForm() : SignupForm())
                    ],
                  )),

            ],
          )

      ),
    );
  }
}
