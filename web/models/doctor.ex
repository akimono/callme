defmodule Callme.Doctor do
  use Callme.Web, :model
use Arc.Ecto.Schema
  schema "doctors" do
    field :name, :string
    field :hiddeninfo, :string
    field :bio, :string
    field :specialty, :string
    field :picture, :string
    field :avatar, Callme.Avatar.Type

    has_many :services, Callme.Service
    timestamps
  end

  @required_fields ~w(name hiddeninfo bio specialty picture )
  @optional_fields ~w()
  @required_file_fields ~w()
  @optional_file_fields ~w(avatar)
  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
 
def changeset(model, params \\  %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @optional_file_fields)
  end
end
