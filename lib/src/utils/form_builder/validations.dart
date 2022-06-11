class Validations {
  Function email() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
  }

  Function password() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
  }

  Function confirmPassword() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
  }
}
