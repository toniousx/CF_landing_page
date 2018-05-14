## Process

1. Create 
2.  project:
``rails new CF_landing_page -d postgresql -T ``

2. Add test amd test development project Gems.

3. Setup Gems

5. Create feature branch and add Feature scenario via BDD-TDD:

- visit root page
- GET all the courses CareerFoundry offers from CF API
- On the frontend, let the user select which course they are interested in
- Based on the user's selection, GET the course details from the RESTful API

It took me some time to refactor and fix some bugs, specially .open because ruby was using Kernel.open then I need to require 'open-uri'.

6. Create feature branch and add a basic bootstrap FE version

---

##### * Additional time later the 3 hours

7. Create feature branch and Add VCR gem Record test suite's HTTP interactions and fix json API (next course on May 14th, was outdated)

#### * Pending and next steps
- Display the total price in the correct currency based on the user's
  - To get the user's geolocation based on the IP address you may (but don't have to!) use https://freegeoip.net geolocation (we use USD for any country outside the EU and UK)**


Bonus: Display the next course start date and the following two start dates separately in the frontend

##### * I was using during all the process BDD & TDD. There are some pending tests and pending refactoring, specially on the last commits.

To improove & to do:
- Add conditionals for user's geolocation
- Read API freegeoip Documentation and implement it
- Add the Bonus excercise