import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_side_client/wigets/textwidget/requiredText.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildAgreement extends StatelessWidget {
  final bool first, second, third, forth;
  final VoidCallback firstCliked, secondClicked, thirdClicked, forthClicked;

  BuildAgreement({
    this.first,
    this.second,
    this.third,
    this.forth,
    this.firstCliked,
    this.secondClicked,
    this.thirdClicked,
    this.forthClicked,
  });

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            first
                ? InkWell(
                    onTap: firstCliked,
                    child: SvgPicture.asset('assets/checkedoff.svg'),
                  )
                : InkWell(
                    onTap: firstCliked,
                    child: SvgPicture.asset('assets/off.svg'),
                  ),
            SizedBox(
              width: 0.0105 * scrHeight,
            ),
            RequiredTextWidget(
              mainText: '약관 전체 동의',
              isRequired: true,
            ),
          ],
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        Divider(
          color: Color(
            0xFFDDDDDD,
          ),
          thickness: 1.5,
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        makeAgreement(
          second,
          secondClicked,
          scrHeight,
          '이용약관 동의',
          '(필수)',
          () async {
            Uri _url = Uri.parse(
                'https://docs.google.com/document/d/1by3vvxIrYiZENovEZKbfIfgOd-6n7q4Xe7BZcJdaMXI/edit?usp=sharing');
            bool ret = await launchUrl(_url);
            print(ret);
          },
        ),
        SizedBox(
          height: 0.0211 * scrHeight,
        ),
        makeAgreement(
          third,
          thirdClicked,
          scrHeight,
          '개인정보 수집 및 이용 동의',
          '(필수)',
          () {
            Uri _url = Uri.parse(
                'https://drive.google.com/file/d/1gi3yLwgt2yjiBPXnIsYxFAHGVeq-oUUp/view?usp=sharing');
            launchUrl(_url);
          },
        ),
        SizedBox(
          height: 0.0211 * scrHeight,
        ),
        makeAgreement(
          forth,
          forthClicked,
          scrHeight,
          'E-mail 및 SMS 광고성 정보 수신 동의',
          '(선택)',
          () {},
        ),
      ],
    );
  }

  Widget makeAgreement(bool selected, VoidCallback clicked, double scrHeight,
      String text1, String text2, VoidCallback additionalInfo) {
    return Row(
      children: [
        selected
            ? InkWell(
                onTap: clicked,
                child: SvgPicture.asset('assets/checkedoff.svg'),
              )
            : InkWell(
                onTap: clicked,
                child: SvgPicture.asset('assets/off.svg'),
              ),
        SizedBox(
          width: 0.0105 * scrHeight,
        ),
        RichText(
          text: TextSpan(
            text: text1,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: Color(0xFF3BD7E2),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        InkWell(
          onTap: additionalInfo,
          child: SvgPicture.asset('assets/arrowright.svg'),
        ),
      ],
    );
  }
}
