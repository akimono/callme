defmodule Callme.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :name, :string
      add :code, :string
      add :topic, :string
      add :discription, :string

      timestamps
    end

  end
end
