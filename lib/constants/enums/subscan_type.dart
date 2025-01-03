import 'package:qris_health/modules/all_scans_module/models/subscan_model.dart';

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

  SubscanModel get subScanModel {
    switch (this) {
      case SubScanType.CT_SCAN_ABDOMEN:
        return SubscanModel(
            appBarTitle: 'Abdomen CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/abdomen_ct_scan.png',
            firstHeading: 'What is Abdominal CT Scan?',
            firstHeadingDescription:
                "An abdomen CT Scan is a computerized CT scan test which is an imaging procedure that provides cross-section images of the abdomen. This advanced diagnostic test abdominal scan in Delhi helps in scanning organs, blood vessels, tissues, etc. This gives accurate results for your abdominal region. During the process the X-ray scanner rotates for the patient's body for proper imaging. This helps in finding out abnormalities, diseases and overall health of abdominal body organs like gallbladder, kidneys, pancreas, etc.",
            prices: [
              Price(title: 'CT ABDOMEN (P)', mrp: 6000, offeredPrice: 4200),
              Price(title: 'CT ABDOMEN (C)', mrp: 7500, offeredPrice: 5700),
              Price(
                  title: 'CT ANGIO LOWER ABD (C)',
                  mrp: 10000,
                  offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO RENAL (C)', mrp: 11000, offeredPrice: 8150),
              Price(
                  title: 'CT ANGIO UPPER ABD (C)',
                  mrp: 10000,
                  offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO WHOLE ABD (C)',
                  mrp: 15000,
                  offeredPrice: 10950),
              Price(
                  title: 'CT CHEST + ABDOMEN (P)',
                  mrp: 10000,
                  offeredPrice: 7000),
              Price(
                  title: 'CT CHEST + ABDOMEN (C)',
                  mrp: 12500,
                  offeredPrice: 9200),
              Price(
                  title: 'CT ENTEROGRAPHY (C)', mrp: 9000, offeredPrice: 6750),
              Price(title: 'CT KUB (P)', mrp: 5000, offeredPrice: 3500),
              Price(title: 'CT KUB (C)', mrp: 6500, offeredPrice: 5000),
              Price(title: 'CT UROGRAPHY (C)', mrp: 8000, offeredPrice: 6000),
              Price(
                  title: 'CT LOWER/UPPER ABDOMEN (P)',
                  mrp: 5000,
                  offeredPrice: 3500),
              Price(
                  title: 'CT LOWER/UPPER ABDOMEN (C)',
                  mrp: 6500,
                  offeredPrice: 5000),
            ],
            secondTitle: 'Abdominal CT Scan Procedure',
            secondDescription:
                "Before starting the test ct scan near me in Delhi the patient will be told to wear hospital clothes and remove metallic objects which is risky for the test. The patient will lie down on the moveable scanner. The table will start moving and rotating. One by one the images will start to be captured and stored in the machine system. The CT scan process is painless with minimum radiation exposure. After the test is performed the results will be analyzed by a qualified radiologist and will be shared with the physician and will be discussed with the patient if treatment is needed or not. If you want to know about abdominal ct scan cost in Delhi then connect with QRIS Health for it.",
            whyToChooseTitle: 'Why to Choose Abdominal CT Scan?',
            whyToChoose: [
              'Comprehensive evaluation',
              'Diagnostic accuracy',
              'Quicker results',
              'Gives guidance for surgery'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question: 'Is it safe to perform an abdomen CT scan?',
                  answer:
                      'Yes, ofcourse abdominal ct scan in Delhi is safe because this procedure involves minimal amount of radiation and the scanners are put in limit for the same. However, pregnant women or kidney patients should consult the doctor or take supervision before the scan.'),
              Faq(
                  question: 'What can we diagnose with this test?',
                  answer:
                      'An abdominal CT Scan ensures that we get diagnosis results for various conditions such as, abdominal pain, kidney stones, tumors, liver issues,etc.'),
              Faq(
                  question: 'Are the contrast materials used in the scan safe?',
                  answer:
                      'Well, the contrast materials used in the scan are safe but some individuals may suffer from allergic issues or more serious issues. It is necessary to inform cect abdomen in Delhi before conducting your scan test.')
            ]);
      case SubScanType.CT_SCAN_JOINT_AND_LIMBS:
        return SubscanModel(
            appBarTitle: 'Joint & Limb CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/joints_and_limbs_ct_scan.png',
            firstHeading: 'What is CT Scan for Joints and Limbs?',
            firstHeadingDescription:
                'CT (Computed Tomography) scans are known to be medical advanced imaging techniques which can obtain detailed images of cross-sectional images for the internal structure of the body. In terms of assessing joint health and bone, CT scans play an important role for diagnosing as well as monetizing multiple conditions of orthopedic. The medical facilities at Delhi offer various CT scans which tailors the limbs and joints which provide accurate diagnosis of the treatment.',
            prices: [
              Price(
                  title: 'CT ANGIO BOTH LIMBS (C)',
                  mrp: 12000,
                  offeredPrice: 8350),
              Price(
                  title: 'CT ANGIO SINGLE LIMB (C)',
                  mrp: 10000,
                  offeredPrice: 7450),
              Price(
                  title: 'CT PER JOINT STUDY (P)',
                  mrp: 4500,
                  offeredPrice: 3150),
              Price(
                  title: 'CT PER JOINT STUDY (C)',
                  mrp: 5500,
                  offeredPrice: 4650),
              Price(title: 'CT SINGLE LIMB (P)', mrp: 4500, offeredPrice: 3150),
              Price(title: 'CT SINGLE LIMB (C)', mrp: 5500, offeredPrice: 4650),
            ],
            secondTitle: 'Joints and Limbs CT Scan Procedure',
            secondDescription:
                "CT bone in Delhi is non-invasive which involves X-ray equipment for detailed procedures for cross-sectional images of the soft tissues & bones in these areas.The patient lies on the table and there is a scanner which moves across the target area which captures different images. The images get processed by the computer for creating detailed & quality 3D images which enable orthopedic & radiologists for evaluating fractures, bones, joint abnormalities & multiple musculoskeletal conditions",
            whyToChooseTitle: 'Why to Choose Joints and Limbs CT Scan?',
            whyToChoose: [
              '3D Imaging',
              'Minimally Radiation',
              'Monitoring Progress',
              'Non-invasive and quick'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question:
                      'What is the need of the hour for CT bone imaging in Delhi?',
                  answer:
                      'The CT bone imaging in Delhi has a crucial part in the diagnosis and evaluation of multiple issues which are bone related. The process involved detailing the bone images, which helps in giving the accurate assessment for things like bone infections fractures, and various other degenerative conditions'),
              Faq(
                  question:
                      'Are all age groups suitable for CT scan joints in Delhi ?',
                  answer:
                      'Yes, CT scan joints in Delhi are suitable for all types of age groups which includes adults, children and elderly people and the ct scan price in Delhi is available at affordable rates. It can provide proper insights into the joint conditions of an individual which aids in early detection and diagnosis of the problem.'),
              Faq(
                  question:
                      'Why is CT scan limbs in Delhi for joints an important diagnostic way?',
                  answer:
                      'The CT scan for joints and limbs is known to be a very valuable diagnostic tool which helps in accessing the bone and joint imaging in delhi. In case of issues like limited liability, joint pains etc, it is a good idea to get in touch with a qualified orthopedic surgeon who could suggest CT scan joints.')
            ]);

      case SubScanType.CT_SCAN_CHEST:
        return SubscanModel(
            appBarTitle: 'Chest CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/chest_ct_scan.png',
            firstHeading: 'What is Chest CT Scan?',
            firstHeadingDescription:
                "The CT scan chest in Delhi is commonly known as the thoracic CT or chest CT, a non-invasive imaging procedure. This process uses technology and X-rays to create detailed images of the chest area. This test offers valuable insights into the structures and organs inside the chest, including the mediastinum, thoracic spine, lungs, heart, etc. A CECT chest in Delhi is used to diagnose and evaluate multiple conditions, such as cardiovascular diseases, lung infections, and various other abnormalities present in the chest region.",
            prices: [
              Price(title: 'CT CHEST (P)', mrp: 4500, offeredPrice: 3150),
              Price(title: 'CT CHEST (C)', mrp: 6000, offeredPrice: 4650),
              Price(
                  title: 'CT CHEST + ABDOMEN (P)',
                  mrp: 10000,
                  offeredPrice: 7000),
              Price(
                  title: 'CT CHEST + ABDOMEN (C)',
                  mrp: 12500,
                  offeredPrice: 9200),
              Price(title: 'HRCT CHEST (C)', mrp: 5500, offeredPrice: 3850),
              Price(
                  title: 'CT NECK + CHEST (P)', mrp: 8000, offeredPrice: 5600),
              Price(
                  title: 'CT NECK + CHEST (C)', mrp: 10000, offeredPrice: 7700),
              Price(
                  title: 'CT ANGIO PULMONARY (C)',
                  mrp: 11000,
                  offeredPrice: 8150),
            ],
            secondTitle: 'Chest CT Scan Procedure',
            secondDescription:
                "During the process, the patient is supposed to lie on the table, which is moved towards the ct scan of lungs in Delhi. The scanner has a doughnut shape which has detectors and X-ray tubes. Once the table moves with the scanners, the X-ray beams are directed toward the chest from various angles. The detectors are used for measuring the radiation amount which passes through the body, and this data is sent to the computer, which creates slices or images of the chest. These pictures then provide a proper view of the internal organ structure, which allows the experts to analyze any abnormalities. In terms of chest ct scan price in Delhi, it is pretty affordable.",
            whyToChooseTitle: 'Why to Choose Chest CT Scan?',
            whyToChoose: [
              'Surgical planning',
              'Cardiovascular assessment',
              'Early detection',
              'Enhanced patient care'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question:
                      'Is the chest CT scan the same as a coronary CT or angiogram?',
                  answer:
                      'No, a chest CT scan in Delhi is a broad image study that captures the images of the chest region, including the lungs and hearts. CT coronary angiogram or CT angiogram is a specialized test that focuses on getting visuals of blood vessels around the heart area and assessing the abnormalities and blockages.'),
              Faq(
                  question: 'Is the chest CT scan considered to be safe?',
                  answer:
                      'Yes, a chest CT scan is considered to be safe. All the risks associated with the radiation do not outweigh the benefits of a chest CT scan. The modern CT scan is designed to minimize the radiation dose and use the right technologies to maintain image quality. In terms of ct scan price near me in Delhi, it is affordable.'),
              Faq(
                  question: 'How should one prepare for a chest CT scan?',
                  answer:
                      'Usually, one is not required to prepare for the chest CT scan. But during the scan, there are chances experts will ask you to remove things like metal objects, any jewelry, or clothes that have metal that could interfere with the scans.')
            ]);
      case SubScanType.CT_SCAN_HEAD_AND_NECK:
        return SubscanModel(
            appBarTitle: 'Head & Neck CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/head_and_neck_ct_scan.png',
            firstHeading: 'What is Head and Neck CT Scan?',
            firstHeadingDescription:
                "The Head and Neck CT scan is known to be a thorough medical procedure for imaging which helps in capturing detailed images of neck and head region. The ct scan brain in Delhi offers valuable insights. The diagnostic tool is very important in early detection of multiple conditions which aids the experts in developing the right treatment plans.",
            prices: [
              Price(
                  title: 'CT ANGIO BRAIN (C)', mrp: 10000, offeredPrice: 7450),
              Price(title: 'CT ANGIO NECK (C)', mrp: 10000, offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO BRAIN+NECK (C)',
                  mrp: 15000,
                  offeredPrice: 10950),
              Price(title: 'CT HEAD (P)', mrp: 2500, offeredPrice: 1750),
              Price(title: 'CT HEAD (C)', mrp: 3500, offeredPrice: 3250),
              Price(title: 'CT NECK (P)', mrp: 4000, offeredPrice: 2800),
              Price(title: 'CT NECK (C)', mrp: 5500, offeredPrice: 4300),
              Price(title: 'CT NECK+CHEST (P)', mrp: 8000, offeredPrice: 5600),
              Price(title: 'CT NECK+CHEST (C)', mrp: 10000, offeredPrice: 7700),
            ],
            secondTitle: "Head and Neck CT Scan Procedure",
            secondDescription:
                "The procedure of Head & Neck CT Scan is fairly simple. The patient is supposed to lie on the examination table which gets positioned in the CT scanner. The scanner makes use of the X-ray technology for capturing cross-sectional images of the neck and head area. This process is very painless, quick and requires the patient to remain still throughout the process to ensure the right imaging. The images which are captured are processed by the computer for creating detailed 3D images, which enables healthcare and radiologists experts for assisting and diagnosing the abnormalities.",
            whyToChooseTitle: 'Why to Choose Abdominal CT Scan?',
            whyToChoose: [
              'Three dimensional imaging',
              'Guiding biopsies',
              'Monitoring of progression of disease',
              'Trauma assessment'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question:
                      'What is the importance of neck and head scan in Delhi?',
                  answer:
                      'A neck and head ct scan centers near me in Delhi has a huge importance in allowing healthcare experts to evaluate multiple neck and head conditions. The scan is used for detecting issues like head injuries, brain tumors, sinus infections, neck masses and various other diseases across.'),
              Faq(
                  question: 'What is the cost of CT scan neck in Delhi?',
                  answer:
                      'The cost of CT scan neck in Delhi can be known with the help of the experts at QRIS Health. You can speak to the professionals and book an appointment.'),
              Faq(
                  question:
                      'What are the associated risks with CT scan neck in Delhi?',
                  answer:
                      'Although the head and neck CT scan is considered to be safe, the ct scan in Delhi is known to be exposed to ionizing radiation. But pregnant individuals should avoid taking these scans, due to the exposure of the radiation.')
            ]);
      case SubScanType.CT_SCAN_SINUS:
        return SubscanModel(
            appBarTitle: 'Sinus CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/sinus_ct_scan.png',
            firstHeading: 'What is Sinus CT Scan PNS?',
            firstHeadingDescription:
                "Sinus CT scan in delhi and CT pns in delhi are known to be very advanced medical procedures which provide proper insights in the nasal passage, sinuses and various other structures. These are known to be painless scans which are very instrumental in diagnosis of multiple sinus-related issues that help doctors plan out the future course of treatment for patients.",
            prices: [
              Price(title: 'CT ORBIT (P)', mrp: 2500, offeredPrice: 1750),
              Price(title: 'CT ORBIT (C)', mrp: 3500, offeredPrice: 3250),
              Price(
                  title: 'CT PNS CORONAL & AXIAL (P)',
                  mrp: 4000,
                  offeredPrice: 3200),
              Price(
                  title: 'CT PNS CORONAL & AXIAL (C)',
                  mrp: 5000,
                  offeredPrice: 4300),
              Price(
                  title: 'CT PNS CORONAL/AXIAL (P)',
                  mrp: 3000,
                  offeredPrice: 2100),
              Price(
                  title: 'CT PNS CORONAL/AXIAL (C)',
                  mrp: 4000,
                  offeredPrice: 3600),
              Price(
                  title: 'CT PNS CORONAL, AXIAL, SAGGITAL (P)',
                  mrp: 5000,
                  offeredPrice: 3500),
              Price(
                  title: 'CT PNS CORONAL, AXIAL, SAGGITAL (C)',
                  mrp: 6000,
                  offeredPrice: 5000),
            ],
            secondTitle: 'Sinus CT Scan, CT PNS Procedure',
            secondDescription:
                "In the CT scan centers near me in Delhi, the patient lies on the table which slides in the CT scanner. There are X-rays beams which are utilized for capturing cross-sectional images of nasal and sinuses passages. The images get reconstructed by the computers for creating a detailed three-dimensional view. The process takes just a few minutes, and the patient is asked to hold their breath for obtaining clear images. The CT scan cost in Delhi is also quite affordable.",
            whyToChooseTitle: 'Why to Choose Abdominal CT Scan?',
            whyToChoose: [
              'Anatomy visualization',
              'Surgical planning',
              'Detailed assessment of sinus',
              'Accurate diagnosis'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question:
                      'What conditions can CT Scan PNS and CT Scan Sinus detect?',
                  answer:
                      'The CT Scan PNS and CT Scan Sinus are very valuable in diagnosing nasal polyps, sinus tumors, sinus cysts and other abnormalities in the nasal passages. The scans help in identifying the root cause of the chronic congestions and various other recurring sinus infections.'),
              Faq(
                  question:
                      'Are the CT Scan Sinus and CT Scan PNS safe and affordable?',
                  answer:
                      'Yes, the CT Scan Sinus and CT Scan PNS are very safe and the nose CT scan price in delhi is also affordable. The radiation amount used during the process is very minimal and the benefits of the right diagnosis outweighs all the possible risks. There is a possibility that patients can experience a little discomfort especially when lying down during the process.'),
              Faq(
                  question: 'How should one prepare for a CT Scan Sinus?',
                  answer:
                      'When it comes to preparation, there are no special requirements. A few things to keep in mind are that patients should avoid wearing any kind of metal objects such as jewelry and priorly inform the experts about the medical implants they have.')
            ]);
      case SubScanType.CT_SCAN_ANGIO:
        return SubscanModel(
            appBarTitle: 'Angio CT Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/angio_ct_scan.png',
            firstHeading: 'What is Angiography CT Scan?',
            firstHeadingDescription:
                "CT Scan Angiography is very commonly also known to be CTA or CT Angiogram in Delhi, a medical technique which is non-invasive and provides blood vessel images through the body. The heart ct scan in Delhi, used in visualizing blood vessels in heart, abdomen, neck, and different extremities. CT Angiography offers vascular conditions such as arterial blockages, vascular malformations, aneurysms.",
            prices: [
              Price(
                  title: 'CT ANGIO BRAIN (C)', mrp: 10000, offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO BRAIN+NECK (C)',
                  mrp: 15000,
                  offeredPrice: 10950),
              Price(
                  title: 'CT ANGIO LOWER ABD (C)',
                  mrp: 10000,
                  offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO RENAL (C)', mrp: 11000, offeredPrice: 8150),
              Price(
                  title: 'CT ANGIO UPPER ABD (C)',
                  mrp: 10000,
                  offeredPrice: 7450),
              Price(
                  title: 'CT ANGIO WHOLE ABD (C)',
                  mrp: 15000,
                  offeredPrice: 10950),
              Price(
                  title: 'CT ANGIO PULMONARY (C)',
                  mrp: 11000,
                  offeredPrice: 8150),
              Price(title: 'CT CHEST (P)', mrp: 4500, offeredPrice: 3150),
              Price(title: 'CT CHEST (C)', mrp: 6000, offeredPrice: 4650),
              Price(title: 'HRCT CHEST (C)', mrp: 5500, offeredPrice: 3850),
            ],
            secondTitle: 'Angiography CT Scan Procedure',
            secondDescription:
                "During the CT coronary angiogram in Delhi, it gets injected via vein for proper visibility of the CT images and blood vessels. The patient is supposed to lie on a narrow table which is slided in on the CT scanner. X-ray beams are rotated across the body, for capturing cross-sectional images for blood vessels. The images get processed by the computer for creating very detailed 3D images which can get properly analyzed by the experts. The process is super quick, and it takes about 30-60 minutes. In terms of full body ct scan price in Delhi, the prices are affordable.",
            whyToChooseTitle: 'Why to Choose Abdominal CT Scan?',
            whyToChoose: [
              'Real time imaging',
              'Coronary assessment',
              'Accurate diagnosis',
              'Prevention of stroke'
            ],
            thirdHeading: 'Other CT Scans',
            faqs: [
              Faq(
                  question:
                      'Is CT Angiography considered to be painless and safe?',
                  answer:
                      'CT Angiography is safe and is performed by the experts. During the process, there is an exposure for radiation ionizing from X-rays and the use of contrast dye. The exposure radiation is less, and it is important that individuals with kidney issues or pregnant women should let the experts know about it.'),
              Faq(
                  question:
                      'How should an individual prepare for CT Angiogram?',
                  answer:
                      'Before getting a CT Angiogram, the individuals should let experts know in case of past medical problems, allergies or ongoing medications. Specially in case of the history of diabetes or kidney problems, this should be clearly stated. Also make sure to inquire about heart ct scan cost in Delhi.'),
              Faq(
                  question:
                      'What should be the expectations after the CT Angiography?',
                  answer:
                      'Post CT Angiogram, the individuals can resume their daily activities unless stated by the expert. It is very important to be drinking fluids and keep themselves hydrated. The expert interprets the images and accordingly discusses the recommendations.')
            ]);

      case SubScanType.ULTRASOUND_ABDOMEN:
        return SubscanModel(
            appBarTitle: 'Abdominal Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/abdominal_ultrasound.png',
            firstHeading: 'What is Abdominal Ultrasound?',
            firstHeadingDescription:
                "Abdominal ultrasound is also commonly known as USG abdomen which is an imaging test for providing real time insights in the internal organs and the structures within the abdomen. The whole abdominal ultrasound in Delhi makes use for creating real time images, which enables experts for visualizing the gallbladder, kidneys, liver, pancreas, spleen and various other abdominal organs.",
            prices: [
              Price(title: 'USG WHOLE ABD', mrp: 1800, offeredPrice: 1250),
              Price(title: 'USG UPPER ABD', mrp: 1500, offeredPrice: 1050),
              Price(
                  title: 'USG LOWER ABD/PELVIS', mrp: 1500, offeredPrice: 1050),
              Price(title: 'USG KUB', mrp: 1500, offeredPrice: 1050),
              Price(title: 'USG KUB+PVR', mrp: 1800, offeredPrice: 1250),
              Price(
                  title: 'USG LOWER ABDO WITH TVS',
                  mrp: 1600,
                  offeredPrice: 1100),
            ],
            secondTitle: 'Abdominal Ultrasound Procedure',
            secondDescription:
                "The preparation of USG whole abdomen in Delhi requires very less preparation. The patient gets instructed to fast for a few hours, specifically when the examination involves imaging of pancreas or gallbladder. The patient is laid on the table and a gel is applied for skin over the abdomen. The gel properly helps with transmitting the sound waves and ensures contact between the ultrasound transducer and skin. The expert, who is also known as sonographer, makes use of a handheld device which is known as ultrasound transducer. The transducer does emit high frequency sound waves in the body and then picks the echoes produced as the sound waves, which bounces back from the internal organs. The echoes get processed by the computer for creating real time images of the organs on the monitor.",
            whyToChooseTitle: 'Why to Choose Abdominal Ultrasound?',
            whyToChoose: [
              'Non-invasive imaging',
              'Real time imaging',
              'Painless procedure',
              'Diverse applications'
            ],
            thirdHeading: 'Other Ultrasound',
            faqs: [
              Faq(
                  question: 'Is the process of abdominal ultrasound painful?',
                  answer:
                      'No, the abdominal ultrasound is considered to be very painless. This process involves the use of sound waves, which eliminates the need for any needles or any radiation exposure.'),
              Faq(
                  question: 'What is the purpose of abdominal ultrasound ?',
                  answer:
                      'USG abdomen in Delhi is done for assessing and diagnosing the various medical conditions which affect the abdominal organs. The ultrasound helps in identification of issues like liver diseases, kidney stones, gallbladder, abdominal masses, pancreatitis and various other conditions.'),
              Faq(
                  question:
                      'What is the duration of abdominal ultrasound in Delhi?',
                  answer:
                      'The abdominal ultrasound in Delhi duration takes about 20 to 30 minutes. The actual time of the ultrasound depends on the examinations of the complexity and the specific organs which are assessed. Finding the right ultrasound near me in Delhi is super easy.')
            ]);
      case SubScanType.ULTRASOUND_PREGNANCY:
        return SubscanModel(
            appBarTitle: 'Pregnancy Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/pregnancy_ultrasound.png',
            firstHeading: 'What is Pregnancy Ultrasound?',
            firstHeadingDescription:
                "Pregnancy is considered to be a memorable phase in every female’s life which is full of joy and also anticipation. Hence, it is very important to monitor the regular health and development of a baby and this is where the role of ultrasound comes into picture. Pregnancy ultrasound in Delhi is considered to be an imaging and non-invasive technique which assists information about the pregnancy journey.",
            prices: [
              Price(
                  title: 'USG LEVEL I/NT-NB SCAN',
                  mrp: 2500,
                  offeredPrice: 1500),
              Price(title: 'USG LEVEL I TWINS', mrp: 5000, offeredPrice: 2500),
              Price(
                  title: 'USG LEVEL II (ANOMALY SCAN)',
                  mrp: 3000,
                  offeredPrice: 2100),
              Price(
                  title: 'USG OBS ROUTINE/ EARLY PREGNANCY',
                  mrp: 1600,
                  offeredPrice: 1200),
              Price(
                  title: 'USG EARLY PREGNANCY (TWINS)',
                  mrp: 2000,
                  offeredPrice: 1500),
              Price(
                  title: 'USG FOLLICULAR STUDY (1 SITTING)',
                  mrp: 1600,
                  offeredPrice: 1100),
              Price(title: 'USG LEVEL II TWINS', mrp: 6000, offeredPrice: 4000),
              Price(title: 'USG BPS/BPP', mrp: 3000, offeredPrice: 2100),
              Price(
                  title: 'USG FOLLICULAR STUDY (FOLLOW UP SINGLE SITTING)',
                  mrp: 3000,
                  offeredPrice: 700),
              Price(
                  title: 'USG FOLLICULAR STUDY( UP TO 4 SITTING)TVS',
                  mrp: 3000,
                  offeredPrice: 2100),
            ],
            secondTitle: 'Pregnancy Ultrasound Procedure',
            secondDescription:
                "Pregnancy Ultrasound is also known as obstetric or prenatal ultrasound as it makes use of very high frequency sound waves, for creating images which are real time. These images provide a glimpse of developing the fetus and various other reproductive organs of the mother. The procedure is not painful at all. The expecting mother is supposed to have a full bladder for 360 degree visualization of both the baby and the uterus. It is important for the mother to drink water before the scan, to get clearer images. The individual is supposed to lie on the table and a gel is applied on the abdomen as it helps in transmission of the sound waves and ensures proper connection vice known as the ultrasound probe which gets moved over gently to the abdomen. This emits the sound waves which bounces back from the organs and fetus and creates the detailed images. The price of sonography in Delhi is also very affordable. The duration of the entire process of sonography in pregnancy in Delhi is somewhere between 20-30 mins, depending on the cooperation of the baby. If you are searching for Ultrasound scan near me in Delhi, than Qris Health is the right place for you",
            whyToChooseTitle: 'Why to Choose Pregnancy Ultrasound?',
            whyToChoose: [
              'Monitoring High-Risk Pregnancies',
              'Fetal Health Assessment',
              'Gestational Age Determination',
              'Anomaly Detection'
            ],
            thirdHeading: 'Other Ultrasound',
            faqs: [
              Faq(
                  question:
                      'When should one undergo the scan in pregnancy in Delhi?',
                  answer:
                      'During the first and second trimesters, it is essential to have a minimum of 2 pregnancy tests. The very first test is done around the 8th week for confirming the pregnancy and determining the due date. The second test is performed around week 22nd, to assess the organs of the baby and spot any abnormalities.'),
              Faq(
                  question:
                      'Is the ultrasound considered safe for both baby and mother?',
                  answer:
                      'Yes, pregnancy ultrasound is considered safe for the baby and mother. The ultrasound makes use of the waves for creating the images and eliminates all risks for radiations which are associated with X-Rays.'),
              Faq(
                  question:
                      'What is the information which one can get via the pregnancy ultrasound?',
                  answer:
                      'The pregnancy ultrasound provides vital information such as the position of the baby, size, age etc.')
            ]);
      case SubScanType.ULTRASOUND_CHEST:
        return SubscanModel(
            appBarTitle: 'Chest/Breast Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/chest_ultrasound.png',
            firstHeading: 'What is Chest and Breast Ultrasound?',
            firstHeadingDescription:
                "Breast ultrasound in Delhi is a crucial radiation free process, which helps in providing the detailed diagnosis via the image of the internal organs. The ultrasound uses sound waves for detecting the images, and hence is considered to be a painless process. The ultrasound can detect the images of various organs such as tissues, breast, heart etc.",
            prices: [
              Price(title: 'USG BREAST(SINGLE)', mrp: 1500, offeredPrice: 1050),
              Price(title: 'USG BREAST(BOTH)', mrp: 2500, offeredPrice: 1750),
              Price(title: 'USG SMALL PARTS', mrp: 2500, offeredPrice: 1750),
              Price(title: 'USG NECK', mrp: 2500, offeredPrice: 1750),
              Price(title: 'USG THYROID', mrp: 2000, offeredPrice: 1400),
              Price(title: 'USG BRAIN', mrp: 3000, offeredPrice: 2100),
              Price(title: 'USG CHEST/THORAX', mrp: 2500, offeredPrice: 1750),
            ],
            secondTitle: 'Chest Ultrasound Procedure',
            secondDescription:
                "The individual before the ultrasound is supposed to wear loose fitting clothes and then lay down on the examination table. A get is applied on the chest area which ensures there is a proper contact between the ultrasound transducer and the skin. A device named transduces is used for emitting high frequency of the sound waves in the chest. The chest scan price in Delhi is very pocket friendly.",
            whyToChooseTitle: 'Why to Choose Chest and Breast Ultrasound?',
            whyToChoose: [
              'Focused evaluation',
              'Focused Imaging',
              'Monitoring Cysts',
              'Breast Health Assessment'
            ],
            thirdHeading: 'Other Ultrasound',
            faqs: [
              Faq(
                  question:
                      'Are chest ultrasound in Delhi considered to be painful?',
                  answer:
                      'No, the breast and chest scan in Delhi process is considered to be painless as it makes use of the sound waves for creating images, without exposure to the radiation. Patients can experience a little discomfort due to the pressure applied via the transducer during this process.'),
              Faq(
                  question:
                      'What is the duration of the chest and breast ultrasound?',
                  answer:
                      'The duration of the breast and chest ultrasound takes about 30 minutes, and this duration does depend on the examination complexity also. The ultrasound centre near me is also very easily available.'),
              Faq(
                  question:
                      'Does breast ultrasound have the ability to detect breast cancer?',
                  answer:
                      'Yes, a breast ultrasound can detect breast cancer which identifies the masses or any kind of abnormalities in the breast tissue.')
            ]);
      case SubScanType.ULTRASOUND_FNAC:
        return SubscanModel(
            appBarTitle: 'FNAC Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/fnac_ultrasound.png',
            firstHeading: 'What is FNAC Ultrasound?',
            firstHeadingDescription:
                "FNAC full form (Fine Needle Aspiration Cytology) ultrasound is known to be a very advanced technique which is used for assessing the abnormal tissues for masses and growth. The FNAC test meaning is the combination of ultrasound with FNAC provides a good approach for diagnostics which helps with obtaining tissue samples with accuracy and precision.",
            prices: [
              Price(
                  title: 'USG GUIDED FNAC(SUPERFICIAL ORGANS)',
                  mrp: 2500,
                  offeredPrice: 1199)
            ],
            secondTitle: 'FNAC Ultrasound Procedure',
            secondDescription:
                "Right before the procedure, the patient is properly briefed about the process and risks. The individuals are asked to do fasting for a few hours, and the number of hours also depends on the areas which get examined. The expert first conducts the ultrasound scan for locating the target precisely. The real time imaging helps in enabling the experts to visualize the mass. Once the expert sets the target, a fine needle is inserted, for obtaining the sample. The needle is guided by ultrasound test in Delhi images which will ensure accurate placements. Once the needle gets entered into the mass, the expert aspirates the tiny tissue cells. The FNAC test price in Delhi is very affordable.",
            whyToChooseTitle: 'Why to Choose FNAC Ultrasound?',
            whyToChoose: [
              'Focused Needle Biopsy',
              'Real time imaging',
              'Diagnosis of Abnormalities',
              'Precise Tissue Sampling'
            ],
            thirdHeading: 'Other Ultrasound',
            faqs: [
              Faq(
                  question: 'Is FNAC test in Delhi ultrasound painful?',
                  answer:
                      'The procedure can sometimes cause some discomfort similar to any kind of needle prick. The process is quite quick, and local anesthesia is used for minimizing the discomfort.'),
              Faq(
                  question: 'What does the FNAC ultrasound diagnose?',
                  answer:
                      'The diagnosis of the FNAC ultrasound covers a wide range of conditions which includes cysts, abscesses, tumors and various other growths of abnormal tissues. The ultrasound is used for evaluating thyroid, breast lumps, lymph, nodes etc.'),
              Faq(
                  question:
                      'Is it safe to get FNAC ultrasound during pregnancy?',
                  answer:
                      'Generally during pregnancy, FNAC is considered to be safe, when used for diagnosis of the treatment. But it is always a good idea to consult with the experts if you are pregnant.')
            ]);

      case SubScanType.COLOR_DOPPLER_ABDOMEN:
        return SubscanModel(
            appBarTitle: 'Abdominal Color Doppler Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/abdominal_color_doppler_ultrasound.png',
            firstHeading: 'What is Abdominal Color Doppler Ultrasound?',
            firstHeadingDescription:
                "The color doppler ultrasound abdominal in Delhi is considered to be an imaging painless technique which is used for examination of the internal organs in the abdomen. The technology of color Doppler offers robust visualization of the blood flow patterns aiding any kind of detection of vascular conditions.",
            prices: [
              Price(title: 'CD ABDOMEN', mrp: 3500, offeredPrice: 2450),
              Price(title: 'HEPATOPORTAL', mrp: 3000, offeredPrice: 2100),
              Price(title: 'CD PENILE', mrp: 4500, offeredPrice: 3150),
              Price(title: 'RENAL DOPPLER', mrp: 3500, offeredPrice: 2450),
              Price(title: 'CD PELVIS', mrp: 3000, offeredPrice: 2100),
              Price(title: 'CD SCROTUM', mrp: 2600, offeredPrice: 1850),
              Price(
                  title: 'RENAL GRAFT (TRANSPLANT)',
                  mrp: 2500,
                  offeredPrice: 1750),
            ],
            secondTitle: 'Abdominal Color Doppler Ultrasound Procedure',
            secondDescription:
                "Before doing the Abdominal Color Doppler Ultrasound, the patients asked for fasting for a specific duration to reduce the interference of gas. There is a water based gel which is applied to the area, which facilitates better transmission of sound waves. Patients are asked to lie on the table, and expose the abdomen for the scan. The expert places the transducer on the abdomen and moves it gently for capturing images. The color Doppler technology is known for adding the color to the images which indicates the speed and direction of the blood flow. In terms to know about doppler ultrasound price in Delhi, QRIS Health experts can help you with everything.",
            whyToChooseTitle:
                'Why to Choose Abdominal Color Doppler Ultrasound?',
            whyToChoose: [
              'Vascular and Organ Assessment',
              'Detecting Vascular Issues',
              'Blood Flow Visualization',
              'Organ Evaluation'
            ],
            thirdHeading: 'Other Color Doppler Ultrasound',
            faqs: [
              Faq(
                  question:
                      'What all issues can be diagnosed via Abdominal Color Doppler Ultrasound in Delhi?',
                  answer:
                      'The Abdominal Color Doppler Ultrasound in Delhi, can diagnose multiple issues such as renal artery stenosis, abdominal aortic aneurysms, gallbladder disorders, liver cirrhosis etc.'),
              Faq(
                  question:
                      'Are there any risks associated with Color Doppler Ultrasound?',
                  answer:
                      'The Color Doppler Ultrasound does not have any risks involved and is very safe as it does not involve any kind of radiation.'),
              Faq(
                  question: 'What is the duration of the ultrasound process?',
                  answer:
                      "The ultrasound duration varies between 40-60 minutes, & it depends on the examination's complexity & patients' condition.")
            ]);
      case SubScanType.COLOR_DOPPLER_PREGNANCY:
        return SubscanModel(
            appBarTitle: 'Pregnancy Color Doppler Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/pregnancy_color_doppler_ultrasound.png',
            firstHeading: 'What is Pregnancy Color Doppler Ultrasound?',
            firstHeadingDescription:
                "Pregnancy color doppler scans in Delhi Ultrasound is known to be a test during pregnancy which assesses the well being of the placenta and fetus. The scan makes use of color Doppler technology, which helps with visualizing the real time blood flow patterns. The color doppler test in pregnancy is considered to be a safe process which gives insights into the blood circulation in the uterus and helps monitor the overall development of the fetal.",
            prices: [
              Price(title: 'CD PREGNANCY', mrp: 3000, offeredPrice: 2100),
              Price(
                  title: 'CD PREGNANCY (TWINS)', mrp: 5000, offeredPrice: 3500),
            ],
            secondTitle: 'Pregnancy Color Doppler Ultrasound  Procedure',
            secondDescription:
                "Before the doppler ultrasound pregnancy in Delhi, the pregnant woman is advised for have a full bladder which helps in providing an enhanced quality image. The individual lies on the table which exposes the abdomen. A water based gel is applied on the abdominal area as it helps in establishing smooth contact. The transducer is placed on the abdomen and it moves gently for obtaining clearer images. The technology of Doppler technology adds the colour to the ultrasound images which represents the speed and direction of the blood flow with the blood vessels.",
            whyToChooseTitle:
                'Why to Choose Pregnancy Color Doppler Ultrasound?',
            whyToChoose: [
              'Monitoring High-Risk Pregnancies',
              'Fetal Health Assessment',
              'Detailed Imaging',
              'Assessment of Blood Flow'
            ],
            thirdHeading: 'Other Color Doppler Ultrasound',
            faqs: [
              Faq(
                  question:
                      'Can there be any risks associated with doppler test in pregnancy in Delhi considered for the baby?',
                  answer:
                      'Yes, doppler scan in pregnancy in Delhi is safe for both baby and the mother and there are no risks involved. The ultrasound makes use of harmless sound waves which create detailed images without any exposure to the radiation.'),
              Faq(
                  question:
                      'Does the process of Pregnancy Color Doppler Ultrasound cause pain?',
                  answer:
                      'The color doppler test in pregnancy in Delhi is safe and painless. The gel application or the transducer application causes a little discomfort.'),
              Faq(
                  question:
                      'For the scan, is full bladder considered necessary?',
                  answer:
                      'Yes, having a full bladder helps with creating better images during the ultrasound. It is always recommended for drinking water before the procedure.'),
            ]);
      case SubScanType.COLOR_DOPPLER_LIMB:
        return SubscanModel(
            appBarTitle: 'Limb Color Doppler Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/limb_color_doppler_ultrasound.png',
            firstHeading: 'What is Limb Color Doppler Ultrasound?',
            firstHeadingDescription:
                "The doppler test for legs in Delhi is known to be an imaging technique which is used for evaluating the blood flow in the legs and arms which is known as peripheral limbs. The process helps in detecting any kind of blood clots, blockages, abnormalities etc.",
            prices: [
              Price(
                  title: 'CD SINGLE LIMB VENOUS',
                  mrp: 2500,
                  offeredPrice: 1750),
              Price(
                  title: 'CD BOTH LIMB VENOUS', mrp: 5000, offeredPrice: 3500),
              Price(
                  title: 'CD SINGLE LIMB ARTERIAL',
                  mrp: 2500,
                  offeredPrice: 1750),
              Price(
                  title: 'CD BOTH LIMB ARTERIAL',
                  mrp: 5000,
                  offeredPrice: 3500),
            ],
            secondTitle: 'Limb Color Doppler Ultrasound Procedure',
            secondDescription:
                "For the process of venous doppler lower limb in delhi, the individual is laid down on the table. The expert applies the gel on the limbs which aids the transmission of the sound waves. Then a transducer is moved across the surface of the limbs which emits higher frequency of the sound waves, bouncing off the blood vessels which creates detailed images. The color doppler technology properly analyzes the sound waves which reflect the moving blood cells, and then generates the color coded images. The Limb Color Doppler Ultrasound properly evaluates the veins and arteries in the legs and arms for different signs such as DVT, PAD etc.",
            whyToChooseTitle: 'Why to Choose Limb Color Doppler Ultrasound?',
            whyToChoose: [
              'Blood Flow Evaluation',
              'Peripheral Vascular Assessment',
              'Vascular Disease Detection',
              'Non-Invasive'
            ],
            thirdHeading: 'Other Color Doppler Ultrasound',
            faqs: [
              Faq(
                  question:
                      'Who are the right individuals that should go for the venous doppler test in Delhi?',
                  answer:
                      'Every individual apart from the following who face these issues can go for limb colour doppler ultrasound - swelling, leg pain, cramping etc.'),
              Faq(
                  question:
                      'What are the benefits for arterial doppler test in Delhi?',
                  answer:
                      'There are multiple benefits of getting a vascular doppler test in Delhi such as the early detection of diseases such as blood clots, artery disease or other vascular abnormalities that provide timely information to prevent complications related to limb related.'),
              Faq(
                  question:
                      'What are the preparations required before taking the test?',
                  answer:
                      'As such there is no pre-preparation required. The individual is advised to wear loose clothes which could make it easy to carry out the ultrasound.')
            ]);
      case SubScanType.COLOR_DOPPLER_CAROTID:
        return SubscanModel(
            appBarTitle: 'Carotid Color Doppler Ultrasound',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/carotid_color_doppler_ultrasound.png',
            firstHeading: 'What is Carotid Color Doppler Ultrasound?',
            firstHeadingDescription:
                "Carotid doppler is known to be a specialized technique used for assessing the blood flow in the arteries which is located in the neck. These arteries supply oxygen-rich blood to the brain. Carotid Doppler plays a significant role in the detection of blockages or abnormalities.",
            prices: [Price(title: 'CD CAROTID', mrp: 3000, offeredPrice: 2100)],
            secondTitle: 'Carotid Color Doppler Ultrasound Procedure',
            secondDescription:
                "Before the Carotid doppler in Delhi process, the individual lies down on the table and exposes the neck area. The expert applies the gel for enhancing the transmission of sound waves. A transducer gets placed on the neck, right over the carotid arteries. Then, the transducer emits the frequency sound waves which bounces off the blood vessels, which creates detailed images. The Doppler technology makes use of the sound waves that reflect from the movement of the blood cells, and produces images that are colour coded of the blood flow direction. The expert evaluates the arteries for plaque buildup, narrowing (stenosis), and blood clots (emboli).",
            whyToChooseTitle: 'Why to Choose Carotid Color Doppler Ultrasound?',
            whyToChoose: [
              'Real-Time Imaging',
              'Carotid Artery Assessment',
              'Stroke Risk Evaluation',
              'Early Detection'
            ],
            thirdHeading: 'Other Color Doppler Ultrasound',
            faqs: [
              Faq(
                  question:
                      'Individuals suffering from what issues should not go for the Carotid doppler process?',
                  answer:
                      'Although there are no risks involved with the carotid doppler test in Delhi process, all the individuals who go through the issues like hypertension, high cholesterol, diabetes etc should connect with the experts before taking the call.'),
              Faq(
                  question:
                      'For how long does the Carotid doppler process last?',
                  answer:
                      "The doppler test for heart in Delhi process takes about 40-45 mins, but the duration also depends on the individual's complexity."),
              Faq(
                  question:
                      'What are the risks which are associated with Carotid Doppler?',
                  answer:
                      "The carotid doppler ultrasound in Delhi is considered to be a safe process, as there is no exposure to radiation and is performed without any complications.")
            ]);
      case SubScanType.MRI_HEAD_AND_NECK:
        return SubscanModel(
            appBarTitle: 'Head and Neck MRI',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/head_and_neck_mri.png',
            firstHeading: 'What is Head and Neck MRI?',
            firstHeadingDescription:
                "A head, brain and neck MRI scan is known to be an imaging technique which helps in getting detailed images of the head, neck and brain structures. The painless process makes use of radio waves and powerful magnets for creating higher resolution of images, which gives diagnosis of cranial, neurological and neck conditions.",
            prices: [
              Price(title: 'MRI BRAIN', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI BRAIN + MRV', mrp: 11000, offeredPrice: 9000),
              Price(
                  title: 'MRI BRAIN CONTRAST', mrp: 10500, offeredPrice: 7700),
              Price(title: 'MRI BRAIN + ORBIT', mrp: 9000, offeredPrice: 5400),
              Price(title: 'MRI FACE', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI NECK', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI PNS', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI PITUITARY', mrp: 8000, offeredPrice: 4200),
              Price(
                  title: 'MRI BRAIN + CSF FLOW STUDY',
                  mrp: 10000,
                  offeredPrice: 7000),
            ],
            secondTitle: 'Head and Neck MRI Procedure',
            secondDescription:
                "The individual is asked to remove all the metal objects such as accessories and jewelry and then get laid down on the table during the brain mri in Delhi. A divide named head coil gets placed around the head for ensuring high quality images. The experts guide the patient for MRI. Then the MRI machine generates the stronger radiofrequency pulses and magnetic fields which causes the protons of the body to align. When the protons return to the normal state, they end up emitting signals which get detected by the MRI machines. The mri brain scan cost in Delhi is affordable",
            whyToChooseTitle: 'Why to Choose Head and Neck MRI?',
            whyToChoose: [
              'Detailed Brain Imaging',
              'Sinus and Nasal Assessment',
              'Head Trauma Evaluation',
              'Neurological Disorders',
            ],
            thirdHeading: 'Other MRI',
            faqs: [
              Faq(
                  question:
                      'Is the MRI brain scan in Delhi considered to be safe?',
                  answer:
                      'Yes, totally. The head, brain and neck MRI is a non-invasive technique which is painless and does not use radiation.'),
              Faq(
                  question:
                      'Which kind of diseases can be detected by the MRI scans in the body?',
                  answer:
                      'A brain MRI with contrast in Delhi can detect various kinds of neurological conditions such as cranial nerve disorders, vascular abnormalities etc.'),
              Faq(
                  question:
                      'What are the side effects which are associated with MRI scans?',
                  answer:
                      'There are no side effects which are associated with the mri scan in Delhi, but individuals with cochlear implants or pacemakers could be at risk and should take advice from the professionals.')
            ]);
      case SubScanType.MRI_SPINE_AND_JOINT:
        return SubscanModel(
            appBarTitle: 'Spine and Joint MRI',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/spine_and_joint_mri.png',
            firstHeading: 'What is Spine and Joint MRI?',
            firstHeadingDescription:
                "The shoulder MRI in Delhi is known to be an imaging procedure which provides the detailed view of the joints in the body. It is known to be a painless process which makes use of radio waves and powerful magnets for letting higher resolution images to get produced and provide insights of musculoskeletal systems.",
            prices: [
              Price(title: 'MRI PER JOINT', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI WHOLE SPINE', mrp: 16000, offeredPrice: 9600),
              Price(
                  title: 'MRI CERVICAL SPINE/ DORSAL/ L.S SPINE',
                  mrp: 7000,
                  offeredPrice: 4200),
              Price(
                  title: 'MRI SCREENING WHOLE SPINE',
                  mrp: 7000,
                  offeredPrice: 4200),
              Price(
                  title: 'MRI SCREENING WHOLE SPINE (CONTRAST)',
                  mrp: 10000,
                  offeredPrice: 7000),
              Price(
                  title: 'MRI WHOLE SPINE (CONTRAST)',
                  mrp: 10000,
                  offeredPrice: 7700),
              Price(
                  title: 'MRI CERVICAL SPINE/ DORSAL/ L.S SPINE (CONTRAST)',
                  mrp: 10000,
                  offeredPrice: 7000),
              Price(
                  title: 'MRI SPINE (Flexionl Extension) EACH STUDY',
                  mrp: 8000,
                  offeredPrice: 4800),
            ],
            secondTitle: 'Spine and Joint MRI Procedure',
            secondDescription:
                "The patient before taking the joint and spine MRI is advised to wear loose and comfortable clothes and get rid of all the metal objects which could hamper the magnetic field of the MRI. After that the patient is laid on the padded table on the position depending on the area which is supposed to be scanned such as on the stomach, back or side. Then specialized coils get positioned around the joint or spine area for examination. The coils help with enhancing the higher quality images. The MRI cervical spine cost in Delhi is very affordable. Then the individual is guided towards the MRI suite by the experts to ensure they are super comfortable with the scan. The MRI machine is known for generating a very powerful magnetic field and pulses which cause hydrogen atoms in the tissues of the body for emitting signals. The signals are captured via the MRI machine and transformed into very detailed images. These signals get processed by the computer for creating the cross sectional images of the joint and spine structures, which provide deep insights about the ligaments, cartilages, bones or soft tissues.",
            whyToChooseTitle: 'Why to Choose Spine and Joint MRI?',
            whyToChoose: [
              'Diagnosis of Spinal Conditions',
              'Soft Tissue Assessment',
              'Detailed Imaging',
              'Chronic Pain Management'
            ],
            thirdHeading: 'Other MRI',
            faqs: [
              Faq(
                  question:
                      'What are the different types of conditions which are detected via MRI cervical spine in Delhi?',
                  answer:
                      'The MRI knee in Delhi scan can easily detect multiple musculoskeletal conditions such as spinal stenosis, ligament tears, joint inflammation etc.'),
              Faq(
                  question: 'Is the MRI scan considered to be noisy?',
                  answer:
                      'Yes, the MRI scan is considered to be noisy as the machine produces the knocking loud and buzzing sound during the scan process.'),
              Faq(
                  question:
                      'Are pregnant women allowed to undergo the joint and spine MRI scan?',
                  answer:
                      'Yes, generally pregnant women can undergo the joint and spine MRI can, but it is always a good idea to consult with the expert before going through the MRI scans. Also the MRI scan cost in Delhi is not very expensive.'),
            ]);
      case SubScanType.MRI_ABDOMEN_AND_PELVIS:
        return SubscanModel(
            appBarTitle: 'Abdominal and Pelvis MRI',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/abdominal_and_pelvis_mri.png',
            firstHeading: 'What is Abdominal and Pelvis MRI?',
            firstHeadingDescription:
                'The pelvis and abdominal MRI scan is considered to be the latest imaging technique which is used for examining the pelvic and abdominal regions. The technique offers detailed images of the organs such as blood vessels and the structurals around it.',
            prices: [
              Price(title: 'MRI UPPER ABDOMEN', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI LOWER ABDOMEN', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI WHOLE ABDOMEN', mrp: 14000, offeredPrice: 8400),
              Price(title: 'MRI PERINEUM', mrp: 7000, offeredPrice: 4200),
              Price(title: 'MRI UROGRAPHY', mrp: 8000, offeredPrice: 4800),
              Price(
                  title: 'MRI PENIS / SCROTUM', mrp: 8000, offeredPrice: 4800),
              Price(
                  title: 'MRI UROGRAPHY (CONTRAST)',
                  mrp: 12000,
                  offeredPrice: 8300),
              Price(
                  title: 'MRI WHOLE ABDOMEN (CONTRAST)',
                  mrp: 11900,
                  offeredPrice: 16000),
              Price(
                  title: 'MRI PERINEUM (CONTRAST)',
                  mrp: 10000,
                  offeredPrice: 7700),
            ],
            secondTitle: 'Abdominal and Pelvis MRI Procedure',
            secondDescription:
                'Right from the mri abdomen in Delhi, the patients are asked to lose clothes and also wear no metal accessories. Moreover, the individual is asked to fasten for a few hours to get cleared images of the abdominal organs. The patient is laid on the moveable table which is moved into the MRI machine and the position is adequate to capture the images of the specific area. Around the abdomen, there are specialized coils, which get positioned across the pelvis and abdomen for enhancing the quality of the image during the scan. The MRI machine is known for generating very powerful radiofrequency pulses and magnetic fields which causes the hydrogen atoms in the tissues to emit signals. These images then get captured by the MRI machine and are then processed into images. These signals are then converted into cross-sectional images of pelvis and abdomen which provides an overview of the organs such as pancreas, gallbladder, uterus, kidneys etc. Hence, it is important to find the right MRI scan near me in Delhi.',
            whyToChooseTitle: 'Why to Choose Abdominal and Pelvis MRI?',
            whyToChoose: [
              'Early disease detection',
              'Detailed Abdominal Assessment',
              'Gynecological Health',
              'Cancer Diagnosis and Staging'
            ],
            thirdHeading: 'Other MRI',
            faqs: [
              Faq(
                  question:
                      'What are the kinds of conditions which are detected in the pelvis and abdomen by MRI scan?',
                  answer:
                      'The pelvic and MRI scans can easily evaluate and detect conditions such as cysts, inflammatory diseases, abnormalities, organ enlargements etc.'),
              Faq(
                  question: 'Are MRI scans considered to be uncomfortable?',
                  answer:
                      'Scan pelvis in Delhi is not uncomfortable but it is indeed a painless process. But inside the MRI machine, sometimes individuals can feel claustrophobic.'),
              Faq(
                  question:
                      'Are there any restrictions on the age for MRI scans?',
                  answer:
                      'No, as such MRI pelvis in Delhi is very age friendly and can be undertaken by people of all age groups. Also the MRI pelvis cost in Delhi is super affordable.')
            ]);
      case SubScanType.MRI_FULL_BODY_MRI:
        return SubscanModel(
            appBarTitle: 'Full Body MRI',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/full_body_mri.png',
            firstHeading: 'What is Full Body MRI?',
            firstHeadingDescription:
                'Full body MRI (Magnetic Resonance Imaging) scan is considered to be an advanced technique for imaging which provides a view on the internal structures of the body in detail. The full body MRI helps with the early detection of multiple medical conditions. When it comes to full body MRI scan price in Delhi, it is very affordable.',
            prices: [
              Price(title: 'MRI WHOLE BODY', mrp: 18000, offeredPrice: 10800)
            ],
            secondTitle: 'Full Body MRI Procedure',
            secondDescription:
                'The full body MRI scan is performed using a cylindrical and a large machine which uses a very powerful magnet. The patient is required to lie on the table which then slides towards the MRI machine. During the process of the scan, the machine is known for generating strong radio waves and magnetic fields which create cross-sectional images of the internal organs of the body. The MRI scan price full body in Delhi at our labs is not expensive at all.',
            whyToChooseTitle: 'Why to Choose Full Body MRI?',
            whyToChoose: [
              'Early disease detection',
              'Cancer screening',
              'Multi-organ evaluation',
              'Neurological Evaluation'
            ],
            thirdHeading: 'Other MRI',
            faqs: [
              Faq(
                  question:
                      'Why do experts recommend the full body MRI scan and what is full body MRI scan cost in Delhi?',
                  answer:
                      'A full body MRI scan is recommended by the expert when there is a need for imaging the body parts. The images are used for thorough evaluation in cases of severe issues like cancer which can assess the overall organ.'),
              Faq(
                  question:
                      'Is the procedure of MRI scan considered to be safe?',
                  answer:
                      'Yes, the full body MRI scan is considered safe as there is no involvement of radiation which is used in CT scans or X-Rays.'),
              Faq(
                  question:
                      'What are the preparations required for the full body MRI scan?',
                  answer:
                      ' Just prior to the full body scan, individuals are asked to remove all the metal objects, as it hampers the quality of the image. In terms of knowing about the MRI scan price in Delhi, it is a good idea to consult with an expert.')
            ]);
      case SubScanType.ECHO_TEST:
        return SubscanModel(
            appBarTitle: 'ECHO Test',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/echo_test.png',
            firstHeading: 'What is ECHO Test?',
            firstHeadingDescription:
                'Echo test in Delhi is also commonly known as echocardiogram, and is a diagnostic process for assessing the overall structure of the heart. This is a procedure which is ultrasound based, and helps experts visualize the blood flow patterns, hearts chambers, valves etc which help with diagnosis of the heart conditions.',
            prices: [
              Price(title: 'FETAL ECHO', mrp: 5000, offeredPrice: 4000),
              Price(title: '2D ECHO', mrp: 2500, offeredPrice: 2000),
              Price(title: 'STRESS ECHO', mrp: 5000, offeredPrice: 3500),
              Price(
                  title: 'TMT (TREADMILL TEST)', mrp: 2500, offeredPrice: 2000),
            ],
            secondTitle: 'ECHO Test Procedure',
            secondDescription:
                'Right before the echo cardiogram in Delhi, the individual is asked to lie down on the table, and then ECG leads get placed on the chest for recording the electrical activity of the heart during the test. A device named transducer is applied to the chest and is moved across various areas for capturing the heart images. The transducer is used for emitting the higher frequency waves that bounce off the heart structures and then return as echoes. The echoes get converted in the images, which displayed the heart size movement and shape. Via the test, the ultrasound helps in assessing the blood flow of the heart valves which helps in detecting the abnormalities. In terms of echo test price in Delhi, it is very affordable.',
            whyToChooseTitle: 'Why to Choose ECHO Test?',
            whyToChoose: [
              'Cardiac Evaluation',
              'Valve Assessment',
              'Assessment of Heart Function',
              'Diagnosis of Heart Conditions'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question:
                      'Is there any discomfort included in the 2d echo test in Delhi?',
                  answer:
                      'The echo test is non-invasive and painless as it is totally needless.'),
              Faq(
                  question:
                      'Who are the individuals who can undergo the echo test for heart in Delhi?',
                  answer:
                      'The individuals with symptoms such as palpitations, chest pain, breath shortness, heart disease issues should consult the expert before undergoing the test.'),
              Faq(
                  question:
                      'Can echo tests help with diagnosis of heart valve issues?',
                  answer:
                      'Yes, echo test is known to be an excellent diagnosis of heart valve issues such as stenosis, regurgitation or valve abnormalities which provide crucial insights for the planning of treatment.')
            ]);
      case SubScanType.EEG_TEST:
        return SubscanModel(
            appBarTitle: 'EEG Test',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/eeg_test.png',
            firstHeading: 'What is EEG Test?',
            firstHeadingDescription:
                'EEG (Electroencephalogram) test is known to be a diagnostic procedure which properly records the electrical activity of the brain. It is known to be a super valuable tool which is currently used by the neurologists for assisting with brain functions, diagnosis of multiple neurological conditions and detecting abnormalities. The eeg test in Delhi is useful for diagnosing sleep disorders, epilepsy, and other issues related to the brain-related.',
            prices: [
              Price(title: 'EEG DIGITAL', mrp: 1500, offeredPrice: 1200),
              Price(title: 'STMV (1 HOUR)', mrp: 4000, offeredPrice: 3250),
              Price(title: 'STMV EEG', mrp: 2000, offeredPrice: 1700),
              Price(title: 'SLEEP DEPRIVED EEG', mrp: 2000, offeredPrice: 1700),
              Price(
                  title: 'EEG DIGITAL(2 HRS RECORD)VIDEO',
                  mrp: 5000,
                  offeredPrice: 4250),
              Price(
                  title: 'EEG DIGITAL(1/2 HR.RECORD)',
                  mrp: 2000,
                  offeredPrice: 1700),
              Price(
                  title: 'EEG DIGITAL (1 HRS RECORD)',
                  mrp: 3000,
                  offeredPrice: 2550),
              Price(
                  title: 'EEG DIGITAL (45 MINS RECORD)',
                  mrp: 3000,
                  offeredPrice: 2500),
              Price(
                  title: 'SLEEP DEPRIVED EEG(STMV)',
                  mrp: 9000,
                  offeredPrice: 6750),
              Price(
                  title: 'SLEEP DEPRIVED(30 MINUTES)',
                  mrp: 5000,
                  offeredPrice: 3500),
            ],
            secondTitle: 'EEG Test Procedure',
            secondDescription:
                'The process for EEG test near me in Delhi is fairly simple. First electrodes get placed right on the scalp by using conductive gels. Then the electrodes get detected and start recording the electrical signals which are produced by the neurons in the brain. The patient is then asked to properly relax and this can be subjected to stimuli during the process of test for provoking responses specific to the brain. The brain waves which get recorded are analyzed by the experts for interpreting the activity patterns and identification of abnormalities. The EEG test price in Delhi is affordable.',
            whyToChooseTitle: 'Why to Choose EEG Test?',
            whyToChoose: [
              'Effective evaluation for weight loss',
              'Diagnostic accuracy',
              'Minimally invasive',
              'Endoscopic technique'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question: 'What is EEG’s test purpose?',
                  answer:
                      'The main purpose for EEG procedure in Delhi is for assessing brain functioning and also detects the irregularity presence in the brain electrical activity. The test helps with diagnosis of seizures, epilepsy, sleep disorders and various other neurological conditions.'),
              Faq(
                  question: 'Is the EEG test considered to be painful?',
                  answer:
                      'The EEG in Delhi is considered to be totally painless. The electrodes get placed on the surface of the scalp, and there is no discomfort or penetration in the procedure. It is considered very safe for all age groups including children and elderly people.'),
              Faq(
                  question:
                      'What is the duration of the EEG test, and when can individuals get the result?',
                  answer:
                      'The duration of the EEG test generally ranges from 30 minutes to an hour. The timeline does vary depending on the niche protocols followed by various testing facilities.')
            ]);
      case SubScanType.DEXA_TEST:
        return SubscanModel(
            appBarTitle: 'Dexa Scan',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/dexa_test.png',
            firstHeading: 'What is Dexa Scan?',
            firstHeadingDescription:
                'Dexa scan is also commonly known as bone density test or BMD Test is known to be a painless process which is used for measuring the bone density. The scan plays a massive role in terms of diagnosis and of critical conditions such as osteoporosis, which is known to be a condition that weakens the bones and makes it fracture prone.',
            prices: [
              Price(title: 'DEXA SINGLE SITE', mrp: 2200, offeredPrice: 2000),
              Price(title: 'DEXA DOUBLE SITE', mrp: 3000, offeredPrice: 2700),
              Price(title: 'DEXA THREE SITES', mrp: 4000, offeredPrice: 3800),
              Price(title: 'DEXA FOUR SITE', mrp: 5000, offeredPrice: 4500),
              Price(
                  title: 'DEXA SINGLE SITE (PAEDIATRIC PROTOCOL',
                  mrp: 2200,
                  offeredPrice: 2000),
              Price(title: 'DEXA WHOLE BODY', mrp: 5500, offeredPrice: 5400),
            ],
            secondTitle: 'Dexa Scan Procedure',
            secondDescription:
                'The process of Dexa scan is very simple and generally takes about 20-30 minutes to complete. The patient is supposed to lie on the padded table, then there is a low-dose X-ray beam which gets passed across the body, focussing on hips and spine, that are known to be common sites for measuring bone density. The machine then captures the images in detail and also calculates the bone density basis on the X-rays absorbed by the bones. The results get expressed in the T-scores which compare bone density to the overall average bone density for healthy and young individuals.',
            whyToChooseTitle: 'Why to Choose Dexa Scan?',
            whyToChoose: [
              'Accurate body composition analysis',
              'Minimum radiation exposure',
              'Better bone density measurement',
              'Early detection of osteoporosis'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question: 'Why is Dexa scan for bone health important?',
                  answer:
                      'The dexa scan is known to be essential as it helps in assessing the overall bone health and also diagnosis conditions such as osteoporosis. Each and every detection of any low bone density allows timely treatment of the problem and at the same time minimizes the risks which are associated with fractures.'),
              Faq(
                  question: 'Is Dexa scan painless and safe?',
                  answer:
                      'Yes, dexa scan is considered to be super safe, as it makes use of the low X-ray doses, which minimizes the radiation exposures. It is known to be a very painless process and requires no needles.'),
              Faq(
                  question: 'Is it easy to find a dexa scan near me in Delhi?',
                  answer:
                      'Yes, finding a dexa scan near me in Delhi is very easy. It is essential to consult the expert before taking any steps further.')
            ]);
      case SubScanType.PFT_TEST:
        return SubscanModel(
            appBarTitle: 'PFT Test',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/pft_test.png',
            firstHeading: 'What is PFT Test?',
            firstHeadingDescription:
                'PFT (Pulmonary Function Tests in Delhi) is known to be a crucial diagnostic tool which is carried out for assessing the lung functions and helps with diagnosing varied respiratory conditions. PFT tests are very important in evaluating the overall lung health and offering the right treatment with individuals suffering from respiratory issues.',
            prices: [
              Price(
                  title: 'PFT(SPIROMETRY) WITH BRONCHODILATOR STUDY',
                  mrp: 2500,
                  offeredPrice: 2000),
              Price(
                  title: 'ROUTINE PFT (SPIROMETRY)',
                  mrp: 2000,
                  offeredPrice: 1700),
            ],
            secondTitle: 'PFT Test Procedure',
            secondDescription:
                'PFT test in Delhi is a painless test which includes a few steps:\n1. Spirometry: This is known to be a common PFT, which measures the capacity of the lung. The patient is required to take a deep breath and then blow the air forcefully into the spirometer, which gives recording of flow of air and volume.\n2. Lung Volume Measurement: The pulmonary function test in Delhi, assists the results of lung capacity and the amount of air which stays after normal exhalation. The test helps in diagnosing conditions such as restrictive lung diseases and chronic obstructive pulmonary disease (COPD).\n3. Diffusion Capacity Test: The PFT test near me in Delhi evaluates how effectively lungs transfer the gasses such as CO2 and O2 between blood and air sacs. When it comes to knowing the pft test price in delhi, you can speak to QRIS Health experts.',
            whyToChooseTitle: 'Why to Choose PFT Test?',
            whyToChoose: [
              'Diagnosis of Respiratory Conditions',
              'Lung Function Assessment',
              'Monitoring of disease',
              'Surgical assessment of risk'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question:
                      'What is known to be the duration of the PFT in Delhi?',
                  answer:
                      'The PFT duration does depend on various factors. Overall on average, the test takes 30 minutes to complete.'),
              Faq(
                  question: 'What does the PFT test indicate?',
                  answer:
                      'The results of the PFT test can provide crucial information about respiratory or lung functions. Some abnormal results which indicate conditions such as chronic bronchitis, lung disease, asthma or lung functions etc.'),
              Faq(
                  question: 'Is PFT considered to be painful?',
                  answer:
                      'PFT is a non-invasive test and is also painless. The process of the test is supposed to be very easy and comfortable, which includes no needles.'),
            ]);
      case SubScanType.ECG_TEST:
        return SubscanModel(
            appBarTitle: 'ECG Test',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/ecg_test.png',
            firstHeading: 'What is ECG Test?',
            firstHeadingDescription:
                'ECG (Electrocardiogram) or EKG is known to be a painless diagnostic test which evaluates the heart’s electrical activity. It is known to be a very popular tool for assisting the health of the heart and diagnosing various cardiac conditions.',
            prices: [
              Price(title: 'ECG', mrp: 500, offeredPrice: 300),
              Price(title: 'ECG (At Home)', mrp: 800, offeredPrice: 600),
            ],
            secondTitle: 'ECG Test Procedure',
            secondDescription:
                'The ECG test in Delhi is carried out by the expert cardiologists. The process of normal ECG in Delhi is very simple. The individual is supposed to lie down on the table. First the area of legs, arm, chest is cleaned to ensure correct placement of electrodes. Then sticky and small electrodes get attached to the points on arms, legs and chest. The electrodes get connected to the ECG machine and record the electrical signals of the heart. Then the ECG machine records the electrical activity for a few minutes and seconds. The ECG test near me in Delhi is very easy to find and the ECG test price in Delhi is also affordable.',
            whyToChooseTitle: 'Why to Choose ECG Test?',
            whyToChoose: [
              'Early detection',
              'Monitoring Chronic Conditions',
              'Diagnosis of Heart Conditions',
              'Cardiac Health Assessment'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question: 'What is ECG full form?',
                  answer:
                      'ECG stands for Electrocardiogram. It is known to be a diagnostic test which records all the electrical activity of the heart for evaluating the function and detects the cardiac abnormalities.'),
              Faq(
                  question: 'Is the ECG test considered to be very painful?',
                  answer:
                      'No, the ECG test is not painful at all, rather it is a painless process and requires no needles. The process is very safe for individuals of all kinds of age groups, and has minimal or no side effects at all.'),
              Faq(
                  question: 'What does the general ECG report indicate?',
                  answer:
                      'The normal ECG report, indicates the regular heart rhythm. This shows that electrical signals which get transmitted properly and there are no abnormalities in the heart conditions.')
            ]);
      case SubScanType.HOLTER_TEST:
        return SubscanModel(
            appBarTitle: 'Holter Test',
            imagePath:
                'assets/images/illustrations/subscan_illustrations/holter_test.png',
            firstHeading: 'What is Holter Test?',
            firstHeadingDescription:
                'The Holter test is also commonly known as ambulatory electrocardiography which involves constant monitoring of electrical activity of the heart over a period of 24 to 48 hours. The test makes use of a portable device known as Holter monitor in Delhi that records the heart electrical signal as the patient through the daily activities.',
            prices: [
              Price(title: 'HOLTER(24 HRS)', mrp: 3000, offeredPrice: 2550),
              Price(title: 'HOLTER(48 HRS)', mrp: 6000, offeredPrice: 5000),
            ],
            secondTitle: 'Holter Test Procedure',
            secondDescription:
                "The expert places an adhesive and small electrodes on the locations of the chest. The electrodes get connected to the Holter monitor which is a compact device which can be worn on the belt or gets attached to the strap around the neck. When the electrodes get attached, the holter monitor test in Delhi gets activated to begin recording the electrical activity of the heart. The patient is required to wear the Holter monitor usually for 24 or 48 hours. During the time, the device records the heart's signal, which provides a comprehensive overview of the heart activity across day and night. Once the monitoring period gets complete, the patient returns to the healthcare facilities for removing the holter monitor. The data which is recorded gets analyzed data by the cardiologist for identifying the abnormalities",
            whyToChooseTitle: 'Why to Choose Holter Test?',
            whyToChoose: [
              'Arrhythmia Detection',
              'Risk Assessment',
              'Post-Event Analysis',
              'Continuous monitoring'
            ],
            thirdHeading: 'Other Radiology Tests',
            faqs: [
              Faq(
                  question:
                      'Can Holter test in Delhi be suitable for all kinds of age?',
                  answer:
                      'Yes, the holtest test is considered suitable for all kinds of age groups such as elderly and children. The painless process can be performed safely on patients with various heart conditions. The holter test cost in Delhi is also very affordable.'),
              Faq(
                  question:
                      'How should the individual prepare for holter test?',
                  answer:
                      'The individual is not required to do any preparation before the holter test. However, the individual is required to wear loose fitting clothes to allow easy placement of electrodes placed on the chest.'),
              Faq(
                  question:
                      'Can an individual take a shower when wearing the holter monitor?',
                  answer:
                      'The holter monitors are known to be water-resistant, hence it is possible to wear the holter monitor when having a shower. But one should note, that it is not possible for submerging the monitor inside the water, to prevent the damage')
            ]);
    }
  }
}
