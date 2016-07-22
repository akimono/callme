defmodule Callme.ZipcodeTest do
  use Callme.ModelCase

  alias Callme.Zipcode

  @valid_attrs %{county: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Zipcode.changeset(%Zipcode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Zipcode.changeset(%Zipcode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
