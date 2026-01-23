import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Core color palette
  static const Color primaryColor = Color(0xFFFF5C00);       // Orange primary color
  static const Color primaryLight = Color(0xFFFF8C42);      // Lighter orange for hover/states
  static const Color primaryDark = Color(0xFFE64A00);       // Darker orange for contrast text
  static const Color secondaryColor = Color(0xFF2E7D32);    // Green secondary color
  static const Color secondaryLight = Color(0xFF60AD5E);    // Lighter green
  static const Color secondaryDark = Color(0xFF1B5E20);     // Darker green
  static const Color successColor = Color(0xFF4CAF50);      // Success/green
  static const Color warningColor = Color(0xFFFFC107);      // Warning/yellow
  static const Color errorColor = Color(0xFFF44336);        // Error/red
  static const Color infoColor = Color(0xFF2196F3);         // Info/blue
  static const Color backgroundColor = Color(0xFFF8F8F8);   // Background color
  static const Color surfaceColor = Colors.white;           // Surface cards/backgrounds
  static const Color textPrimary = Color(0xFF1A1A1A);       // Primary text
  static const Color textSecondary = Color(0xFF757575);     // Secondary text
  static const Color textHint = Color(0xFFBDBDBD);          // Hint text
  static const Color dividerColor = Color(0xFFE0E0E0);      // Divider color
  static const Color borderColor = Color(0xFFE0E0E0);       // Border color

  // Status colors for store availability
  static const Color openColor = Color(0xFF4CAF50);         // Open status
  static const Color closedColor = Color(0xFFF44336);       // Closed status

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        background: backgroundColor,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onBackground: textPrimary,
        onError: Colors.white,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w700, color: textPrimary),  // H1
        displayMedium: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w700, color: textPrimary),  // H2
        displaySmall: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w700, color: textPrimary),   // H3
        headlineLarge: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: textPrimary),  // H4
        headlineMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimary), // H5
        headlineSmall: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary),  // H6
        titleLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary),     // Title 1
        titleMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),    // Title 2
        titleSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: textPrimary),     // Title 3
        bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: textPrimary),      // Body 1
        bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: textSecondary),   // Body 2
        bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: textSecondary),    // Body 3
        labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: textPrimary),     // Button
        labelMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: textSecondary),  // Caption 1
        labelSmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, color: textHint),        // Caption 2
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: textPrimary),
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: 16),
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: 16),
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: textHint),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade100,
        selectedColor: primaryColor,
        disabledColor: Colors.grey.shade200,
        labelStyle: GoogleFonts.poppins(fontSize: 12, color: textSecondary),
        secondaryLabelStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 0.5,
        space: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: primaryColor,
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedItemColor: textSecondary,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );
  }
}
