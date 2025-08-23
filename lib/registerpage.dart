import 'package:flutter/material.dart';
import 'widget/appbar.dart';
import 'widget/footer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    final orangeColor = const Color.fromARGB(255, 237, 119, 1);

    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rejestracja',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email
                            TextFormField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Adres e-mail',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.grey[900],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Wprowadź adres e-mail';
                                }
                                if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Nieprawidłowy format e-mail';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Hasło
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Hasło',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.grey[900],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Wprowadź hasło';
                                }
                                if (value.length < 6) {
                                  return 'Hasło musi mieć co najmniej 6 znaków';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Potwierdzenie hasła
                            TextFormField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Potwierdź hasło',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.grey[900],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Potwierdź hasło';
                                }
                                if (value != passwordController.text) {
                                  return 'Hasła nie są takie same';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            // Akceptacja regulaminu
                            Row(
                              children: [
                                Checkbox(
                                  value: acceptedTerms,
                                  activeColor: orangeColor,
                                  onChanged: (value) {
                                    setState(() {
                                      acceptedTerms = value ?? false;
                                    });
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                    'Akceptuję regulamin i politykę prywatności',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (!acceptedTerms) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Musisz zaakceptować regulamin')),
                                      );
                                      return;
                                    }
                                    // TODO: Dodaj logikę rejestracji
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Rejestracja powiodła się!')),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Zarejestruj się',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Masz już konto?",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Zaloguj się',
                                    style: TextStyle(color: orangeColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const FooterPage(), // <- Footer działa poprawnie
          ],
        ),
      ),
    );
  }
}
