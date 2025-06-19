import 'package:flutter/material.dart';
import 'package:nps_survey/constants/constants.dart';
import 'package:nps_survey/widgets/feedback_widgets/feedback_footer.dart';
import 'package:nps_survey/widgets/nps_top.dart';

class CustomPage extends StatefulWidget {
  const CustomPage(
      {super.key,
      required this.question,
      required this.callback,
      required this.surveyResponseNumber,
      required this.goBack,
      required this.children,
      this.dialogContainerStyle,
      this.submitButtonText,
      this.questionsTextStyle,
      this.submitButtonTextStyle,
      this.submitButtonStyle,
      this.feedbackInputStyle,
      this.feedbackInputTextStyle,
      this.selectedScoreVisible});

  final List<Widget> children;
  final BoxDecoration? dialogContainerStyle;
  final String question;
  final Function(String, int) callback;
  final int surveyResponseNumber;
  final TextStyle? questionsTextStyle;
  final String? submitButtonText;
  final TextStyle? submitButtonTextStyle;
  final BoxDecoration? submitButtonStyle;
  final InputDecoration? feedbackInputStyle;
  final TextStyle? feedbackInputTextStyle;
  final bool? selectedScoreVisible;

  final Function() goBack;

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
              FeedbackFooter(
                callback: widget.callback,
                feedbackResponse: '',
                surveyResponse: widget.surveyResponseNumber,
                submitButtonText: widget.submitButtonText,
                submitButtonTextStyle: widget.submitButtonTextStyle,
                submitButtonStyle: widget.submitButtonStyle,
                goBack: widget.goBack,
              ),
            ],
          ),
        ));
  }
}
