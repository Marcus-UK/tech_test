#Kitten finder tech test

This is attempt at the Which technical test. It is ruby application that is
intended to be run from the command line. I have used BDD principles to
guide the development of my solution to the problem. You will find the user
stories for this process listed below.

# User stories

```
As an investigator,
So that I know where to look for the lost kittens,
I want to be able to access a list of directions from the forensics API.

As an investigator,
So that I  can easily follow the instructions,
I want them to be stored in an array.

As an investigator,
So that I can head in the right direction,
I want to be able to turn 90 degrees to the right when instructed.

As an investigator,
So that I can head in the right direction,
I want to be able to turn 90 degrees to the left when instructed.

As an investigator,
so that I can move when instructed,
I want to be able to move forward one grid square when instructed.

As an investigator,
so that I can check if I have found the kitten's location,
I want to be able to submit my location to the forensics API.

```

# How to run this application

To run this application, follow these steps:

```
$ Clone this repo in to a local directory on your system.
$ From your command line, navigate to the root directory of the application.
$ Run 'bundle install' from your command line to install its dependencies.
$ Open an IRB session to make use of the application's functions.
```

To run the tests for this application:
```
$ Navigate to the root directory of the application using your command line.
$ Run 'rspec' to run the tests.
```

# Technologies

- Ruby
- Rspec
- HTTParty
