# Fima - Personal Finance Made Simple

## Architecture

Following the `bloc` library guide, the code is separated into three parts
1. Presentation
2. Business Logic
3. Data
   - Repository
   - Data Provider

## Data

1. AuthenticationRepository
   The `AuthenticationRepository` is responsible for managing authentication and fetching user information from `Firebase`. 
2. DatabaseRepository 
   The `DatabaseRepository` is responsible for managing user data related to their finances, including the ability to create, update, read, and delete data.
