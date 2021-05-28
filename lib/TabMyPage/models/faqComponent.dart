import 'dart:convert';

FaqComponent faqComponentFromJson(String str) =>
    FaqComponent.fromJson(json.decode(str));

String faqComponentToJson(FaqComponent data) => json.encode(data.toJson());

class FaqComponent {
  FaqComponent({
    this.headTitle,
    this.qusestion,
    this.answer,
  });

  String headTitle;
  String qusestion;
  String answer;

  factory FaqComponent.fromJson(Map<String, dynamic> json) => FaqComponent(
        headTitle: json["headTitle"],
        qusestion: json["qusestion"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "headTitle": headTitle,
        "qusestion": qusestion,
        "answer": answer,
      };
}
