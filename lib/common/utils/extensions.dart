import 'package:flutter/material.dart';

extension WhenX<T> on AsyncSnapshot<T> {
  R when<R>({
    required R Function(T data) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
  }) {
    if (hasError && !hasData) {
      return error(this.error!, stackTrace!);
    }
    if (!this.hasData) {
      return loading();
    }
    return data(this.data!);
  }
}
