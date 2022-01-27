import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentDelete extends StatelessWidget {
  const CommentDelete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: 50, width: 343,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                    Radius.circular(30.0) ),),
                child: TextButton(onPressed: (){

                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 323.0),
                        child: Column(
                          children: [
                            Container(height: 176, width: 343,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0) ),),
                                child: Column(
                                  children: [
                                    SizedBox(height: 40,),
                                    TextButton(onPressed: (){Navigator.of(context).pop();},
                                      child: const Text('헉...삭제하실 건가요?\n해당 데이터가 전체 지워집니다.',
                                          textAlign: TextAlign.center,
                                          style : TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff111111),
                                          )),),
                                    SizedBox(height: 16,),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Container(width: 140, height: 48,
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25),
                                              ),backgroundColor: Color(0xffdddddd)),
                                              onPressed: (){Navigator.of(context).pop();}, child: Text('아니요',style: TextStyle(
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
                                              onPressed: (){Navigator.of(context).pop();}, child: Text('삭제',style: TextStyle(
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
                    },
                  );
                },child: const Text('삭제',style : TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666666),
                )),)
            ),
            const SizedBox(height: 8,),
            Container(height: 50, width: 343,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                    Radius.circular(30.0) ),),
                child: TextButton(onPressed: (){

                  Navigator.of(context).pop();
                },child: const Text('수정',style : TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666666),
                )),)
            ),
            const SizedBox(height: 8,),
            Container(height: 50, width: 343,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                    Radius.circular(30.0) ),),
                child: TextButton(onPressed: (){Navigator.of(context).pop();},
                  child: const Text('취소',style : TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff666666),
                  )),)
            ),
          ],
        ),
      );

  }}
