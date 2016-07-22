defmodule Callme.Repo.Migrations.CreateZipcode do
  use Ecto.Migration

  def change do
    create table(:zipcodes) do
      add :zip, :string
      add :county, :string
      add :state, :string

      timestamps
    end

  end
end
