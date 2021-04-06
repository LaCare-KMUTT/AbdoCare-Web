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
