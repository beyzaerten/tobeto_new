import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_event.dart';
import 'package:tobeto_new/widgets/footer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  String newPassword = "";
  String oldPassword = "";

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      // Mevcut kullanıcının kimlik bilgilerini al
      User? user = FirebaseAuth.instance.currentUser;

      // Kullanıcıyı e-posta ve eski şifre ile tekrar doğrula
      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // Yeni şifreyi güncelle
      await user.updatePassword(newPassword);

      // Şifre değiştirme başarılı
      print("Şifre başarıyla değiştirildi!");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Şifreniz başarıyla değiştirildi.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Hata durumunda kullanıcıya bilgi ver
      print("Şifre değiştirme hatası: $error");
    }
  }

  Future<void> deleteAccount() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Kullanıcıyı sil
      await user!.delete();

      // Kullanıcı silme başarılı
      print("Kullanıcı hesabı başarıyla silindi!");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Üyeliğiniz başarıyla sonlandırıldı.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Hata durumunda kullanıcıya bilgi ver
      print("Üyelik sonlandırma hatası: $error");
    }
  }

  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Emin misiniz?"),
          content:
              Text("Üyeliğinizi sonlandırmak istediğinizden emin misiniz?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // İptal butonuna basılınca dialogu kapat
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Sil butonuna basılınca dialogu kapat
                deleteAccount(); // Kullanıcıyı silme işlemi
              },
              child: Text("Sil"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color? textColor = isDarkMode
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).textTheme.bodyMedium!.color;
    return Form(
        key: _formKey,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: phoneHeight / 60,
                // ),
                Text(
                  "Eski Şifre*",
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  obscureText: false,
                  onSaved: (newValue) => oldPassword = newValue!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Şifrenizi Giriniz";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Eski Şifre",
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(style: BorderStyle.solid))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yeni Şifre*",
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (newValue) => newPassword = newValue!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Şifrenizi Giriniz";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Yeni Şifre",
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(style: BorderStyle.solid))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yeni Şifre Tekrar*",
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  // onSaved: (newValue) => surname = newValue!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Şifrenizi Giriniz";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Yeni Şifre Tekrar",
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(style: BorderStyle.solid))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: phoneHeight / 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: phoneWidth / 25),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Form geçerliyse, şifre değiştirme fonksiyonunu çağır
                    changePassword(oldPassword, newPassword);
                  }
                },
                child: Text("Şifre Değiştir",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: phoneWidth / 25, vertical: 5),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  _showDeleteConfirmationDialog();
                },
                child: Text("Üyeliği Sonlandır",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: phoneHeight / 20,
          ),
          Footer()
        ]));
  }
}
