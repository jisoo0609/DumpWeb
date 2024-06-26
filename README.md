# Dump Web
진행 기간 (23.07.23 ~ 23.10.24)

### Repository

> [Dump Web](https://github.com/incruit-intern-2023/DumpWeb)
>  
> fork Repository - [Dump Web](https://github.com/jisoo0609/DumpWeb)


## Review

1. 다인원 프로젝트라 방향 선정에 어려움이 있었다.
    - 소규모로 진행되는 것이 아닌 큰 서비스를 다인원의 사람들이 처리해야 했다.
    - 이는 처음 프로젝트를 전달 받았을 때, 프로젝트의 시작 방향을 잡는데 어려움이 있었다.
    - 추후, 대표님과의 상의를 통해 방식과 역할을 수정하고 진행할 수 있었다.
2. 프론트엔드와 백엔드 사이의 소통의 어려움이 있었다.
    - 프론트엔드는 백엔드를, 백엔드는 프론트엔드를 접해본 경험이 적어 두 역할 사이 소통에 어려움이 있었다.
    - 진행 과정에서 각자 자신의 역할을 잘 파악할 수 있도록 했다.
    - 프론트엔드는 서버로부터 전달받아야 하는 정보를 정확히 요구하고, 백엔드는 이를 프론트엔드에서 처리하기 쉬운 형태로 전달하기 위해 노력했다.
3. 요구사항 전달에 문제점이 있었다.
    - 요구사항이 문서가 아닌 구두로 전달되어 개발 진행 중에 어려움이 있었다.
    - 퇴근 전 다음날 개발 분량을 체크하고, 다음날 출근 후 오전 회의를 진행하면서 일일 개발할 부분을 재확인했다.
    - 이 과정에서 구두로 전달 받은 요구사항이 계속 변경되었고, 이에 맞는 개발을 위해 수정해야 하는 부분이 많아졌다.
    - 이는 진행 속도가 약간 더뎌지는 데 영향을 미쳤다.
4. 기술적 어려움이 존재했다.
    - 중간에 개발 버전이 변경되는 문제가 있었다.
    - 자바 1.8 버전을 사용해, 최신 버전에서 문제가 발생하는 부분이 있었다.
    - 자바 버전을 다운그레이드 해 진행했다.
5. 병합
    - 개발 내용을 병합하는 과정에서 일부 문제가 있었다.
    - 다인원이 프로젝트를 관리하다 보니, merge 담당자가 있음에도 불구하고, 다른 인원이 파일을 건드는 상황이 발생했다.
    - 이는 프로젝트의 파일 충돌을 야기했고, 추후 수정되었다.
    - 브랜치의 상태를 항상 최신 상태로 유지하여 커밋하는 것을 생활화 할 수 있도록 했다.
6. 매일 통합
    - 퇴근 전에 회사에서 일일 개발된 내용을 통합시켜 주었다.
    - 매일 하나의 `main`브랜치로 결과물을 보내고 이를 서버에 반영했다.
    - 그 날 개발한 내용을 매일 체크할 수 있다는 장점이 있었다.
    - 다음날 진행해야 할 분량을 미리 생각할 수 있게 해 효율성이 올라갔다.

## TECH
- java 1.8
- Spring boot
- SMTP
- lombok
- JSON
- JSP

### DataBase
- MariaDB
- MyBatis
- JDBC

## Service

### `DailyReportMapper.java`

- MyBatis를 사용하여 데이터베이스와 상호 작용하기 위한 메서드 정의
- MyBatis를 사용하면 이러한 인터페이스 메서드를 호출함으로써 SQL 매핑 파일과 연동하여 데이터베이스에 접근할 수 있음
- 이 인터페이스의 메서드 이름과 매개변수 타입이 매퍼 XML 파일의 `id` 와 `parameterType` 속성과 일치해야 함
- 일보 등록, 일보 수정, 일보 상세보기, 일보 리스트 조회(조건별), 일보 삭제의 메서드가 존재한다.

### `dailyReport.xml`

- MyBatis의 Mapper파일로 데이터베이스와 연동하여 SQL 쿼리를 정의하고 실행하는 역할
- `DailyReportMapper` 인터페이스의 SQL 매핑을 담당
- 데이터베이스 연동에 필요한 SQL 쿼리들을 정의
- 각 쿼리는 매핑되는 인터페이스의 메서드에서 사용되며, `id` 속성은 메서드 이름과 동일해야 함
- `parameterType` 은 매개변수의 타입을 지정하고, `resultType` 은 결과의 타입을 지정

### `DailReportDto.java`

- 테이블 정보를 전달 가능하다.

### `DailyReportController.java`

- Spring MVC를 사용하여 작성된 웹 애플리케이션의 컨트롤러 클래스
- `DailyReportController` 클래스는 웹 요청을 받아 해당 요청에 따라 적절한 기능을 수행하고 결과를 반환하는 역할
- `@RequiredArgsConstructor` 사용
    - 초기화 되지 않은 final 필드나, `@NonNull` 이 붙은 필드에 대해 생성자를 생성해 줌
    - 새로운 필드를 추가할 때 다시 생성자를 만들어서 관리해야 하는 번거로움을 없애줌(`@Autowired`를 사용하지 않고 의존성 주입)

### `DailyReportService.java`

- `DailyReportService` 클래스를 보여주며, Spring 애플리케이션의 비즈니스 로직을 구현하는 부분을 담고 있음
- 일일 보고서와 관련된 작업을 수행하며, 데이터베이스와의 상호작용을 담당

### `AOPconfig.java`

- 로그인 체크를 수행하는 기능을 구현
- AOP를 통해 컨트롤러 메서드의 실행 전후에 특정 작업을 수행할 수 있음
- 컨트롤러 메서드가 실행되기 전에 로그인 상태를 확인하고, 로그인 되지 않았을 경우 로그인 페이지로 이동 시키는 역할
- 이를 통해 보안을 강화하고 로그인을 필요로 하는 기능에 접근 제어를 적용할 수 있음

### `CommonUtil.java`

- 다양한 유틸리티 메서드를 제공하여 간단한 작업을 수행
- 데이터 변환을 돕는 역할

## 담당 역할

### Step4: 등록된 일보 조건 별 조회 / 일괄 결재, 취소 백엔드

- 조회 페이지로 이동

![Untitled](/docs/images/Untitled.png)

- 대분류: 제출처, 상차지, 운행일, 하차지, 품목 기준 조회

![Untitled](/docs/images/Untitled%20(1).png)

- 상세 조건을 부여해 검색할 수 있다.

![Untitled](/docs/images/Untitled%20(2).png)

- 일괄결재 성공

![Untitled](/docs/images/Untitled%20(3).png)

- 일괄취소 성공

![Untitled](/docs/images/Untitled%20(4).png)