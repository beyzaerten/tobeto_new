import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_event.dart';
import 'package:tobeto_new/blocs/auth/auth_state.dart';

import 'package:tobeto_new/screens/home_screen.dart';
import 'package:tobeto_new/screens/login_screen/register_screen.dart';
import 'package:tobeto_new/widgets/tobeto_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = "";

  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  bool _obsecureText = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(Login(email: _email, password: _password));
    }
  }

  void _showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      builder: (context, state) {
        return _isLogin
            ? GestureDetector(
                onTap: () {
                  // Tıklanan herhangi bir yere tıklandığında odak kaybolsun
                  _focusNode.unfocus();
                  _focusNodePassword.unfocus();
                },
                child: Scaffold(
                  drawer: SafeArea(child: TobetoDrawer()),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  body: Stack(children: [
                    Container(
                      width: phoneWidth,
                      height: phoneHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: isDarkMode
                                ? const AssetImage("lib/assets/darklogin.png")
                                : const AssetImage("lib/assets/login1.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Center(
                          child: Container(
                        width: phoneWidth / 1.3,
                        height: phoneHeight / 2.2,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: isDarkMode
                              ? [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.332),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 1),
                                  ),
                                ]
                              : const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.13),
                                    blurRadius: 29.0,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: phoneHeight / 25,
                          ),
                          AspectRatio(
                              aspectRatio: 16 / 2,
                              child: isDarkMode
                                  ? Image.asset("lib/assets/tb.png")
                                  : Image.asset("lib/assets/tobeto.png")),
                          SizedBox(
                            height: phoneHeight / 45,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              // height: phoneHeight / 22,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains("@")) {
                                    return "Lütfen geçerli bir e-posta adresi giriniz.";
                                  }
                                },
                                onSaved: (value) => _email = value!,
                                focusNode: _focusNode,
                                style: TextStyle(fontSize: 13),
                                cursorHeight: phoneHeight / 40,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.mail_outline,
                                      size: 20,
                                      // color: const Color.fromARGB(255, 156, 156, 156),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 9),
                                    labelText: "E-Posta",
                                    labelStyle: TextStyle(
                                      fontSize: phoneWidth / 27,
                                      color: const Color.fromARGB(
                                          255, 156, 156, 156),
                                    )),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              // height: phoneHeight / 15,
                              child: TextFormField(
                                focusNode: _focusNodePassword,
                                onSaved: (value) => _password = value!,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 8) {
                                    return 'Şifre en az 8 karakter uzunluğunda olmalıdır.';
                                  }
                                  return null;
                                },
                                style: const TextStyle(fontSize: 13),
                                obscureText: _obsecureText,
                                cursorHeight: phoneHeight / 40,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      size: 20,
                                      // color: const Color.fromARGB(255, 156, 156, 156),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obsecureText = !_obsecureText;
                                          });
                                        },
                                        icon: Icon(
                                          _obsecureText
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 20,
                                          // color: const Color.fromARGB(255, 156, 156, 156),
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 9),
                                    labelText: "Parola",
                                    labelStyle: TextStyle(
                                      fontSize: phoneWidth / 27,
                                      color: const Color.fromARGB(
                                          255, 156, 156, 156),
                                    )),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              width: phoneWidth / 1.5,
                              height: phoneHeight / 25,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ))),
                                  onPressed: () {
                                    _submit();
                                    if (state is NotAuthenticated) {
                                      _showErrorSnackBar(state.errorMessage ??
                                          "Giriş yapılamadı");
                                    }
                                  },
                                  child: const Text(
                                    "GİRİŞ YAP",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight / 45,
                          ),
                          Divider(),
                          // Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets
                                  .zero, // İçerisindeki Text widget'ına ait padding değeri
                              child: Text(
                                "Hesabınız Yok Mu? Kayıt Ol",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 194, 25, 255)),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Parolamı Unuttum",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ))
                        ]),
                      )),
                    )
                  ]),
                ))
            : RegisterScreen();
      },
    );
  }
}
