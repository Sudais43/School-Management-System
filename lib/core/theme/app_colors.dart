import 'package:flutter/material.dart';

/// Centralized color palette for the application defining both
/// Light Mode and Dark Mode specific colors and shared brand accents.
abstract class AppColors {
  // Prevent instantiation
  const AppColors._();

  // ==========================================
  // BRAND & ACCENT COLORS (Shared)
  // ==========================================
  static const Color primaryBlue = Color(0xFF4390DC);
  static const Color primaryBlueLight = Color(0xFF6BB0F5);
  static const Color primaryBlueDark = Color(0xFF1D5AA6);

  static const Color sidebarBackground = Color(0xFF132252);
  static const Color sidebarTextUnselected = Color(0xFFB0C4DE);

  static const Color logoCoral = Color(0xFFEC5863);
  static const Color logoTeal = Color(0xFF2CB1A1);
  static const Color logoAmber = Color(0xFFFFB74D);

  // ==========================================
  // LIGHT THEME PALETTE
  // ==========================================
  static const Color lightBackground = Color(0xFFF8FAFC); // Very soft grayish-white
  static const Color lightSurface = Color(0xFFFFFFFF);    // Pure white cards & modals
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9); // Light container tint

  static const Color lightTextPrimary = Color(0xFF1E293B);   // Deep slate main headlines
  static const Color lightTextSecondary = Color(0xFF64748B); // Muted slate subtext
  static const Color lightTextMuted = Color(0xFF94A3B8);     // Very light gray details

  static const Color lightBorder = Color(0xFFE2E8F0);        // Subtle outline border
  static const Color lightDivider = Color(0xFFE2E8F0);       // List/Card divider

  static const Color lightError = Color(0xFFEF4444);
  static const Color lightSuccess = Color(0xFF10B981);
  static const Color lightWarning = Color(0xFFF59E0B);

  // ==========================================
  // DARK THEME PALETTE
  // ==========================================
  static const Color darkBackground = Color(0xFF0F172A);  // Deep slate navy dark theme background
  static const Color darkSurface = Color(0xFF1E293B);     // Elevated card background
  static const Color darkSurfaceVariant = Color(0xFF334155); // Secondary container tint

  static const Color darkTextPrimary = Color(0xFFF8FAFC);   // Off-white main headlines
  static const Color darkTextSecondary = Color(0xFF94A3B8); // Soft grayish-blue body text
  static const Color darkTextMuted = Color(0xFF64748B);     // Muted text details

  static const Color darkBorder = Color(0xFF334155);        // Dark mode card outline
  static const Color darkDivider = Color(0xFF1E293B);       // Dark mode divider

  static const Color darkError = Color(0xFFF87171);
  static const Color darkSuccess = Color(0xFF34D399);
  static const Color darkWarning = Color(0xFFFBBF24);
}