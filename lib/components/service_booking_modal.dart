import 'package:flutter/material.dart';

class ServiceBookingModal extends StatefulWidget {
  final Function(DateTime, String) onBookingConfirmed;

  const ServiceBookingModal({super.key, required this.onBookingConfirmed});

  @override
  _ServiceBookingModalState createState() => _ServiceBookingModalState();
}

class _ServiceBookingModalState extends State<ServiceBookingModal> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime; // Added to store the selected time
  String? _selectedService;

  final List<String> _services = [
    'Corte de Cabelo',
    'Barba',
    'Tratamento Capilar',
    'Penteado',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectedTime = null; // Reset the selected time when a new date is chosen
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimizes modal height
        children: [
          const Text(
            'Agendar Serviço',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Text color
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button background color
              foregroundColor: Colors.black, // Text color
              side: const BorderSide(color: Colors.black), // Button border
              textStyle: const TextStyle(color: Colors.black), // Forces text color
            ),
            onPressed: () => _selectDate(context),
            child: Text(_selectedDate == null
                ? 'Selecione a Data'
                : 'Data Selecionada: ${_selectedDate!.toLocal().toString().split(' ')[0]}'), // Display the selected date
          ),
          const SizedBox(height: 10),
          // Display the selected date below the button
          if (_selectedDate != null)
            Text(
              'Data: ${_selectedDate!.toLocal().toString().split(' ')[0]}', // Display the selected date
              style: const TextStyle(fontSize: 16, color: Colors.black), // Style of the displayed date
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button background color
              foregroundColor: Colors.black, // Text color
              side: const BorderSide(color: Colors.black), // Button border
              textStyle: const TextStyle(color: Colors.black), // Forces text color
            ),
            onPressed: () => _selectTime(context),
            child: Text(_selectedTime == null
                ? 'Selecione a Hora'
                : 'Hora Selecionada: ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'), // Time formatting
          ),
          const SizedBox(height: 10),
          // Display the selected time below the button
          if (_selectedTime != null)
            Text(
              'Hora: ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}', // Display the selected time
              style: const TextStyle(fontSize: 16, color: Colors.black), // Style of the displayed time
            ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            value: _selectedService,
            hint: const Text('Selecione um Serviço', style: TextStyle(color: Colors.black)), // Hint text color
            isExpanded: true,
            items: _services.map((String service) {
              return DropdownMenuItem<String>(
                value: service,
                child: Text(service, style: const TextStyle(color: Colors.black)), // Dropdown text color
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedService = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button background color
              foregroundColor: Colors.black, // Text color
              side: const BorderSide(color: Colors.black), // Button border
              textStyle: const TextStyle(color: Colors.black), // Forces text color
            ),
            onPressed: () {
              if (_selectedDate != null && _selectedTime != null && _selectedService != null) {
                // Combine the selected date and time into a single DateTime
                DateTime selectedDateTime = DateTime(
                  _selectedDate!.year,
                  _selectedDate!.month,
                  _selectedDate!.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );
                widget.onBookingConfirmed(selectedDateTime, _selectedService!);
                Navigator.pop(context); // Close the modal after confirming
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Por favor, selecione a data, a hora e o serviço',
                      style: TextStyle(color: Colors.black), // SnackBar text color
                    ),
                    backgroundColor: Colors.white, // SnackBar background color
                  ),
                );
              }
            },
            child: const Text('Confirmar Agendamento', style: TextStyle(color: Colors.black)), // Text color
          ),
        ],
      ),
    );
  }
}
