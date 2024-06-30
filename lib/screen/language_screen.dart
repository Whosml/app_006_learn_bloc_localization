import 'package:app_006_learn_bloc_localization/bloc/localization_bloc.dart';
import 'package:app_006_learn_bloc_localization/generated/l10n.dart';
import 'package:app_006_learn_bloc_localization/screen/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var groupValue = context.read<LocalizationBloc>().state.locale.languageCode;
    return BlocConsumer<LocalizationBloc, LocalizationState>(
      listener: (context, state) {
        groupValue = state.locale.languageCode;// TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.language),
          ),
          body: ListView.builder(
              itemCount  : languageModel.length,
              itemBuilder: (context, index) {
                var item = languageModel[index];
                return RadioListTile(
                  value     : item.languageCode,
                  groupValue: groupValue,
                  title     : Text(item.language),
                  subtitle  : Text(item.subLanguage),
                  onChanged : (value) {BlocProvider.of<LocalizationBloc>(context).add(LoadLocalization(Locale(item.languageCode)));}
                );
              }),
        );
      },
    );
  }
}
