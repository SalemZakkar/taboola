class Validations {
  static bool checkNumber(String num) {
    try {
      int.parse(num);
      return true;
    } catch (e) {
      return false;
    }
  }
  static bool checkName(String name) {
    return (name.isNotEmpty && name.contains(RegExp("[A-z]")) && name.contains("/")==false  && name.contains(r"\") ==false && name.contains(" ") == false ? true : false);
  }
  static bool checkPassword(String password){
    return (password.isNotEmpty && password.contains(" ") == false && (password.length<6) == false);
  }
  static bool checkEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) && email.contains(" ") == false;
    return emailValid;
  }
}
