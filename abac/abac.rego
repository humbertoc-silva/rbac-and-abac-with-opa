package abac

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

now = ns {
    ns := time.now_ns()
}

week_day = wd {
    wd := time.weekday([now, "America/Sao_Paulo"])
}

hour = h {
    [h, _, _] := time.clock([now, "America/Sao_Paulo"])
}

action_allowed {
    role := data.attrs[decoded_token.role]
    role.path == http_request.path
    role.methods[_] == http_request.method
    role.week_day[_] == week_day
    role.hour.from <= hour
    role.hour.to >= hour
}
