Map<dynamic, dynamic> getFormProps({required String type}) {
  switch (type) {
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
