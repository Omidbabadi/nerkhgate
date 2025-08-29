import 'package:flutter/material.dart';
import 'package:myapp/core/common/entities/currency.dart';

extension StringExt on String {
  ThemeMode get stringValueToTheme {
    return switch (toLowerCase()) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  bool? get stringValueToBool {
    return switch (toLowerCase()) {
      'true' => true,
      'false' => false,
      _ => null,
    };
  }

  ItemTypes get getItemTypes {
    return switch (toLowerCase()) {
      'gold' => ItemTypes.gold,
      'currency' => ItemTypes.currency,
      _ => ItemTypes.cryptocurrency,
    };
  }

  String countryCodeToEmoji(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }

  String currencyToFlag(String currency) {
    const map = {
      "USD": "US",
      "EUR": "EU", // Eurozone flag
      "GBP": "GB",
      "JPY": "JP",
      "CNY": "CN",
      "AUD": "AU",
      "CAD": "CA",
      "CHF": "CH",
      "SEK": "SE",
      "NOK": "NO",
      "DKK": "DK",
      "RUB": "RU",
      "TRY": "TR",
      "AED": "AE",
      "AFN": "AF",
      "ALL": "AL",
      "AMD": "AM",
      "ANG": "CW", // Netherlands Antilles → Curaçao
      "AOA": "AO",
      "ARS": "AR",
      "AWG": "AW",
      "AZN": "AZ",
      "BAM": "BA",
      "BBD": "BB",
      "BDT": "BD",
      "BGN": "BG",
      "BHD": "BH",
      "BIF": "BI",
      "BMD": "BM",
      "BND": "BN",
      "BOB": "BO",
      "BRL": "BR",
      "BSD": "BS",
      "BTN": "BT",
      "BWP": "BW",
      "BYN": "BY",
      "BZD": "BZ",
      "CLP": "CL",
      "COP": "CO",
      "CRC": "CR",
      "CUP": "CU",
      "CZK": "CZ",
      "DJF": "DJ",
      "DOP": "DO",
      "DZD": "DZ",
      "EGP": "EG",
      "ETB": "ET",
      "FJD": "FJ",
      "GEL": "GE",
      "GHS": "GH",
      "GIP": "GI",
      "GMD": "GM",
      "GNF": "GN",
      "GTQ": "GT",
      "GYD": "GY",
      "HKD": "HK",
      "HNL": "HN",
      "HRK": "HR",
      "HTG": "HT",
      "HUF": "HU",
      "IDR": "ID",
      "ILS": "IL",
      "INR": "IN",
      "IQD": "IQ",
      "IRR": "IR",
      "ISK": "IS",
      "JMD": "JM",
      "JOD": "JO",
      "KES": "KE",
      "KGS": "KG",
      "KHR": "KH",
      "KMF": "KM",
      "KRW": "KR",
      "KWD": "KW",
      "KZT": "KZ",
      "LAK": "LA",
      "LBP": "LB",
      "LKR": "LK",
      "LRD": "LR",
      "LYD": "LY",
      "MAD": "MA",
      "MDL": "MD",
      "MGA": "MG",
      "MKD": "MK",
      "MMK": "MM",
      "MNT": "MN",
      "MOP": "MO",
      "MRU": "MR",
      "MUR": "MU",
      "MVR": "MV",
      "MWK": "MW",
      "MXN": "MX",
      "MYR": "MY",
      "MZN": "MZ",
      "NAD": "NA",
      "NGN": "NG",
      "NIO": "NI",
      "NPR": "NP",
      "NZD": "NZ",
      "OMR": "OM",
      "PAB": "PA",
      "PEN": "PE",
      "PGK": "PG",
      "PHP": "PH",
      "PKR": "PK",
      "PLN": "PL",
      "PYG": "PY",
      "QAR": "QA",
      "RON": "RO",
      "RSD": "RS",
      "RWF": "RW",
      "SAR": "SA",
      "SCR": "SC",
      "SDG": "SD",
      "SGD": "SG",
      "SLL": "SL",
      "SOS": "SO",
      "SRD": "SR",
      "SSP": "SS",
      "SYP": "SY",
      "THB": "TH",
      "TJS": "TJ",
      "TMT": "TM",
      "TND": "TN",
      "TOP": "TO",
      "TTD": "TT",
      "TZS": "TZ",
      "UAH": "UA",
      "UGX": "UG",
      "UYU": "UY",
      "UZS": "UZ",
      "VEF": "VE",
      "VES": "VE",
      "VND": "VN",
      "XAF": "CM",
      "XCD": "AG", // Eastern Caribbean
      "XOF": "SN", // West African CFA
      "XPF": "PF", // CFP franc
      "YER": "YE",
      "ZAR": "ZA",
      "ZMW": "ZM",
      "ZWL": "ZW",
    };
    debugPrint(currency);
    if (!map.containsKey(currency)) return "🏳"; // fallback
    return countryCodeToEmoji(map[currency]!);
  }
}
