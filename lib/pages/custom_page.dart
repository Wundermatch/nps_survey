import 'package:flutter/material.dart';
import 'package:nps_survey/constants/constants.dart';
import 'package:nps_survey/widgets/custom_page_widgets/custom_page_footer.dart';
import 'package:nps_survey/widgets/nps_top.dart';

class CustomPage extends StatefulWidget {
  const CustomPage(
      {super.key,
      required this.question,
      required this.callback,
      required this.surveyResponseNumber,
      required this.actions,
      required this.goBack,
      required this.children,
      this.dialogContainerStyle,
      this.questionsTextStyle,
      this.selectedScoreVisible});

  final List<Widget> children;
  final BoxDecoration? dialogContainerStyle;
  final String question;
  final Function(String, int) callback;
  final int surveyResponseNumber;
  final TextStyle? questionsTextStyle;
  final bool? selectedScoreVisible;

  final Function() goBack;

  final List<Widget> actions;

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            widget.dialogContainerStyle ?? DefaultStyles.containerDefaultStyle,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - SizeConstants.paddingValue20,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              NpsTop(
                  question: widget.question,
                  questionTextStyle: widget.questionsTextStyle,
                  surveyResponseNumber: widget.selectedScoreVisible ?? false
                      ? widget.surveyResponseNumber
                      : null),
              ...widget.children,
              CustomPageFooter(
                callback: widget.callback,
                surveyResponse: widget.surveyResponseNumber,
                actions: widget.actions,
                goBack: widget.goBack,
              ),
            ],
          ),
        ));
  }
}
