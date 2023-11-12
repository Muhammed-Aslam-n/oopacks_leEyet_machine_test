
// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }
// }
// extension EmailValidator on String {
//   bool isValidEmail(email) {
//     final regex = RegExp(r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$');
//     return regex.hasMatch(email);
//   }
// }

extension EmailValidator on String {
  String? validateEmail(String email) {
    if(email.isEmpty){
      return "Mail can't be empty";
    }
    final regex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$',
    );

    if (!regex.hasMatch(email)) {
      return 'Invalid email format';
    }

    if (!contains('@')) {
      return 'Email must contain the @ symbol.';
    }

    if (!contains('.')) {
      return 'Email must contain a domain (e.g., example.com).';
    }

    return null;
  }
}


extension PasswordValidator on String {
  String? validatePassword(password) {
    if(password.isEmpty){
      return "Password can't be empty";
    }
    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return 'Password must be at least 8 characters long.';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one digit.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(this)) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!RegExp(r'[^A-Za-z0-9]').hasMatch(this)) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }
}

const String hintPassword = 'Your password';
const String hintEmail = 'Your mail - name@example.com';
const String hintFirstName = 'Name must be at least 3 characters';

const String hintLastName = 'Your last name';


