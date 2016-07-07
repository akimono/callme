defmodule Callme.Repo.Migrations.Remaketable do
  use Ecto.Migration

  def change do
  	create table(:users) do
	add :name, :string
	add :email, :string, null: false
	add :password, :string

	timestamps
  end
end
end