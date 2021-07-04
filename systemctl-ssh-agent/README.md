### Start ssh-agent with systemd user

It is possible to use the systemd/User facilities to start the agent. Use this if you would like your ssh agent to run when you are logged in, regardless of whether x is running.

`~/.config/systemd/user/ssh-agent.service`

```
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Then export the environment variable SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" in your login shell initialization file, such as ~/.bash_profile.

Finally, enable or start the service with the --user flag.