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
}
