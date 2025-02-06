package jenkins.compliance

# Default rule: deny by default
default allow = false

# Example policy to ensure the application must not have DEBUG mode enabled.
deny[msg] if {
    input.app.debug == true
    msg := "Application DEBUG mode is enabled. Compliance check failed."
}

# Example policy to check if the application is using secure protocols.
deny[msg] if {
    input.app.protocol != "https"
    msg := "Application must use HTTPS protocol."
}

# Allow rule: Only allow if no deny rules match.
allow if {
    count(deny) == 0
}
