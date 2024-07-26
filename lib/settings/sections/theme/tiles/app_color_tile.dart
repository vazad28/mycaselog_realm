// part of '../theme_section.dart';

// class AppColorTile extends ConsumerWidget {
//   const AppColorTile({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final seedColorHex =
//         ref.watch(settingsNotifierProvider.select((value) => value.seedColorHex));

//     return SettingsTile(
//       title: S.of(context).changeColor,
//       leading: const Icon(Icons.color_lens),
//       trailing: DropdownButton<Color>(
//         value: seedColorHex.hexToColor(),
//         alignment: Alignment.centerRight,
//         onChanged: (color) {
//           if (color != null) {
//             ref
//                 .watch(settingsNotifierProvider.notifier)
//                 .on(SettingsEvent.updateThemeColor(color.toHex()));
//           }
//         },
//         underline: const SizedBox.shrink(),
//         items: AppColors.colors
//             .map(
//               (color) => DropdownMenuItem<Color>(
//                 value: color,
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: color,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         color.toHex().toUpperCase(),
//                         style: TextStyle(
//                           color: color.computeLuminance() > 0.5
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
