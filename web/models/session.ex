defmodule Session do
	use Ecto.Schema
	import Ecto.Changeset

schema "session" do
field :password, :string
field :email, :string
timestamps
end

def changeset(session, params \\ :empty) do
	session
	|> cast(params, ~w(name email ), [])
end
end