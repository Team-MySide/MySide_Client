import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe03InsertRecipe.dart';
import 'package:my_side_client/common/CommonAppBar.dart';
import 'package:my_side_client/common/CommonTheme.dart';


class RegisterRecipe02InsertRecipeImage extends StatefulWidget {
  const RegisterRecipe02InsertRecipeImage({Key key}) : super(key: key);

  @override
  _RegisterRecipe02InsertRecipeImageState createState() => _RegisterRecipe02InsertRecipeImageState();
}

class _RegisterRecipe02InsertRecipeImageState extends State<RegisterRecipe02InsertRecipeImage> {
  final ScrollController _scrollController = ScrollController();
  final List<TextEditingController> _stateController=[];
  TextEditingController recipeController1 = TextEditingController();
  TextEditingController recipeController2 = TextEditingController();
  TextEditingController recipeController3 = TextEditingController();
  TextEditingController recipeController4 = TextEditingController();
  TextEditingController recipeController5 = TextEditingController();
  TextEditingController recipeController6 = TextEditingController();
  TextEditingController recipeController7 = TextEditingController();
  TextEditingController recipeController8 = TextEditingController();
  TextEditingController recipeController9 = TextEditingController();
  TextEditingController recipeController10 = TextEditingController();
  TextEditingController recipeController11 = TextEditingController();
  TextEditingController recipeController12 = TextEditingController();
  TextEditingController recipeController13 = TextEditingController();
  TextEditingController recipeController14 = TextEditingController();
  TextEditingController recipeController15 = TextEditingController();
  TextEditingController recipeController16 = TextEditingController();
  TextEditingController recipeController17 = TextEditingController();
  TextEditingController recipeController18 = TextEditingController();
  TextEditingController recipeController19 = TextEditingController();
  TextEditingController recipeController20 = TextEditingController();
  TextEditingController recipeController21 = TextEditingController();
  TextEditingController recipeController22 = TextEditingController();
  TextEditingController recipeController23 = TextEditingController();
  TextEditingController recipeController24 = TextEditingController();
  TextEditingController recipeController25 = TextEditingController();
  TextEditingController recipeController26 = TextEditingController();
  TextEditingController recipeController27 = TextEditingController();
  TextEditingController recipeController28 = TextEditingController();
  TextEditingController recipeController29 = TextEditingController();
  TextEditingController recipeController30 = TextEditingController();

  final List<int> _count=[];
  int number=0;

  var nowState = List<bool>.filled(30, true);


  List<bool> _nownowState =[
    true,true,true,true,true,true,true,true,true,true,
    true,true,true,true,true,true,true,true,true,true,
    true,true,true,true,true,true,true,true,true,true];




  bool somethingInsert(){
    int f=30;
    for(int i=0; i<30; i++){
      if(_nownowState[i])f--;
    }
    if(f<_count.length){return true;}
    else return false;


  }

  bool everyInsert(){
    int t=0;
    for(int i=0; i<30; i++){
      if(_nownowState[i])t++;
    }
    if(t==30) return true;
    else return false;
  }


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
                    getImage(ImageSource.camera, index);
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
                    getImage(ImageSource.gallery, index);
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _stateController.insert(0,recipeController1);
    _stateController.insert(1,recipeController2);
    _stateController.insert(2,recipeController3);
    _stateController.insert(3,recipeController4);
    _stateController.insert(4,recipeController5);
    _stateController.insert(5,recipeController6);
    _stateController.insert(6,recipeController7);
    _stateController.insert(7,recipeController8);
    _stateController.insert(8,recipeController9);
    _stateController.insert(9,recipeController10);
    _stateController.insert(10,recipeController11);
    _stateController.insert(11,recipeController12);
    _stateController.insert(12,recipeController13);
    _stateController.insert(13,recipeController14);
    _stateController.insert(14,recipeController15);
    _stateController.insert(15,recipeController16);
    _stateController.insert(16,recipeController17);
    _stateController.insert(17,recipeController18);
    _stateController.insert(18,recipeController19);
    _stateController.insert(19,recipeController20);
    _stateController.insert(20,recipeController21);
    _stateController.insert(21,recipeController22);
    _stateController.insert(22,recipeController23);
    _stateController.insert(23,recipeController24);
    _stateController.insert(24,recipeController25);
    _stateController.insert(25,recipeController26);
    _stateController.insert(26,recipeController27);
    _stateController.insert(27,recipeController28);
    _stateController.insert(28,recipeController29);
    _stateController.insert(29,recipeController30);

    double scrHeight = MediaQuery.of(context).size.height;

    if(number==0){   //요리순서 step1 항목
      _count.insert(0, number);
      _nownowState[0]=false;
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },);
      number++;
      _count.insert(1, number);
      _nownowState[1]=false;
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },);
      number++;
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: CommonAppBarVer2(
        title: "요리 순서(1/5)",
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [





              Padding(
                padding: const EdgeInsets.only( left: 16,right: 16),
                child: Container(constraints: BoxConstraints(maxHeight: 0.85*scrHeight,),
                  child: DecribeRecipeListView(),
                ),
              ),


            ],),
          BottomButtons()
        ],
      ),
    );
  }



  ListView DecribeRecipeListView() {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ListViewItem(index);
      },itemCount: _count.length,
    );
  }

  Column ListViewItem(int index) {
    return Column(
      children: [
        if(index==0)
          Container(height: 32, width: 343,
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
              border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
                Radius.circular(40.0) ),),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/error.svg'),
                Text('순서 추가는 30개까지 가능해요',style : TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffaaaaaa),
                )),
              ],
            ),
          ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height:25,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if(index<9)
                  Text('STEP 0${index+1}',style: const TextStyle(
                    color: Color(0xff666666), fontSize: 14.0, fontWeight: FontWeight.w400,) ),
                  if(index>8)
                    Text('STEP ${index+1}',style: const TextStyle(
                      color: Color(0xff666666), fontSize: 14.0, fontWeight: FontWeight.w400,) ),


                  if(index>1)
                    if(index==number-1)
                      DeleteButton(),
                ],
              ),
            ),

            const SizedBox(height: 7,),
            //_count[index],

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Container(height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(), borderRadius: const BorderRadius.all(
                        Radius.circular(8.0) ),),

                    padding: const EdgeInsets.only(left: 15, ),
                    child:  TextField(
                      controller: _stateController[index],
                      onChanged: (_) => setState(() {
                        if(_stateController[index].text.isNotEmpty){
                          _nownowState[index]=true;
                        }
                        else{
                          _nownowState[index]=false;
                        }
                      }),
                      maxLines: null,
                      decoration: InputDecoration(hintText: '0/1000자',
                        border:InputBorder.none,),),),
                ),

                const SizedBox(width: 8,),
                //RegisterPhoto(index),
                InkWell(
                  child: _image[index]==null ? Stack(
                    children: [
                      Container( width:100, height:100,
                        decoration: BoxDecoration(color: const Color(0xffedededed),
                          border: Border.all(color: Colors.transparent, ),
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Positioned( left: 30,top: 30, child:
                      Container(width: 40, height: 40,
                        decoration: BoxDecoration(color: Colors.white,
                          border: Border.all(color: Colors.transparent, ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(100.0) ),),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: SvgPicture.asset('assets/camera.svg'),
                        ),
                      ),
                      ),
                    ],
                  ) : Container(width: 100, height: 100,
                    child: kIsWeb
                        ? Image.network(_image[index].path)
                        :Image.file(File(_image[index].path)),
                  ),
                  onTap: (){_showCamera(index);},
                ),
              ],),
            const SizedBox(height: 24,),
          ],
        ),


        if(index==number-1&&index!=29)
        TextButton(onPressed: () {
          setState(()  {
            number++;
            _count.insert(0, number);
            _nownowState[_count.length-1]=false;
            Future.delayed(const Duration(milliseconds: 100), () {
              _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.ease);
            },);});},
          child:  const Text('순서 추가하기 +', style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,) ),
          style: TextButton.styleFrom(
            primary:  const Color(0xff666666),
            onSurface: Colors.blue,
          ),),

        if(index==29)
        Container(width: 341, height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 0, 0, 0.1),
            border: Border.all(color: Colors.transparent, ), borderRadius: const BorderRadius.all(
              Radius.circular(40.0) ),),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("순서 추가는 30개까지 가능해요😢",textAlign: TextAlign.center,style : TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xffe10000),
              )),
            ],
          ),
        )






















      ],
    );
  }


  ButtonTheme DeleteButton() {
    return ButtonTheme(
        minWidth:40,
        height:24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
            onPressed: (){
              if(_count.length!=1) {
                setState(() {
                  _count.removeAt(_count.length-1);
                  _image[_count.length]=null;
                  number--;});}
              _nownowState[_count.length]=true;
              _stateController[_count.length].clear();
            },

            child: const Text('삭제',style: TextStyle(
              color: Color(0xffaaaaaa),
              fontSize: 12.0,
              fontWeight: FontWeight.w300,))));
  }

  Expanded BottomButtons() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
                child: Container(
                  height: 70,
                  child: TextButton(
                    onPressed: somethingInsert() ? () {_showDialog();} : null,
                    child: Text("임시저장", style: TextStyle(fontSize: 16)),
                    // style:
                    style: CommonTheme.getSquareGreyButtonStyle(),
                  ),
                )),
            Expanded(
                child: Container(
                  height: 70,
                  child: TextButton(
                    onPressed: everyInsert() ? () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterRecipe03InsertRecipe()),
                    );} : null,
                    child: Text("재료 입력하기", style: TextStyle(fontSize: 16)),
                    style: CommonTheme.getSquarePrimaryButtonStyle(),
                  ),
                ))
          ],
        ),
      ),
    );

  }
  final ImagePicker picker = ImagePicker();
  // List<File> _image =[];
  var _image =  List<File>.filled(30,null);
  // final picker = ImagePicker();




  Future getImage(ImageSource imageSource, int index) async{
    final pickedFile = await picker.pickImage(source: imageSource);
    setState(() {
      _image[index]=File(pickedFile.path);
    });
  }

/* Future<void> _pickImage(ImageSource imageSource, int index) async{
    final image = await picker.pickImage(source: imageSource);
    if(image!=null){
      setState(() {
        _image[index] = image;
      });
    }
  }*/

}

