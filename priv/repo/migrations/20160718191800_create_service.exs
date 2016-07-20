defmodule Callme.Repo.Migrations.CreateService do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :locations, :string
      add :info, :string
      add :cost, :string
      add :active, :string
      add :doctor_id, references(:doctors, on_delete: :nothing)

      timestamps
    end
    create index(:services, [:doctor_id])

  end
end
