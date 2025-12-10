import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Đăng nhập"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TÊN NGƯỜI DÙNG
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Tên người dùng",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập tên người dùng";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // MẬT KHẨU
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải có ít nhất 6 ký tự";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // ===== NÚT ĐĂNG NHẬP (CÓ ICON + NHỎ GỌN) =====
                  SizedBox(
                    width: 150, // ⭐ Thu nhỏ nút
                    height: 45, // ⭐ Chiều cao vừa phải
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login), // ⭐ Icon đăng nhập
                      label: const Text("Đăng nhập"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Đăng nhập thành công"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
