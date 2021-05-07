enum EvaluationFormTopic {
  recoveryReadiness0,
  respiratory0,
  drain0,
  urology0,
  respiratory1,
  drain1,
  bloodclot1,
  nutrition1,
  infection2,
  pulmanary2,
  digestive2,
  generalForm,
  vitalSign1,
  vitalSign2,
  vitalSign3,
  vitalSign4,
  vitalSign5,
  vitalSign6,
}

class EvaluationModel {
  List<Map<String, Object>> vitalSignList = [
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "02.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign1,
    },
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "06.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign2,
    },
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "10.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign3,
    },
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "14.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign4,
    },
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "18.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign5,
    },
    {
      "formName": "แบบประเมินสัญญาณชีพ",
      "formTime": "22.00 น.",
      "selectedForm": EvaluationFormTopic.vitalSign6,
    },
  ];
  List<Map<String, Object>> postOpHospitalDay0List = [
    {
      "formName": "แบบประเมินความพร้อมฟื้นสภาพหลังผ่าตัด",
      "selectedForm": EvaluationFormTopic.recoveryReadiness0,
    },
    {
      "formName": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedForm": EvaluationFormTopic.respiratory0,
    },
  ];
  List<Map<String, Object>> postOpHospitalDay0List2 = [
    {
      "formName": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedForm": EvaluationFormTopic.drain0,
    },
    {
      "formName": "แบบประเมินระบบปัสสาวะ",
      "selectedForm": EvaluationFormTopic.urology0,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay1List = [
    {
      "formName": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedForm": EvaluationFormTopic.respiratory1,
    },
    {
      "formName": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedForm": EvaluationFormTopic.drain1,
    },
  ];
  List<Map<String, Object>> postOpHospitalDay1List2 = [
    {
      "formName": "แบบประเมินป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
      "selectedForm": EvaluationFormTopic.bloodclot1,
    },
    {
      "formName": "แบบประเมินการจัดการภาวะโภชนาการ",
      "selectedForm": EvaluationFormTopic.nutrition1,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay2List = [
    {
      "formName": "แบบประเมินการเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "selectedForm": EvaluationFormTopic.infection2,
    },
    {
      "formName": "แบบประเมินการฟื้นฟูสมรรถภาพของปอด",
      "selectedForm": EvaluationFormTopic.pulmanary2,
    },
    {
      "formName": "แบบประเมินการฟื้นฟูระบบทางเดินอาหาร",
      "selectedForm": EvaluationFormTopic.digestive2,
    }
  ];
  List<Map<String, Object>> preOpHos = [
    {
      "formName": "แบบประเมิน Pre-Visit",
      "selectedForm": EvaluationFormTopic.generalForm,
    },
  ];
}
