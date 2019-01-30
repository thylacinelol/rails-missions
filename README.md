# README

The task is to write an action that stores some data in the sqlite database and returns json. 

### The POST request 

The requests purpose is to calculate the n-th value of the fibonacci series and should look like this:

`POST /fibonacci.json`

with the required integer parameter `n`. If the paramter is missing the response should have status code 400 with an appropriate error message. 

The successful response should be JSON in the following structure:

```json
{
  "value": 3,
  "result": 5,
  "runtime": 67
}
```

`result` should be the `n`-th value of the fibonacci series and `runtime` should be the time in milliseconds it took to compute the result.

Each request should save the following information about the request to the database:

* `value` of the paramter `n` 
* `result`
* `runtime`
* `created_at`

### The GET request 

The purpose of this request is to list the last 10 computations stored in the database via the `POST` request.

`GET /fibonacci.json`

The successful response should be JSON in the following structure:

```json
[
  {
    "value": 3,
    "result": 5,
    "runtime": 67,
    "created_at": "2019-01-30T12:45:56Z"
  },
  {
    "value": 10,
    "result": 55,
    "runtime": 187,
    "created_at": "2019-01-30T12:43:34Z"
  }
]
```

The main purpose of this task is to see that you know the rails stack and get a glimpse of your coding style.

### Hints

* use libraries whenever they fit
* write specs
* keep it simple and focus on the task
* don't forget the edge cases
