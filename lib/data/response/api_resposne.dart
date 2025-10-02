import 'package:winner_trains_app/data/response/status.dart';
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.data, this.message, this.status);
  ApiResponse.loading() : status = Status.LOADING, data = null, message = null;
  ApiResponse.completed(this.data) : status = Status.COMPLETE, message = null;
  ApiResponse.error(this.message) : status = Status.ERROR, data = null;
  @override
  String toString() {
    return "Status: $status \nMessage: $message \nData: $data";
  }
}
