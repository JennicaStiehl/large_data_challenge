# Large Data Take Home Challenge

## Description
This challenge gives a large data set and requirements include importing the data and organizing it in an efficient way. Next, create methods to calculate information and statistics about the Olympics. Then create an API for this data.

## Setup
```ruby
rake db:create
```
Created databases: 'large_data_challenge_development'
'large_data_challenge_test'
```ruby
rake db:migrate
```
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
## Testing
[Should-Matchers](https://github.com/thoughtbot/shoulda-matchers)

[RSpec](https://github.com/rspec/rspec-rails)

[SimpleCov](https://github.com/colszowka/simplecov)

## Importing
[ActiveRecord-Import](https://revs.runtime-revolution.com/a-better-way-to-import-all-your-records-using-activerecord-import-6053e20692f3)

[Importing Large Data Sets](https://medium.com/@eric_lum/importing-large-datasets-in-ror-why-you-should-use-activerecord-import-26fc915e6fd0)

[Importing Massive Data into Rails](https://mattboldt.com/importing-massive-data-into-rails/)

[Speeding Up Bulk Imports in Rails](https://blog.codeship.com/speeding-up-bulk-imports-in-rails/?source=post_page)
