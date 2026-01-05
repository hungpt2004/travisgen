// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travisgen_client/common/constant/handle_status.dart';
import 'package:travisgen_client/common/utils/dialog_util.dart';
import 'package:travisgen_client/common/utils/toast_util.dart';
import 'package:travisgen_client/common/utils/wrapped_value.dart';

class ErrorState extends Equatable {
  final String? error;
  final Object? exception;
  const ErrorState({this.error, this.exception});

  ErrorState copyWith({String? error, Object? exception}) {
    return ErrorState(error: error ?? this.error, exception: exception ?? this.exception);
  }

  @override
  String toString() => 'ErrorState(error: $error, exception: $exception)';

  @override
  List<Object?> get props => [error, exception];

  Future<dynamic> defHandle(BuildContext context) async {
    if (error != null) {
      ToastUtil.showError(context, text: error);
    } else if (exception != null) {
      // return ExceptionHandler.handleError(exception!, null);
    }
  }
}

class BaseState<T> extends Equatable {
  final HandleStatus status;
  final ErrorState? err;
  final T data;

  const BaseState(this.data, {this.status = HandleStatus.initial, this.err});

  @override
  List<Object?> get props => [status, err, data];

  BaseState<T> copyWith({HandleStatus? status, Wrapped<ErrorState?>? err, T? data}) {
    return BaseState<T>(data ?? this.data, status: status ?? this.status, err: err == null ? this.err : err.value);
  }

  BaseState<T> success(T data) => BaseState<T>(data, status: HandleStatus.success);
  BaseState<T> error(ErrorState err) => copyWith(err: Wrapped.value(err), status: HandleStatus.error);

  BaseState<T> get loading => copyWith(status: HandleStatus.loading, err: const Wrapped.value(null));

  bool get isLoading => status == HandleStatus.loading;

  void handleLoading(BuildContext context) {
    if (isLoading) {
      DialogUtil.showLoading(context);
    } else {
      DialogUtil.hideLoading(context);
    }
  }

  void defHandle(BuildContext context, {void Function(T data)? onSuccess, void Function(ErrorState err)? onError}) {
    switch (status) {
      case HandleStatus.initial:
        DialogUtil.hideLoading(context);
      case HandleStatus.loading:
        DialogUtil.showLoading(context);
      case HandleStatus.success:
        DialogUtil.hideLoading(context);
        onSuccess?.call(data);
      case HandleStatus.error:
        DialogUtil.hideLoading(context);
        (onError ?? (e) => e.defHandle(context))(err!);
    }
  }

  void defHandleManualHideLoading(
    BuildContext context, {
    void Function(T data)? onSuccess,
    void Function(ErrorState err)? onError,
  }) {
    switch (status) {
      case HandleStatus.initial:
        DialogUtil.hideLoading(context);
      case HandleStatus.loading:
        DialogUtil.showLoading(context);
      case HandleStatus.success:
        if (onSuccess != null) {
          onSuccess.call(data);
          return;
        }

        DialogUtil.hideLoading(context);
      case HandleStatus.error:
        if (onError != null) {
          onError.call(err!);
          return;
        }

        DialogUtil.hideLoading(context);
        err?.defHandle(context);
    }
  }
}
