_Burbs_

_User Story_
Burbs is a web app designed for parents considering relocating from New York City to its suburbs.

_What problems does the app solve?_
Rather than have to look through websites for school information, crime statistics, real estate information,leisure facilities, daycare, transportation information etc, Burbs is designed to give a one-page overview of everything a parent could wish to know when considering where to raise a family, while acting as a portal to more detailed information.

_What are the MVP features?_
The MVP will offer information about towns on a single rail line, the Metro North line between Grand Central Station and Poughkeepsie. All information will be up-to-date as it will be called via APIs such as Google Maps, GreatSchools and Foursquare.

_What are the post-MVP features?_
A much wider range of towns and communities will be included, and the range of information will be increased to include detailed demographics, housing information, long-time statistical trends, weather, environmental information etc. More APIs will be sued to supply the most up-to-date data, such as the US Census, neighborhood data from companies like Zillow, and information from NY State's open data project.

_Gems_
Devise, HTTParty, Simple Form, Bootstrap

_Getting Started_
Run bundle install
$rails db:create
$rails db:migrate
$rails db:seed
Log in as test@test.com / pw: test123 (Username: Bruce Wayne)

_Deployment_
Deployment will be through Heroku.

_Built With_
Ruby on Rails - The web framework used
Gems - Gems to enhance the users experience
Bootstrap - Used to generate styling and forms
Devise - Used to generate user-friendly functions (i.e. logging in)

_Versioning_
Ruby version 2.3.1
