class LineMetadata {
  const LineMetadata({this.color, this.lineType});

  final String? color;
  final String? lineType;
}

const Map<String, String> canonicalLineNameByAlias = <String, String>{
  '1호선': '01호선',
  '01호선': '01호선',
  '2호선': '02호선',
  '02호선': '02호선',
  '3호선': '03호선',
  '03호선': '03호선',
  '4호선': '04호선',
  '04호선': '04호선',
  '5호선': '05호선',
  '05호선': '05호선',
  '6호선': '06호선',
  '06호선': '06호선',
  '7호선': '07호선',
  '07호선': '07호선',
  '8호선': '08호선',
  '08호선': '08호선',
  '9호선': '09호선',
  '09호선': '09호선',
  '경의중앙선': '경의선',
  '경의중앙': '경의선',
  '경의선': '경의선',
  '경춘': '경춘선',
  '수인분당선': '수인분당선',
  '수인분당': '수인분당선',
  '신분당선': '신분당선',
  '신분당': '신분당선',
  '공항': '공항철도',
  '공항철도': '공항철도',
  '경춘선': '경춘선',
  '경강': '경강선',
  '경강선': '경강선',
  '서해선': '서해선',
  '인천1호선': '인천선',
  '인천 1호선': '인천선',
  '인천선': '인천선',
  '인천2호선': '인천2호선',
  '인천 2호선': '인천2호선',
  '우이신설': '우이신설경전철',
  '우이신설선': '우이신설경전철',
  '우이신설경전철': '우이신설경전철',
  '신림선': '신림선',
  '의정부': '의정부경전철',
  '의정부경전철': '의정부경전철',
  '에버라인': '용인경전철',
  '용인에버라인': '용인경전철',
  '용인경전철': '용인경전철',
  '김포골드라인': '김포도시철도',
  '김포도시철도': '김포도시철도',
};

const Map<String, LineMetadata> defaultLineMetadataByName =
    <String, LineMetadata>{
      '01호선': LineMetadata(color: '#0D3692'),
      '02호선': LineMetadata(color: '#00A23F'),
      '03호선': LineMetadata(color: '#EF7C1C'),
      '04호선': LineMetadata(color: '#009BCE'),
      '05호선': LineMetadata(color: '#996CAC'),
      '06호선': LineMetadata(color: '#CD7C2F'),
      '07호선': LineMetadata(color: '#747F00'),
      '08호선': LineMetadata(color: '#E6186C'),
      '09호선': LineMetadata(color: '#A49D87'),
      '경의선': LineMetadata(color: '#77C4A3'),
      '수인분당선': LineMetadata(color: '#FABE00'),
      '신분당선': LineMetadata(color: '#B81B30'),
      '공항철도': LineMetadata(color: '#0079AC'),
      '경춘선': LineMetadata(color: '#0C8E72'),
      '경강선': LineMetadata(color: '#003DA5'),
      '서해선': LineMetadata(color: '#8FC31F'),
      '인천선': LineMetadata(color: '#7CA8D5'),
      '인천2호선': LineMetadata(color: '#ED8B00'),
      '우이신설경전철': LineMetadata(color: '#B7C450'),
      '신림선': LineMetadata(color: '#6789CA'),
      '의정부경전철': LineMetadata(color: '#FDA600'),
      '용인경전철': LineMetadata(color: '#6FB245'),
      '김포도시철도': LineMetadata(color: '#957326'),
    };

String canonicalizeLineName(String? rawName) {
  final String trimmed = rawName?.trim() ?? '';
  if (trimmed.isEmpty) {
    return trimmed;
  }
  return canonicalLineNameByAlias[trimmed] ?? trimmed;
}
