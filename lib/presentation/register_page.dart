import 'package:flutter/material.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/domain/models/user_model.dart';
import 'package:pengiriman/domain/api/user_api.dart';
// import 'package:paktani_mobile/domain/api/user_api.dart';
// import 'package:paktani_mobile/domain/model/user_model.dart';
// import 'package:paktani_mobile/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';

  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController _userPhoneNumberController =
      TextEditingController();
  bool _isObscure = true;
  
  final UserApi _userApi = UserApi();
  late UserModel userModel;
  @override
  void initState() {
    super.initState();
    _emailController;
    _passwordController;
    _usernameController;
    _userAddressController;
    _userPhoneNumberController;
  }

  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 50,
                child: TextField(
                  enabled: true,
                  cursorColor: Colors.blue,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 80,
                alignment: Alignment.center,
                child: TextField(
                  obscureText: _isObscure,
                  obscuringCharacter: '*',
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 50,
                child: TextField(
                 
                  cursorColor: Colors.blue,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'username',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 50,
                child: TextField(
                 
                  cursorColor: Colors.blue,
                  controller: _userAddressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'address',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 50,
                child: TextField(
                  
                  cursorColor: Colors.blue,
                  controller: _userPhoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'phone number',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('belum memiliki akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    String email = _emailController.text.toString();
                    String username = _usernameController.text.toString();
                    String password = _passwordController.text.toString();
                    String userAddress = _userAddressController.text.toString();
                    String userPhoneNumber =
                        _userPhoneNumberController.text.toString();

                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _usernameController.text.isNotEmpty &&
                        _userAddressController.text.isNotEmpty &&
                        _userPhoneNumberController.text.isNotEmpty) {
                      UserModel userModel = UserModel(
                        email: email,
                        username: username,
                        password: password,
                       address: userAddress
                      );
                      _userApi.createUser(userModel);

                      print(userModel);
                     // Navigator.pushNamed(context, LoginPage.ROUTE_NAME);
                    } else {
                      const AlertDialog(
                        title: Text('data tidak lengkap'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _userAddressController.dispose();
    _userPhoneNumberController.dispose();
    super.dispose();
  }
}
