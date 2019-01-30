# README

## Mission #1

Write an API call that returns the n-th value of the fibonacci series.

### The request

`POST /fibonacci.json`

Parameter:
* `n`: [integer] n-th value of the fibonacci series

If the paramter is missing the response should have status code 400 with an appropriate error message. 

### The response

The successful response should be JSON in the following structure:

```json
{
  "value": 3,
  "result": 5,
  "runtime": 67
}
```

* `value`: the value of the parameter n
* `result`: the n-th value of the fibonacci series
* `runtime`: time in milliseconds it took to compute the result

## Mission #2

Save the computation results on each request to the database.

The data that should be stored:

* `value`: value of the paramter `n` 
* `result`: the n-th value of the fibonacci series
* `runtime`: time in milliseconds it took to compute the result
* `created_at`: creation datetime of the record

## Mission #3

Write an API call that returns the last 10 computation results from the database in JSON format.

### The request

`GET /fibonacci.json`

Parameters: none

### The response

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

The main purpose of these tasks is to see that you know the rails stack and get a glimpse of your coding style.

### Hints

* tackle each mission one after another
* commit at least after each mission is completed
* use libraries whenever they fit
* write specs!
* keep it simple and focus on the task
* don't forget the edge cases
