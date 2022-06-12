Map<dynamic, dynamic> getFormProps({required String formType}) {
  switch (formType) {
    case 'authentication':
      return {
        'width': 350,
      };
    default:
      return {
        'width': 1000,
      };
  }
}
