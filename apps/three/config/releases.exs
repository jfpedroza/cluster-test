import Config

config :three, ThreeWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: "dEUYe/MmwJMD0BugBDYiV3TUGZa6XypE58u5g0hRap4EIpVH8u+le8LhNMv8a43J"

config :three, ThreeWeb.Endpoint, server: true
