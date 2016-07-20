defmodule Callme.Repo.Migrations.CreateDoctor do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :name, :string
      add :hiddeninfo, :string
      add :bio, :string
      add :specialty, :string
      add :picture, :string

      timestamps
    end

  end
end
