import 'dart:io';

void main() {
  stdout.write("Enter speed limit: ");
  int speedLimit = int.parse(stdin.readLineSync()!);

  stdout.write("Enter actual speed: ");
  int actualSpeed = int.parse(stdin.readLineSync()!);

  stdout.write("Do you have a license? (yes/no): ");
  String hasLicense = stdin.readLineSync()!.toLowerCase();

  int fine = 0;
  int overSpeed = actualSpeed - speedLimit;

  if (overSpeed > 20) {
    fine = 1000;
  } else if (overSpeed > 0) {
    fine = 500;
  }

  if (hasLicense == "no") {
    fine += 500;
  }

  print("\nYour total fine is: $fine ");
}
