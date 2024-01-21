# README

Campus Closet - Student based clothing donatin system

# Getting Started

To get started follow the steps below to install ruby gems and set up the database.

$ **bundle install**

$ **rails db:create**

To seed the database use the following commands.

$ **rake db:migrate**

$ **rake db:seed**

# Runing Tests

Below are the steps to run rspec and cucumber tests.

$ **bundle exec rspec**

$ **rails cucumber**

# How to deploy

To run the project locally use rails as below.

$ **rails s**

To deploy the project to heroku use the following steps.

$ **heroku login**

$ **heroku create -a <name>**

$ **git push heroku main**

$ **heroku run rails db:migrate**

$ **heroku run rails db:seed**

If you would like to see the running website the link is below.

https://bespoke-campus-closet-3461b1a0aab9.herokuapp.com/

# Contact

To contact our team reach out to our current Product Owner

hunter-pearson_36@tamu.edu