import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/common/CommonTheme.dart';

class RegisterRecipe07Complete extends StatelessWidget {
  const RegisterRecipe07Complete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              CompleteText(),
              BottomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteText extends StatelessWidget {
  const CompleteText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 325,),
        CompleteIcon(),

        SizedBox(height: 30,),
        Text("레시피가 등록되었어요!",
            style : TextStyle(
                fontSize: 22.0,
                fontFamily: "NotoSans",
                fontWeight: FontWeight.w700,
                color: Color(0xff111111)
            )),
        SizedBox(height: 9,),
        Text("지금 바로 확인해 보세요😋",
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

class CompleteIcon extends StatelessWidget {
  const CompleteIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(height: 64, width: 64,
            decoration: BoxDecoration(
              color: Color(0xff3bd7e2),
              border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                Radius.circular(100.0) ),),
          ),
          Positioned(
            top: 24, left: 18,

            child: SvgPicture.asset('assets/Complete.svg',),
          )
        ]
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 70,
              child: TextButton(
                onPressed:  () {} ,
                child: Text("게시글 보러가기", style: TextStyle(fontSize: 16)),
                // style:
                style: CommonTheme.getSquareGreyButtonStyle(),
              ),
            )),
        Expanded(
            child: Container(
              height: 70,
              child: TextButton(
                onPressed:  () {},
                child: Text("홈으로 가기", style: TextStyle(fontSize: 16)),
                style: CommonTheme.getSquarePrimaryButtonStyle(),
              ),
            ))
      ],
    );
  }
}






