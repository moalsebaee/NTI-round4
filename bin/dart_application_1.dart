import 'dart:io';

void main() {
  int balance = 1000; 
  int option; 

  print("Welcome to Simple ATM");
  print("Your starting balance is $balance");

  while (true) {
    print("\nChoose an option:");
    print("1. Check Balance");
    print("2. Withdraw");
    print("3. Deposit");
    print("4. Exit");

    stdout.write("Enter your option: ");
    option = int.parse(stdin.readLineSync()!);

    if (option == 1) {
      
      print("Your current balance is: $balance");
    } 
    else if (option == 2) {
      
      stdout.write("Enter amount to withdraw: ");
      int amount = int.parse(stdin.readLineSync()!);

      if (amount > balance) {
        print("Insufficient balance! Your current balance is $balance");
      } else if (amount <= 0) {
        print("Invalid amount!");
      } else {
        balance -= amount;
        print("Withdrawal successful! Your current balance is $balance");
      }
    } 
    else if (option == 3) {
      
      stdout.write("Enter amount to deposit: ");
      int amount = int.parse(stdin.readLineSync()!);

      if (amount <= 0) {
        print("Invalid amount!");
      } else {
        balance += amount;
        print("Deposit successful! Your current balance is $balance");
      }
    } 
    else if (option == 4) {
      
      print("Thank you for using the ATM!");
      break;
    } 
    else {
      
      print("Invalid option!");
    }
  }
}
