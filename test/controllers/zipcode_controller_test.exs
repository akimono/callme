defmodule Callme.ZipcodeControllerTest do
  use Callme.ConnCase

  alias Callme.Zipcode
  @valid_attrs %{county: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, zipcode_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing zipcodes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, zipcode_path(conn, :new)
    assert html_response(conn, 200) =~ "New zipcode"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, zipcode_path(conn, :create), zipcode: @valid_attrs
    assert redirected_to(conn) == zipcode_path(conn, :index)
    assert Repo.get_by(Zipcode, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, zipcode_path(conn, :create), zipcode: @invalid_attrs
    assert html_response(conn, 200) =~ "New zipcode"
  end

  test "shows chosen resource", %{conn: conn} do
    zipcode = Repo.insert! %Zipcode{}
    conn = get conn, zipcode_path(conn, :show, zipcode)
    assert html_response(conn, 200) =~ "Show zipcode"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, zipcode_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    zipcode = Repo.insert! %Zipcode{}
    conn = get conn, zipcode_path(conn, :edit, zipcode)
    assert html_response(conn, 200) =~ "Edit zipcode"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    zipcode = Repo.insert! %Zipcode{}
    conn = put conn, zipcode_path(conn, :update, zipcode), zipcode: @valid_attrs
    assert redirected_to(conn) == zipcode_path(conn, :show, zipcode)
    assert Repo.get_by(Zipcode, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    zipcode = Repo.insert! %Zipcode{}
    conn = put conn, zipcode_path(conn, :update, zipcode), zipcode: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit zipcode"
  end

  test "deletes chosen resource", %{conn: conn} do
    zipcode = Repo.insert! %Zipcode{}
    conn = delete conn, zipcode_path(conn, :delete, zipcode)
    assert redirected_to(conn) == zipcode_path(conn, :index)
    refute Repo.get(Zipcode, zipcode.id)
  end
end
