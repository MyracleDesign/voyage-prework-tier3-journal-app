# Dart / Flutter Digital Journal App

This project consist of a client application written with flutter web and a server application written in Dart. Please consider reading the further following readme,
 
- [Client Readme](client/readme.md)
- [Server Readme](server/README.md)

You can find the a running version of this version on Heroku:
- [Client](https://digital-journal-client.herokuapp.com)

## Getting Started

You can start this project by start up the client and server.

If you have [Powershell](https://github.com/powershell/powershell) installed you can use the [Start Script](scripts/start_all.ps1) to start up the server and client.

### Prerequisites
You have to install the newest version of dart sdk + flutter.

```
# Windows
choco install dart-sdk

# MacOS
brew tap dart-lang/dart
brew install dart
```

To make also flutter web possible you have to activate the flutter web globally. After installation of flutter and dart. Please execute the following command.
```powershell
flutter packages pub global activate webdev
```

Please check after installing also the PATH variables to dart and flutter.

For more information how to install dart or flutter please visit the following websites
- [Dart Install](https://dart.dev/get-dart)
- [Flutter](https://flutter.dev/docs/get-started/install)

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Currently the deployment is handled via the [deployment.ps1](./scripts/deployment.ps1). It deploys the client and the server to Heroku if you have them in your remotes.

## Built With
Thanks for all the great products that we can use

* [Powershell](https://github.com/powershell/powershell) - The terminal that is used
* [Dart](https://dart.dev/) - Dart language
* [Flutter](https://flutter.dev/) - UI Framework for Dart
* [Aqueduct](https://aqueduct.io/) - Server Framework for Dart

## Contributing
Thanks to all contributers to make that journal the best dart journal in the world.
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Max Weber** - *Setup of the Dev Environment* - [MyracleDesign](https://github.com/MyracleDesign)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc