defmodule Callme.ServiceTest do
  use Callme.ModelCase

  alias Callme.Service

  @valid_attrs %{active: "some content", cost: "some content", info: "some content", locations: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Service.changeset(%Service{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Service.changeset(%Service{}, @invalid_attrs)
    refute changeset.valid?
  end
end
