import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';

class BusinessSnackbars {
  const BusinessSnackbars._();

  static void showInputSearchWdg(
    BuildContext context,
  ) {
    final bloc = context.read<BusinessBloc>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onDismiss: () {},
      content: BlocBuilder<BusinessBloc, BusinessState>(
        builder: (context, state) {
          final vm = state.vm;
          return const SizedBox();
        },
      ),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar.getSnackBar(context));
  }
}
