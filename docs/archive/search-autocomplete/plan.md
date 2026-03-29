# Plan: Search Autocomplete And Localized Default Placeholder

## Goal
- 이 작업으로 해결하려는 사용자 문제:
  Search input에서 역명을 입력하기 시작했을 때 현재 설정 언어 기준으로 관련 역 후보를 바로 확인하고 선택할 수 있어야 한다.
- 기대 결과:
  출발/도착 입력창에서 1글자 입력만으로 추천 목록이 보이고, 기본 예시 역명은 실제 값이 아니라 회색 placeholder로만 표시된다.
- 왜 지금 필요한지:
  현재 검색 화면은 출발 input에 기본값이 실제로 들어가 있어 입력 의도를 흐리고, 역명 입력 보조가 없어 검색 시작 비용이 높다.

## Non-Goals
- 이번 작업에서 하지 않을 것:
  DB 스키마 변경
- 이번 작업에서 하지 않을 것:
  서버/API 기반 autocomplete
- 이번 작업에서 하지 않을 것:
  오타 교정, 초성 검색, fuzzy matching
- 후속 작업으로 미룰 것:
  추천 랭킹 고도화
- 후속 작업으로 미룰 것:
  최근 검색/즐겨찾기 기반 추천

## Requirements

### Functional Requirements
- Search input은 설정된 언어 기준으로 역명 후보를 추천해야 한다.
- 추천 목록은 1글자 입력 시점부터 보여야 한다.
- 초기 구현은 데이터 수가 많지 않으므로 단순 `filter` 기반으로 처리한다.
- 추천 항목을 탭하면 해당 값이 input에 반영되어야 한다.
- Search UI의 기본 출발역 텍스트는 실제 입력값에서 제거해야 한다.
- 기본 예시 역명은 언어별 `서울역`에 해당하는 문자열로 회색 placeholder 처리해야 한다.

### Technical Requirements
- 역 추천 데이터는 기존 `stations` 테이블의 다국어 컬럼을 재사용한다.
- 제출 시점에는 기존처럼 한국어 canonical station name으로 정규화하는 흐름을 유지한다.
- `StationSearchLookup`은 매 화면/요청마다 다시 로드하지 않고, 앱 런타임 동안 재사용 가능한 캐시 또는 provider 형태로 공유한다.
- 현재 설정 언어 변경 시 placeholder와 추천 기준은 즉시 바뀌어야 한다.
- 사용자 입력 중인 실제 텍스트는 언어 변경 시 자동으로 덮어쓰지 않는다.

## Current Context
- 현재 동작:
  `SearchPage`는 출발 input을 `searchDefaultOrigin` 값으로 초기화하고 있다.
- 현재 문제:
  `서울역`이 placeholder가 아니라 실제 입력값이어서 사용자가 아무것도 입력하지 않아도 출발역이 채워진 상태가 된다.
- 현재 문제:
  `StationSearchLookup`은 입력값을 canonical Korean으로 변환하는 역할만 있고, 추천 목록을 위한 검색 API는 아직 없다.
- 관련 파일/모듈:
  `lib/features/search/presentation/search_page.dart`
- 관련 파일/모듈:
  `lib/features/search/domain/station_search_lookup.dart`
- 관련 파일/모듈:
  `lib/features/settings/domain/app_strings.dart`
- 관련 문서:
  `docs/domain/db/db.md`

## Proposed Approach
- 전체 접근 방식:
  검색 도메인에 언어별 추천 엔트리와 단순 필터링 로직을 추가하고, `StationSearchLookup`은 provider 또는 캐시된 lookup으로 공용화한 뒤 Search UI에서 입력값 길이 1 이상일 때 추천 목록을 노출한다.
- 데이터 모델 변경 여부:
  없음. 기존 `stations.name_ko`, `name_en`, `name_jp`, `name_ch`를 그대로 사용한다.
- UI 변경 여부:
  있음. 출발 input의 초기값 주입을 제거하고, 언어별 placeholder와 추천 목록 UI를 추가한다.
- 기존 코드 영향 범위:
  Search 화면 입력 UX, station lookup 도메인, 문자열 리소스 사용 방식에 영향이 있다. Route 요청 시 정규화 흐름은 유지한다.

## Milestones

### M1. Lookup 확장 및 추천 규칙 정의
- 목적:
  현재 언어 기준으로 추천 가능한 역명 목록과 필터링 API를 제공하고, lookup 재사용 구조를 정의한다.
- 포함 범위:
  `StationSearchLookup`에 추천용 엔트리 구성, normalized query 비교, 언어 우선 표시 문자열 선택 로직 추가
- 포함 범위:
  `StationSearchLookup`을 Search 화면과 Route 요청 정규화에서 함께 쓸 수 있도록 provider 또는 캐시된 인스턴스 구조로 정리
- 포함 범위:
  단순 정렬 규칙 정의
  `startsWith` 일치 우선, 그다음 `contains` 일치, 마지막은 원본 로드 순서 유지
- 제외 범위:
  fuzzy matching, typo tolerance, 초성 검색
- 완료 조건:
  1글자 입력으로 추천 결과를 반환할 수 있고, 현재 언어에 따라 표시 문자열이 달라지며, lookup이 매번 DB 전체를 다시 읽지 않도록 재사용 경로가 정리된다.

### M2. Search UI autocomplete 연결
- 목적:
  출발/도착 input에서 추천 목록을 실제로 보여주고 선택 가능하게 만든다.
- 포함 범위:
  출발 input 초기값 제거
- 포함 범위:
  `searchDefaultOrigin`을 placeholder 용도로만 사용
- 포함 범위:
  focus/input 상태에 따라 추천 목록 표시
- 포함 범위:
  추천 선택 시 controller 값 반영 및 목록 닫기
- 제외 범위:
  별도 검색 결과 페이지 추가
- 완료 조건:
  사용자가 입력 1글자만으로 추천을 보고 선택할 수 있으며, 기본 예시 역명은 회색 placeholder로만 보인다.

### M3. 다국어 동기화 및 회귀 검증
- 목적:
  언어 전환과 기존 route 요청 흐름이 함께 안전하게 유지되는지 확인한다.
- 포함 범위:
  언어 변경 시 placeholder와 추천 기준 동기화
- 포함 범위:
  선택된 역명 또는 직접 입력값이 기존 canonical Korean 정규화와 충돌하지 않는지 확인
- 포함 범위:
  Search autocomplete와 Route 요청이 동일한 cached lookup/provider를 사용해도 동작 차이가 없는지 확인
- 포함 범위:
  테스트 추가 또는 기존 테스트 확장
- 제외 범위:
  route 화면 자체의 UX 변경
- 완료 조건:
  언어 변경, 추천 선택, 직접 입력, 빈 입력 에러 흐름이 모두 의도대로 동작한다.

## Risks / Open Questions
- “순서대로”의 정확한 기준이 아직 열려 있다.
- 이번 계획에서는 `prefix match > contains match > 데이터 원순서`를 기본안으로 둔다.
- 동일한 표시명 또는 동일 canonical station이 여러 row로 존재할 때 중복 제거 기준이 필요하다.
- 이번 범위에서는 canonical Korean 기준 dedupe가 가장 단순하다.
- Flutter 기본 `Autocomplete` 위젯을 사용할지, 현재 디자인을 유지하기 위한 커스텀 suggestion list를 사용할지 구현 시점에 선택이 필요하다.
- lookup을 어느 계층에서 캐시할지 결정이 필요하다.
- 현재 우선안은 Riverpod provider로 1회 로드 후 Search/Route 양쪽에서 공유하는 방식이다.

## Validation
- 수동 확인 포인트:
  검색 화면 진입 시 출발 input은 비어 있고, 회색 placeholder만 보여야 한다.
- 수동 확인 포인트:
  언어를 `en`, `zh-Hans`, `ja`로 바꾸면 placeholder가 각각 `Seoul Station`, `首尔站`, `ソウル駅`로 바뀌어야 한다.
- 수동 확인 포인트:
  출발/도착 input에서 1글자 입력 시 추천 목록이 표시되어야 한다.
- 수동 확인 포인트:
  추천 항목 선택 시 input 값이 정상 반영되어야 한다.
- 수동 확인 포인트:
  추천 선택 후 route 요청이 기존처럼 정상 동작해야 한다.
- 수동 확인 포인트:
  동일 세션에서 여러 번 검색해도 lookup 재로딩으로 인한 눈에 띄는 지연이 없어야 한다.
- 수동 확인 포인트:
  입력 없이 진행하면 기존 역 필수 입력 에러가 유지되어야 한다.
