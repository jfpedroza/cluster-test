FROM bitwalker/alpine-elixir-phoenix:1.9.0

ENV MIX_ENV=prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

RUN mix compile

USER default

CMD ["mix", "run", "--no-halt"]
