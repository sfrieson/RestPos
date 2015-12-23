# RestPos
#### A RESTful POS webapp for any restaurant.


Admin info for testing
```
Username: Gadoe
Password: admin1
```
---

RestPos is a Ruby on Rails POS system built to easy the operations of many users in a restaurant setting.  There are four main sections to work from:

* **Admin** - Where new employees and menu items are created

![Menu input page]()

* **Host Stand** - A view specific to the host's needs featuring a waitlist, and seating options.

![Host Stand view]()

* **Server Portal** - A view for the main floor of the restaurant, allowing servers to place orders and bussers to mark the tables they've cleared.

![Server Portal view]()

* **Kitchen View** - A view of the most recent orders for the kitchen with color coding to denote the amount time the order has been up.
![Kitchen Orders view]()

---


## System dependencies
**Faker** - The Server Portal makes use of *Faker* to make new parties as they enter the restaurant.

This could be done without completely, and allow the host to type in the name.  This is currently just simulating a random set of people walking.

**Skeleton** - The light CSS framework *Skeleton*, which also makes use of *Normalize* was used for base styling of the site and their grid system.

When the sizes of screens that are going to be used is better understood, the framework can be modified further to better fit the needs of the restaurant.

**Font Awesome** - The symbol font *Font Awesome* was used to quickly add pictographs to the first version of this app.

A smaller subset can be created in the future to reduce this reliance.

---

## Structure

#### Database
![ERD](/public/planning/RestPosErd-01.png){height: 20px}
*Entity Relation Diagram*


Routing

Design
![Rough Wireframes](/public/planning/wireframe_sketch.gif)
*Rough original wireframes*
___

## Future improvements

#### Known Issues
* Order placed time on Kitchen screens


#### Future Improvements
* Allergies
* Phone improvements
* Credit Card Payment
* Give the Server Portal access to the full menu.
* Easter Eggs
* Server pin and access




* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
