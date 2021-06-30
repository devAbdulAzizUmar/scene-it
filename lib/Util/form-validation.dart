class FormValidation {
  String validatePostTitle(String title) {
    if (title.isEmpty)
      return "Please enter title.";
    else if (title.length < 3)
      return "Title must be at least 3 characters.";
    else if (title.length > 25)
      return "Title must be less than 16 characters.";
    else
      return null;
  }

  String validatePostDescription(String description) {
    if (description.isEmpty)
      return "Please enter a description.";
    else if (description.length < 10)
      return "Description is too short.";
    else
      return null;
  }
}
