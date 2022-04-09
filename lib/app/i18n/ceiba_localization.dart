import 'package:yaml/yaml.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CeibaLocalization {

  final String localName;

  late YamlMap translations;

  static const LocalizationsDelegate<CeibaLocalization> delegate = _CeibaLocalizationDelegate();

  CeibaLocalization(this.localName);

  Future load() async {
    String yamlString = await rootBundle.loadString('lib/app/i18n/langs/$localName.yaml');
    translations = loadYaml(yamlString);
  }

  String translate(String key) {
    try {
      final List<String> keys = key.split('.');
      dynamic translated = translations;
      for (var key in keys) {
        translated = translated[key];
      }
      return translated ?? '-';      
    } catch (e) {
      return '-';
    }
  }


  static CeibaLocalization of(BuildContext context) {
    return Localizations.of(context, CeibaLocalization);
  }

}

class _CeibaLocalizationDelegate extends LocalizationsDelegate<CeibaLocalization> {

  const _CeibaLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<CeibaLocalization> load(Locale locale) async {
    final String languageCode = isSupported(locale) ? locale.languageCode : 'en';
    var t = CeibaLocalization(languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(LocalizationsDelegate<CeibaLocalization> old) {
    return false;
  }

}