sealed class ApiResult<T> {}

//generic class
class Success<T> extends ApiResult<T> {
  T data;
  Success(this.data);
}

class Error<T> extends ApiResult<T> {
  String error;
  Error(this.error);
}
