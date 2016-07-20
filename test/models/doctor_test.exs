defmodule Callme.DoctorTest do
  use Callme.ModelCase

  alias Callme.Doctor

  @valid_attrs %{bio: "some content", hiddeninfo: "some content", name: "some content", picture: "some content", specialty: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Doctor.changeset(%Doctor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Doctor.changeset(%Doctor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
