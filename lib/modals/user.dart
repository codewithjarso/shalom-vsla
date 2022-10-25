class UserFields {
  static final String firstname = 'firstname';
  static final String id = 'IdNo';
  static final String account = 'Account';
  static final String amount = 'Amount';
  static final String loanType = 'LoanType';
  static final String phone = 'Phone';
  static final String lastname = 'lastname';

  static List<String> getFields() =>
      [firstname, id, account, amount, loanType, phone, lastname];
}

class User {
  final String firstname;
  final String id;
  final String accountNo;
  final String amount;
  final String loanType;
  final String phone;
  final String lastname;

  User(
      {required this.firstname,
      required this.id,
      required this.accountNo,
      required this.amount,
      required this.loanType,
      required this.phone,
      required this.lastname});
  Map<String, dynamic> toJson() => {
        UserFields.firstname: firstname,
        UserFields.id: id,
        UserFields.account: accountNo,
        UserFields.amount: amount,
        UserFields.loanType: loanType,
        UserFields.phone: phone,
        UserFields.lastname: lastname,
      };
}
