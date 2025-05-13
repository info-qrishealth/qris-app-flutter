// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_name')
  String? get docName => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_bio')
  String? get shortBio => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_speciality')
  String? get docSpeciality => throw _privateConstructorUsedError;
  @JsonKey(name: 'pic')
  String? get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_email')
  String? get docEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_experience')
  String? get docExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_phone')
  String? get docPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_dob')
  String? get doctorDob => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_address')
  String? get docAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_states')
  int? get docStates => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_areas')
  int? get docAreas => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review')
  String? get review => throw _privateConstructorUsedError;
  @JsonKey(name: 'fees')
  String? get fees => throw _privateConstructorUsedError;
  @JsonKey(name: 'education')
  String? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'passing_year')
  String? get passingYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'trusted')
  String? get trusted => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  String? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_title')
  String? get metaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_key')
  String? get metaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_desc')
  String? get metaDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'dis_order')
  int? get disOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_on')
  String? get uploadedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'mob_verified')
  String? get mobVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  String? get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'otp')
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'educations')
  List<DoctorEducation> get educations => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'doc_name') String? docName,
      @JsonKey(name: 'short_bio') String? shortBio,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'doc_speciality') String? docSpeciality,
      @JsonKey(name: 'pic') String? pic,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'doc_email') String? docEmail,
      @JsonKey(name: 'doc_experience') String? docExperience,
      @JsonKey(name: 'doc_phone') String? docPhone,
      @JsonKey(name: 'doctor_dob') String? doctorDob,
      @JsonKey(name: 'doc_address') String? docAddress,
      @JsonKey(name: 'doc_states') int? docStates,
      @JsonKey(name: 'doc_areas') int? docAreas,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'rating') String? rating,
      @JsonKey(name: 'review') String? review,
      @JsonKey(name: 'fees') String? fees,
      @JsonKey(name: 'education') String? education,
      @JsonKey(name: 'passing_year') String? passingYear,
      @JsonKey(name: 'trusted') String? trusted,
      @JsonKey(name: 'verified') String? verified,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'meta_title') String? metaTitle,
      @JsonKey(name: 'meta_key') String? metaKey,
      @JsonKey(name: 'meta_desc') String? metaDesc,
      @JsonKey(name: 'dis_order') int? disOrder,
      @JsonKey(name: 'uploaded_on') String? uploadedOn,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'mob_verified') String? mobVerified,
      @JsonKey(name: 'email_verified') String? emailVerified,
      @JsonKey(name: 'otp') String? otp,
      @JsonKey(name: 'educations') List<DoctorEducation> educations});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docName = freezed,
    Object? shortBio = freezed,
    Object? description = freezed,
    Object? docSpeciality = freezed,
    Object? pic = freezed,
    Object? category = freezed,
    Object? docEmail = freezed,
    Object? docExperience = freezed,
    Object? docPhone = freezed,
    Object? doctorDob = freezed,
    Object? docAddress = freezed,
    Object? docStates = freezed,
    Object? docAreas = freezed,
    Object? gender = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? fees = freezed,
    Object? education = freezed,
    Object? passingYear = freezed,
    Object? trusted = freezed,
    Object? verified = freezed,
    Object? slug = freezed,
    Object? metaTitle = freezed,
    Object? metaKey = freezed,
    Object? metaDesc = freezed,
    Object? disOrder = freezed,
    Object? uploadedOn = freezed,
    Object? status = freezed,
    Object? mobVerified = freezed,
    Object? emailVerified = freezed,
    Object? otp = freezed,
    Object? educations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortBio: freezed == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      docSpeciality: freezed == docSpeciality
          ? _value.docSpeciality
          : docSpeciality // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      docEmail: freezed == docEmail
          ? _value.docEmail
          : docEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      docExperience: freezed == docExperience
          ? _value.docExperience
          : docExperience // ignore: cast_nullable_to_non_nullable
              as String?,
      docPhone: freezed == docPhone
          ? _value.docPhone
          : docPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorDob: freezed == doctorDob
          ? _value.doctorDob
          : doctorDob // ignore: cast_nullable_to_non_nullable
              as String?,
      docAddress: freezed == docAddress
          ? _value.docAddress
          : docAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      docStates: freezed == docStates
          ? _value.docStates
          : docStates // ignore: cast_nullable_to_non_nullable
              as int?,
      docAreas: freezed == docAreas
          ? _value.docAreas
          : docAreas // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      passingYear: freezed == passingYear
          ? _value.passingYear
          : passingYear // ignore: cast_nullable_to_non_nullable
              as String?,
      trusted: freezed == trusted
          ? _value.trusted
          : trusted // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDesc: freezed == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadedOn: freezed == uploadedOn
          ? _value.uploadedOn
          : uploadedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mobVerified: freezed == mobVerified
          ? _value.mobVerified
          : mobVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      educations: null == educations
          ? _value.educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<DoctorEducation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
          _$DoctorImpl value, $Res Function(_$DoctorImpl) then) =
      __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'doc_name') String? docName,
      @JsonKey(name: 'short_bio') String? shortBio,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'doc_speciality') String? docSpeciality,
      @JsonKey(name: 'pic') String? pic,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'doc_email') String? docEmail,
      @JsonKey(name: 'doc_experience') String? docExperience,
      @JsonKey(name: 'doc_phone') String? docPhone,
      @JsonKey(name: 'doctor_dob') String? doctorDob,
      @JsonKey(name: 'doc_address') String? docAddress,
      @JsonKey(name: 'doc_states') int? docStates,
      @JsonKey(name: 'doc_areas') int? docAreas,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'rating') String? rating,
      @JsonKey(name: 'review') String? review,
      @JsonKey(name: 'fees') String? fees,
      @JsonKey(name: 'education') String? education,
      @JsonKey(name: 'passing_year') String? passingYear,
      @JsonKey(name: 'trusted') String? trusted,
      @JsonKey(name: 'verified') String? verified,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'meta_title') String? metaTitle,
      @JsonKey(name: 'meta_key') String? metaKey,
      @JsonKey(name: 'meta_desc') String? metaDesc,
      @JsonKey(name: 'dis_order') int? disOrder,
      @JsonKey(name: 'uploaded_on') String? uploadedOn,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'mob_verified') String? mobVerified,
      @JsonKey(name: 'email_verified') String? emailVerified,
      @JsonKey(name: 'otp') String? otp,
      @JsonKey(name: 'educations') List<DoctorEducation> educations});
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
      _$DoctorImpl _value, $Res Function(_$DoctorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? docName = freezed,
    Object? shortBio = freezed,
    Object? description = freezed,
    Object? docSpeciality = freezed,
    Object? pic = freezed,
    Object? category = freezed,
    Object? docEmail = freezed,
    Object? docExperience = freezed,
    Object? docPhone = freezed,
    Object? doctorDob = freezed,
    Object? docAddress = freezed,
    Object? docStates = freezed,
    Object? docAreas = freezed,
    Object? gender = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? fees = freezed,
    Object? education = freezed,
    Object? passingYear = freezed,
    Object? trusted = freezed,
    Object? verified = freezed,
    Object? slug = freezed,
    Object? metaTitle = freezed,
    Object? metaKey = freezed,
    Object? metaDesc = freezed,
    Object? disOrder = freezed,
    Object? uploadedOn = freezed,
    Object? status = freezed,
    Object? mobVerified = freezed,
    Object? emailVerified = freezed,
    Object? otp = freezed,
    Object? educations = null,
  }) {
    return _then(_$DoctorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortBio: freezed == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      docSpeciality: freezed == docSpeciality
          ? _value.docSpeciality
          : docSpeciality // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      docEmail: freezed == docEmail
          ? _value.docEmail
          : docEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      docExperience: freezed == docExperience
          ? _value.docExperience
          : docExperience // ignore: cast_nullable_to_non_nullable
              as String?,
      docPhone: freezed == docPhone
          ? _value.docPhone
          : docPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorDob: freezed == doctorDob
          ? _value.doctorDob
          : doctorDob // ignore: cast_nullable_to_non_nullable
              as String?,
      docAddress: freezed == docAddress
          ? _value.docAddress
          : docAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      docStates: freezed == docStates
          ? _value.docStates
          : docStates // ignore: cast_nullable_to_non_nullable
              as int?,
      docAreas: freezed == docAreas
          ? _value.docAreas
          : docAreas // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      passingYear: freezed == passingYear
          ? _value.passingYear
          : passingYear // ignore: cast_nullable_to_non_nullable
              as String?,
      trusted: freezed == trusted
          ? _value.trusted
          : trusted // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKey: freezed == metaKey
          ? _value.metaKey
          : metaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDesc: freezed == metaDesc
          ? _value.metaDesc
          : metaDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      disOrder: freezed == disOrder
          ? _value.disOrder
          : disOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      uploadedOn: freezed == uploadedOn
          ? _value.uploadedOn
          : uploadedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mobVerified: freezed == mobVerified
          ? _value.mobVerified
          : mobVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      educations: null == educations
          ? _value._educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<DoctorEducation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorImpl implements _Doctor {
  const _$DoctorImpl(
      {required this.id,
      @JsonKey(name: 'doc_name') this.docName,
      @JsonKey(name: 'short_bio') this.shortBio,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'doc_speciality') this.docSpeciality,
      @JsonKey(name: 'pic') this.pic,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'doc_email') this.docEmail,
      @JsonKey(name: 'doc_experience') this.docExperience,
      @JsonKey(name: 'doc_phone') this.docPhone,
      @JsonKey(name: 'doctor_dob') this.doctorDob,
      @JsonKey(name: 'doc_address') this.docAddress,
      @JsonKey(name: 'doc_states') this.docStates,
      @JsonKey(name: 'doc_areas') this.docAreas,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'rating') this.rating,
      @JsonKey(name: 'review') this.review,
      @JsonKey(name: 'fees') this.fees,
      @JsonKey(name: 'education') this.education,
      @JsonKey(name: 'passing_year') this.passingYear,
      @JsonKey(name: 'trusted') this.trusted,
      @JsonKey(name: 'verified') this.verified,
      @JsonKey(name: 'slug') this.slug,
      @JsonKey(name: 'meta_title') this.metaTitle,
      @JsonKey(name: 'meta_key') this.metaKey,
      @JsonKey(name: 'meta_desc') this.metaDesc,
      @JsonKey(name: 'dis_order') this.disOrder,
      @JsonKey(name: 'uploaded_on') this.uploadedOn,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'mob_verified') this.mobVerified,
      @JsonKey(name: 'email_verified') this.emailVerified,
      @JsonKey(name: 'otp') this.otp,
      @JsonKey(name: 'educations')
      final List<DoctorEducation> educations = const []})
      : _educations = educations;

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'doc_name')
  final String? docName;
  @override
  @JsonKey(name: 'short_bio')
  final String? shortBio;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'doc_speciality')
  final String? docSpeciality;
  @override
  @JsonKey(name: 'pic')
  final String? pic;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'doc_email')
  final String? docEmail;
  @override
  @JsonKey(name: 'doc_experience')
  final String? docExperience;
  @override
  @JsonKey(name: 'doc_phone')
  final String? docPhone;
  @override
  @JsonKey(name: 'doctor_dob')
  final String? doctorDob;
  @override
  @JsonKey(name: 'doc_address')
  final String? docAddress;
  @override
  @JsonKey(name: 'doc_states')
  final int? docStates;
  @override
  @JsonKey(name: 'doc_areas')
  final int? docAreas;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'rating')
  final String? rating;
  @override
  @JsonKey(name: 'review')
  final String? review;
  @override
  @JsonKey(name: 'fees')
  final String? fees;
  @override
  @JsonKey(name: 'education')
  final String? education;
  @override
  @JsonKey(name: 'passing_year')
  final String? passingYear;
  @override
  @JsonKey(name: 'trusted')
  final String? trusted;
  @override
  @JsonKey(name: 'verified')
  final String? verified;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'meta_title')
  final String? metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  final String? metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  final String? metaDesc;
  @override
  @JsonKey(name: 'dis_order')
  final int? disOrder;
  @override
  @JsonKey(name: 'uploaded_on')
  final String? uploadedOn;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'mob_verified')
  final String? mobVerified;
  @override
  @JsonKey(name: 'email_verified')
  final String? emailVerified;
  @override
  @JsonKey(name: 'otp')
  final String? otp;
  final List<DoctorEducation> _educations;
  @override
  @JsonKey(name: 'educations')
  List<DoctorEducation> get educations {
    if (_educations is EqualUnmodifiableListView) return _educations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_educations);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, docName: $docName, shortBio: $shortBio, description: $description, docSpeciality: $docSpeciality, pic: $pic, category: $category, docEmail: $docEmail, docExperience: $docExperience, docPhone: $docPhone, doctorDob: $doctorDob, docAddress: $docAddress, docStates: $docStates, docAreas: $docAreas, gender: $gender, rating: $rating, review: $review, fees: $fees, education: $education, passingYear: $passingYear, trusted: $trusted, verified: $verified, slug: $slug, metaTitle: $metaTitle, metaKey: $metaKey, metaDesc: $metaDesc, disOrder: $disOrder, uploadedOn: $uploadedOn, status: $status, mobVerified: $mobVerified, emailVerified: $emailVerified, otp: $otp, educations: $educations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.docName, docName) || other.docName == docName) &&
            (identical(other.shortBio, shortBio) ||
                other.shortBio == shortBio) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.docSpeciality, docSpeciality) ||
                other.docSpeciality == docSpeciality) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.docEmail, docEmail) ||
                other.docEmail == docEmail) &&
            (identical(other.docExperience, docExperience) ||
                other.docExperience == docExperience) &&
            (identical(other.docPhone, docPhone) ||
                other.docPhone == docPhone) &&
            (identical(other.doctorDob, doctorDob) ||
                other.doctorDob == doctorDob) &&
            (identical(other.docAddress, docAddress) ||
                other.docAddress == docAddress) &&
            (identical(other.docStates, docStates) ||
                other.docStates == docStates) &&
            (identical(other.docAreas, docAreas) ||
                other.docAreas == docAreas) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.passingYear, passingYear) ||
                other.passingYear == passingYear) &&
            (identical(other.trusted, trusted) || other.trusted == trusted) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaKey, metaKey) || other.metaKey == metaKey) &&
            (identical(other.metaDesc, metaDesc) ||
                other.metaDesc == metaDesc) &&
            (identical(other.disOrder, disOrder) ||
                other.disOrder == disOrder) &&
            (identical(other.uploadedOn, uploadedOn) ||
                other.uploadedOn == uploadedOn) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mobVerified, mobVerified) ||
                other.mobVerified == mobVerified) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            const DeepCollectionEquality()
                .equals(other._educations, _educations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        docName,
        shortBio,
        description,
        docSpeciality,
        pic,
        category,
        docEmail,
        docExperience,
        docPhone,
        doctorDob,
        docAddress,
        docStates,
        docAreas,
        gender,
        rating,
        review,
        fees,
        education,
        passingYear,
        trusted,
        verified,
        slug,
        metaTitle,
        metaKey,
        metaDesc,
        disOrder,
        uploadedOn,
        status,
        mobVerified,
        emailVerified,
        otp,
        const DeepCollectionEquality().hash(_educations)
      ]);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor(
      {required final int id,
      @JsonKey(name: 'doc_name') final String? docName,
      @JsonKey(name: 'short_bio') final String? shortBio,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'doc_speciality') final String? docSpeciality,
      @JsonKey(name: 'pic') final String? pic,
      @JsonKey(name: 'category') final String? category,
      @JsonKey(name: 'doc_email') final String? docEmail,
      @JsonKey(name: 'doc_experience') final String? docExperience,
      @JsonKey(name: 'doc_phone') final String? docPhone,
      @JsonKey(name: 'doctor_dob') final String? doctorDob,
      @JsonKey(name: 'doc_address') final String? docAddress,
      @JsonKey(name: 'doc_states') final int? docStates,
      @JsonKey(name: 'doc_areas') final int? docAreas,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'rating') final String? rating,
      @JsonKey(name: 'review') final String? review,
      @JsonKey(name: 'fees') final String? fees,
      @JsonKey(name: 'education') final String? education,
      @JsonKey(name: 'passing_year') final String? passingYear,
      @JsonKey(name: 'trusted') final String? trusted,
      @JsonKey(name: 'verified') final String? verified,
      @JsonKey(name: 'slug') final String? slug,
      @JsonKey(name: 'meta_title') final String? metaTitle,
      @JsonKey(name: 'meta_key') final String? metaKey,
      @JsonKey(name: 'meta_desc') final String? metaDesc,
      @JsonKey(name: 'dis_order') final int? disOrder,
      @JsonKey(name: 'uploaded_on') final String? uploadedOn,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'mob_verified') final String? mobVerified,
      @JsonKey(name: 'email_verified') final String? emailVerified,
      @JsonKey(name: 'otp') final String? otp,
      @JsonKey(name: 'educations')
      final List<DoctorEducation> educations}) = _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'doc_name')
  String? get docName;
  @override
  @JsonKey(name: 'short_bio')
  String? get shortBio;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'doc_speciality')
  String? get docSpeciality;
  @override
  @JsonKey(name: 'pic')
  String? get pic;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'doc_email')
  String? get docEmail;
  @override
  @JsonKey(name: 'doc_experience')
  String? get docExperience;
  @override
  @JsonKey(name: 'doc_phone')
  String? get docPhone;
  @override
  @JsonKey(name: 'doctor_dob')
  String? get doctorDob;
  @override
  @JsonKey(name: 'doc_address')
  String? get docAddress;
  @override
  @JsonKey(name: 'doc_states')
  int? get docStates;
  @override
  @JsonKey(name: 'doc_areas')
  int? get docAreas;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'rating')
  String? get rating;
  @override
  @JsonKey(name: 'review')
  String? get review;
  @override
  @JsonKey(name: 'fees')
  String? get fees;
  @override
  @JsonKey(name: 'education')
  String? get education;
  @override
  @JsonKey(name: 'passing_year')
  String? get passingYear;
  @override
  @JsonKey(name: 'trusted')
  String? get trusted;
  @override
  @JsonKey(name: 'verified')
  String? get verified;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'meta_title')
  String? get metaTitle;
  @override
  @JsonKey(name: 'meta_key')
  String? get metaKey;
  @override
  @JsonKey(name: 'meta_desc')
  String? get metaDesc;
  @override
  @JsonKey(name: 'dis_order')
  int? get disOrder;
  @override
  @JsonKey(name: 'uploaded_on')
  String? get uploadedOn;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'mob_verified')
  String? get mobVerified;
  @override
  @JsonKey(name: 'email_verified')
  String? get emailVerified;
  @override
  @JsonKey(name: 'otp')
  String? get otp;
  @override
  @JsonKey(name: 'educations')
  List<DoctorEducation> get educations;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
