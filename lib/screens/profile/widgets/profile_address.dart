import 'package:flutter/material.dart';

class ProfileAddress extends StatefulWidget {
  const ProfileAddress({Key? key}) : super(key: key);

  @override
  _ProfileAddressState createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(child: Text("Address")),
        )
      ],
    );
  }
}
