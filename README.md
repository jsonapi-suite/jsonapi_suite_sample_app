# jsonapi_suite sample app

This is a sample application for [jsonapi_suite](https://jsonapi-suite.github.io/jsonapi_suite). You can use this reference implementation to help track down errors if you end up having trouble.

Be sure to check out `spec/api` as well!

### Running

To run the rails backend:

* `bundle install`
* `bin/rake db:migrate`
* `bin/rake db:seed`

This also comes with an optional ember frontend:

* `cd ./frontend`
* `npm install && bower install`
* `ember s --proxy http://127.0.0.1:3000`
