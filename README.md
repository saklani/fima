# Fima - Personal Finance Made Simple

## Architecture

Following the `bloc` library guide, the code is separated into three parts
1. Presentation
2. Business Logic
3. Data
   - Repository
   - Data Provider

## Data
1. `package:models/models.dart` contains all the data models, generated `json` serialization and deserialization logic. 
2. `package:authentication_repository/authentication_repository.dart` is responsible for managing authentication and fetching user information from `Firebase`. 
3. `package:database_repository/database_repository.dart` is responsible for managing user data related to their finances, including the ability to create, update, read, and delete data.

## Business Logic
At the app level, the `/app` directory contains a `bloc` that keep tracks of whether the user is authenticated.
Depending on the authenticated state the [AppBloc] triggers the switch between the [SignInView] and the [Dashboard].
Each page has a separate directory within `/pages` which has a `/cubit` or `/bloc` directory with the implementation of the business logic.

## Presentation
Views are implemented within `/pages/[page_name]/view/[page_view].dart`. 