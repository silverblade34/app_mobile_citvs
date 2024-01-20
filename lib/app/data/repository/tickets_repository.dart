import 'package:citvs/app/data/models/tickets/response_tickets.dart';
import 'package:citvs/app/data/providers/tickets_provider.dart';

TicketsProvider ticketsProvider = TicketsProvider();

class TicketsRepository {
  Future<ResponseTickets> getDataTickets(
      String token, int campusId, String dateFrom, String dateTo) async {
    final response =
        await ticketsProvider.getDataTickets(token, campusId, dateFrom, dateTo);

    // Verificar si response.body es null
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;
    ResponseTickets ticketsData = ResponseTickets.fromJson(body);
    return ticketsData;
  }
}
