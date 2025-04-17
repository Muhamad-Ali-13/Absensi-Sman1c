import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService extends ChangeNotifier {
  String _userId = '';
  String _errorMessage = '';

  String getErrorMessage() => _errorMessage;

  void setLoginErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  String getUserId() => _userId;

  Future<bool> createUserManually(String email, String pwd, String nama, String role) async {
    try {
      final response = await Supabase.instance.client
          .from('users')
          .insert({
        'email': email,
        'password': pwd,
        'nama': nama,
        'role': role,
      })
          .select()
          .single();

      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      setLoginErrorMessage('Gagal membuat user: $e');
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    setLoginErrorMessage('');
    try {
      final response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('email', email)
          .eq('password', password)
          .single();

      if (response != null) {
        _userId = response['id'];
        return true;
      } else {
        setLoginErrorMessage('Email atau password salah.');
        return false;
      }
    } catch (e) {
      setLoginErrorMessage('Login error: $e');
      return false;
    }
  }
}

Future<void> loginUser(String email, String password) async {
  final response = await Supabase.instance.client
      .from('users')
      .select()
      .eq('email', email)
      .eq('password', password)
      .single(); // hanya ambil satu data

  if (response != null && response.data != null) {
    final user = response.data;
    print('Login sukses! Selamat datang, ${user['nama']}');
    // Simpan user ID / info di local state atau secure storage
  } else {
    print('Login gagal: Email atau password salah.');
  }
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://csvnoolewgjdtxvdposl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNzdm5vb2xld2dqZHR4dmRwb3NsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ5MDQ3NjksImV4cCI6MjA2MDQ4MDc2OX0.YXlKBVDfLCRT9ej9-SyVHQQG8aiG-cijlKmIgpLLXQ4',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
      ],
      child: FlutterAbsensiApp(),
    ),
  );
}

class FlutterAbsensiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme
            )
        ),
        debugShowCheckedModeBanner: false,
        home: FlutterAbsensiSplash()
    );
  }
}

class FlutterAbsensiSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FlutterAbsensiLogin())
      );
    });

    return Scaffold(
        backgroundColor: Utils.mainThemeColor,
        body: Stack(
          children: const [
            Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                    )
                )
            )
          ],
        )
    );
  }
}

class FlutterAbsensiLogin extends StatefulWidget {
  @override
  FlutterAbsensiLoginState createState() => FlutterAbsensiLoginState();
}

class FlutterAbsensiLoginState extends State<FlutterAbsensiLogin>{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginService get loginService => Provider.of<LoginService>(context, listen: false);

  bool validateEmailAndPassword() {
    String email = usernameController.text.trim();
    String password = passwordController.text;
    return Utils.validateEmail(email) && password.isNotEmpty;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 7,
                          color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                child: Image.asset(
                  'assets/smanic.jpeg',
                ),
              ),
              const SizedBox(height: 30),
              const Text('Welcome to', style: TextStyle(color: Colors.grey, fontSize: 15)),
              const Text('Absensi\nSMAN 1 CIAWI',
                  style: TextStyle(color: Utils.mainThemeColor, fontSize: 30)),
              Expanded(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('Sign Into Your Absensi Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey, fontSize: 12)
                            ),
                            const SizedBox(height: 10),
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: TextField(
                                    onChanged: (text) {
                                      setState(() {});
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email, color: Utils.mainThemeColor),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 20, bottom: 11, top: 11, right: 15
                                        ),
                                        hintText: "Email"
                                    ),
                                    style: const TextStyle(fontSize: 16),
                                    controller: usernameController
                                )
                            ),
                            const SizedBox(height: 20),
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: TextField(
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.lock, color: Utils.mainThemeColor),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 11, right: 15
                                      ),
                                      hintText: "Password"
                                  ),
                                  controller: passwordController,
                                  style: const TextStyle(fontSize: 16),
                                )
                            )
                          ]
                      )
                  )
              ),
              FlutterAbsensiMainButton(
                  label: 'Log In',
                  enabled: validateEmailAndPassword(),
                  onTap: () async {
                    var username = usernameController.value.text;
                    var pwd = passwordController.value.text;

                    bool isLoggedIn = await loginService.signInWithEmailAndPassword(username, pwd);

                    if (isLoggedIn) {
                      usernameController.clear();
                      passwordController.clear();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FlutterAbsensiMain())
                      );
                    }
                  }
              ),
              const SizedBox(height: 10),

            ]
        ),
      ),
    );
  }
}


class FlutterAbsensiMainButton extends StatelessWidget {

  final Function? onTap;
  final String? label;
  final bool? enabled;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? labelColor;

  const FlutterAbsensiMainButton({
    Key? key, this.label, this.onTap,
    this.icon,
    this.backgroundColor = Utils.mainThemeColor,
    this.iconColor = Colors.white,
    this.labelColor = Colors.white,
    this.enabled = true })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: enabled! ? backgroundColor : backgroundColor!.withOpacity(0.5),
            child: InkWell(
              onTap: enabled! ? () {
                onTap!();
              } : null,
              highlightColor: Colors.white.withOpacity(0.2),
              splashColor: Colors.white.withOpacity(0.1),
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: icon != null,
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Icon(icon, color: iconColor, size: 20),
                            )
                        ),
                        Text(label!, textAlign: TextAlign.center,
                            style: TextStyle(
                                color: labelColor,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ]
                  )
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FlutterAbsensiMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('main page'),
        )
    );
  }
}

class Utils {
  static const Color mainThemeColor = Color(0xFFFF0000);

  static bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);

    return (value != null || value!.isNotEmpty || regex.hasMatch(value));
  }

  static Widget generateInputField(
      String hintText,
      IconData iconData,
      TextEditingController controller,
      bool isPasswordField,
      Function onChanged) {

    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50)
        ),
        child: TextField(
          onChanged: (text) {
            onChanged(text);
          },
          obscureText: isPasswordField,
          obscuringCharacter: "*",
          decoration: InputDecoration(
              prefixIcon: Icon(iconData, color: Utils.mainThemeColor),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: hintText
          ),
          controller: controller,
          style: const TextStyle(fontSize: 16),
        )
    );
  }
}


