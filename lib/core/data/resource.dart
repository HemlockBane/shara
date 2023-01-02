class Resource<T> {
  Resource._(this.data);

  factory Resource.success(T? data) = _Success<T>;

  factory Resource.failure({String? errorMessage, T? data}) = _Failure<T>;

  factory Resource.loading() = _Loading<T>;

  bool isSuccess() => this is _Success<T>;
  bool isLoading() => this is _Loading<T>;
  bool isFailure() => this is _Failure<T?>;

  final T? data;
}

class _Success<T> extends Resource<T> {
  _Success(T? data) : super._(data);
}

class _Loading<T> extends Resource<T> {
  _Loading() : super._(null);
}

class _Failure<T> extends Resource<T> {
  _Failure({this.errorMessage, T? data}) : super._(data);

  final String? errorMessage;
}
