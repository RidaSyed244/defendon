class Validators {
  static String? emptyValidator(String? text) {
    if (text!.isEmpty) {
      return 'Please Fill in the field';
    }
    return null;
  }

  static String? doubleValidator(String? text) {
    if (text!.isEmpty) {
      return 'Please Fill in the field';
    }
    try {
      double.parse(text);
      return null;
    } catch (e) {
      return 'Please enter correct value';
    }
  }

  static String? nameValidator(String? email) {
    if (email!.isEmpty) {
      return 'Please fill in the name';
    }

    if (email.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? usernameValidator(String? email) {
    if (email!.isEmpty) {
      return 'Please fill in the username';
    }

    if (email.length < 6) {
      return 'Username must be at least 6 characters';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return 'Please Fill in the email';
    }

    const p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(p);

    if (!regExp.hasMatch(email.trim())) {
      return 'Please Enter Valid Email Address';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Please Fill in the password';
    }

    if (password.length < 6) {
      return 'Text must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? password, String? oldPassword) {
    if (password!.isEmpty) {
      return 'Please fill in the password';
    }

    if (password != oldPassword) {
      return "Passwords don't match";
    }
    return null;
  }

  static String? lengthValidator(String? field, {int length = 4}) {
    if (field!.isEmpty) {
      return 'Please Fill in the field';
    }

    if (field.length < length) {
      return 'Text must be at least $length characters';
    }
    return null;
  }

  static String? dropDownValidator(String? text, String title) {
    if (text!.isEmpty) {
      return 'Please select the $title';
    }
    return null;
  }

  static String? otpValidator(String? value, {int length = 6}) {
    if (value == null || value.isEmpty) {
      return 'Please enter the OTP code';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'OTP code must contain only numbers';
    }
    return null;
  }

  static String? validateInviteCode(
    String? inviteCode,
  ) {
    if (inviteCode!.length < 6) {
      return 'Invite code must be at least 6 characters long.';
    }

    return null;
  }

  static String? taskTitleValidator(String? title) {
    if (title == null || title.isEmpty) {
      return 'Please fill in the title';
    }

    if (title.length < 3) {
      return 'Title must be at least 3 characters';
    }
    if (title.length > 100) {
      return 'Title cannot exceed 100 characters';
    }

    if (!RegExp(r'^[a-zA-Z0-9\s\W]+$').hasMatch(title)) {
      return 'Only alphabets and numbers are allowed';
    }

    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.toString().isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.toString().length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    if (value.toString().length > 15) {
      return 'Phone number cannot exceed 15 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
      return 'Phone number must contain only digits';
    }
    return null;
  }

  static String? addressValidator(String? address) {
    if (address == null || address.trim().isEmpty) {
      return 'Please enter your address';
    }

    if (address.trim().length < 5) {
      return 'Address must be at least 5 characters long';
    }

    return null;
  }

  static String? licenseValidator(String? license) {
    if (license == null || license.trim().isEmpty) {
      return 'Please enter your license number';
    }

    if (license.trim().length < 6) {
      return 'License number must be at least 6 characters long';
    }

    // Optional: pattern check (alphanumeric)
    final regExp = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regExp.hasMatch(license.trim())) {
      return 'License number must contain only letters and numbers';
    }

    return null;
  }

  static String? titleValidator(String? title) {
    if (title == null || title.trim().isEmpty) {
      return 'Please enter a title';
    }

    // Allow letters, spaces, hyphens, and apostrophes
    final regExp = RegExp(r"^[a-zA-Z\s'-]+$");

    if (!regExp.hasMatch(title.trim())) {
      return 'Title can only contain letters, spaces, hyphens, and apostrophes';
    }

    return null;
  }

  static String? registrationNumberValidator(String? regNo) {
    if (regNo == null || regNo.trim().isEmpty) {
      return 'Please enter your registration number';
    }

    // Optional: Minimum length check (adjust as needed)
    if (regNo.trim().length < 4) {
      return 'Registration number must be at least 4 characters long';
    }

    // Optional: Only alphanumeric pattern
    final regExp = RegExp(r'^[a-zA-Z0-9-]+$');
    if (!regExp.hasMatch(regNo.trim())) {
      return 'Registration number can only contain letters, numbers, and hyphens';
    }

    return null;
  }

  static String? numberOfEmployeesValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the number of employees';
    }

    // Check if input is a valid number
    final number = int.tryParse(value.trim());
    if (number == null) {
      return 'Please enter a valid number';
    }

    // Optional: range check
    if (number <= 0) {
      return 'Number of employees must be greater than 0';
    }

    if (number > 100000) {
      return 'Please enter a realistic number of employees';
    }

    return null;
  }
}
