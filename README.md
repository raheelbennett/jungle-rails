# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Description:

Jungle is a project built for learning purposes using Ruby on Rail and several testing mechanism including RSpec and Cypress. Data is persisted by Active Record on a PostgreSQL database.

Users can either sign up as a new user, login using email and password credentials if already registered and logout. Error validation is in place to prevent user from registering using an existing email address. Other form validations in place to guide user while registering and logging in. Users can place an order without loggin in just as a logged in user.

Products can be added to the cart that shows itemized list and total. When a product has 0 quantity, a sold out badge should be displayed on the product list page and Add button will be disabled. Once order is placed an order summary page is displayed with email address that was used to place the order and detailed order summary.

Admins must enter HTTP auth login/password to access admin functionality. Admins can list and create new categories, add new products using existing and new categories, and view dashboard for details on products and categories.

!["Home Page"]()

!["Home Page 2"]()

!["Cart"]()

!["Admin Products"]()

!["New User"]()

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
