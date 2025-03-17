## 폴더 구조
LearnCleanArchitecture/
├── Data/
│   ├── APIService.swift
│   ├── DataSources/
│   │   └── RemotePostsDataSource.swift
│   └── Repositories/
│       └── PostsRepository.swift
├── Domain/
│   ├── Entities/
│   │   └── Post.swift
│   └── UseCases/
│       └── GetPostsUseCase.swift
└── Presentation/
    ├── ViewModels/
    │   └── PostsViewModel.swift
    └── Views/
        └── ContentView.swift

## 계층 설명
### 1. Presentation (표현 계층)
Views: 사용자가 직접 보고 상호작용하는 UI 부분입니다.
ViewModels: UI 상태를 관리하고 UI에 표시할 데이터를 준비합니다.

### 2. Domain (도메인 계층)
Entities: 앱의 핵심 데이터 모델을 정의합니다.
UseCases: 앱의 핵심 비즈니스 로직을 담당합니다.

### 3. Data (데이터 계층)
Repositories: 데이터 접근을 추상화하고 데이터 출처를 숨깁니다.
DataSources: 실제 데이터를 가져오는 구체적인 방법(API, 로컬 DB 등)을 구현합니다.
APIService: 네트워크 통신을 담당합니다.

## 종속 관계
일반적으로 CleanArchitecture는 3~4개의 레이어(Domain을 Entities와 UseCases로 분리하는 경우가 있음)로 구분합니다.
Domain은 프로젝트에서 가장 핵심적인 데이터 모델(Entity)와 비즈니스 로직(UseCase)를 선언하고 이를 기반으로 나머지 Data, Presentation 레이어를 구현합니다.
이를 종속관계라하며 Domain레이어의 코드들은 Data, Presentation에 구현된 코드를 사용하지 않습니다.

    Presentation → Domain ← Data

이렇게 되면 Data, Presentation의 코드를 변경하더라도 Domain의 코드들을 변경할 필요가 없게 됩니다.
