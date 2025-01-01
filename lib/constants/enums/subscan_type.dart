enum SubScanType {
  CT_SCAN_ABDOMEN,
  CT_SCAN_JOINT_AND_LIMBS,
  CT_SCAN_CHEST,
  CT_SCAN_HEAD_AND_NECK,
  CT_SCAN_SINUS,
  CT_SCAN_ANGIO,

  ULTRASOUND_ABDOMEN,
  ULTRASOUND_PREGNANCY,
  ULTRASOUND_CHEST,
  ULTRASOUND_FNAC,

  COLOR_DOPPLER_ABDOMEN,
  COLOR_DOPPLER_PREGNANCY,
  COLOR_DOPPLER_LIMB,
  COLOR_DOPPLER_CAROTID,

  MRI_ABDOMEN_AND_PELVIS,
  MRI_SPINE_AND_JOINT,
  MRI_HEAD_AND_NECK,
  MRI_FULL_BODY_MRI,

  ECHO_TEST,
  EEG_TEST,
  DEXA_TEST,
  PFT_TEST,
  ECG_TEST,
  HOLTER_TEST
}

extension SubscanTypeExtension on SubScanType {
  String get formattedName {
    switch (this) {
      case SubScanType.CT_SCAN_ABDOMEN:
        return 'Abdomen';
      case SubScanType.CT_SCAN_JOINT_AND_LIMBS:
        return 'Joint & Limb';
      case SubScanType.CT_SCAN_CHEST:
        return 'Chest';
      case SubScanType.CT_SCAN_HEAD_AND_NECK:
        return 'Head & Neck';
      case SubScanType.CT_SCAN_SINUS:
        return 'Sinus';
      case SubScanType.CT_SCAN_ANGIO:
        return 'Angio';
      case SubScanType.ULTRASOUND_ABDOMEN:
        return 'Abdomen';
      case SubScanType.ULTRASOUND_PREGNANCY:
        return 'Pregnancy';
      case SubScanType.ULTRASOUND_CHEST:
        return 'Chest/Breast';
      case SubScanType.ULTRASOUND_FNAC:
        return 'FNAC';
      case SubScanType.COLOR_DOPPLER_ABDOMEN:
        return 'Abdomen';
      case SubScanType.COLOR_DOPPLER_PREGNANCY:
        return 'Pregnancy';
      case SubScanType.COLOR_DOPPLER_LIMB:
        return 'Limb';
      case SubScanType.COLOR_DOPPLER_CAROTID:
        return 'Carotid';
      case SubScanType.MRI_ABDOMEN_AND_PELVIS:
        return 'Abdomen & Pelvis';
      case SubScanType.MRI_SPINE_AND_JOINT:
        return 'Spine & Joint';
      case SubScanType.MRI_HEAD_AND_NECK:
        return 'Head & Neck';
      case SubScanType.MRI_FULL_BODY_MRI:
        return 'Full Body MRI';
      case SubScanType.ECHO_TEST:
        return 'Echo Test';
      case SubScanType.EEG_TEST:
        return 'EEG Test';
      case SubScanType.DEXA_TEST:
        return 'Dexa Test';
      case SubScanType.PFT_TEST:
        return 'PFT Test';
      case SubScanType.ECG_TEST:
        return 'ECG Test';
      case SubScanType.HOLTER_TEST:
        return 'Holter Test';
    }
  }
}
