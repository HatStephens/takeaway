takeaway
========

####Makers Academy Week 2 Takeaway Challenge

Use multiple classes to produce a program which implements the following functionality:

- []can create a list of dishes with prices
- []can place an order by giving the list of dishes, their quantities and a number that should be the exact total cost of the order (this is not normal!) 
- []if the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52"
- []the text sending functionality should be implemented using Twilio API 
- []use twilio-ruby gem to access the API
- []use a Gemfile to manage your gems
- []make sure that your Takeaway classes are thoroughly tested and that you use mocks and/or stubs, as necessary to ensure texts are not sent when your tests are run
- []if your Takeaway class is loaded into IRB and the order is placed, the text should actually be sent
