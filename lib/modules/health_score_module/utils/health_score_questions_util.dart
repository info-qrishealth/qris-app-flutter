import '../models/health_score_question_model/health_score_question_model.dart';

class HealthScoreQuestionsUtil {
  static final List<HealthScoreQuestionModel> bloodPressureScores = [
    HealthScoreQuestionModel(option: '90-130 / 60-90 mmHg (Normal)', marks: 10),
    HealthScoreQuestionModel(option: '130-140 / 90-100 mmHg', marks: 8),
    HealthScoreQuestionModel(option: '140-150 / 100-110 mmHg', marks: 6),
    HealthScoreQuestionModel(option: '150-160 / 110-120 mmHg', marks: 4),
    HealthScoreQuestionModel(option: '>160 / >120 mmHg', marks: 2),
  ];

  static final List<HealthScoreQuestionModel> heartRateScores = [
    HealthScoreQuestionModel(option: '60-80 beats/minute', marks: 10),
    HealthScoreQuestionModel(option: '81-90 beats/minute', marks: 8),
    HealthScoreQuestionModel(option: '91-100 beats/minute', marks: 6),
    HealthScoreQuestionModel(option: '101-110 beats/minute', marks: 4),
    HealthScoreQuestionModel(option: '>110 / < 60', marks: 2),
  ];

  static final List<HealthScoreQuestionModel> sleepScores = [
    HealthScoreQuestionModel(
        option: 'Sleep well for 7-8 hours daily', marks: 10),
    HealthScoreQuestionModel(option: 'Snoring at Night', marks: 8),
    HealthScoreQuestionModel(
        option: 'Snoring & Frequent wake up in middle of sleep', marks: 6),
    HealthScoreQuestionModel(
        option: 'Choking, coughing & breathing difficulty during sleep',
        marks: 4),
    HealthScoreQuestionModel(
        option: 'Falling asleep during the day while working/driving etc',
        marks: 2),
  ];

  static final List<HealthScoreQuestionModel> fruitVegScores = [
    HealthScoreQuestionModel(
        option: 'No fruit or vegetables each day', marks: 4),
    HealthScoreQuestionModel(
        option: '1-2 servings of fruit or vegetables per day', marks: 6),
    HealthScoreQuestionModel(
        option: '3-4 servings of fruit or vegetables per day', marks: 8),
    HealthScoreQuestionModel(
        option: '5+ servings of fruit or vegetables per day', marks: 10),
  ];

  static final List<HealthScoreQuestionModel> waterIntakeScores = [
    HealthScoreQuestionModel(option: '8 or more glasses', marks: 10),
    HealthScoreQuestionModel(option: '5-7 glasses', marks: 8),
    HealthScoreQuestionModel(option: '3-5 glasses', marks: 6),
    HealthScoreQuestionModel(option: 'Fewer than 3 glasses', marks: 4),
  ];

  static final List<HealthScoreQuestionModel> exerciseScores = [
    HealthScoreQuestionModel(option: 'No Exercise', marks: 2),
    HealthScoreQuestionModel(option: 'Less than 30 minutes a day', marks: 4),
    HealthScoreQuestionModel(option: '30-45 minutes a day', marks: 6),
    HealthScoreQuestionModel(option: '45 minutes to 1 hour a day', marks: 8),
    HealthScoreQuestionModel(option: 'More than 1 ½ hours per day', marks: 10),
  ];

  static final List<HealthScoreQuestionModel> alcoholConsumptionScores = [
    HealthScoreQuestionModel(option: 'I Don’t drink', marks: 10),
    HealthScoreQuestionModel(option: '2-3 drinks', marks: 8),
    HealthScoreQuestionModel(option: '4-5 drinks', marks: 6),
    HealthScoreQuestionModel(option: '6 or more drinks', marks: 4),
  ];

  static final List<HealthScoreQuestionModel> smokingScores = [
    HealthScoreQuestionModel(option: 'I Don’t smoke', marks: 10),
    HealthScoreQuestionModel(option: '2-3 cigarettes', marks: 8),
    HealthScoreQuestionModel(option: '4-5 cigarettes', marks: 6),
    HealthScoreQuestionModel(option: '6 or more cigarettes', marks: 4),
  ];
}
