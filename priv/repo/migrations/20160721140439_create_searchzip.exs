defmodule Callme.Repo.Migrations.CreateSearchzip do
  use Ecto.Migration

  def change do
  	   create table(:searchzip) do
      add :searchzip, :string

      timestamps
    end
  end
end
