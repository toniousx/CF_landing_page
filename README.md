## Process

1. Create Rails project:
``rails new CF_landing_page -d postgresql -T ``

2. Add test amd test development project Gems.

3. Setup Gems

5. Create fature branch and write Feature Test. Story:

- visit root page
- GET all the courses CareerFoundry offers from CF API
- On the frontend, let the user select which course they are interested in
- Based on the user's selection, GET the course details from the RESTful API
- Display the total price in the correct currency based on the user's
  - To get the user's geolocation based on the IP address you may (but don't have to!) use https://freegeoip.net geolocation (we use USD for any country outside the EU and UK)**


Bonus: Display the next course start date and the following two start dates separately in the frontend

