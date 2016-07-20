defmodule Callme.Service do
  use Callme.Web, :model

  schema "services" do
    field :name, :string
    field :locations, :string
    field :info, :string
    field :cost, :string
    field :active, :string
    belongs_to :doctor, Callme.Doctor, foreign_key: :doctor_id

    timestamps
  end

  @required_fields ~w(name locations info cost active doctor_id)
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
