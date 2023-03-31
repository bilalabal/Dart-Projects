import 'dart:io';

Map<String, String> registeredUsers = {}; // Create an empty map called registeredUsers.

bool addUserToRegisteredUsers(String username, String password) {
  if (password.length >= 8) { // Check if the length of the password is 8 or more characters.
    registeredUsers[username] = password; // Add the username and password to the registeredUsers map.
    return true;
  } else {
    return false;
  }
}

bool isUserRegistered(String username, Map<String, String> registeredUsers) {
  return registeredUsers.containsKey(username);
}

bool isPasswordCorrect(String username, String password) {
  if (registeredUsers.containsKey(username) && registeredUsers[username] == password) {
    return true;
  } else {
    return false;
  }
}


String scrambleWord(String word) {
  List<String> letters = word.split('');
  letters.shuffle();
  return letters.join();
}

void playGame() {
  // Prompt the user to enter their username and password
  String username = getUserInput("Enter your username: ");
  String password = getUserInput("Enter your password: ");
  
  // Check if the entered username is registered and the entered password is correct
  if (!isUserRegistered(username, registeredUsers)) {
    print("Username not found. Please try again.");
    return;
  }
  if (!isPasswordCorrect(username, password)) {
    print("Incorrect password. Please try again.");
    return;
  }
  
  // Display a welcome message and prompt the user to enter their name
  
  String name = getUserInput("Enter your name: ");
  print("Welcome, $name!");
  
  // Display the instructions for the game
  print("Instructions: You will be given a scrambled word, and you must unscramble it to form a valid word.");
  
  // Define a list of words
  List<String> words = ["apple", "banana", "cherry", "orange", "pear"];
  
  // Define a variable called score and set it to 0
  int score = 0;
  
  // Loop through the list of words
  for (String word in words) {
    // Scramble the current word using the scrambleWord function
    String scrambledWord = scrambleWord(word);
    
    // Prompt the user to unscramble the word and get their answer
    String answer = getUserInput("Unscramble this word: $scrambledWord: ");
    
    // Check if the answer is correct
    if (answer == word) {
      // Update the score and display a message with the updated score
      score++;
      print("Correct! Your score is now $score.");
    } else {
      // Display a message indicating the answer is incorrect
      print("Incorrect. The correct answer is $word.");
    }
  }
  
  // After looping through all the words, display the final score
  print("Game over! Your final score is $score.");
}


String getUserInput(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!.trim();
}

void main() {
  // create an empty map called registeredUsers
  // Map<String, String> registeredUsers = {};

  // add three users to the registeredUsers map using the addUserToRegisteredUsers function
  addUserToRegisteredUsers('user1', 'password1');
  addUserToRegisteredUsers('user2', 'password2');
  addUserToRegisteredUsers('user3', 'password3');

  // call the playGame function to start the game
  playGame();
}
