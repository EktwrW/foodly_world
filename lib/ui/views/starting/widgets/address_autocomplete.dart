// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodly_world/core/blocs/location/location_bloc.dart';
// import 'package:foodly_world/data_models/places/place_suggestion_dm.dart';

// class AddressAutocompleteWidget extends StatefulWidget {
//   const AddressAutocompleteWidget({super.key});

//   @override
//   AddressAutocompleteWidgetState createState() => AddressAutocompleteWidgetState();
// }

// class AddressAutocompleteWidgetState extends State<AddressAutocompleteWidget> {
//   final TextEditingController textEditingValue = TextEditingController();
//   late LocationBloc _locationBloc;

//   @override
//   void initState() {
//     super.initState();
//     _locationBloc = context.read<LocationBloc>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Autocomplete<PlaceSuggestionDM>(
//       fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
//         return TextField(
//           controller: textEditingController,
//           focusNode: focusNode,
//           onSubmitted: (String value) {
//             onFieldSubmitted();
//           },
//         );
//       },
//       optionsBuilder: (TextEditingValue textEditingValue) async {
//         //if (textEditingValue.text == '') {
//         return const Iterable<PlaceSuggestionDM>.empty();
//         //}

//         // final suggestions = await _locationBloc.fetchAddressSuggestions(textEditingValue.text);
//         // return suggestions;
//       },
//       displayStringForOption: (PlaceSuggestionDM suggestion) => suggestion.placeName,
//       onSelected: (PlaceSuggestionDM selection) {
//         log('Selected: ${selection.placeName}');
//         // Aquí puedes actualizar tu UI basado en la selección
//       },
//     );
//   }
// }

//! TODO move this file to another place and rename class