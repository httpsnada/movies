bool isValidEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email);
}

bool isValidPhone(String? phone) {
  if (phone == null || phone.isEmpty) {
    return false;
  }
  return RegExp(r'^[0-9]{11}$').hasMatch(phone);
}
