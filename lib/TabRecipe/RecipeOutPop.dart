import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe01InsertRecipe.dart';

class RecipeOutPoP extends StatelessWidget {
  const RecipeOutPoP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 323.0),
      child: Column(
        children: [
          Container(height: 232, width: 343,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                  Radius.circular(8.0) ),),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Text('나가기 하면 이전 페이지까지 저장돼요.\n정말로 나가실 건가요?',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff111111),
                        )),
                  SizedBox(height: 24,),
                  Text('임시 저장된 레시피는 ‘마이페이지 > 나의 레시피 >\n 내가 작성한 레시피에서 볼 수 있어요',
                      style : TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff999999),
                      )),
                  SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(width: 140, height: 48,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),backgroundColor: Color(0xffdddddd)),
                            onPressed: (){Navigator.of(context).pop();}, child: Text('계속 입력하기',style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,))),
                      ),
                      SizedBox(width: 16,),
                      Container(width: 140, height: 48,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),backgroundColor: Color(0xff3bd7e2)),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterRecipe01InsertRecipe()),
                              );
                            }, child: Text('나가기',style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,))),
                      )
                    ],
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
