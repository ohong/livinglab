# LivingLAB by Oscar Hong

[LivingLAB](https://cs290-livinglab.herokuapp.com/) helps people easily find co-living arrangements with homes and roommates they'll love!

It was built by me, [**Oscar Hong**](https://ch311.dukecs.io/portfolio/), as my final project for [CS290: Web Application Development](http://www.cs.duke.edu/courses/compsci290.2/spring17/), a class taught by Robert Duvall at Duke University in the Spring of 2017. Please don't hesitate to [contact me](mailto:oscar.hong@duke.edu) if you run into any problems with the set-up or have questions/concerns/suggestions for the project.

_I hope you like it!_

## Project Specs

This project is intended for you to build a significant dynamic web application on a topic of your choosing that provides for a variety of users, provides a JSON web service, and is backed by an automated suite of tests. As [Harvard's CS50 Final Project](http://docs.cs50.net/2016/fall/project/project.html) puts it:
> All that we ask is that you build something of interest to you, that you solve an actual problem, that you impact campus, or that you change the world. Strive to create something that outlives this course.

## Getting Started

I developed this project locally and not on Cloud9. These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. It's deployed to Heroku [here](https://cs290-livinglab.herokuapp.com/).

### Prerequisites

Before trying setting up your local dev env, make sure you have the following:

```
ruby 2.4
rails 5.0
```

### Installing

1. Clone this repo locally in the directory where you'd like to keep it.

From GitLab: `$ git clone git@coursework.cs.duke.edu:ch311/livinglab.git`

From GitHub: `$ git clone git@github.com:ohong/livinglab.git`

2. Install the required Ruby gems.

```console
$ bundle install
$ bundle update
```

3. Run database migrations.

```console
$ rake db:migrate
```

4. Lastly, boot up your local server.

```console
$ rails server
```

And **_wallah!_** You should now have a local instance of this app running on `http://localhost:3000/`. Have fun with it!

_N.B. Some external API-dependent features (e.g. Facebook authentication) won't work locally because I have my secrets and keys stored in env variables (for obvious security purposes). Sorry, I can't give them to you unless you are the professor or the TAs._

## Running the Test Suite

Explanation on how to run the automated tests here.

## Tech Stack and Features

LivingLAB was built with the Ruby on Rails framework. For the database, it uses SQLite3 in development and PostgreSQL in production.

### Ruby Gems

* [devise](https://github.com/plataformatec/devise) - Basic user authentication and management.
* [toastr-rails](https://github.com/tylergannon/toastr-rails) - Turn ugly rails messages into beautiful notifications on the top right of the screen.
* [paperclip](https://github.com/thoughtbot/paperclip) - Photo upload.
* [geocoder](https://github.com/alexreisner/geocoder) - Turns address string into longitude and latitude to be fed into Google Maps API.
* [private_pub](https://github.com/ryanb/private_pub) - Enables real-time messaging. Works beautifully in development (I can show you how) but Heroku doesn't like it so it's not used in production.
* [thin](https://github.com/macournoyer/thin) - A simple web server framework for hosting private_pub locally
* [omniauth](https://github.com/omniauth/omniauth) - Used for authentication from different providers (e.g. Facebook, Google, GitHub, etc.)
* [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook) - Omniauth extension for Facebook.

### Code Libraries

* [Bootstrap](http://getbootstrap.com/) - Responsive framework; I actually used the [`bootstrap-sass`](https://github.com/twbs/bootstrap-sass) ruby gem.
* [jQuery](https://jquery.com/) - I used this JS library to write AJAX functions for deleting photos, refreshing messages, etc.

### Other Resources

* [Sass](http://sass-lang.com/) - CSS extension language; I actually used the [`sass-rails`](https://github.com/rails/sass-rails) ruby gem.
* [Google Material Icons](https://material.io/icons/) - All icons used came from here. Fit's with Google's material design.
* [Gravatar](http://en.gravatar.com/) - When a new user signs up, his profile picture is automatically populated by Gravatar (Globally Recognized Avatar) - see how I did this in [`application_helper.rb`](/app/helpers/application_helper.rb)
* [Google Maps API](https://developers.google.com/maps/) - Google Maps integration on each home's page - see the room's [`show.html.erb` view](app/views/rooms/show.html.erb)
* [Facebook Login API](https://developers.facebook.com/docs/facebook-login) - Used with omniauth-facebook - see how I integrated Facebook login in the [`omniauth_callbacks_controller.rb`](app/controllers/omniauth_callbacks_controller.rb).

### Security

Explanation on the many security precautions taken in this project here.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

Thank you to the following people, without whom this project would not have been possible:

* [Robert Duvall](https://users.cs.duke.edu/~rcd/), for teaching this class and continually encouraging us to strive to be better web developers.
* The TAs of this class - Mike, Zachary, Thomas, and Robert, for your patience in helping me troubleshoot whenever I ran into problems.
* My classmates in CS290, for inspiring me with your project ideas and amazing work. Seeing your progress has really motivated me to do more!
