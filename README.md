
# Formloader Application

Integrated & built with:

- CheckIt
- BuildIt
- ObjectDump
- Coffeepress

Utilizes the following libraries:

- Select2
- jQuery
- jQueryUI

## Order of operation for validating forms... 

1. Field item validations
2. Fieldset validations
3. Form validations

## Formloader Api

- GET                  /api/bootstrap
- POST                 /api/application
- GET|PUT|DELETE       /api/application/:name

- GET|PUT|POST|DELETE  /api/:application/:type/:item

## TODO:

1. Get the new form saving
2. Ability to check how many times something is used, delete across multiple JS trees
3. Redirect after a new item is created, or if the key is changed
4. Figuring out the reasoning for coming up with 
5. Better preview/output

- Unit Tests