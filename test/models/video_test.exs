defmodule Callme.VideoTest do
  use Callme.ModelCase

  alias Callme.Video

  @valid_attrs %{code: "some content", discription: "some content", name: "some content", topic: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
