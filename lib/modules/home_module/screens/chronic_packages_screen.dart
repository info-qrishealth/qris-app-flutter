import 'package:flutter/material.dart';
import 'package:qris_health/constants/app_constants.dart';
import 'package:qris_health/shared/components/common_app_bar.dart';

import '../components/chronic_disease_list_tile.dart';
import '../enum/chronic_disease_item_type.dart';
import '../models/chronic_package_model/chronic_disease_package.dart';

class ChronicPackagesScreen extends StatelessWidget {
  ChronicPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(title: 'Chronic wellness Packages'),
        body: SafeArea(
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.scaffoldPadding, vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return ChronicDiseaseListTile(
                    chronicDiseasePackage: _chronicPackages[index],
                    testId: index + 376);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 12);
              },
              itemCount: _chronicPackages.length),
        ));
  }

  final _chronicPackages = [
    ChronicDiseasePackage(
      title: "COPD Care Package",
      idealFor: "Chronic Bronchitis, Emphysema, Long-term smokers, Elderly",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Blood Tests",
          details: "CBC, CRP, ESR, IgE, AEC, Vitamin D, LFT ,KFT",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.xray,
          title: "CHEST XRAY",
          details: "",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "MD Physician (1), Dietitian (1), Physiotherapist (1 - Breathing Exercises & Chest Physiotherapy)",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.addon,
          title: "Add-On",
          details: "Smoking Cessation Support + Inhaler Technique Training",
        ),
      ],
      originalPrice: 4299,
      discountedPrice: 3500,
    ),
    ChronicDiseasePackage(
      title: "Asthma Management Package",
      idealFor:
          "Recurrent wheeze, allergy-induced asthma, poorly controlled asthma",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Blood Tests",
          details: "CBC, Total IgE, AEC, Vitamin D, CRP, LFT, KFT",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.xray,
          title: "CHEST XRAY",
          details: "",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "MD Physician (1), Dietitian (1), Physiotherapist (1 - Breathing Exercises & Chest Physiotherapy)",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.addon,
          title: "Add-On",
          details: "Allergy Trigger Management Guide",
        ),
      ],
      originalPrice: 4299,
      discountedPrice: 3500,
    ),
    ChronicDiseasePackage(
      title: "Hypertension Control Package",
      idealFor:
          "Patients with Stage 1 or 2 Hypertension, or those with uncontrolled BP",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Blood Tests",
          details:
              "CBC, Kidney Function, Lipid Profile, HbA1c, Serum Electrolytes, Thyroid Profile, LFT",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.xray, // Treating this as monitoring/test
          title: "ECG & BP Monitoring",
          details: "",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Cardiologist/Internal Medicine (1), Dietitian (1), Physiotherapist (1 - Lifestyle & Exercise Training)",
        ),
        ChronicPackageItem(
            type: ChronicPackageItemType.addon,
            title: "Add-On",
            details: "Home BP Log + Lifestyle Toolkit + Home BP Monitor"),
      ],
      originalPrice: 4999,
      discountedPrice: 4200,
    ),
    ChronicDiseasePackage(
      title: "Diabetes Management Package",
      idealFor:
          "Type 2 Diabetes, Prediabetes, Newly diagnosed, or uncontrolled sugar levels",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Blood Tests",
          details:
              "FBS, PPBS, HbA1c, Lipid Profile, LFT, KFT, Vitamin B12, Vitamin D, Urine Microalbumin, Thyroid, Urine Routine",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.xray,
          title: "Foot Examination",
          details: "",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Endocrinologist/Physician (1), Dietitian (1), Physiotherapist (1 - Diabetes-Specific Exercises)",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.addon,
          title: "Add-On",
          details: "Diabetic Foot Care Education & Home Glucometer",
        ),
      ],
      originalPrice: 4299,
      discountedPrice: 3800,
    ),
    ChronicDiseasePackage(
      title: "PCOD Balance Package",
      idealFor:
          "Women with menstrual irregularities, weight gain, acne, or diagnosed PCOD",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Blood Tests",
          details:
              "LH, FSH, Prolactin, TSH, Testosterone, DHEAS, HbA1c, Lipid Profile, Vitamin D, AMH",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.xray,
          title: "Pelvic USG",
          details: "",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Gynaecologist (1), Dietitian (1), Physiotherapist (1 - PCOD-Friendly Workouts), Psychologist Consultation (1)",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.addon,
          title: "Add-On",
          details: "Menstrual Tracker + Hair & Skin Nutrition Tips",
        ),
      ],
      originalPrice: 6499,
      discountedPrice: 5800,
    ),
    ChronicDiseasePackage(
        title: "Hypothyroidism / Thyroid Disorders",
        why: "Extremely common in Indian females; needs lifelong monitoring",
        includes: [
          ChronicPackageItem(
            type: ChronicPackageItemType.blood_test,
            title: "Tests",
            details: "TSH, T3, T4, Anti-TPO, Vitamin D, B12, CBC, LFT, KFT",
          ),
          ChronicPackageItem(
            type: ChronicPackageItemType.consultation,
            title: "Consultations",
            details:
                "Internal Medicine (1), Dietitian (1), Optional Physiotherapist",
          ),
        ],
        originalPrice: 3499,
        discountedPrice: 2700),
    ChronicDiseasePackage(
      title: "Arthritis / Osteoarthritis / Rheumatoid Arthritis",
      why: "Causes pain, disability; requires multi-disciplinary care",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "CRP, ESR, RA Factor, ANA, Vitamin D, Uric Acid, KFT, LFT",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Care",
          details:
              "Physician (1), Physiotherapist, Dietitian (Anti-Inflammatory Diet)",
        ),
      ],
      originalPrice: 3499,
      discountedPrice: 2500,
    ),
    ChronicDiseasePackage(
      title: "Anaemia Management (Iron Deficiency / B12 / Chronic Disease)",
      why: "Common across women, children, elderly",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "CBC, Ferritin, Iron Studies, B12, Folate, KFT",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Care",
          details:
              "Physician In Males, Dietitian (Iron-Rich Diets), Gynecologist (In Females)",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.addon,
          title: "Add-On",
          details: "Iron Injection 2500 Per Injection Including Medicine",
        ),
      ],
      originalPrice: 3499,
      discountedPrice: 2200,
    ),
    ChronicDiseasePackage(
      title: "Obesity / Metabolic Syndrome",
      why: "Cross-links diabetes, HTN, PCOD, heart disease",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details:
              "HbA1c, Lipid Profile, LFT, TSH, Insulin Fasting, BMI Calculation",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Dietitian (Weight Loss), Physician, Physiotherapist & Psychologist Consultation For Motivation.",
        ),
      ],
      originalPrice: 3499,
      discountedPrice: 3000,
    ),
    ChronicDiseasePackage(
      title: "Chronic Headache / Migraine",
      why: "Highly disabling; often mismanaged",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "CBC, Vitamin D, MRI Brain",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Physician, Dietitian (Trigger Foods), Physiotherapist, Psychologist",
        ),
      ],
      originalPrice: 7499,
      discountedPrice: 6700,
    ),
    ChronicDiseasePackage(
      title: "IBS / IBD / Chronic Digestive Disorders",
      why: "Lifestyle-triggered, hereditary",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "Stool Routine, Calprotectin (If IBD), CBC, LFT, CRP",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Intn Medicine, Dietitian (Trigger Elimination), Stress Management By Psychologist",
        ),
      ],
      originalPrice: 8999,
      discountedPrice: 7000,
    ),
    ChronicDiseasePackage(
      title:
          "Fatty Liver / NAFLD/ Alcoholic Liver Disease (Non-Alcoholic & Alcoholic Fatty Liver Disease)",
      why: "Silent epidemic; overlaps with diabetes & obesity",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "LFT, Lipid Profile, HbA1c, USG Abdomen",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details:
              "Physician, Dietitian (Low-Carb), Psychologist For Alcohol Withdrawal",
        ),
      ],
      originalPrice: 4999,
      discountedPrice: 4000,
    ),
    ChronicDiseasePackage(
      title: "Chronic Fatigue / Fibromyalgia",
      why: "Often undiagnosed in women",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "Vitamin D, B12, TSH, CRP, ESR",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details: "Physician, Psychologist, Physiotherapist, Dietitian",
        ),
      ],
      originalPrice: 4399,
      discountedPrice: 3500,
    ),
    ChronicDiseasePackage(
      title: "Heart Disease Follow-Up (Post-MI / Heart Failure)",
      why: "Long-term secondary prevention",
      includes: [
        ChronicPackageItem(
          type: ChronicPackageItemType.blood_test,
          title: "Tests",
          details: "Lipid Profile, HbA1c, LFT, KFT, ECG, Echo",
        ),
        ChronicPackageItem(
          type: ChronicPackageItemType.consultation,
          title: "Consultations",
          details: "Physician, Dietitian, Cardiac Rehab Physio",
        ),
      ],
      originalPrice: 4999,
      discountedPrice: 4500,
    ),
  ];
}
