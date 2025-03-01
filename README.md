# Ask Me

**Ask Me** is a Ruby on Rails web application that enables registered users to ask questions and receive answers from other users. Users can only answer questions addressed to them, and they have the ability to manage their received questions by editing, deleting, or hiding them.

## Live Demo
The project is deployed on Heroku and can be accessed at: [Ask Me](https://ask-valentina.herokuapp.com/)

---

## Features

- **User Authentication**: Users must log in to ask or answer questions.
- **Ask & Answer**: Users can send questions to others and answer questions directed to them.
- **Profile Pages**: Clicking on a user’s avatar redirects to their profile page, listing all questions they have received.
- **Gravatar & Robohash Integration**: User avatars are fetched using Gravatar, and for users without a Gravatar account, the app generates an avatar using the Robohash web service.
- **Question Management**: Users can edit, delete, or hide questions directed to them.
- **Real-time Updates**: Latest three questions are displayed on the main page.
- **Database**: Uses SQLite3 for development and PostgreSQL for production.

---

## Project Pages

1. **Home Page**
   - Displays the latest three questions from users.
   - Each question shows sender, receiver, date, question text, and answer (if provided).
   - Clicking on a user’s avatar redirects to their profile page.

2. **User Profile Page**
   - Lists all questions received by the user.
   - Questions can be edited, answered, deleted, or hidden (only by the recipient).

3. **Question Edit Page**
   - Allows the recipient of a question to modify or answer it.

---

## Installation Guide

### Prerequisites
Ensure you have the following installed:
- Ruby 3.0.1
- Rails 7.0.2.3
- Bundler
- SQLite3 (for development)
- PostgreSQL (for production)

### Setup Instructions

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/ask-me.git
   cd ask-me
   ```

2. Install dependencies:
   ```sh
   bundle install
   ```

3. Set up the database:
   ```sh
   rails db:create db:migrate db:seed
   ```

4. Start the Rails server:
   ```sh
   rails server
   ```
   The app will be available at `http://localhost:3000`.

---

## Dependencies

The project’s dependencies are listed in the `Gemfile`:

```ruby
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'email_address'
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'where_exists'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
  gem 'bullet'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '~> 1.1'
end
```

---

## Deployment

### Heroku Deployment Steps
1. Login to Heroku:
   ```sh
   heroku login
   ```
2. Create a new Heroku app:
   ```sh
   heroku create ask-me-app
   ```
3. Set up PostgreSQL for production:
   ```sh
   heroku addons:create heroku-postgresql:hobby-dev
   ```
4. Deploy the application:
   ```sh
   git push heroku main
   ```
5. Run database migrations:
   ```sh
   heroku run rails db:migrate
   ```
6. Open the app in the browser:
   ```sh
   heroku open
   ```

---
