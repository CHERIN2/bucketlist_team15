# 프로젝트 제목
### Bucket List

<br>

# 프로젝트 정보
### 기간: 7.3 - 7.7

<br>

# 프로젝트 인원
### [김은경](https://github.com/Luna828) &nbsp; [박세찬](https://github.com/CHERIN2) &nbsp; [최진훈](https://github.com/pinocchio22)

<br>

# Github
    https://github.com/CHERIN2/bucketlist_team15.git

<br>

# 기술 스택
<img src="https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white" />

<br>

# 주요 기능
    1. 버킷리스트 생성 - createDialog에서 입력받은 내용을 sharedPreference에 저장
    
    2. 버킷리스트 삭제 - 원하는 내용의 index를 이용하여 삭제
    
    3. 버킷리스트 수정 - 초기값으로 기존의 내용을 보여주고 저장방식이 아닌 교체방식

    4. 체크박스 정렬 - 내용에 저장된 체크박스값(bool)로 정렬하여 true면 맨 아래로 위치

    5. 상태관리 - provider를 사용하여 모든 데이터를 쉽게 관리

<br>

# 아키텍쳐
![image](https://github.com/CHERIN2/bucketlist_team15/assets/61182499/06a746d1-9e23-4a11-87c2-3ca5b4dfd818)

<br>
    
# 기타 추가 사항들
**1. flutter의 context 가 무엇인지 궁금합니다** <br>
- 트리상의 위젯 위치와 그 위젯의 부모를 알려주는 지표 (scafold - snackbar 예제를 통해 알아볼 수 있음) <br>

**2. provider에서 context.read<Service>(); 를 쓰고 안쓰고의 차이 , 왜쓰는지가 궁금합니다** <br>
- context를 관찰하여 service provider를 찾아온다. 여기서 service는 싱글톤 패턴이기 떄문에 어디서 선언을 하던 한개의 인스턴스만 가지므로 효율에 문제가 x <br>

**3. 두개의 isChecked 함수 중 어떤 것을 선택할까요?** <br>
- 두 함수 모두 싱글책임 원칙(함수를 기능에 따라 분리)을 위배하므로 체크와 정렬 기능을 분리 권장 / 두번째 경우가 탐색의 횟수가 적고 얼리 리턴 처리(조건연산이 한번 적음)가 되어있으므로 더 나은 선택이 될 수도 있음 <br><br>
<img src="https://github.com/CHERIN2/bucketlist_team15/assets/61182499/dee26559-ca7c-40a3-835b-6fb2f01df04b"  width="350" height="400"/> <br>

**4. showDialog의 위치가 맞는지 궁금합니다** <br>
- 반복되는 showDialog 부분을 따로 분리를 하고 필요한 곳에서 접근하여 사용하는 것을 권장 <br><br>
<img src="https://github.com/CHERIN2/bucketlist_team15/assets/61182499/c8ed4b16-cc65-4a77-bfe9-8f2175746624"  width="130" height="130"/> <br>

