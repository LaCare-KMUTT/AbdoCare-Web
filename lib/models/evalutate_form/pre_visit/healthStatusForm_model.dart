// ignore_for_file: non_constant_identifier_names

class HealthStatusFormModel {
  bool general_Normal = false;
  bool general_AbnormalWeightLost = false;
  bool general_AbnormalWeightGain = false;
  bool general_Fever = false;
  bool general_Fatigue = false;
  bool general_ChillsSweats = false;
  String general_Other = '-';

  bool heent_Normal = false;
  bool heent_Headache = false;
  bool heent_BlurredVision = false;
  bool heent_Tinnitus = false;
  bool heent_Dizziness = false;
  bool heent_Epistaxis = false;
  String heent_Other = '-';

  bool cv_Normal = false;
  bool cv_ChestPain = false;
  bool cv_Palpitations = false;
  bool cv_Murmur = false;
  bool cv_PNDOrthopnea = false;
  bool cv_LEswelling = false;
  String cv_Other = '-';

  bool pulmonary_Normal = false;
  bool pulmonary_Wheezing = false;
  bool pulmonary_Cough = false;
  bool pulmonary_SOB = false;
  bool pulmonary_Hemoptysis = false;
  bool pulmonary_Sputum = false;
  String pulmonary_Other = '-';

  bool gynuro_Normal = false;
  bool gynuro_Dysuria = false;
  bool gynuro_Frequency = false;
  bool gynuro_Urgency = false;
  bool gynuro_Hematuria = false;
  bool gynuro_PelvicPain = false;
  String gynuro_Other = '-';

  bool neuro_Normal = false;
  bool neuro_Migraine = false;
  bool neuro_Seizure = false;
  bool neuro_TiaStorke = false;
  bool neuro_WeaknessSyncope = false;
  bool neuro_SensoryImpairment = false;
  String neuro_Other = '-';

  bool gi_Normal = false;
  bool gi_GERD = false;
  bool gi_NauseaVomiting = false;
  bool gi_DiarrheaConstipation = false;
  bool gi_BowelHabitChanges = false;
  bool gi_Melena = false;
  String gi_Other = '-';

  bool ms_Normal = false;
  bool ms_JointSwellingPain = false;
  bool ms_LimitationsNeckMobility = false;
  bool ms_GaitDifficulty = false;
  bool ms_Deformity = false;
  bool ms_ProstheticDevices = false;
  String ms_Other = '-';

  bool endocrine_Normal = false;
  bool endocrine_HairLoss = false;
  bool endocrine_ExcessiveSweat = false;
  bool endocrine_ExcessiveThirst = false;
  bool endocrine_HeatIntolerance = false;
  bool endocrine_ColdIntolerance = false;
  String endocrine_Other = '-';

  bool hemeLymph_Normal = false;
  bool hemeLymph_BleedingTendency = false;
  bool hemeLymph_DVTHistory = false;
  bool hemeLymph_EnlargedNodes = false;
  bool hemeLymph_Immunosuppression = false;
  bool hemeLymph_RecentSteroidUse = false;
  String hemeLymph_Other = '-';

  String abnormalDetails = '-';

  Map<String, dynamic> toMap() {
    return {
      'general_Normal': general_Normal,
      'general_AbnormalWeightLost': general_AbnormalWeightLost,
      'general_AbnormalWeightGain': general_AbnormalWeightGain,
      'general_Fever': general_Fever,
      'general_Fatigue': general_Fatigue,
      'general_ChillsSweats': general_ChillsSweats,
      'general_Other': general_Other,
      'heent_Normal': heent_Normal,
      'heent_Headache': heent_Headache,
      'heent_BlurredVision': heent_BlurredVision,
      'heent_Tinnitus': heent_Tinnitus,
      'heent_Dizziness': heent_Dizziness,
      'heent_Epistaxis': heent_Epistaxis,
      'heent_Other': heent_Other,
      'cv_Normal': cv_Normal,
      'cv_ChestPain': cv_ChestPain,
      'cv_Palpitations': cv_Palpitations,
      'cv_Murmur': cv_Murmur,
      'cv_PNDOrthopnea': cv_PNDOrthopnea,
      'cv_LEswelling': cv_LEswelling,
      'cv_Other': cv_Other,
      'pulmonary_Normal': pulmonary_Normal,
      'pulmonary_Wheezing': pulmonary_Wheezing,
      'pulmonary_Cough': pulmonary_Cough,
      'pulmonary_SOB': pulmonary_SOB,
      'pulmonary_Hemoptysis': pulmonary_Hemoptysis,
      'pulmonary_Sputum': pulmonary_Sputum,
      'pulmonary_Other': pulmonary_Other,
      'gynuro_Normal': gynuro_Normal,
      'gynuro_Dysuria': gynuro_Dysuria,
      'gynuro_Frequency': gynuro_Frequency,
      'gynuro_Urgency': gynuro_Urgency,
      'gynuro_Hematuria': gynuro_Hematuria,
      'gynuro_PelvicPain': gynuro_PelvicPain,
      'gynuro_Other': gynuro_Other,
      'neuro_Normal': neuro_Normal,
      'neuro_Migraine': neuro_Migraine,
      'neuro_Seizure': neuro_Seizure,
      'neuro_TiaStorke': neuro_TiaStorke,
      'neuro_WeaknessSyncope': neuro_WeaknessSyncope,
      'neuro_SensoryImpairment': neuro_SensoryImpairment,
      'neuro_Other': neuro_Other,
      'gi_Normal': gi_Normal,
      'gi_GERD': gi_GERD,
      'gi_NauseaVomiting': gi_NauseaVomiting,
      'gi_DiarrheaConstipation': gi_DiarrheaConstipation,
      'gi_BowelHabitChanges': gi_BowelHabitChanges,
      'gi_Melena': gi_Melena,
      'gi_Other': gi_Other,
      'ms_Normal': ms_Normal,
      'ms_JointSwellingPain': ms_JointSwellingPain,
      'ms_LimitationsNeckMobility': ms_LimitationsNeckMobility,
      'ms_GaitDifficulty': ms_GaitDifficulty,
      'ms_Deformity': ms_Deformity,
      'ms_ProstheticDevices': ms_ProstheticDevices,
      'ms_Other': ms_Other,
      'endocrine_Normal': endocrine_Normal,
      'endocrine_HairLoss': endocrine_HairLoss,
      'endocrine_ExcessiveSweat': endocrine_ExcessiveSweat,
      'endocrine_ExcessiveThirst': endocrine_ExcessiveThirst,
      'endocrine_HeatIntolerance': endocrine_HeatIntolerance,
      'endocrine_ColdIntolerance': endocrine_ColdIntolerance,
      'endocrine_Other': endocrine_Other,
      'hemeLymph_Normal': hemeLymph_Normal,
      'hemeLymph_BleedingTendency': hemeLymph_BleedingTendency,
      'hemeLymph_DVTHistory': hemeLymph_DVTHistory,
      'hemeLymph_EnlargedNodes': hemeLymph_EnlargedNodes,
      'hemeLymph_Immunosuppression': hemeLymph_Immunosuppression,
      'hemeLymph_RecentSteroidUse': hemeLymph_RecentSteroidUse,
      'hemeLymph_Other': hemeLymph_Other,
      'abnormalDetails': abnormalDetails,
    };
  }

  void fromMap(Map<String, dynamic> map) {
    general_Normal = map['general_Normal'];
    general_AbnormalWeightLost = map['general_AbnormalWeightLost'];
    general_AbnormalWeightGain = map['general_AbnormalWeightGain'];
    general_Fever = map['general_Fever'];
    general_Fatigue = map['general_Fatigue'];
    general_ChillsSweats = map['general_ChillsSweats'];
    general_Other = map['general_Other'];
    heent_Normal = map['heent_Normal'];
    heent_Headache = map['heent_Headache'];
    heent_BlurredVision = map['heent_BlurredVision'];
    heent_Tinnitus = map['heent_Tinnitus'];
    heent_Dizziness = map['heent_Dizziness'];
    heent_Epistaxis = map['heent_Epistaxis'];
    heent_Other = map['heent_Other'];
    cv_Normal = map['cv_Normal'];
    cv_ChestPain = map['cv_ChestPain'];
    cv_Palpitations = map['cv_Palpitations'];
    cv_Murmur = map['cv_Murmur'];
    cv_PNDOrthopnea = map['cv_PNDOrthopnea'];
    cv_LEswelling = map['cv_LEswelling'];
    cv_Other = map['cv_Other'];
    pulmonary_Normal = map['pulmonary_Normal'];
    pulmonary_Wheezing = map['pulmonary_Wheezing'];
    pulmonary_Cough = map['pulmonary_Cough'];
    pulmonary_SOB = map['pulmonary_SOB'];
    pulmonary_Hemoptysis = map['pulmonary_Hemoptysis'];
    pulmonary_Sputum = map['pulmonary_Sputum'];
    pulmonary_Other = map['pulmonary_Other'];
    gynuro_Normal = map['gynuro_Normal'];
    gynuro_Dysuria = map['gynuro_Dysuria'];
    gynuro_Frequency = map['gynuro_Frequency'];
    gynuro_Urgency = map['gynuro_Urgency'];
    gynuro_Hematuria = map['gynuro_Hematuria'];
    gynuro_PelvicPain = map['gynuro_PelvicPain'];
    gynuro_Other = map['gynuro_Other'];
    neuro_Normal = map['neuro_Normal'];
    neuro_Migraine = map['neuro_Migraine'];
    neuro_Seizure = map['neuro_Seizure'];
    neuro_TiaStorke = map['neuro_TiaStorke'];
    neuro_WeaknessSyncope = map['neuro_WeaknessSyncope'];
    neuro_SensoryImpairment = map['neuro_SensoryImpairment'];
    neuro_Other = map['neuro_Other'];
    gi_Normal = map['gi_Normal'];
    gi_GERD = map['gi_GERD'];
    gi_NauseaVomiting = map['gi_NauseaVomiting'];
    gi_DiarrheaConstipation = map['gi_DiarrheaConstipation'];
    gi_BowelHabitChanges = map['gi_BowelHabitChanges'];
    gi_Melena = map['gi_Melena'];
    gi_Other = map['gi_Other'];
    ms_Normal = map['ms_Normal'];
    ms_JointSwellingPain = map['ms_JointSwellingPain'];
    ms_LimitationsNeckMobility = map['ms_LimitationsNeckMobility'];
    ms_GaitDifficulty = map['ms_GaitDifficulty'];
    ms_Deformity = map['ms_Deformity'];
    ms_ProstheticDevices = map['ms_ProstheticDevices'];
    ms_Other = map['ms_Other'];
    endocrine_Normal = map['endocrine_Normal'];
    endocrine_HairLoss = map['endocrine_HairLoss'];
    endocrine_ExcessiveSweat = map['endocrine_ExcessiveSweat'];
    endocrine_ExcessiveThirst = map['endocrine_ExcessiveThirst'];
    endocrine_HeatIntolerance = map['endocrine_HeatIntolerance'];
    endocrine_ColdIntolerance = map['endocrine_ColdIntolerance'];
    endocrine_Other = map['endocrine_Other'];
    hemeLymph_Normal = map['hemeLymph_Normal'];
    hemeLymph_BleedingTendency = map['hemeLymph_BleedingTendency'];
    hemeLymph_DVTHistory = map['hemeLymph_DVTHistory'];
    hemeLymph_EnlargedNodes = map['hemeLymph_EnlargedNodes'];
    hemeLymph_Immunosuppression = map['hemeLymph_Immunosuppression'];
    hemeLymph_RecentSteroidUse = map['hemeLymph_RecentSteroidUse'];
    hemeLymph_Other = map['hemeLymph_Other'];
    abnormalDetails = map['abnormalDetails'];
  }

  HealthStatusFormModel getModel() {
    return this;
  }
}
