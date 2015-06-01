defmodule DbBench.MysqlexSupervisor do
  use Supervisor

  # this will create a linked process and call init
  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    pool_options = [
      {:name, {:local, :mysqlex_pool}},
      {:worker_module, Mysqlex.Connection},
      {:size, 10},
      {:max_overflow, 10}
      ]
    mysqlex_args = [
      {:hostname,"127.0.0.1"},
      {:database, String.to_char_list("test")},
      {:username, String.to_char_list("test")},
      {:password, 'test'}
      ]

    children = [
      :poolboy.child_spec( :mysqlex_pool, pool_options, mysqlex_args )
      ]
    supervise(children, strategy: :one_for_one)
  end

  def q(args) do
    {:ok, item} = :poolboy.transaction(:mysqlex_pool, fn(worker) -> Mysqlex.Connection.query(worker, args, []) end)
  end
end
