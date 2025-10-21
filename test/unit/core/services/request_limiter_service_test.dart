import 'package:desafio_rickandmorty/core/services/internal_error_service.dart';
import 'package:desafio_rickandmorty/core/services/request_limiter_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RequestLimiterService', () {
    late RequestLimiterService requestLimiter;

    setUp(() {
      requestLimiter = RequestLimiterService.instance;
      requestLimiter.quantityRequests = 0;
      requestLimiter.lastRequest = DateTime.now();
    });

    test('verify() permite requisição se abaixo do limite', () {
      requestLimiter.quantityRequests = 0;

      expect(
        () => requestLimiter.verify(action: 'Test action'),
        returnsNormally,
      );
      expect(requestLimiter.quantityRequests, 1);
    });

    test('verify() incrementa quantityRequests', () {
      requestLimiter.quantityRequests = 0;

      requestLimiter.verify(action: 'First request');
      expect(requestLimiter.quantityRequests, 1);

      requestLimiter.verify(action: 'Second request');
      expect(requestLimiter.quantityRequests, 2);
    });

    test('verify() lança exceção ao atingir limite', () {
      requestLimiter.quantityRequests = 300;

      expect(
        () => requestLimiter.verify(action: 'Over limit request'),
        throwsA(isA<InternalErrorService>()),
      );
    });

    test('verify() com quantityRequests = 299 funciona', () {
      requestLimiter.quantityRequests = 299;

      expect(
        () => requestLimiter.verify(action: 'Test action'),
        returnsNormally,
      );
      expect(requestLimiter.quantityRequests, 300);
    });

    test('verify() com quantityRequests = 300 lança erro', () {
      requestLimiter.quantityRequests = 300;

      expect(
        () => requestLimiter.verify(action: 'Test action'),
        throwsA(isA<InternalErrorService>()),
      );
    });

    test('maxQuantityRequestsMinute é 300', () {
      expect(requestLimiter.maxQuantityRequestsMinute, 300);
    });

    test('verify() com diferentes actions', () {
      requestLimiter.quantityRequests = 0;

      expect(
        () => requestLimiter.verify(action: 'GET /api/character'),
        returnsNormally,
      );

      expect(
        () => requestLimiter.verify(action: 'POST /api/data'),
        returnsNormally,
      );
    });

    test('verify() mantém estado após múltiplas chamadas', () {
      requestLimiter.quantityRequests = 0;

      for (int i = 0; i < 10; i++) {
        requestLimiter.verify(action: 'Request $i');
      }

      expect(requestLimiter.quantityRequests, 10);
    });
  });
}
