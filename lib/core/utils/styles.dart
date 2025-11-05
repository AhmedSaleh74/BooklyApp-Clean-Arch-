import 'package:flutter/material.dart';

abstract class Styles {
  // 🟢 ألوان أساسية
  static const Color primaryColor = Color(0xFF674FA3);
  static const Color secondaryColor = Color(0xFFF2E9FF);
  static const Color accentColor = Color(0xFF9370DB);
  static const Color backgroundColor = Color(0xFFF9F9FB);
  static const Color textColor = Color(0xFF1C1C1C);

  // 🟢 عنوان رئيسي كبير (مثلاً لاسم التطبيق أو الـ AppBar)
  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
    letterSpacing: 0.5,
  );

  // 🟢 عنوان فرعي (section title)
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  // 🟢 نص عادي
  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    height: 1.4,
  );

  // 🟢 نص ثانوي (زي وصف أو تفاصيل صغيرة)
  static const TextStyle caption = TextStyle(fontSize: 14, color: Colors.grey);

  // 🟢 نص غامق (زي السعر أو معلومة مهمة)
  static const TextStyle highlighted = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  // 🟢 نص أبيض (للأزرار مثلاً)
  static const TextStyle whiteText = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}
