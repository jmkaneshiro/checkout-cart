# README
## Summary
Basic Checkout Cart is a learning project to practice building a full stack application using only Rails 6. Vist the live site at https://basic-checkout-cart.herokuapp.com/ .

## Features
The app has will have three primary feature areas
+ As a seller, I should be able to add products and inventory to my store
+ As a buyer, I should be able to add items to my cart and complete an order
+ The app should ensure that a cart can only be converted into an order if all parts of the transaction are complete

## Structure
The app will have the following models
+ Product
+ InventoryItem
+ Cart
+ CartItem
+ Order

## Deployment Instructions
The app can be deployed locally by doing the following:
1. Clone the app
2. CD into your app directory
3. Install gems with `bundle install`
4. Install Node.js packages with `yarn install` (This project does not use NPM as Yarn is the default option for Rails 6)
5. Run migrations with `bundle exec rails db:migrate`
6. Go ahead and run the app with `bundle exec rails server`

## Rails/Ruby Notees
This app runs the following:
+ rails 6.0.3
+ ruby 2.7.0
