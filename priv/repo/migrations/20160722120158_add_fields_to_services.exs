defmodule Callme.Repo.Migrations.AddFieldsToServices do
  use Ecto.Migration

  def change do
  	 	alter table(:services) do
  	 		add :specialty, :string
  	 		add :type, :string
  end
end
end
