package rbac

import input.attributes.request.http as http_request

default allow = false

allow {
    action_allowed
}

token = encoded {
    [_, encoded] := split(http_request.headers.authorization, " ")
}

decoded_token = payload {
    [_, payload, _] := io.jwt.decode(token)
}

action_allowed {
    role := data.roles[decoded_token.role]
    role.path == http_request.path
    role.methods[_] == http_request.method
}
