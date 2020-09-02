package rbac

roles = {
    "admin": {
      "path": "/customers",
      "methods": [
        "POST",
        "GET"
      ]
    },
    "user": {
      "path": "/customers",
      "methods": [
        "GET"
      ]
    }
  }

test_not_allowed_by_default {
    not allow
}

test_allowed_with_role_admin_and_method_post {
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
    } with data.roles as roles
}

test_allowed_with_role_admin_and_method_get {
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
    } with data.roles as roles
}

test_allowed_with_role_user_and_method_get {
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
    } with data.roles as roles
}

test_not_allowed_with_invalid_role {
    not allow with input as {
        "attributes": {
            "request": {
                "http": {
                    "method": "GET",
                    "path": "/customers",
                    "headers": {
                        "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiZm9vIn0.bNv6LqQ9k9cwFmCU-u10R0PAJKW92vApKLHBkrdZcjI"
                    }
                }
            }
        }
    } with data.roles as roles
}

test_not_allowed_with_invalid_path {
    not allow with input as {
        "attributes": {
            "request": {
                "http": {
                    "method": "POST",
                    "path": "/foo",
                    "headers": {
                        "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJyb2xlIjoiYWRtaW4ifQ.JZike9_-TeQiSdZsF2kTd9SiPe-gChOIIDg23gki18U"
                    }
                }
            }
        }
    } with data.roles as roles
}

test_not_allowed_with_invalid_method {
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
    } with data.roles as roles
}
