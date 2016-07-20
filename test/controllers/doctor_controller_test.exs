defmodule Callme.DoctorControllerTest do
  use Callme.ConnCase

  alias Callme.Doctor
  @valid_attrs %{bio: "some content", hiddeninfo: "some content", name: "some content", picture: "some content", specialty: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, doctor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing doctors"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, doctor_path(conn, :new)
    assert html_response(conn, 200) =~ "New doctor"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, doctor_path(conn, :create), doctor: @valid_attrs
    assert redirected_to(conn) == doctor_path(conn, :index)
    assert Repo.get_by(Doctor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, doctor_path(conn, :create), doctor: @invalid_attrs
    assert html_response(conn, 200) =~ "New doctor"
  end

  test "shows chosen resource", %{conn: conn} do
    doctor = Repo.insert! %Doctor{}
    conn = get conn, doctor_path(conn, :show, doctor)
    assert html_response(conn, 200) =~ "Show doctor"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, doctor_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    doctor = Repo.insert! %Doctor{}
    conn = get conn, doctor_path(conn, :edit, doctor)
    assert html_response(conn, 200) =~ "Edit doctor"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    doctor = Repo.insert! %Doctor{}
    conn = put conn, doctor_path(conn, :update, doctor), doctor: @valid_attrs
    assert redirected_to(conn) == doctor_path(conn, :show, doctor)
    assert Repo.get_by(Doctor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    doctor = Repo.insert! %Doctor{}
    conn = put conn, doctor_path(conn, :update, doctor), doctor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit doctor"
  end

  test "deletes chosen resource", %{conn: conn} do
    doctor = Repo.insert! %Doctor{}
    conn = delete conn, doctor_path(conn, :delete, doctor)
    assert redirected_to(conn) == doctor_path(conn, :index)
    refute Repo.get(Doctor, doctor.id)
  end
end
