import 'dart:ui';

import 'package:qris_health/constants/enums/subscan_type.dart';
import 'package:qris_health/styles/app_colors.dart';

enum ScanType {
  CT_SCAN,
  ULTRASOUND,
  ECHO_TEST,
  EEG_TEST,
  DEXA_TEST,
  PFT_TEST,
  MRI,
  ECG_TEST,
  HOLTER_TEST,
  COLOR_DOPPLER
}

extension ScanTypeExtension on ScanType {
  String get iconPath {
    switch (this) {
      case ScanType.CT_SCAN:
        return 'assets/images/icons/all_scan_icon/ct_scan.png';
      case ScanType.ULTRASOUND:
        return 'assets/images/icons/all_scan_icon/ultrasound.png';
      case ScanType.ECHO_TEST:
        return 'assets/images/icons/all_scan_icon/echo_test_icon.png';
      case ScanType.EEG_TEST:
        return 'assets/images/icons/all_scan_icon/eeg_icon.png';
      case ScanType.DEXA_TEST:
        return 'assets/images/icons/all_scan_icon/dexa_scan_icon.png';
      case ScanType.PFT_TEST:
        return 'assets/images/icons/all_scan_icon/pft_test_icon.png';
      case ScanType.MRI:
        return 'assets/images/icons/all_scan_icon/mri_icon.png';
      case ScanType.ECG_TEST:
        return 'assets/images/icons/all_scan_icon/ecg_test_icon.png';
      case ScanType.HOLTER_TEST:
        return 'assets/images/icons/all_scan_icon/holter_icon.png';
      case ScanType.COLOR_DOPPLER:
        return 'assets/images/icons/all_scan_icon/color_doppler_icon.png';
    }
  }

  List<SubScanType> get subScans {
    switch (this) {
      case ScanType.CT_SCAN:
        return [
          SubScanType.CT_SCAN_ABDOMEN,
          SubScanType.CT_SCAN_JOINT_AND_LIMBS,
          SubScanType.CT_SCAN_CHEST,
          SubScanType.CT_SCAN_HEAD_AND_NECK,
          SubScanType.CT_SCAN_SINUS,
          SubScanType.CT_SCAN_ANGIO,
        ];
      case ScanType.ULTRASOUND:
        return [
          SubScanType.ULTRASOUND_ABDOMEN,
          SubScanType.ULTRASOUND_PREGNANCY,
          SubScanType.ULTRASOUND_CHEST,
          SubScanType.ULTRASOUND_FNAC,
        ];
      case ScanType.ECHO_TEST:
        return [SubScanType.ECHO_TEST];
      case ScanType.EEG_TEST:
        return [SubScanType.EEG_TEST];
      case ScanType.DEXA_TEST:
        return [SubScanType.DEXA_TEST];
      case ScanType.PFT_TEST:
        return [SubScanType.PFT_TEST];
      case ScanType.MRI:
        return [
          SubScanType.MRI_ABDOMEN_AND_PELVIS,
          SubScanType.MRI_SPINE_AND_JOINT,
          SubScanType.MRI_HEAD_AND_NECK,
          SubScanType.MRI_FULL_BODY_MRI,
        ];
      case ScanType.ECG_TEST:
        return [SubScanType.ECG_TEST];
      case ScanType.HOLTER_TEST:
        return [SubScanType.HOLTER_TEST];
      case ScanType.COLOR_DOPPLER:
        return [
          SubScanType.COLOR_DOPPLER_ABDOMEN,
          SubScanType.COLOR_DOPPLER_PREGNANCY,
          SubScanType.COLOR_DOPPLER_LIMB,
          SubScanType.COLOR_DOPPLER_CAROTID,
        ];
    }
  }

  Color get backgroundColor {
    switch (this) {
      case ScanType.CT_SCAN:
        return AppColors.primaryBlue.withOpacity(0.05);
      case ScanType.ULTRASOUND:
        return AppColors.primaryBlue.withOpacity(0.05);
      case ScanType.ECHO_TEST:
        return Color(0x72D389FF);
      case ScanType.EEG_TEST:
        return Color(0x7297FE97);
      case ScanType.DEXA_TEST:
        return Color(0x60FFEA75);
      case ScanType.PFT_TEST:
        return Color(0x84BFFF7B);
      case ScanType.MRI:
        return Color(0x72FFBF7B);
      case ScanType.ECG_TEST:
        return Color(0x7289D5FF);
      case ScanType.HOLTER_TEST:
        return Color(0x7297A5FE);
      case ScanType.COLOR_DOPPLER:
        return Color(0x72C0CC81);
    }
  }
}
