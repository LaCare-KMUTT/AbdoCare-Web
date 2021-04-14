// ignore_for_file: non_constant_identifier_names

class HealthStatusFormModel {
  bool general_Normal;
  bool general_AbnormalWeightLost;
  bool general_AbnormalWeightGain;
  bool general_Fever;
  String general_Other;

  bool heent_Normal;
  bool heent_Headache;
  bool heent_BlurredVision;
  bool heent_Tinnitus;
  String heent_Other;

  bool cv_Normal;
  bool cv_ChestPain;
  bool cv_Palpitations;
  bool cv_Murmur;
  bool cv_PNDOrthopnea;
  bool cv_LEswelling;
  String cv_Other;

  bool pulmonary_Normal;
  bool pulmonary_Wheezing;
  bool pulmonary_Cough;
  bool pulmonary_SOB;
  String pulmonary_Other;

  bool gynuro_Normal;
  bool gynuro_Dysuria;
  bool gynuro_Frequency;
  bool gynuro_Urgency;
  String gynuro_Other;

  bool neuro_Normal;
  bool neuro_Migraine;
  bool neuro_Seizure;
  bool neuro_TiaStorke;
  bool neuro_WeaknessSyncope;
  bool neuro_SensoryImpairment;
  String neuro_Other;

  bool gi_Normal;
  bool gi_GERD;
  bool gi_NauseaVomiting;
  bool gi_DiarrheaConstipation;
  bool gi_BowelHabitChanges;
  bool gi_Melena;
  String gi_Other;

  bool ms_Normal;
  bool ms_JointSwellingPain;
  bool ms_LimitationsNeckMobility;
  bool ms_GaitDifficulty;
  bool ms_Deformity;
  bool ms_ProstheticDevices;
  String ms_Other;

  bool endocrine_Normal;
  bool endocrine_HairLoss;
  bool endocrine_ExcessiveSweat;
  bool endocrine_ExcessiveThirst;
  bool endocrine_HeatIntolerance;
  bool endocrine_ColdIntolerance;
  String endocrine_Other;

  bool hemeLymph_Normal;
  bool hemeLymph_BleedingTendency;
  bool hemeLymph_DVTHistory;
  bool hemeLymph_EnlargedNodes;
  bool hemeLymph_Immunosuppression;
  bool hemeLymph_RecentSteroidUse;
  String hemeLymph_Other;

  Map<String, dynamic> toMap() {
    return {
      'general_Normal': general_Normal,
      'general_AbnormalWeightLost': general_AbnormalWeightLost,
      'general_AbnormalWeightGain': general_AbnormalWeightGain,
      'general_Fever': general_Fever,
      'general_Other': general_Other,
      'heent_Normal': heent_Normal,
      'heent_Headache': heent_Headache,
      'heent_BlurredVision': heent_BlurredVision,
      'heent_Tinnitus': heent_Tinnitus,
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
      'pulmonary_Other': pulmonary_Other,
      'gynuro_Normal': gynuro_Normal,
      'gynuro_Dysuria': gynuro_Dysuria,
      'gynuro_Frequency': gynuro_Frequency,
      'gynuro_Urgency': gynuro_Urgency,
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
    };
  }

  void fromMap(Map<String, dynamic> map) {
    general_Normal = map['general_Normal'];
    general_AbnormalWeightLost = map['general_AbnormalWeightLost'];
    general_AbnormalWeightGain = map['general_AbnormalWeightGain'];
    general_Fever = map['general_Fever'];
    general_Other = map['general_Other'];
    heent_Normal = map['heent_Normal'];
    heent_Headache = map['heent_Headache'];
    heent_BlurredVision = map['heent_BlurredVision'];
    heent_Tinnitus = map['heent_Tinnitus'];
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
    pulmonary_Other = map['pulmonary_Other'];
    gynuro_Normal = map['gynuro_Normal'];
    gynuro_Dysuria = map['gynuro_Dysuria'];
    gynuro_Frequency = map['gynuro_Frequency'];
    gynuro_Urgency = map['gynuro_Urgency'];
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
  }

  HealthStatusFormModel getModel() {
    return this;
  }
}
