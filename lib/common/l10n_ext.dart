import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// 本地化扩展，方便在任何地方获取翻译
extension L10nExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// 全局快捷访问（需要 context）
AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context);
