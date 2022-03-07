
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_side_client/TabRecipe/RecipeSavePop.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe05InsertRecipe.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipeAppBar.dart';
import 'package:my_side_client/common/CommonAppBar.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/RecipeControllers/RecipeRegisterController.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/TimePickerWidget.dart';
import 'package:my_side_client/wigets/textfieldwidget/memoTextField.dart';
import 'package:my_side_client/wigets/textwidget/requiredText.dart';

class RegisterRecipe04InsertRecipe extends StatefulWidget {
  @override
  State<RegisterRecipe04InsertRecipe> createState() => _RegisterRecipe04InsertRecipeState();
}

class _RegisterRecipe04InsertRecipeState extends State<RegisterRecipe04InsertRecipe> {

  final RecipeRegisterController recipeRegisterController =
  Get.put(RecipeRegisterController());

  void _showCamera(int index) {
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
                    getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },child: const Text('사진 촬영',style : TextStyle(
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
                    getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },child: const Text('앨범에서 사진 선택',style : TextStyle(
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
  Widget build(BuildContext context) {


    double scrHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: RegisterRecipeAppBar(
        title: '레시피 입력 (3/5)',
      ),
      body: GetBuilder<RecipeRegisterController>(
        builder: (controller) {
          bool isButtonActive = controller.checkActive();
          return SafeArea(
            child: Column(
              children: [
                Container(height: scrHeight-200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              //레시피 이름
                              buildRecipeName(controller.recipeNameTextField),
                              SizedBox(height: 15),
                              //레시피 설명
                              buildRecipeDetail(controller.recipeDetailTextField),
                              SizedBox(height: 25),
                              // 대표사진(음식사진)
                              buildFoodPic(),
                              SizedBox(height: 25),
                              // 레시피 종류
                              buildRecipeType(
                                controller.setRecipeType,
                                controller.recipeType,
                              ),
                              SizedBox(height: 25),
                              // 레시피난이도
                              buildRecipeDifficulty(
                                  controller.starRating, controller.setStarRating),
                              SizedBox(height: 25),
                              // 소요시간
                              buildTimeRequired(
                                controller.setTmpDuration,
                                controller.setHoursAndMinutes,
                                controller.hours,
                                controller.minutes,
                                controller.setInitDuration,
                              ),
                              SizedBox(height: 25),
                              // 분량
                              buildFoodAmount(
                                controller.setFoodAmount,
                                controller.foodAmount,
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


                Row(
                  children: [
                    Expanded(
                      child: RecSubmitButton(
                        buttonText: '임시저장',
                        buttonHeight: 70,
                        activated: isButtonActive,
                        validateFunc: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pop(context);
                              });
                              return RecipeSavePop();
                            },
                          );
                        },
                        rectButtonColor: Color(0xFF666666),
                      ),
                    ),
                    Expanded(
                      child: RecSubmitButton(
                        buttonText: '다음단계',
                        buttonHeight: 70,
                        activated: isButtonActive,
                        validateFunc: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterRecipe05InsertRecipe()),
                          );
                        },
                      ),
                    ),
                  ],
                )



              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildRecipeName(TextFieldModel recipeNameTF) {
    return buildRecipeInputField(
      '레시피 이름',
      true,
      false,
      0,
      MemoTextField(
        scrHeight: 300,
        textFieldModel: recipeNameTF,
        maxLines: 1,
        belowTextExist: false,
      ),
    );
  }

  Widget buildRecipeDetail(TextFieldModel recipeDetailTF) {
    return buildRecipeInputField(
      '레시피 설명',
      false,
      true,
      recipeDetailTF.tec.text.length,
      MemoTextField(
        scrHeight: 0,
        textFieldModel: recipeDetailTF,
        maxLines: 4,
        belowTextExist: false,
      ),
    );
  }

  Widget buildFoodPic() {
    return buildRecipeInputField(
      '대표 사진(완성된 음식 사진)',
      true,
      false,
      0,
      InkWell(
        child: image==null ?Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 343,
              color: Color(0xFFEDEDED),
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
            SvgPicture.asset('assets/camera.svg'),
          ],
        ) :Container(width: double.infinity, height: 343,
          child: kIsWeb
              ? Image.network(image.path)
              :Image.file(File(image.path)),
        ),
        onTap: (){ _showCamera(0); },
      ),
    );
  }

  Widget buildRecipeType(Function setFunc, int recipeType) {
    return buildRecipeInputField(
      '레시피 종류',
      true,
      false,
      0,
      GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2.17,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SelectableRoundButton(
            buttonText: recipeList[index],
            isSelected: recipeType == index + 1,
            onTap: () {
              setFunc(index + 1);
            },
          );
        },
      ),
    );
  }

  Widget buildRecipeInputField(String mainText, bool isRequired,
      bool hasNumCounts, int charlen, Widget belowWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RequiredTextWidget(
              mainText: mainText,
              isRequired: isRequired,
            ),
            Spacer(),
            hasNumCounts
                ? Text(
              '$charlen/1000자',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            )
                : SizedBox(
              width: 0,
            ),
          ],
        ),
        SizedBox(height: 8),
        belowWidget,
      ],
    );
  }

  Widget buildRecipeDifficulty(int starRate, Function setFunc) {
    return buildRecipeInputField(
      '레시피 난이도',
      true,
      false,
      0,
      buildStarRow(starRate, setFunc),
    );
  }

  Widget buildStarRow(int starRate, Function setFunc) {
    return Row(
      children: [
        buildStar(1, starRate, () {
          setFunc(1);
        }),
        SizedBox(width: 18),
        buildStar(2, starRate, () {
          setFunc(2);
        }),
        SizedBox(width: 18),
        buildStar(3, starRate, () {
          setFunc(3);
        }),
      ],
    );
  }

  Widget buildStar(int id, int idx, VoidCallback onTap) {
    return InkWell(
      child: idx >= id
          ? SvgPicture.asset(
        'assets/icons/on.svg',
        height: 22.86,
        width: 22.86,
      )
          : SvgPicture.asset(
        'assets/icons/off.svg',
        height: 22.86,
        width: 22.86,
      ),
      onTap: onTap,
    );
  }

  Widget buildTimeRequired(Function setTmpDuration, Function setRequiredTime,
      int hours, int minutes, Function setInitDuration) {
    return buildRecipeInputField(
      '소요시간',
      true,
      false,
      0,
      Container(
        width: double.infinity,
        child: InkWell(
          child: Row(
            children: [
              Expanded(child: buildDropdown('시간', hours)),
              Expanded(child: buildDropdown('분', minutes)),
            ],
          ),
          onTap: () {
            Get.dialog(TimerPickerWidget(
              setTmpDuration: setTmpDuration,
              setTimeRequired: setRequiredTime,
              setInitDuration: setInitDuration,
            ));
          },
        ),
      ),
    );
  }

  Widget buildDropdown(String type, int curNum) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFDDDDDD),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Text(
                  curNum.toString(),
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/darrow.svg'),
              ],
            ),
          ),
        ),
        SizedBox(width: 7),
        Text(
          type,
          style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget buildFoodAmount(Function setFunc, int foodAmount) {
    return buildRecipeInputField(
      '분량',
      false,
      false,
      0,
      GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.65,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SelectableRoundButton(
            buttonText: foodAmountList[index],
            isSelected: foodAmount == index + 1,
            onTap: () {
              setFunc(index + 1);
            },
          );
        },
      ),
    );
  }

  File image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async{
    final pickedFile = await picker.pickImage(source: imageSource);
    setState(() {
      image=File(pickedFile.path);
    });
  }
}
