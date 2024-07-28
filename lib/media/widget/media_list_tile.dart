import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';

import '../../media_gallery/media_gallery.dart';

class MediaListTile extends StatelessWidget {
  const MediaListTile(
      {required this.caseModel, required this.mediaModel, super.key,});

  final CaseModel caseModel;
  final MediaModel mediaModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Thumbnail(
          mediaModel: mediaModel,
        ),
      ),
      title: Text(caseModel.diagnosis ?? S.of(context).noTitle),
      subtitle: Text(caseModel.surgery ?? S.of(context).noTitle),
    );
  }
}
