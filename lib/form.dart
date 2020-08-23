import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class MainForm extends StatefulWidget {
  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController messageContentController = TextEditingController();
  String phoneNum = '';
  String messageContent = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0),
      child: KeyboardAvoider(
        autoScroll: true,
        child: Column(
          children: [
            inputPhoneForm(),
            SizedBox(
              height: 20.0,
            ),
            inputMessageForm(),
            Row(
              children: [
                generateButton(),
                clearAllButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget inputMessageForm() {
    return Neumorphic(
      style: NeumorphicStyle(
        lightSource: LightSource.left,
        shape: NeumorphicShape.convex,
        depth: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Message',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Text(
                '(optional)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                    depth: -24.0,
                    intensity: 18.0,
                    color: Colors.transparent,
                    shape: NeumorphicShape.convex,
                    lightSource: LightSource.top),
                child: TextField(
                  controller: messageContentController,
                  maxLines: 4,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // prefixIcon: Icon(Icons.contact_phone),
                    // suffixIcon: Icon(null),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        messageContentController.clear();
                      },
                    ),
                    hintText: 'Eg: Hi. How are you?',
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputPhoneForm() {
    return Neumorphic(
      style: NeumorphicStyle(
        lightSource: LightSource.right,
        shape: NeumorphicShape.convex,
        depth: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Phone number',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Text(
                'Include your country code\n(Optional when message is included)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                    depth: -24.0,
                    intensity: 18.0,
                    color: Colors.transparent,
                    shape: NeumorphicShape.convex,
                    lightSource: LightSource.top),
                child: TextField(
                  controller: phoneNumController,
                  maxLength: 15,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counter: Offstage(),
                    border: InputBorder.none,
                    // prefixIcon: Icon(Icons.contact_phone),
                    // suffixIcon: Icon(null),
                    prefixIcon: Icon(null),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        phoneNumController.clear();
                      },
                    ),
                    hintText: 'Eg: 601956291',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget generateButton() {
    return NeumorphicButton(
      child: ListTile(
        leading: FaIcon(FontAwesomeIcons.link),
        title: Text('Generate Link'),
      ),
      style: NeumorphicStyle(
        color: Colors.green,
      ),
    );
  }

  Widget clearAllButton() {
    return NeumorphicButton(
      child: ListTile(
        leading: FaIcon(FontAwesomeIcons.eraser),
        title: Text('Clear All'),
      ),
      style: NeumorphicStyle(
        color: Colors.green,
      ),
    );
  }
}

//Neumorhic docs - https://pub.dev/packages/flutter_neumorphic