import 'dart:io';  // Import dart:io to use input/output 
void main() {  
  print("Welcome to Tech Store");   // Print welcome message with new line
 
  stdout.write("Enter your name: ");  // Ask user to enter their name (no new line)
  
  String? name = stdin.readLineSync();  
  // String? → variable can hold text OR null (nullable)
  // readLineSync() → reads input from user
  print("Hi $name ");  // $name → insert variable value into the string
  
  Map<int, Map<String, dynamic>> products = {  
    // Map (dictionary): key = int, value = another map
    1: {"name": "Laptop", "price": 1500},
    2: {"name": "Mobile", "price": 800},
    3: {"name": "Keyboard", "price": 100},
    4: {"name": "Mouse", "price": 50}
  };
  List<Map<String, dynamic>> cart = [];  
  // Empty list to store items the user selects (cart)
  void showProducts() {  // Function to display products
    print("\nProducts:");
    print("1. Laptop - \$1500");
    print("2. Mobile - \$800");
    print("3. Keyboard - \$100");
    print("4. Mouse - \$50");
  }

  void addItem() {  // Function to add product to the cart
    stdout.write("Choose product number: ");  
    String? pn = stdin.readLineSync();   // pn → product number (as string, nullable)
    stdout.write("How many? ");  
    String? q = stdin.readLineSync();   // q → quantity (as string, nullable)
    
    cart.add({
      "name": products[int.parse(pn!)]!["name"],   
      // pn! → product number is NOT null
      // int.parse(pn) → convert string to int (e.g. "1" → 1)
      // products[...]! → product is not null
      "price": products[int.parse(pn)]!["price"],
      "qty": int.parse(q!)  
      // q! → q is NOT null, then convert to int
    });
  }

  showProducts();  // Show product list
  addItem();  // Let user add first item
  stdout.write("Another product? (yes/no): ");  
  String? ans1 = stdin.readLineSync();   // Ask if user wants another product
  if (ans1 == "yes") {  
    showProducts();
    addItem();
    stdout.write("Another product? (yes/no): ");  
    String? ans2 = stdin.readLineSync();
    if (ans2 == "yes") {  
      showProducts();
      addItem();
    }
  }

  print("\nYour Cart:");  // Show items in the cart
  num total = 0;   // total → sum of prices (num can be int or double)
 
 if (cart.isNotEmpty) {  
  dynamic i1 = cart[0];  // get first item in cart
  num t1 = i1['price'] * i1['qty'];   // calculate price * quantity
  print("${i1['name']} x${i1['qty']} = \$${t1}"); // show item name, qty, total
  total += t1;  // add to total 
}

if (cart.length > 1) {  
  dynamic i2 = cart[1];  // get second item if exists
  num t2 = i2['price'] * i2['qty'];  // calculate price * quantity
  print("${i2['name']} x${i2['qty']} = \$${t2}");
  total += t2;
}

if (cart.length > 2) {  
  dynamic i3 = cart[2];  // get third item if exists
  num t3 = i3['price'] * i3['qty'];
  print("${i3['name']} x${i3['qty']} = \$${t3}");
  total += t3;
}

  print("Total = \$${total}");  // Show total price
  
  /* Shorter way with loop (optional)
  for (var item in cart) {
    num totalItem = item['price'] * item['qty'];
    print("${item['name']} x${item['qty']} = \$${totalItem}");
    total += totalItem;
  }
  */

  print("\nPayment: 1. Visa  2. Cash"); // Ask payment method 
  stdout.write("Choose (1/2): ");
  String? pay = stdin.readLineSync();   

  if (pay == "1") {  // If Visa chosen → ask card details
    stdout.write("Card name: ");
    String? cname = stdin.readLineSync();
    stdout.write("Card number: ");
    String? cnum = stdin.readLineSync();
    stdout.write("CVV (3 num only): ");
    String? cvv = stdin.readLineSync();

    print("\nThanks $name, payment successful ");
  } else {  
    print("\nPlease pay cash on delivery ");// If Cash chosen
  }
  print("\nThank you for shopping with us, $name ");   // Final message after shopping
 
}