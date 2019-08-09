FROM bitwalker/alpine-elixir-phoenix:1.9.0

# Set exposed ports
EXPOSE 6000
ENV PORT=6000 MIX_ENV=prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

ADD . .

RUN mix compile

USER default

CMD ["mix", "phx.server"]
