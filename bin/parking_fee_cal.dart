import 'dart:io';

void main() {
  print("Enter parking hours:");
  int hours = int.parse(stdin.readLineSync()!);

  print("Enter day :");
  String day = stdin.readLineSync()!.toLowerCase();

  int cost = 0;

  
  if (hours <= 2) {
    cost = 0;
  } else if (hours <= 5) {
    cost = (hours - 2) * 10;
  } else {
    cost = (3 * 10) + (hours - 5) * 20;
  }

  
  if (day == "thursday" || day == "friday") {
    cost += 50;
  }

  print("Total parking cost: $cost");
}
