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

List<RadioListTileModel> getTransferList() => [
      RadioListTileModel.withValue(
          index: 1,
          text:
              '0 ไม่สามารถนั่งได้ (นั่งแล้วจะล้มเสมอ) หรือต้องใช้คนสองคนช่วยกันยกขึ้น',
          value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text:
              '1 ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้ เช่น ต้องใช้คนที่แข็งแรงหรือมีทักษะ1 คน หรือใช้คนทั่วไป2 คนพยุงหรือดันขึ้นมาจึงจะนั่งอยู่ได้',
          value: 1),
      RadioListTileModel.withValue(
          index: 3,
          text:
              '2 ต้องการความช่วยเหลือบ้างเช่น บอกให้ทำตาม หรือช่วยพยุงเล็กน้อย หรือต้องมีคนดูแลเพื่อความปลอดภัย',
          value: 2),
      RadioListTileModel.withValue(index: 4, text: '3 ทำได้เอง', value: 3),
    ];

List<RadioListTileModel> getToiletUseList() => [
      RadioListTileModel.withValue(
          index: 1, text: '0 ช่วยตัวเองไม่ได้', value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text:
              '1 ทำเองได้บ้าง (อย่างน้อยทำความสะอาดตัวเองได้หลังจากเสร็จธุระ) แต่ต้องการความช่วยเหลือในบางสิ่ง',
          value: 1),
      RadioListTileModel.withValue(
          index: 3,
          text:
              '2 ช่วยตัวเองได้ดี (ขึ้นนั่งและลงจากโถส้วมเองได้ ทำความสะอาดได้เรียบร้อยหลังจากเสร็จธุระ ถอดใส่เสื้อผ้าได้เรียบร้อย)',
          value: 2),
    ];

List<RadioListTileModel> getMobilityList() => [
      RadioListTileModel.withValue(
          index: 1, text: '0 เคลื่อนที่ไปไหนไม่ได้', value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text:
              '1 ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง (ไม่ต้องมีคนเข็นให้) และจะต้องเข้าออกมุมห้องหรือประตูได้',
          value: 1),
      RadioListTileModel.withValue(
          index: 3,
          text:
              '2 เดินหรือเคลื่อนที่โดยมีคนช่วย เช่น พยุง หรือบอกให้ทำตาม หรือต้องให้ความสนใจดูแลเพื่อความปลอดภัย ',
          value: 2),
      RadioListTileModel.withValue(
          index: 4, text: '3 เดินหรือเคลื่อนที่ได้เอง', value: 3),
    ];

List<RadioListTileModel> getDressingList() => [
      RadioListTileModel.withValue(
          index: 1,
          text: '0 ต้องมีคนสวมใส่ให้ ช่วยตัวเองแทบไม่ได้หรือได้น้อย',
          value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text: '1 ช่วยตัวเองได้ประมาณร้อยละ50ที่เหลือต้องมีคนช่วย',
          value: 1),
      RadioListTileModel.withValue(
          index: 3,
          text:
              '2 ช่วยตัวเองได้ดี (รวมทั้งการติดกระดุม รูดซิบ หรือใช้เสื้อผ้าที่ดัดแปลงให้เหมาะสมก็ได้)',
          value: 2),
    ];

List<RadioListTileModel> getStairsList() => [
      RadioListTileModel.withValue(
          index: 1, text: '0 ไม่สามารถทำได้', value: 0),
      RadioListTileModel.withValue(index: 2, text: '1 ต้องการคนช่วย', value: 1),
      RadioListTileModel.withValue(
          index: 3,
          text:
              '2  ขึ้นลงได้เอง (ถ้าต้องใช้เครื่องช่วยเดิน เช่น walkerจะต้องเอาขึ้นลงได้ด้วย)',
          value: 2),
    ];

List<RadioListTileModel> getBathingList() => [
      RadioListTileModel.withValue(
          index: 1, text: '0 ต้องมีคนช่วยหรือทำให้', value: 0),
      RadioListTileModel.withValue(index: 2, text: '1 อาบน้ำเองได้', value: 1),
    ];

List<RadioListTileModel> getBowelsList() => [
      RadioListTileModel.withValue(
          index: 1,
          text: '0 กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ',
          value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text: '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่า1ครั้งต่อสัปดาห์)',
          value: 1),
      RadioListTileModel.withValue(
          index: 3, text: '2 กลั้นได้เป็นปกติ', value: 2),
    ];

List<RadioListTileModel> getBladderList() => [
      RadioListTileModel.withValue(
          index: 1,
          text: '0 กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะแต่ไม่สามารถดูแลเองได้',
          value: 0),
      RadioListTileModel.withValue(
          index: 2,
          text: '1 กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)',
          value: 1),
      RadioListTileModel.withValue(
          index: 3, text: '2 กลั้นได้เป็นปกติ', value: 2),
    ];
