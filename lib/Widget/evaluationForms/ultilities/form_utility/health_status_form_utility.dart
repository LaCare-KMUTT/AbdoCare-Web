import 'package:AbdoCare_Web/models/evalutate_form/pre_visit/healthStatusForm_model.dart';

class HealthStatusUtility {
  bool getValidateHealthStatus(HealthStatusFormModel model) {
    if (model.general_Normal == false &&
        model.general_AbnormalWeightLost == false &&
        model.general_AbnormalWeightGain == false &&
        model.general_Fever == false &&
        model.general_Fatigue == false &&
        model.general_ChillsSweats == false &&
        model.general_Other == '-') {
      return false;
    } else if (model.heent_Normal == false &&
        model.heent_Headache == false &&
        model.heent_BlurredVision == false &&
        model.heent_Tinnitus == false &&
        model.heent_Dizziness == false &&
        model.heent_Epistaxis == false &&
        model.heent_Other == '-') {
      return false;
    } else if (model.cv_Normal == false &&
        model.cv_ChestPain == false &&
        model.cv_Palpitations == false &&
        model.cv_Murmur == false &&
        model.cv_PNDOrthopnea == false &&
        model.cv_LEswelling == false &&
        model.cv_Other == '-') {
      return false;
    } else if (model.pulmonary_Normal == false &&
        model.pulmonary_Wheezing == false &&
        model.pulmonary_Cough == false &&
        model.pulmonary_SOB == false &&
        model.pulmonary_Hemoptysis == false &&
        model.pulmonary_Sputum == false &&
        model.pulmonary_Other == '-') {
      return false;
    } else if (model.gynuro_Normal == false &&
        model.gynuro_Dysuria == false &&
        model.gynuro_Frequency == false &&
        model.gynuro_Urgency == false &&
        model.gynuro_Hematuria == false &&
        model.gynuro_PelvicPain == false &&
        model.gynuro_Other == '-') {
      return false;
    } else if (model.neuro_Normal == false &&
        model.neuro_Migraine == false &&
        model.neuro_Seizure == false &&
        model.neuro_TiaStorke == false &&
        model.neuro_WeaknessSyncope == false &&
        model.neuro_SensoryImpairment == false &&
        model.neuro_Other == '-') {
      return false;
    } else if (model.gi_Normal == false &&
        model.gi_GERD == false &&
        model.gi_NauseaVomiting == false &&
        model.gi_DiarrheaConstipation == false &&
        model.gi_BowelHabitChanges == false &&
        model.gi_Melena == false &&
        model.gi_Other == '-') {
      return false;
    } else if (model.ms_Normal == false &&
        model.ms_JointSwellingPain == false &&
        model.ms_LimitationsNeckMobility == false &&
        model.ms_GaitDifficulty == false &&
        model.ms_Deformity == false &&
        model.ms_ProstheticDevices == false &&
        model.ms_Other == '-') {
      return false;
    } else if (model.endocrine_Normal == false &&
        model.endocrine_HairLoss == false &&
        model.endocrine_ExcessiveSweat == false &&
        model.endocrine_ExcessiveThirst == false &&
        model.endocrine_HeatIntolerance == false &&
        model.endocrine_ColdIntolerance == false &&
        model.endocrine_Other == '-') {
      return false;
    } else if (model.hemeLymph_Normal == false &&
        model.hemeLymph_BleedingTendency == false &&
        model.hemeLymph_DVTHistory == false &&
        model.hemeLymph_EnlargedNodes == false &&
        model.hemeLymph_Immunosuppression == false &&
        model.hemeLymph_RecentSteroidUse == false &&
        model.hemeLymph_Other == '-') {
      return false;
    } else {
      return true;
    }
  }
}
