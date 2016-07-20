defmodule Callme.Doctor do
  use Callme.Web, :model

  schema "doctors" do
    field :name, :string
    field :hiddeninfo, :string
    field :bio, :string
    field :specialty, :string
    field :picture, :string

    has_many :services, Callme.Service
    timestamps
  end

  @required_fields ~w(name hiddeninfo bio specialty picture)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
