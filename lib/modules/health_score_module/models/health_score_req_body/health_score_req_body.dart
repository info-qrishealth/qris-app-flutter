class HealthScoreReqBody {
  String? patientId;
  String? name;
  String? mobile;
  String? gender;
  String? age;
  String? weight;
  String? height;
  String? bloodPressure;
  String? pulseRate;
  String? sleepPattern;
  String? diet;
  String? water;
  String? alcohol;
  String? cigarettes;
  String? physicalActivity;

  HealthScoreReqBody(
      {this.name,
      this.mobile,
      this.gender,
      this.age,
      this.weight,
      this.height,
      this.bloodPressure,
      this.pulseRate,
      this.sleepPattern,
      this.diet,
      this.water,
      this.alcohol,
      this.cigarettes,
      this.physicalActivity,
      this.patientId});

  factory HealthScoreReqBody.fromJson(Map<String, dynamic> json) =>
      HealthScoreReqBody(
          name: json["name"],
          mobile: json["mobile"],
          gender: json["gender"],
          age: json["age"],
          weight: json["weight"],
          height: json["height"],
          bloodPressure: json["blood_pressure"],
          pulseRate: json["pulse_rate"],
          sleepPattern: json["sleep_pattern"],
          diet: json["diet"],
          water: json["water"],
          alcohol: json["alcohol"],
          cigarettes: json["cigarettes"],
          physicalActivity: json["physical_activity"],
          patientId: json["patient_id"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "gender": gender,
        "age": age,
        "weight": weight,
        "height": height,
        "blood_pressure": bloodPressure,
        "pulse_rate": pulseRate,
        "sleep_pattern": sleepPattern,
        "diet": diet,
        "water": water,
        "alcohol": alcohol,
        "cigarettes": cigarettes,
        "physical_activity": physicalActivity,
        "patient_id": patientId
      };
}
