import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/supabase_service.dart';
import '../models/contact_input_model.dart';

import '../../../core/networking/supabase_constants.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit(this._service) : super(const ContactState.initial());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final SupabaseService _service;

  void clear() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  void submit(ContactInputModel contact) async {
    emit(const ContactState.loading());
    final res = await _service.sendData(
      table: SupabaseConstants.contact,
      data: contact.toJson(),
    );
    res.fold(
      (l) => emit(ContactState.error(l.errMsg)),
      (r) => emit(const ContactState.sent()),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    return super.close();
  }
}
