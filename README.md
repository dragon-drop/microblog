# A Micro Blog - Candidate Code Assessment

## The Challenge

* _a micro blog_ is a micro-blog, like Twitter.
* A working example of the app can be seen at https://a-microblog.herokuapp.com
* Users can browse the list of posts, and individual posts, without logging in
* Users need to login to post

Your challenge is to add the ability to *like* posts:

> As a user,
> I want to like other users' posts
> So that they know I enjoyed what they wrote

## Expectations
* Candidates are welcome to spend as much time on this as they like, but we don't expect more than 1-2 hours effort.
* The goal is to get the feature into the application - we should be able to see your submission by running the app, not by looking at the code
* We don't expect a fully polished feature in this time, tell us in your submission what you'd do next if you had more time.

## Submission format
* Submit your assessment by forking this repository and sending us a Pull Request
* Provide any details you think we should know in the body of your pull request
* You're welcome to list any other improvements you'd like to make to the application if you had the time


## Running the application
* _a microblog_ runs on Ruby 3.1.2 and Rails 7.0.4
* Start it like any Rails app

## Implementation Details
* Postgres is used for the database
* Redis is required to run the ActionCable streaming
* [RSpec](https://rspec.info/) is used for testing
* [Stimulus](https://stimulus.hotwired.dev/) for sprinklings of javascript
* [Tailwind CSS](https://tailwindcss.com/) is used for styling
* [Turbo](https://turbo.hotwired.dev/) is used to give us the speed of a single-page web appliaction
