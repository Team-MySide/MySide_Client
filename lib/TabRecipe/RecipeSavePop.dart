import 'package:flutter/material.dart';

class RecipeSavePop extends StatelessWidget {
  const RecipeSavePop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 40, width: 343,
              decoration: BoxDecoration(
                color: Color(0xffd8f7f9),
                border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                  Radius.circular(40.0) ),),
              child: TextButton(onPressed: (){Navigator.of(context).pop();},
                child: const Text('임시 저장 되었습니다!',style : TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3bd7e2),
                )),)
          ),
        ],
      ),
    );
  }
}



