ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Callme.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Callme.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Callme.Repo)

