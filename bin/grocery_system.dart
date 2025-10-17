import 'dart:io';

void main() {
  List<Map<String, dynamic>> products = [];
  Map<String, Map<String, dynamic>> invoices = {};
  int invoiceCount = 0;

  print("Welcome to Smart Grocery System");

  while (true) {
    print("\n1. Add product");
    print("2. Show products");
    print("3. Update quantity");
    print("4. Buy products");
    print("5. Show invoices");
    print("6. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      stdout.write("Enter name: ");
      String name = stdin.readLineSync()!;
      stdout.write("Enter price: ");
      double price = double.parse(stdin.readLineSync()!);
      stdout.write("Enter quantity: ");
      int qty = int.parse(stdin.readLineSync()!);

      products.add({"name": name, "price": price, "qty": qty});
      print("Product added!");
    }
      else if (choice == "2") {
      if (products.isEmpty) {
        print("No products yet!");
      } else {
        print("Products List:");
        for (int i = 0; i < products.length; i++) {
          var p = products[i];
          print(
            "${i + 1}. ${p["name"]} - Price: ${p["price"]} - Qty: ${p["qty"]}",
          );
        }
      }
    } else if (choice == "3") {
      stdout.write("Enter product name: ");
      String name = stdin.readLineSync()!;
      var product = products.firstWhere(
        (p) => p["name"].toLowerCase() == name.toLowerCase(),
        orElse: () => {},
      );

      if (product.isEmpty) {
        print("Not found!");
      } else {
        stdout.write("Enter new quantity: ");
        product["qty"] = int.parse(stdin.readLineSync()!);
        print("Updated!");
      }
    } else if (choice == "4") {
      if (products.isEmpty) {
        print("No products to buy!");
        continue;
      }

      stdout.write("Enter your name: ");
      String customer = stdin.readLineSync()!;
      List<Map<String, dynamic>> cart = [];
      double total = 0;

      while (true) {
        stdout.write("Enter product name (or 'done'): ");
        String name = stdin.readLineSync()!;
        if (name.toLowerCase() == "done") break;

        var product = products.firstWhere(
          (p) => p["name"].toLowerCase() == name.toLowerCase(),
          orElse: () => {},
        );

        if (product.isEmpty) {
          print("Not found!");
          continue;
        }

        stdout.write("Enter quantity: ");
        int qty = int.parse(stdin.readLineSync()!);

        if (qty > product["qty"]) {
          print("Not enough in stock!");
          continue;
        }

        num subtotal = qty * product["price"];
        total += subtotal;
        product["qty"] -= qty;

        cart.add({
          "name": name,
          "qty": qty,
          "price": product["price"],
          "total": subtotal,
        });
        print("Added $qty x $name");
      }

      if (cart.isEmpty) continue;

      invoiceCount++;
      invoices["Invoice #$invoiceCount"] = {
        customer: cart,
        "final_total": total,
      };

      print("Total = $total");
      print("Invoice saved!");
    } else if (choice == "5") {
      if (invoices.isEmpty) {
        print("No invoices yet!");
      } else {
        invoices.forEach((key, value) {
          print("\n$key:");
          String customer = value.keys.firstWhere((k) => k != "final_total");
          print("Customer: $customer");
          List items = value[customer];
          for (var i in items) {
            print("- ${i["name"]} x${i["qty"]} = ${i["total"]}");
          }
          print("Total = ${value["final_total"]}");
        });
      }
    } else if (choice == "6") {
      print("Thank you!");
      break;
    } else {
      print("Invalid choice!");
    }
  }
}
