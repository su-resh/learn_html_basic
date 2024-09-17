class QuizValidator {
  // List of correct answers for validation
  static final List<String> correctAnswers = [
    "a", // Answer for Question 1
    "b", // Answer for Question 2
    "c", // Answer for Question 3
    // Add more correct answers as needed
  ];

  // Check if the name is valid
  static bool isNameValid(String name) {
    return name.trim().isNotEmpty;
  }

  // Check if all quiz answers are valid
  static bool areQuizzesValid(List<String> selectedAnswers) {
    return selectedAnswers.length == correctAnswers.length &&
        selectedAnswers.every((answer) => answer.isNotEmpty);
  }

  // Check if all selected answers are correct
  static bool areAnswersCorrect(List<String> selectedAnswers) {
    for (int i = 0; i < correctAnswers.length; i++) {
      if (selectedAnswers[i] != correctAnswers[i]) {
        return false; // An answer is incorrect
      }
    }
    return true; // All answers are correct
  }

  // Validate the form including name, quiz answers, and correctness
  static String? validateForm(String name, List<String> selectedAnswers) {
    if (!isNameValid(name) && !areQuizzesValid(selectedAnswers)) {
      return "Please answer all quiz questions and enter your name.";
    } else if (!isNameValid(name)) {
      return "Please enter your name.";
    } else if (!areQuizzesValid(selectedAnswers)) {
      return "Please answer all quiz questions.";
    } else if (!areAnswersCorrect(selectedAnswers)) {
      return "Some quiz answers are incorrect.";
    }
    return null; // No errors, proceed
  }
}
