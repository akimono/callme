defmodule User do
 use Ecto.Schema
 import Ecto.Changeset
schema "users" do
field :name, :string
field :password, :string, virtual: true
field :email, :string
field :crypted_password, :string
field :admin, :boolean, default: false
timestamps
end
@required_fields ~w(name email )

def log_changeset(user, params) do
	user
	|> cast(params, ~w(email password), [])
end
def login_changeset(user, params) do
user
|> changeset(params)
|> cast(params, ~w(password), [])
|> validate_length(:password, min: 6, max: 100)
|> put_pass_hash()
end
def changeset(user, params \\ :empty) do
	user
	|> cast(params, ~w(name email admin), [])
	|> validate_length(:email, min: 1, max: 20)
end
defp put_pass_hash(changeset) do
case changeset do
%Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
put_change(changeset, :crypted_password, Comeonin.Bcrypt.hashpwsalt(pass))
_ ->
changeset
end
end
end