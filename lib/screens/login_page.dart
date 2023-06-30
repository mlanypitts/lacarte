import 'package:flutter/material.dart';
import 'package:restaurant_assignment/screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  bool _passwordVisible = true;

  final TextEditingController nameController = TextEditingController();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-2.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.ease,
  ));

  @override
  void initState() {
    super.initState();
    stopAnimation();
  }

  void stopAnimation() async {
    await _animationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 18),
                    Image.asset(
                      'assets/images/logo.png',
                    ),
                    const SizedBox(height: 44),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Container(
                        height: 288,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                    style: BorderStyle.solid
                                  ),
                                ),
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.white),
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    // Do something
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: TextField(
                                  obscureText: _passwordVisible,
                                  style: const TextStyle(color: Colors.white),
                                  decoration:  InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(_passwordVisible){
                                            _passwordVisible = false;
                                          }
                                          else{
                                            _passwordVisible = true;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        _passwordVisible == true ? Icons.visibility:Icons.visibility_off,
                                        color: Colors.white,
                                        size: 22
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(color: Colors.white),
                                    contentPadding: const EdgeInsets.all(15),
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value) {
                                    // Do something
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white.withOpacity(0.8),
                                child: const Icon(Icons.arrow_forward, size: 24, color: Colors.black,),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
