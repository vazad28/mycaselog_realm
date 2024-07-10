part of 'app_failures.dart';

extension ExceptionX on Exception {
  String toLocalizedString() {
    if (this is AuthenticationFailure) {
      return (this as AuthenticationFailure).toLocalizedString();
      // } else if (this is RepositoryFailure) {
      //   return (this as RepositoryFailure).toLocalizedString();
    } else if (this is AppFailure) {
      return (this as AppFailure).toLocalizedString();
    } else {
      return toString();
    }
  }
}
