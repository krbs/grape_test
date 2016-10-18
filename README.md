## Trying to pinpoint nested params error in grape

Error is

```
TypeError: no implicit conversion of Symbol into Integer"
```


Api methods are in app/api/v1/methods.rb
Tests are in test/integration/api_test.rb

Ruby version: 2.3.1p112

How to run the test suite: rails test

Or option is to jump into failing method directly with curl:

```
curl -H "Content-type: application/json" -X POST -d '{"arr1":[{"hash1":{"arr2":[{"hash2":{"something":"value"}}]}}]}' http://localhost:3000/api/v1/nested_params_test_4
```
