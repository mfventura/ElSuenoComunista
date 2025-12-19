import 'package:flutter/material.dart';

/// App color palette - Dark mode theme inspired by mockup
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFFDC2626);
  static const Color primaryDark = Color(0xFF991B1B);
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentDark = Color(0xFFD97706);

  // Background colors
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceElevated = Color(0xFF252525);
  static const Color surfaceGlass = Color(0x0DFFFFFF); // 5% white

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA1A1AA);
  static const Color textMuted = Color(0xFF71717A);

  // Border colors
  static const Color border = Color(0x1AFFFFFF); // 10% white

  // Semantic colors
  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);

  // Category colors
  static const Color categoryTools = Color(0xFFDC2626);
  static const Color categoryFood = Color(0xFF16A34A);
  static const Color categoryTransport = Color(0xFF2563EB);
  static const Color categoryServices = Color(0xFF9333EA);
  static const Color categoryHelp = Color(0xFFF59E0B);
  static const Color categoryBooks = Color(0xFFEC4899);
  static const Color categoryLeisure = Color(0xFF14B8A6);
  static const Color categoryKids = Color(0xFF8B5CF6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F0F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
