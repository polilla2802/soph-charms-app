import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soph_charms_app/app/provider/google_sign_in.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  String box = "";
  bool loading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _logOut() async {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    await provider.googleLogOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(163, 208, 241, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(254, 202, 250, 1),
          title: Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                        radius: 15,
                      ),
                    )),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        user.displayName!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color.fromRGBO(238, 80, 165, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async => _logOut(),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Color.fromRGBO(238, 80, 165, 1),
                  ),
                ))
          ],
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    if (loading == true) {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 8), child: Text("Test")),
          ],
        ),
      );
    }
  }

  Widget _emptyBox() {
    return const SizedBox();
  }

  Widget _boxGrid(Map<dynamic, dynamic> boxMap) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                child: Container(
                  child: Column(
                    children: [
                      Image.asset("assets/logos/cube.png"),
                      Text("cube ${index + 1}")
                    ],
                  ),
                ),
              );
            },
            childCount: boxMap.length,
          ),
        ),
      ],
    );
  }
}
