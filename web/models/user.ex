defmodule User do
 use Ecto.Schema
 import Ecto.Changeset
schema "users" do
field :name, :string
field :password, :string
field :email, :string
timestamps
end
def changeset(user, params \\ :empty) do
	user
	|> cast(params, ~w(name email), [])
	|> validate_length(:name, min: 1, max: 20)
	|> unique_constraint(:email)
	|> validate_format(:email, ~r/@/)
	|> validate_length(:email, min: 5, max: 50)
end
 
end