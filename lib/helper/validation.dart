class Validation {
  // Name text field validation
  static nameValidation(value) {
    if (value.isEmpty) {
      return "Enter Your Name";
    }
  }

  // Block chain address text field validation
  static blockChainAddressValidation(value) {
    if (value.isEmpty) {
      return "Enter Your block chain address.";
    }
  }

  // Email text field validation
  static emailValidation(value) {
    if (value.isEmpty) {
      return "Enter Your Email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter valid email";
    }

    return null;
  }

  // Phone text field validation
  static phoneValidation(value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{11}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Enter Your Phone Number";
    } else if (!regExp.hasMatch(value)) {
      return "Enter Valid Phone Number";
    }
  }

  // Password text field validation
  static passwordValidation(value) {
    if (value.isEmpty) {
      return "Enter Your Password";
    } else if (value.length < 8) {
      return "Password At least 8 Characters";
    }
  }
}
