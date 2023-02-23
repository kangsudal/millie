# millie

**목표**: 밀리의서재 레이아웃 클론하기

**데이터**: [Google Books API](https://developers.google.com/books/docs/v1/using?hl=ko)

**프레임워크**: Flutter
<br/>
<br/>

## Web App
https://millie-92f7d.web.app/#/
<br/>
<br/>

## 구현영상
https://kangsudal.tistory.com/entry/%EB%B0%80%EB%A6%AC%EC%9D%98-%EC%84%9C%EC%9E%AC-UI-%ED%81%B4%EB%A1%A0
<br/>
<br/>

### 사용 라이브러리와 위젯

**사용 라이브러리**: `carousel_slider`, `http`, `riverpod`

`http`: Google Books API에서 도서 정보를 받아옴

`carousel_slider`: 스크롤 기능

`riverpod`: 스크롤할때 offset에 따라 appBar를 보일지 말지 상태 관리

**사용 위젯**: `BottomNavigationBar`, `DefaultTabController`, `TabBar` & `TabBarView`, `ImageFiltered`, `Visibility`, `AnimatedOpacity`

`ImageFiltered`: 책 표지색에 맞게 blur된 배경 생성

`Visibility`: 알림-공지사항에 리스트를 열고 닫는 기능

`AnimatedOpacity`: 스크롤할때 offset에 따라 appBar의 투명도 조절
<br/>
<br/>

### 어려웠던점 & 해결
web app에서 책 커버 이미지가 안나오는 현상이 발생함. 
[Failed to load network image](https://github.com/kangsudal/millie/issues/1#issue-1514935262)
