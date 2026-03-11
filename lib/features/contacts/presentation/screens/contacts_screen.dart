import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_x.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.contacts)),
      body: Center(child: Text(context.l10n.contactsNotImplemented)),
    );
  }
}
