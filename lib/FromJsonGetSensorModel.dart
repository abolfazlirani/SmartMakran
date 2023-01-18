class FromJsonGetSensorModel {
  FromJsonGetSensorModel({
      this.ph, 
      this.oxygen, 
      this.orp, 
      this.ec, 
      this.temperature, 
      this.ammonia, 
      this.nitrite, 
      this.nitrate, 
      this.pool, 
      this.sensorsKey,});

  FromJsonGetSensorModel.fromJson(dynamic json) {
    ph = json['ph'];
    oxygen = json['oxygen'];
    orp = json['orp'];
    ec = json['ec'];
    temperature = json['temperature'];
    ammonia = json['ammonia'];
    nitrite = json['nitrite'];
    nitrate = json['nitrate'];
    pool = json['pool'];
    sensorsKey = json['sensorsKey'];
  }
  double? ph;
  double? oxygen;
  double? orp;
  double? ec;
  double? temperature;
  int? ammonia;
  int? nitrite;
  int? nitrate;
  String? pool;
  String? sensorsKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ph'] = ph;
    map['oxygen'] = oxygen;
    map['orp'] = orp;
    map['ec'] = ec;
    map['temperature'] = temperature;
    map['ammonia'] = ammonia;
    map['nitrite'] = nitrite;
    map['nitrate'] = nitrate;
    map['pool'] = pool;
    map['sensorsKey'] = sensorsKey;
    return map;
  }

}