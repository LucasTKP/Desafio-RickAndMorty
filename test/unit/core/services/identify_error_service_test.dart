import 'package:desafio_rickandmorty/core/services/identify_error_service.dart';
import 'package:desafio_rickandmorty/core/services/internal_error_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';
import 'dart:io';

void main() {
  group('identifyError', () {
    test('TimeoutException retorna mensagem de timeout', () {
      final error = TimeoutException('Timeout');
      final result = identifyError(error: error, message: 'Custom message');

      expect(result, contains('Tempo esgotado.\nVerifique sua conexão com a internet.'));
    });

    test('SocketException retorna mensagem apropriada', () {
      final error = SocketException('Connection refused');
      final result = identifyError(error: error, message: 'Custom message');

      expect(result, isNotEmpty);
    });

    test('TypeError retorna "Erro de tipo"', () {
      final error = TypeError();
      final result = identifyError(error: error, message: 'Custom message');

      expect(result, 'Erro de tipo.');
    });

    test('InternalErrorService retorna mensagem customizada', () {
      const customMessage = 'Custom error from service';
      final error = InternalErrorService(message: customMessage);
      final result = identifyError(error: error, message: 'Original message');

      expect(result, customMessage);
    });

    test('Erro genérico retorna mensagem padrão passada', () {
      final error = Exception('Some exception');
      const customMessage = 'Custom message';
      final result = identifyError(error: error, message: customMessage);

      expect(result, customMessage);
    });

    test('identifyError com message vazia', () {
      final error = Exception('Some exception');
      final result = identifyError(error: error, message: '');

      expect(result, '');
    });

    test('TimeoutException retorna string com "timeout"', () {
      final error = TimeoutException('Connection timeout');
      final result = identifyError(error: error, message: 'Timeout error');

      expect(
        result,
        equals('Tempo esgotado.\nVerifique sua conexão com a internet.'),
      );
    });

    test('SocketException com "Connection refused"', () {
      final error = SocketException('Connection refused');
      final result = identifyError(error: error, message: 'Network error');

      expect(result, isNotEmpty);
    });
  });
}
