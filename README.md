# Large Data Take Home Challenge

## Description
This challenge gives a large data set and requirements include importing the data and organizing it in an efficient way. Next, create methods to calculate information and statistics about the Olympics. Then create an API for this data.

## Contributors
[Jennica Stiehl](https://www.linkedin.com/in/jennicastiehl/)

If you would like to be added to this list, here are the steps you might take:
1. Clone this repo
2. Follow the setup instructions
3. Make your additions on a new branch
4. Submit a Pull Request and tag @stiehlrod

## techStack
postgres (PostgreSQL) 11.4

Ruby 2.6.3 on Rails 5.2.3
Bundled with 2.0.2

Heroku

## Database Schema
![Schema](public/schema.jpg)

## Setup
```ruby
bundle install

rake import_sport
rake import_event
rake import_team
rake import_olympian
rake import_game
rake import_medalist

rake db:create
```
Created databases: 'large_data_challenge_development'
'large_data_challenge_test'
```ruby
rake db:migrate
```

## Production
https://polar-spire-59828.herokuapp.com/

## Endpoints
request: localhost:3000/api/v1/olympians
response:
```json
{
    "olympians": [
        {
            "name": "Andreea Aanei",
            "team": "Romania",
            "age": 22,
            "sport": "Weightlifting",
            "total_medals_won": 0
        },
        {
            "name": "Nstor Abad Sanjun",
            "team": "Spain",
            "age": 23,
            "sport": "Gymnastics",
            "total_medals_won": 0
        }
      ]
}
```
request: localhost:3000/api/v1/olympians?age=youngest
response:
```json
{
    "olympians": [
        {
            "name": "Ana Iulia Dascl",
            "team": "Romania",
            "age": 13,
            "sport": "Swimming",
            "total_medals_won": 0
        }
    ]
}
```
request: localhost:3000/api/v1/olympians?age=oldest
response:
```json
{
    "olympians": [
        {
            "name": "Julie Brougham",
            "team": "New Zealand",
            "age": 62,
            "sport": "Equestrianism",
            "total_medals_won": 0
        }
    ]
}
```
request: localhost:3000/api/v1/olympian_stats
response:
```json
{
    "olympian_stats": {
        "total_competing_olympians": 2850,
        "average_weight": {
            "unit": "kg",
            "male_olympians": "77.87",
            "female_olympians": "61.41"
        },
        "average_age": "26.37"
    }
}
```
request: localhost:3000/api/v1/events
response:
```json

```
request: /api/v1/events
response:
```json
{
    "events": [
        {
            "sport": "Weightlifting",
            "events": [
                "Weightlifting Women's Super-Heavyweight",
                "Weightlifting Men's Heavyweight",
                "Weightlifting Men's Middleweight",
                "Weightlifting Men's Middle-Heavyweight",
                "Weightlifting Men's Featherweight",
                "Weightlifting Women's Flyweight",
                "Weightlifting Women's Middleweight",
                "Weightlifting Women's Lightweight",
                "Weightlifting Men's Lightweight",
                "Weightlifting Men's Super-Heavyweight",
                "Weightlifting Men's Light-Heavyweight",
                "Weightlifting Women's Heavyweight",
                "Weightlifting Women's Light-Heavyweight",
                "Weightlifting Men's Bantamweight",
                "Weightlifting Women's Featherweight"
            ]
        },
        {
            "sport": "Gymnastics",
            "events": [
                "Gymnastics Men's Individual All-Around",
                "Gymnastics Men's Floor Exercise",
                "Gymnastics Men's Parallel Bars",
                "Gymnastics Men's Horizontal Bar",
                "Gymnastics Men's Rings",
                "Gymnastics Men's Pommelled Horse",
                "Gymnastics Men's Team All-Around",
                "Gymnastics Men's Horse Vault",
                "Gymnastics Women's Team All-Around",
                "Gymnastics Women's Uneven Bars",
                "Gymnastics Women's Balance Beam",
                "Gymnastics Women's Individual All-Around",
                "Gymnastics Women's Floor Exercise",
                "Gymnastics Women's Horse Vault"
            ]
        }
    ]
}
```
request: localhost:3000/api/v1/events/10/medalists
reqponse:
```json
{
    "event": "Taekwondo Women's Flyweight",
    "medalists": [
        {
            "name": "Patimat Abakarova",
            "team": "Azerbaijan",
            "age": 21,
            "medal": "Bronze"
        },
        {
            "name": "Tijana Bogdanovi",
            "team": "Serbia",
            "age": 18,
            "medal": "Silver"
        }
    ]
}
```
## Testing
[Should-Matchers](https://github.com/thoughtbot/shoulda-matchers)

[RSpec](https://github.com/rspec/rspec-rails)

[SimpleCov](https://github.com/colszowka/simplecov)

![Coverage](public/coverage.jpg)

## Importing
[ActiveRecord-Import](https://revs.runtime-revolution.com/a-better-way-to-import-all-your-records-using-activerecord-import-6053e20692f3)

[Importing Large Data Sets](https://medium.com/@eric_lum/importing-large-datasets-in-ror-why-you-should-use-activerecord-import-26fc915e6fd0)

[Importing Massive Data into Rails](https://mattboldt.com/importing-massive-data-into-rails/)

[Speeding Up Bulk Imports in Rails](https://blog.codeship.com/speeding-up-bulk-imports-in-rails/?source=post_page)

## Known Issues
Rake task needs to be refactored
