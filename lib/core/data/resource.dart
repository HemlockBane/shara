class Resource<T> {
  Resource._(this.data);

  factory Resource.success(T? data) = Success<T>;

  factory Resource.failure({String? errorMessage, T? data}) = Failure<T>;

  factory Resource.loading() = Loading<T>;

  bool isSuccess() => this is Success<T>;

  bool isLoading() => this is Loading<T>;

  bool isFailure() => this is Failure<T?>;


  final T? data;
}

class Success<T> extends Resource<T> {
  Success(T? data) : super._(data);
}

class Loading<T> extends Resource<T> {
  Loading() : super._(null);
}
class Failure<T> extends Resource<T> {
  Failure({this.errorMessage, T? data}) : super._(data);

  final String? errorMessage;
}
