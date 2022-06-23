class GetAppsError implements Exception {
  GetAppsError([this.message = 'Unknown getApps error!']);
  final String message;

  factory GetAppsError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return GetAppsError('');
      default:
        return GetAppsError('');
    }
  }
}

class GetAppError implements Exception {
  GetAppError([this.message = 'Unknown getApp error!']);
  final String message;

  factory GetAppError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return GetAppError('');
      default:
        return GetAppError('');
    }
  }
}

class CreateAppError implements Exception {
  CreateAppError([this.message = 'Unknown createApp error!']);
  final String message;

  factory CreateAppError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return CreateAppError('');
      default:
        return CreateAppError('');
    }
  }
}

class UpdateAppError implements Exception {
  UpdateAppError([this.message = 'Unknown updateApp error!']);
  final String message;

  factory UpdateAppError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return UpdateAppError('');
      default:
        return UpdateAppError('');
    }
  }
}

class DeleteAppError implements Exception {
  DeleteAppError([this.message = 'Unknown deleteApp error!']);
  final String message;

  factory DeleteAppError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return DeleteAppError('');
      default:
        return DeleteAppError('');
    }
  }
}
