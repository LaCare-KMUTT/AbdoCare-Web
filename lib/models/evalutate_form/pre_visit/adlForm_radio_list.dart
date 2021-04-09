import 'radioListTile_model.dart';

List<RadioListTileModel> getFeedingList() => [
      RadioListTileModel.withValue(
          index: 1,
          text: '0 ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้',
          value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text:
              '1 ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า',
          value: 1),
      RadioListTileModel.withValue(
          index: 3, text: '2 ตักอาหารและช่วยตัวเองได้เป็นปกติ', value: 2),
    ];

List<RadioListTileModel> getGroomingList() => [
      RadioListTileModel.withValue(
          index: 1, text: '0 ต้องการความช่วยเหลือ', value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text: '1 ทำเองได้ (รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)',
          value: 1),
    ];
