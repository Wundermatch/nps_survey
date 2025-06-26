import 'package:flutter/material.dart';
import 'package:nps_survey/constants/constants.dart';

class CustomPageFooter extends StatelessWidget {
  const CustomPageFooter({
    super.key,
    required this.callback,
    required this.surveyResponse,
    required this.goBack,
    required this.actions,
  });

  final Function(String, int) callback;
  final int surveyResponse;
  final List<Widget> actions;

  final Function() goBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: SizeConstants.paddingValue20),
          child: GestureDetector(
            onTap: goBack,
            child: Container(
              height: SizeConstants.paddingValue46,
              width: SizeConstants.paddingValue46,
              decoration: BoxDecoration(
                  color: DesignColors.white,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(SizeConstants.roundBorderRadius))),
              child: Center(
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: DesignColors.npsColor,
                  size: SizeConstants.paddingValue30,
                ),
              ),
            ),
          ),
        ),
        ...actions.map((element) => Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    SizeConstants.paddingValue10,
                    SizeConstants.paddingValue15,
                    SizeConstants.paddingValue20,
                    SizeConstants.paddingValue15),
                child: element))),
      ],
    );
  }
}
