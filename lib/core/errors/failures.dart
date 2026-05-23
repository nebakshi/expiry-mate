/// Domain-level failures. Repositories/services translate raw exceptions
/// (FirebaseException, SocketException, etc.) into these so the presentation
/// layer never depends on infrastructure details.
sealed class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => message;
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Not found.']);
}

class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

class PlanLimitFailure extends Failure {
  const PlanLimitFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Something went wrong.']);
}

/// Lightweight Result type so use-cases can return success or failure without
/// throwing across layers.
sealed class Result<T> {
  const Result();
  bool get isSuccess => this is Success<T>;
}

class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;
}
