class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;
  // use _ is for private variable, 

  BankAccount(this.accountId, this.accountOwner, this._balance);


  double get balance => _balance;

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception('Insufficient balance for withdrawal!');
      // throw exception mean stopping the program and shouting error in ur code paro
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance = balance + amount;
  }
}

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {};

 Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      // account.containskey is for creating another account with the same id, it will throw an exception
      throw Exception("Account with ID $accountId already exists!");
    }

    BankAccount newAccount = BankAccount(accountId, accountOwner, 0);
    // _accounts is a map that stores all the bank accounts, with the account ID as the key and the BankAccount object as the value
    _accounts[accountId] = newAccount;
    return newAccount;
  }
  
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

   print(ronanAccount.balance); // Balance: $0
   ronanAccount.credit(100);
   print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
   print(ronanAccount.balance); // Balance: $50

   try {
  ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
  print(e); // Output: Insufficient balance for withdrawal!
   }

  try {
   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
   }
}
