part of 'stats_search_bar.dart';

class StatsSearchPhraseQuery {
  StatsSearchPhraseQuery({required this.title, required this.params});

  final String params;
  final String title;
}

class StatsSearchPhrases {
  static final List<StatsSearchPhraseQuery> items = [
    StatsSearchPhraseQuery(
      title: 'All joints',
      params:
          'tka OR tha OR tsa OR ((knee OR hip OR shoulder) AND (total OR arthroplasty OR replacement OR hemi*))',
    ),
    StatsSearchPhraseQuery(
      title: 'Total knee',
      params:
          'tka OR (knee AND (total OR arthroplasty OR replacement OR hemi*))',
    ),
    StatsSearchPhraseQuery(
      title: 'Total hip',
      params:
          'tha OR (hip AND (total OR arthroplasty OR replacement OR bipolar OR hemi*))',
    ),
    StatsSearchPhraseQuery(
      title: 'Total Shoulder',
      params:
          'tsa OR (shoulder AND (total OR arthroplasty OR replacement OR reverse OR hemi*))',
    ),
    StatsSearchPhraseQuery(
      title: 'Ankle fracture',
      params:
          '(malleolus OR malleolar OR fibular OR bimalleolar OR trimalleolar) AND fracture',
    ),
    StatsSearchPhraseQuery(title: 'All fractures', params: 'fracture'),
    StatsSearchPhraseQuery(title: 'All arthroscopy', params: 'arthroscop*'),
    StatsSearchPhraseQuery(
      title: 'Shoulder arthroscopy',
      params: 'shoulder AND arthroscop*',
    ),
    StatsSearchPhraseQuery(
      title: 'Knee arthroscopy',
      params: 'knee AND arthroscop*',
    ),
    StatsSearchPhraseQuery(
      title: 'Ankle arthroscopy',
      params: 'ankle AND arthroscop*',
    ),
  ];
}
