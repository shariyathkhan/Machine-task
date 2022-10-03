import 'dart:convert';

ChangeRateModel changeRateModelFromJson(String str) =>
    ChangeRateModel.fromJson(json.decode(str));

String changeRateModelToJson(ChangeRateModel data) =>
    json.encode(data.toJson());

class ChangeRateModel {
  ChangeRateModel({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  Map<String, dynamic>? conversionRates;

  factory ChangeRateModel.fromJson(Map<String, dynamic> json) =>
      ChangeRateModel(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        timeLastUpdateUnix: json["time_last_update_unix"],
        timeLastUpdateUtc: json["time_last_update_utc"],
        timeNextUpdateUnix: json["time_next_update_unix"],
        timeNextUpdateUtc: json["time_next_update_utc"],
        baseCode: json["base_code"],
        conversionRates: json["conversion_rates"] == null
            ? null
            : Map.from(json["conversion_rates"])
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "time_last_update_unix": timeLastUpdateUnix,
        "time_last_update_utc": timeLastUpdateUtc,
        "time_next_update_unix": timeNextUpdateUnix,
        "time_next_update_utc": timeNextUpdateUtc,
        "base_code": baseCode,
        "conversion_rates": conversionRates == null
            ? null
            : Map.from(conversionRates!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
