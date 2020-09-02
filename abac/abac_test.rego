package abac

attrs = {
    "admin": {
      "path": "/customers",
      "methods": [
        "POST",
        "GET"
      ],
      "week_day": [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday"
      ],
      "hour": {
        "from": 0,
        "to": 23
      }
    },
    "user": {
      "path": "/customers",
      "methods": [
        "GET"
      ],
      "week_day": [
        "Monday",
        "Wednesday"
      ],
      "hour": {
        "from": 9,
        "to": 18
      }
    }
  }

test_not_allowed_by_default {
    not allow
}

test_allowed_with_role_admin_method_post_and_correct_period {
  allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "POST",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiYWRtaW4ifQ.JZike9_-TeQiSdZsF2kTd9SiPe-gChOIIDg23gki18U"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}

test_allowed_with_role_admin_method_get_and_correct_period {
  allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "GET",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiYWRtaW4ifQ.JZike9_-TeQiSdZsF2kTd9SiPe-gChOIIDg23gki18U"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}

test_not_allowed_with_role_admin_correct_period_and_invalid_method {
  not allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "DELETE",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiYWRtaW4ifQ.JZike9_-TeQiSdZsF2kTd9SiPe-gChOIIDg23gki18U"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}

test_not_allowed_with_role_admin_valid_method_and_invalid_period {
  not allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "POST",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiYWRtaW4ifQ.JZike9_-TeQiSdZsF2kTd9SiPe-gChOIIDg23gki18U"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Sunday"
  with hour as 12
}

test_allowed_with_role_user_method_get_and_correct_period {
  allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "GET",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ik1hcnkgRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoidXNlciJ9.ny-WUJemM_Sg9ugLFHUj5RrkOGgVyMCxuZZ5qolE5cA"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}

test_not_allowed_with_role_user_correct_period_and_invalid_method {
  not allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "POST",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ik1hcnkgRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoidXNlciJ9.ny-WUJemM_Sg9ugLFHUj5RrkOGgVyMCxuZZ5qolE5cA"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}

test_not_allowed_whit_role_user_valid_method_and_invalid_period {
  not allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "GET",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ik1hcnkgRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoidXNlciJ9.ny-WUJemM_Sg9ugLFHUj5RrkOGgVyMCxuZZ5qolE5cA"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Tuesday"
  with hour as 12
}

test_not_allowed_with_invalid_role {
  not allow with input as {
      "attributes": {
          "request": {
              "http": {
                  "method": "POST",
                  "path": "/customers",
                  "headers": {
                      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiZm9vIn0.bNv6LqQ9k9cwFmCU-u10R0PAJKW92vApKLHBkrdZcjI"
                  }
              }
          }
      }
  }
  with data.attrs as attrs
  with week_day as "Monday"
  with hour as 12
}