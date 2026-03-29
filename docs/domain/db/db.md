# DB Plan

현재 기준에서 DB는 "기본 역/노선 seed 저장소"를 넘어서 route parsing과 route view 구성에 직접 쓰이고 있다. 이 문서는 실제 스키마와 현재 사용 범위만 간단히 정리한다.

## Current Status

현재 DB에 있는 핵심 테이블:
- `stations`
- `lines`
- `line_stations`
- `direction_policies`
- `station_transition_overrides`

현재 importer가 채우는 asset:
- `subway_line_info.json`
- `full_route_info.csv`
- `branch_keys.csv`
- `direction_policies.csv`
- `station_transition_overrides.csv`

현재 runtime에서 실제로 쓰는 것:
- `lines.color`
  - 노선 색상 조회
- `line_stations`
  - branch 후보 계산
  - main branch fallback
  - `nextNegativeStationName` 계산
- `direction_policies`
  - direction label 해석
  - `directionNegativeExamplesText` 계산
- `station_transition_overrides`
  - 분기 구간 branch 보정
- `stations`
  - 역명 다국어 표시 lookup

## Table Summary

### `stations`

역명 기준 마스터 테이블이다.

유지하는 컬럼:
- `name_ko`
- `name_en`
- `name_jp`
- `name_ch`

현재 판단:
- 지금 구조로 충분하다.
- 역 dedupe와 다국어 보강은 importer 책임으로 둔다.

### `lines`

노선 메타 테이블이다.

유지하는 컬럼:
- `name`
- `color`
- `line_type`

현재 판단:
- `name`은 실제 join key로 쓰인다.
- `color`는 runtime에서 사용 중이다.
- `line_type`은 스키마와 importer 경로는 있지만 현재 runtime 사용도는 낮다.

메모:
- `color`, `line_type`은 `line_metadata_catalog.dart`를 통해 importer 시점에 채워진다.
- 예전 문서에 있던 `operator` 같은 확장 컬럼은 현재 범위에서 제외한다.

### `line_stations`

노선 위 역 순서와 branch 구조를 표현하는 핵심 테이블이다.

유지하는 컬럼:
- `line_id`
- `station_id`
- `station_code`
- `station_no`
- `order_index`
- `branch_key`
- `is_terminal`

현재 판단:
- 현재 DB 설계에서 가장 중요한 테이블이다.
- 별도 edge table 없이도 현재 branch 판정과 인접역 계산에 충분히 쓰이고 있다.

메모:
- unique 기준은 `line_id + station_id + branch_key`
- junction 역은 branch별 row가 여러 개 생길 수 있다.
- `order_index`는 branch 내부 정렬용이다.

### `station_transition_overrides`

기본 `line_stations` 규칙만으로 branch를 고르기 어려운 전이를 보정하는 예외 테이블이다.

유지하는 컬럼:
- `line_id`
- `current_station_code`
- `next_station_code`
- `api_terminal_station_code`
- `api_terminal_station_name`
- `api_direction`
- `resolved_branch_key`
- `prev_station_code`
- `priority`
- `note`
- `is_active`

현재 판단:
- 일반 역 전체를 담는 테이블이 아니라 예외 전이 사전으로 유지한다.
- 현재 runtime branch 판정에 이미 연결돼 있다.
- `prev_station_code`는 스키마에 있지만 아직 필요한 사례가 많지 않다.

### `direction_policies`

API direction/terminal 값을 사용자 표시 라벨로 바꾸는 정책 테이블이다.

유지하는 컬럼:
- `line_id`
- `branch_key`
- `direction_kind`
- `api_direction`
- `api_terminal_station_code`
- `display_label_ko`
- `is_active`

현재 판단:
- 현재 목적에는 이 컬럼셋이면 충분하다.
- direction label과 negative example 계산에 이미 쓰이고 있다.
- 다국어 direction label은 아직 범위 밖이다.

