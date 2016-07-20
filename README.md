# 실시간 인플루언서

## 프로젝트 선정 이유

종합설계 프로젝트로 SEO 관련 내용을 다뤄보려고 잠시 실시간 검색어 분석을 한 적이 있습니다. 실시간으로 올라오는 3대 포털 사이트의 검색어 순위와 음원 차트 순위를 기반으로 인플루언서(영향력있는 사람)를 선별하는 작업입니다. 각각을 타당한 이유에 맞게 가중치를 부여하고 분석하는 과정이 재미있었습니다. 하지만 단순히 웹 크롤링과 수치 부여 만으로는 좋은 데이터를 얻는데에 한계가 있었다는 것을 깨닫고 주제를 바꾸게 해준 프로젝트입니다.

## 프로젝트 요약

- 네이버, 다음, 구글의 실시간 검색어를 2시간 단위로 추출합니다.
- 한국에서 영향력이 있는 음원 차트(멜론, 소리바다 등)을 분석한 사이트에서 음원 차트를 가져옵니다. 단, 차트는 프로그램을 실행하는 순간 가져와서 그 순간에만 영향력을 미칩니다.
- 각 포털사이트의 유입량과 순위 그리고 음원 차트의 순위마다 다른 가중치를 두어 수치화합니다.
- 각각의 대표 아티스트(인플루언서)마다 여러 동일 의미 키워드 리스트를 보유하여 해당 리스트에 해당되는 것들은 모두 수치화 작업에 사용됩니다.

## 프로젝트 풀이

- Like Query 사용하여 동일 키워드 리스트 데이터 추출
 - DB에서 해당 키워드 리스트의 문자를 포함한 검색어 데이터를 추출한다.
 - 추출한 데이터를 수치화 작업하여 총 합계를 내고 대표 키워드 데이터에 적용한다.

- 가중치 부여 작업
 - 각각을 사회적 영향력 기준으로 판별하여 차등 가중치를 부여한다.

## 프로젝트 소감

해당 프로젝트는 중간에 멈추었지만, 실시간 검색어 데이터를 다뤄볼 수 있는 좋은 경험이었습니다. 그리고 실시간 영향력을 판별하는 기준에는 여러가지가 있지만, 단순히 웹 상에서 돌아다니는 검색어 순위만으로는 좋은 데이터를 얻기 어렵다고 생각하게 되었습니다. 때문에 좋은 영향력 데이터를 위해서는 발로 뛰어서 사람들의 의견을 구하고 여러 지역과 다양한 연령층의 사람들의 목소리를 들을 수 있는 조사원들과 분석원들이 필요하다는 것을 깨달았습니다. 검색 엔진의 위대함을 다시한번 깨닫습니다.
