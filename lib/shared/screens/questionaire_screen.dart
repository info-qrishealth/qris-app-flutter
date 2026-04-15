import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qris_health/constants/enums/questionnaire_type.dart';
import 'package:qris_health/constants/enums/snackbar_type.dart';
import 'package:qris_health/modules/all_scans_module/models/test_package_model/test_package_model.dart';
import 'package:qris_health/modules/health_module/models/wellness_answer/wellness_answer.dart';
import 'package:qris_health/modules/health_module/models/wellness_question/wellness_question.dart';
import 'package:qris_health/modules/health_module/services/wellness_service.dart';
import 'package:qris_health/modules/orders_modele/helpers/cart_helper.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';
import 'package:qris_health/shared/components/common_html_text.dart';
import 'package:qris_health/shared/components/common_listview_shimmer.dart';
import 'package:qris_health/shared/components/common_textfield.dart';
import 'package:qris_health/styles/app_colors.dart';

import '../../constants/app_constants.dart';

class QuestionnaireScreen extends StatefulWidget {
  final TestPackageModel testPackageModel;
  const QuestionnaireScreen({super.key, required this.testPackageModel});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _textTheme = Get.textTheme;
  final _pageController = PageController();
  final _textController = TextEditingController();

  List<WellnessQuestion> _questions = [];
  List<WellnessAnswer> _answers = [];

  late Future<List<WellnessQuestion>> _future;
  int _answeredQuestionCount = 0;
  int? _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _future = WellnessService.getWellnessQuestions(
        testId: widget.testPackageModel.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Questionnaire'),
        body: SafeArea(
            child: FutureBuilder<List<WellnessQuestion>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _questions = snapshot.data!;
                    _questions.sort((a, b) => a.disOrder.compareTo(b.disOrder));

                    if (_answers.isEmpty) {
                      for (var question in _questions) {
                        _answers.add(WellnessAnswer(
                            questionId: question.id,
                            question: question.questionTitle,
                            answer: ''));
                      }
                    }

                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.scaffoldPadding),
                        child: Column(children: [
                          SizedBox(height: 24),
                          Row(children: [
                            Expanded(
                                child: SliderTheme(
                                    data: SliderThemeData(
                                        overlayShape:
                                            SliderComponentShape.noOverlay,
                                        thumbShape:
                                            SliderComponentShape.noOverlay,
                                        trackHeight: 7,
                                        activeTrackColor: AppColors.primaryBlue,
                                        inactiveTrackColor: AppColors
                                            .primaryBlue
                                            .withOpacity(0.05)),
                                    child: Slider(
                                        value:
                                            _answeredQuestionCount.toDouble() +
                                                1,
                                        onChanged: (value) {},
                                        max: _questions.length.toDouble()))),
                            SizedBox(width: 12),
                            Text(
                                '${_answeredQuestionCount + 1}/${_questions.length}',
                                style: _textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryPink))
                          ]),
                          SizedBox(height: 32),
                          Expanded(
                              child: PageView.builder(
                                  controller: _pageController,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _questions.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentQuestionIndex = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    final question = _questions[index];
                                    final options = AppConstants.decodeBase64(
                                        encodedString: question.options);
                                    options?.removeWhere((key, value) =>
                                        value.toString().isEmpty);

                                    return ListView(
                                        physics: BouncingScrollPhysics(),
                                        keyboardDismissBehavior:
                                            ScrollViewKeyboardDismissBehavior
                                                .onDrag,
                                        children: [
                                          Text(question.questionTitle,
                                              style: _textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.black)),
                                          SizedBox(height: 16),
                                          if (question.questionType ==
                                              QuestionnaireType.TEXTAREA)
                                            CommonTextField(
                                                controller: _textController,
                                                textInputType:
                                                    TextInputType.text,
                                                hintText: 'Please answer',
                                                onChanged: (answer) {
                                                  _answers[index] =
                                                      _answers[index]
                                                          .copyWith
                                                          .call(answer: answer);

                                                  setState(() {});
                                                },
                                                readOnly: false,
                                                headingText: null)
                                          else if (question.questionType ==
                                              QuestionnaireType.DATE)
                                            CommonTextField(
                                                controller: _textController,
                                                readOnly: true,
                                                onTap: () async {
                                                  final date =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime.now());

                                                  if (date != null) {
                                                    _textController.text =
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(date);
                                                    _answers[index] = _answers[
                                                            index]
                                                        .copyWith
                                                        .call(
                                                            answer:
                                                                _textController
                                                                    .text);
                                                  }
                                                },
                                                textInputType:
                                                    TextInputType.datetime,
                                                hintText: 'DD-MM-YYYY',
                                                headingText: null)
                                          else if (question.questionType ==
                                              QuestionnaireType.SINGLE)
                                            Column(
                                                children:
                                                    options?.entries
                                                            .map((entry) {
                                                          final value = entry
                                                              .value
                                                              .toString()
                                                              .replaceAll(
                                                                  '<p>', '')
                                                              .replaceAll(
                                                                  '</p>', '')
                                                              .replaceAll(
                                                                  ',', '');

                                                          return InkWell(
                                                              onTap: () {
                                                                _answers[
                                                                    index] = _answers[
                                                                        index]
                                                                    .copyWith
                                                                    .call(
                                                                        answer:
                                                                            value);
                                                                setState(() {});
                                                              },
                                                              child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            20,
                                                                        child: Radio(
                                                                            value: value,
                                                                            groupValue: _answers[index].answer.split(',').firstWhereOrNull((element) => element.trim() == value.trim()),
                                                                            onChanged: (_) {
                                                                              _answers[index] = _answers[index].copyWith.call(answer: value);

                                                                              setState(() {});
                                                                            })),
                                                                    SizedBox(
                                                                        width:
                                                                            8),
                                                                    Expanded(
                                                                        child: CommonHtmlText(
                                                                            text:
                                                                                entry.value.toString().trim())),
                                                                  ]));
                                                        }).toList() ??
                                                        [])
                                          else if (question.questionType ==
                                              QuestionnaireType.MULTI)
                                            Column(
                                                children: options?.entries
                                                        .map((entry) {
                                                      final value = entry.value
                                                          .toString()
                                                          .replaceAll('<p>', '')
                                                          .replaceAll(
                                                              '</p>', '')
                                                          .replaceAll(',', '');

                                                      return InkWell(
                                                          onTap: () =>
                                                              _toggleCheckbox(
                                                                  value: value,
                                                                  index: index),
                                                          child: Row(children: [
                                                            SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: Checkbox(
                                                                    value: _answers[index].answer.split(',').firstWhereOrNull((element) =>
                                                                            element.trim() ==
                                                                            value
                                                                                .trim()) !=
                                                                        null,
                                                                    onChanged: (_) => _toggleCheckbox(
                                                                        value:
                                                                            value,
                                                                        index:
                                                                            index))),
                                                            SizedBox(width: 8),
                                                            Expanded(
                                                                child: CommonHtmlText(
                                                                    text: entry
                                                                        .value
                                                                        .toString()
                                                                        .trim())),
                                                          ]));
                                                    }).toList() ??
                                                    []),
                                        ]);
                                  })),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(children: [
                                if (_answeredQuestionCount != 0)
                                  Expanded(
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color:
                                                      AppColors.primaryBlue)),
                                          onPressed: () {
                                            _pageController.previousPage(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                curve: Curves.easeIn);
                                            _answeredQuestionCount--;
                                            setState(() {});
                                          },
                                          child: Text('Previous',
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primaryBlue)))),
                                SizedBox(width: 12),
                                Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryBlue),
                                        onPressed: () async {
                                          if (_answers[_currentQuestionIndex!]
                                              .answer
                                              .isEmpty) {
                                            AppConstants.showSnackbar(
                                                text:
                                                    'Please fill the given fields before continue',
                                                type: SnackbarType.warning);

                                            return;
                                          }

                                          if (_currentQuestionIndex ==
                                              _questions.length - 1) {
                                            final wellnessAnswers = _answers
                                                .map((answer) => answer.copyWith
                                                    .call(
                                                        prdId: widget
                                                            .testPackageModel.id
                                                            .toString()))
                                                .toList();

                                            await CartHelper
                                                .addToCartAndNavigate(
                                                    testPackageModel:
                                                        widget.testPackageModel,
                                                    wellnessAnswers:
                                                        wellnessAnswers);
                                          } else {
                                            _pageController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                curve: Curves.easeIn);
                                            _answeredQuestionCount++;
                                            _textController.clear();
                                            setState(() {});
                                          }
                                        },
                                        child: Text(_currentQuestionIndex ==
                                                _questions.length - 1
                                            ? 'Submit'
                                            : 'Next'))),
                              ]))
                        ]));
                  }

                  return CommonListviewShimmer();
                })));
  }

  String _addValueInString({required String newValue, required String values}) {
    if (values.isEmpty) {
      values = newValue;
    } else {
      values += ", $newValue";
    }

    return values;
  }

  String _removeValue({required String valueToRemove, required String values}) {
    List<String> valuesList =
        values.split(", ").where((e) => e != valueToRemove).toList();
    values = valuesList.join(", ");

    return values;
  }

  void _toggleCheckbox({required String value, required int index}) {
    final answers = _answers[index].answer.split(',');
    final isChecked =
        answers.firstWhereOrNull((element) => element.trim() == value.trim()) !=
            null;

    String checkedValues;

    if (!isChecked) {
      checkedValues =
          _addValueInString(newValue: value, values: _answers[index].answer);
    } else {
      checkedValues =
          _removeValue(valueToRemove: value, values: _answers[index].answer);
    }

    _answers[index] = _answers[index].copyWith.call(answer: checkedValues);

    setState(() {});
  }
}
