#####Customer.rb

Not sure about the confirm_order method which sends the SMS sitting in the customer class - is it the customer's responsibility to send the message to themselves?
The confirm_order method also has a lot of different functions - might be worth pulling out the :body composition into a seperate method?

#####PlaceOrder class

Very small thing (and only because I'm trying the find things to say!) is that not sure about the name of this class. Think classes should correspond to nouns, not verbs - its the methods that describe the actions?
