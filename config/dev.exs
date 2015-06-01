use Mix.Config

#config :db_bench, DbBench.Repo,
#  adapter: Ecto.Adapters.Postgres,
#  database: "ecto_simple",
#  username: "postgres",
#  password: "postgres",
#  hostname: "10.0.3.82",
#  size: 10,
#  max_overflow: 10

config :db_bench, DbBench.Repo,
  adapter: Ecto.Adapters.MySQL,
  database: "test",
  username: "test",
  password: "test",
  hostname: "127.0.0.1",
  size: 10,
  max_overflow: 10

config :logger, level: :error
  #config :logger, level: :debug

