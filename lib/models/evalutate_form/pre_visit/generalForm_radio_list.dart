import 'radioListTile_model.dart';

List<RadioListTileModel> getConsentSignList() => [
      RadioListTileModel(index: 1, text: 'Patient'),
      RadioListTileModel(index: 2, text: 'Others'),
    ];

List<RadioListTileModel> getTypeOfAnesthesiaList() => [
      RadioListTileModel(index: 1, text: 'GA'),
      RadioListTileModel(index: 2, text: 'SB'),
      RadioListTileModel(index: 3, text: 'GA+SB'),
      RadioListTileModel(index: 4, text: 'GA+Feneral nerve block'),
    ];

List<RadioListTileModel> getPreviousIllnessList1() => [
      RadioListTileModel(index: 1, text: 'DM'),
      RadioListTileModel(index: 2, text: 'HT'),
      RadioListTileModel(index: 3, text: 'DLP'),
      RadioListTileModel(index: 4, text: 'Heart disease'),
      RadioListTileModel(index: 5, text: 'Lung disease'),
    ];

List<RadioListTileModel> getPreviousIllnessList2() => [
      RadioListTileModel(index: 6, text: 'Hematologic abnormality'),
      RadioListTileModel(index: 7, text: 'Renal disease'),
      RadioListTileModel(index: 8, text: 'Other'),
    ];

List<RadioListTileModel> getAsaClassList() => [
      RadioListTileModel.withValue(
          index: 1,
          text:
              'ASA Class l: ผู้ป่วยมีสุขภาพแข็งแรงดี มีเพียงโรคที่มารับการผ่าตัดเพียงเท่านั้น',
          value: 'ASAClass1'),
      RadioListTileModel.withValue(
          index: 2,
          text:
              'ASA Class ll: ผู้ป่วยมีพยาธิสภาพเล็กน้อย เช่น ผู้ป่วยสูงอายุ โรคความดันโลหิตสูง หรือโรคหัวใจที่ควบคุมอาการได้ดี เป็นต้น',
          value: 'ASAClass2'),
      RadioListTileModel.withValue(
          index: 3,
          text:
              'ASA Class lll: ผู้ป่วยมีพยาธิสภาพของร่างกายที่รุนแรงขึ้น และเป็นอุปสรรคต่อการดำเนินชีวิตของผู้ป่วย เช่น โรคเบาหวานที่มีผลแทรกซ้อน',
          value: 'ASAClass3'),
      RadioListTileModel.withValue(
          index: 4,
          text:
              'ASA Class lV: ผู้ป่วยที่มีพยาธิสภาพของร่างกายที่รุนแรงมากและไม่สามารถรักษาให้อยู่ในสภาวะปกติโดยยาหรือการผ่าตัดและมีอันตรายต่อชีวิต',
          value: 'ASAClass4'),
      RadioListTileModel.withValue(
          index: 5,
          text:
              'ASA Class V: ผู้ป่วยที่มีชีวิตอยู่ได้เพียง 24 ชั่วโมง ไม่ว่าจะได้รับการรักษาด้วยยาหรือผ่าตัด',
          value: 'ASAClass5'),
    ];

List<RadioListTileModel> getAntiPlateletList() => [
      RadioListTileModel(index: 1, text: 'No'),
      RadioListTileModel(index: 2, text: 'Yes(ระบุ):'),
    ];

List<RadioListTileModel> getAllergyMedicationList() => [
      RadioListTileModel(index: 1, text: 'No'),
      RadioListTileModel(index: 2, text: 'Yes(ระบุ):'),
    ];

List<RadioListTileModel> getAllergyLatexList() => [
      RadioListTileModel(index: 1, text: 'No'),
      RadioListTileModel(index: 2, text: 'Iodine'),
      RadioListTileModel(index: 3, text: 'Tape'),
      RadioListTileModel(index: 4, text: 'Food'),
      RadioListTileModel(index: 5, text: 'Environment'),
      RadioListTileModel(index: 6, text: 'Other(ระบุ):'),
    ];

List<RadioListTileModel> getPsychologicalStatusList() => [
      RadioListTileModel(index: 1, text: 'Calm'),
      RadioListTileModel(index: 2, text: 'Fear'),
      RadioListTileModel(index: 3, text: 'Anxious'),
      RadioListTileModel(index: 4, text: 'Other(ระบุ):'),
    ];

List<RadioListTileModel> getDrugAndSubstanceList1() => [
      RadioListTileModel(index: 1, text: 'No'),
      RadioListTileModel(index: 2, text: 'Drug sedative(ระบุ):'),
    ];
List<RadioListTileModel> getDrugAndSubStanceList2() => [
      RadioListTileModel(index: 3, text: 'Smoking'),
      RadioListTileModel(index: 4, text: 'ETOH'),
      RadioListTileModel(index: 5, text: 'Narcotics'),
    ];

List<RadioListTileModel> getSleepDisorderList() => [
      RadioListTileModel(index: 1, text: 'No'),
      RadioListTileModel(index: 2, text: 'Yes'),
    ];

List<RadioListTileModel> getSleepDisorderDurationList() => [
      RadioListTileModel(index: 3, text: '< 2 Wk.'),
      RadioListTileModel(index: 4, text: '> 2 Wk.'),
    ];
