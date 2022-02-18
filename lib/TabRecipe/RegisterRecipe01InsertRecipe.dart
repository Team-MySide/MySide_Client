import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabRecipe/CommentDelete.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe07Complete.dart';
import 'package:my_side_client/common/CommonAppBar.dart';
import 'RegisterRecipe02InsertRecipeImage.dart';
import 'RegisterRecipe02InsertVideo.dart';


class RegisterRecipe01InsertRecipe extends StatefulWidget {
  const RegisterRecipe01InsertRecipe({Key key}) : super(key: key);

  @override
  _RegisterRecipe01InsertRecipeState createState() => _RegisterRecipe01InsertRecipeState();
}

class _RegisterRecipe01InsertRecipeState extends State<RegisterRecipe01InsertRecipe> {


  /* showDialog(  // 등록 취소 or 이전 작업 불러오기 팝업
  context: context,
  builder: (BuildContext context) {
  Future.delayed(const Duration(seconds: 1), () {
  Navigator.pop(context);
  });
  return RecipeDeletePoP('이전에 작성 중인던 레시피가 있어요!\n삭제할까요? 불러올까요?');
  });*/

  /*return showDialog( //삭제 팝업
  context: context,
  builder: (BuildContext context) {return CommentDelete();});*/


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
                        MaterialPageRoute(builder: (context) => const RegisterRecipe07Complete()),
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
