import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
        // ConstrainedBox(
        // constraints:
        // BoxConstraints(minHeight: 80),
        Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset("images/iconlogo.png"),
                  onPressed: () => {},
                ),
                Expanded(
                    child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                )),
                IconButton(
                    onPressed: _callNotification,
                    icon: const Icon(Icons.notifications))
              ],
            ));
  }

  _callNotification() {}
}
