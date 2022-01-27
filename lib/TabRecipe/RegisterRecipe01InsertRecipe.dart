import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/common/CommonAppBar.dart';

import 'RegisterRecipe02InsertRecipeImage.dart';
import 'RegisterRecipe02InsertVideo.dart';


class RegisterRecipe01InsertRecipe extends StatefulWidget {
  const RegisterRecipe01InsertRecipe({Key key}) : super(key: key);

  @override
  _RegisterRecipe01InsertRecipeState createState() => _RegisterRecipe01InsertRecipeState();
}

class _RegisterRecipe01InsertRecipeState extends State<RegisterRecipe01InsertRecipe> {

  void _showDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
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
                    CommentDelete();
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
      },
    );
  }


  void CommentDelete() {
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
  }

  void LoadRecipe() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
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
                        child: const Text('이전에 작성 중인던 레시피가 있어요!\n삭제할까요? 불러올까요?',
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
                                onPressed: (){Navigator.of(context).pop();}, child: Text('삭제하기',style: TextStyle(
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
                                onPressed: (){Navigator.of(context).pop();}, child: Text('불러오기',style: TextStyle(
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
  }






  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      height: 787.67,

      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: CommonAppBarVer2(
          title: "등록 방법",
        ),

        body: Center(
          child: Column(
            children:[
              const TitleText(),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: SvgPicture.asset('assets/letter.svg'),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterRecipe02InsertRecipeImage()),
                      );
                    },
                  ),
                  const SizedBox(width: 15,),
                  InkWell(
                    child: SvgPicture.asset('assets/video.svg'),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterRecipe02InsertRecipeVideo()),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 159,),
        Text("나만의 레시피를 만들어보세요!",
            style : TextStyle(
                fontSize: 24.0,
                fontFamily: "NotoSans",
                fontWeight: FontWeight.w700,
                color: Color(0xff111111)
            )),
        SizedBox(height: 9,),
        Text("요리하는 동안 사진을 찍어 올리거나\n유튜브에 올렷던 레시피 영상을 등록하여\n이웃들에게 공유해보세요.",
            textAlign: TextAlign.center,
            style : TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Color(0xff666666),
            )),

        SizedBox(height: 52,),
      ],
    );
  }
}
