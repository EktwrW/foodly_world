class FoodlyRegex {
  const FoodlyRegex._();

  static const Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const Pattern passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\W_]).{8,}$';

  static const Pattern userNamePattern = r'^[a-zA-Z0-9_]+ *$';

  static const Pattern onlyLettersPattern = r'^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ]+ *$';

  static const postalCodeRegex = {
    'US': r'^\d{5}(-\d{4})?$', // United States: 5 digits, optionally followed by a dash and 4 additional digits
    'AR':
        r'^[A-Z]?\d{4}[A-Z]{3}?$', // Argentina: 4 digits, and optionally a letter at the beginning and three letters at the end
    'VE': r'^\d{4}$', // Venezuela: 4 digits
    'EC': r'^\d{6}$', // Ecuador: 6 digits
    'SV': r'^\d{4}$', // El Salvador: 4 digits
    'ES': r'^\d{5}$', // Spain: 5 digits
    'PT': r'^\d{4}(-\d{3})?$', // Portugal: 4 digits, optionally followed by a dash and 3 additional digits
  };

  static const phoneNumberRegex = {
    'US':
        r'^\d{3}-?\d{3}-?\d{4}$', // United States: 3 digits for the area code, followed by 3 digits, then 4 digits, optionally separated by dashes.
    'AR':
        r'^(\d{2,4})-?\d{6,8}$', // Argentina: Between 2 and 4 digits for the area code, followed by 6 to 8 digits for the local number, with or without a dash.
    'VE':
        r'^0?\d{2,3}-?\d{7}$', // Venezuela: 2 or 3 digits for the area code (optionally preceded by 0), followed by 7 digits for the local number, with or without a dash.
    'EC':
        r'^\d{2}-?\d{7}$', // Ecuador: 2 digits for the area code, followed by 7 digits for the local number, with or without a dash.
    'SV':
        r'^\d{4}-?\d{4}$', // El Salvador: 4 digits for the area code, followed by 4 digits for the local number, with or without a dash.
    'ES':
        r'^\d{2,3}-?\d{6,7}$', // Spain: 2 or 3 digits for the area code, followed by 6 or 7 digits for the local number, with or without a dash.
    'PT':
        r'^\d{2,3}-?\d{6,7}$', // Portugal: 2 or 3 digits for the area code, followed by 6 or 7 digits for the local number, with or without a dash.
  };
}
