defmodule Callme.Repo.Migrations.AddFieldsToDoctors do
  use Ecto.Migration

  def change do
  	alter table(:doctors) do
  		
  	add :avatar, :string
  	end
  end
end
