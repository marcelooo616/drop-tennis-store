class CreditCardValidator {
  static bool validateCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return false;
    }

    if (!luhnAlgorithm(cardNumber)) {
      return false;
    }

    return true;
  }

  static bool luhnAlgorithm(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  static bool validateExpirationDate(String expirationDate) {
    if (expirationDate.length != 5) {
      return false;
    }

    final List<String> parts = expirationDate.split('/');
    if (parts.length != 2) {
      return false;
    }

    final int month = int.tryParse(parts[0]) ?? 0;
    final int year = int.tryParse(parts[1]) ?? 0;

    final DateTime now = DateTime.now();
    if (year < now.year || (year == now.year && month < now.month)) {
      return false;
    }

    if (month < 1 || month > 12) {
      return false;
    }

    return true;
  }

  static bool validateCVV(String cvv) {
    cvv = cvv.trim();

    if (cvv.isEmpty) {
      return false;
    }

    final int cvvValue = int.tryParse(cvv) ?? 0;

    if (cvvValue <= 0) {
      return false;
    }

    return true;
  }

  static bool validarNome(String nome) {
    List<String> partesNome = nome.split(' ');
    if (partesNome.length >= 2) {
      return true; // Nome válido (possui pelo menos um nome e um sobrenome)
    }
    return false; // Nome inválido
  }

}
