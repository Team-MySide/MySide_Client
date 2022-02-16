import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonAppBar.dart';
import 'package:my_side_client/common/CommonTheme.dart';

class RegisterRecipe02InsertRecipeVideo extends StatefulWidget {
  const RegisterRecipe02InsertRecipeVideo({Key key}) : super(key: key);

  @override
  _RegisterRecipe02InsertRecipeVideoState createState() => _RegisterRecipe02InsertRecipeVideoState();
}

class _RegisterRecipe02InsertRecipeVideoState extends State<RegisterRecipe02InsertRecipeVideo> {

  TextEditingController recipeURLEditingController = TextEditingController();
  TextEditingController recipeProcessEditingController = TextEditingController();

  @override
  void dispose() {
    TextEditingController recipeURLEditingController = TextEditingController();
    TextEditingController recipeProcessEditingController = TextEditingController();
    super.dispose();
  }

  int a=0;
  String abc='recipeURLEditingController';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });

        return Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)
                ),
                backgroundColor: const Color(0xff3bd7e2),
                content: const SizedBox(
                  height: 30, width: 341,
                  child: Center(child: Text('임시 저장 되었습니다!')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool isSomethingInserted() {
    if (recipeURLEditingController.text.isNotEmpty) {
      return true;
    }
    else if(recipeProcessEditingController.text.isNotEmpty)
    {
      return true;
    }
    return false;
  }
  bool isBothInserted() {
    if (recipeURLEditingController.text.isNotEmpty) {
      if(recipeProcessEditingController.text.isNotEmpty)
      {
        return true;
      }
    }

    return false;
  }
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> _stateController=[];
    final TextEditingController recipeController = TextEditingController();
    _stateController.insert(0,recipeController);
    return SizedBox(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: CommonAppBarVer2(
          title: "요리 순서(1/5)",
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height: 9,),
                  Column(
                    children: const [
                      Text("유튜브 링크 입력",
                          style : TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          )),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffdddddd)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(
                              8.0) //         <--- border radius here
                      ),),




                    child:  Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField( controller:recipeURLEditingController,
                        onChanged: (_) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'URL을 입력해주세요.',
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300,color: Color(0xffaaaaaa)),

                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Column(
                    children: const [
                      Text("설명",
                          style : TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          )),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffdddddd)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(
                              8.0) //         <--- border radius here
                      ),),

                    child: Padding(
                      padding: EdgeInsets.only(left: 15, ),
                      child: TextField(controller: recipeProcessEditingController,
                        onChanged: (_) => setState(() {}),
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '조리과정 내용이 들어갑니다. ',
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300,color: Color(0xffaaaaaa)),
                          border:InputBorder.none,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 70,
                          child: TextButton(
                            onPressed: isSomethingInserted() ? () {_showDialog();} : null,
                            child: Text("임시저장", style: TextStyle(fontSize: 16)),
                            // style:
                            style: CommonTheme.getSquareGreyButtonStyle(),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          height: 70,
                          child: TextButton(
                            onPressed: isBothInserted() ? () {} : null,
                            child: Text("재료 입력하기", style: TextStyle(fontSize: 16)),
                            style: CommonTheme.getSquarePrimaryButtonStyle(),
                          ),
                        ))
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
