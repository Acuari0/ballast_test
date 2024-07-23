# Pokemon Movie

# User Story

I am a pokemon lover, and I would like to have at hand information on all the movies in the pokemon market. My fascination for the pokemon world is such that I want to know all the curiosities of each one of them, their summary, among other things.

To have all the pokemon movies listed in one app, as well as their specific details will be of great interest, as it will save me from going to Google or forums to dive deeply into the pokemon world.

The app will have a simple design, rather fluid and not overloaded. It will be similar to the pokemon information websites. The application will not have advertising and it will go directly to the features that I require.

# Design Choices 

Taking into account the following points :

- Not enough time to be creative.
- It is a simple app but could be scalable.
- The user is not required to stay in the app for a long time.
- The app is currently made for informational use only.

I have decided to use a simplistic design, taking in reference to different pokemon information pages such as

- [PokeFandom] (https://pokemon.fandom.com/es/wiki/Heracross)
- [Wikidex] (https://www.wikidex.net/wiki/Heracross)
- [BulbaPedia] (https://bulbapedia.bulbagarden.net/wiki/Heracross_(Pok%C3%A9mon))

Adding a theme based on an indigo seed in relation to the color of my favorite pokemon Heracross.

https://archives.bulbagarden.net/media/upload/thumb/7/75/0214Heracross.png/500px-0214Heracross.png

# Technical Architecture

For the software architecture in this first phase not much data will be handled, but there is no information about how much data will be handled in the future and how many views the app will have.

That said.

Pages

The app will initially be managed in 4 screens

- Splash Screen : Small introduction to the app.
- Login Screen: A simple login
- Main Screen: List and search movies.
- Summary Screen: Gives information about a movie

Structure

We will have 2 important structures:

- User : User information.

  * username: User name
  * token: Login validation token.

- Product : Movies obtained from the API

  * id: id of the movie
  * title: movie title
  * image: image of the movie
  * summary: movie description

With this information base where at the beginning we have a small app that by doing research beyond that provided by the client can become a medium and even large app because of the vast information that can provide the POKEMON theme.

It is considered that the worst case scenario is that the app in its scaling can become a medium app with more than 10 screens if we take into account:

- User profile
- Configuration
- News
- Registration
- Password Recovery
- Movie Information Distrubution

With this hypothesis not being confirmed by the client, it was decided to use the redux architecture for the state management of the project, combined with Clean Arquitecture.

Redux is used for medium to large projects as it facilitates the development in advanced stages of the project bringing as benefits.

Predictable state management: With Redux, the state of the application is managed in a centralized and consistent way. This makes it easier to understand how the state changes over time and debug any issues that may arise.

Scalability: As the size and complexity of a Flutter application grows, Redux makes it easier to manage the state of the application. By following the core concepts of Redux, you can quickly scale the state management of your application.

Reusable code: By centralizing the state of the application, you can write reusable code that can be shared across different parts of the application.

Easy to test: Because the reducer is a pure function, it is easy to write automated tests. This makes it easier to ensure that the state of the application is being updated correctly.

I have chosen redux because I can't know how large the project is because I don't have enough information and it is better to go for a safe bet than to regret it in the future.

# Search Engine

The search engine is enhanced with the dependency (full_text_search: ^0.8.0+3) which helps to make a more accurate search and the dependency (diacritic: ^0.1.3) to remove words with diacritics.

The search process consists of separating sentences into words, for this purpose lists of strings are created using spaces as separators. We pass the data to full_text_search and it will search the possible results making comparisons according to the title of the movie and the id of this one, it is important to emphasize that the comparisons of the words are made removing the diacritics of each one and converting all the letters in small letters.

# Language

I see that every title is in English, so I use the English for de native language of the app.


# Unit Test 

Unit test is very important at the beginning of an app. I cover all the app with unit test and some golden test in the HomeScreen an SummaryScreen.

For running unit test you have to do

flutter test --update-goldens