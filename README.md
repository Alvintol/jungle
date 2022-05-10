# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

!["Main Page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/Main.png?raw=true)
!["Login Page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/LoginPage.png?raw=true)
!["Main Products Page with sold out display"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/MainSoldHover.png?raw=true)
!["Categories page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/CategorySingle.png?raw=true)
!["Main page with Login credentials"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/MainLoggedIn.png?raw=true)
!["My cart page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/MyCart.png?raw=true)
!["New product imput page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/NewProducts.png?raw=true)
!["My orders page"](https://github.com/Alvintol/jungle/blob/master/app/assets/images/Order.png?raw=true)

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

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- rails/actioncable
- rails/activestorage 
- rails/ujs
- rails/webpacker 
- turbolinks 
- ebpack 
- puma
- sass-rails
- turbolinks
- jbuilder
- jquery-rails
- sdoc
- bcrypt
- bootstrap
- bootsnap
- font-awesome-rails
- money-rails
- rmagick
- faker
- carrierwave

