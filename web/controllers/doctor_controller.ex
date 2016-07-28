defmodule Callme.DoctorController do
  use Callme.Web, :controller

  alias Callme.Doctor

  plug :scrub_params, "doctor" when action in [:create, :update]

  def index(conn, _params) do
    doctors = Repo.all(Doctor)
    render(conn, "index.html", doctors: doctors)
  end

  def new(conn, _params) do
    changeset = Doctor.changeset(%Doctor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    changeset = Doctor.changeset(%Doctor{}, doctor_params)
    avatar = doctor_params["avatar"]
    doctor = doctor_params
    Callme.Avatar.store({%Plug.Upload{}, doctor})
    case Repo.insert(changeset) do
      {:ok, _doctor} ->
        conn
        |> put_flash(:info, "Doctor created successfully.")
        |> redirect(to: doctor_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Repo.get!(Doctor, id) |> Repo.preload(:services)
    render(conn, "show.html", doctor: doctor)
  end

  def edit(conn, %{"id" => id}) do
    doctor = Repo.get!(Doctor, id)
    changeset = Doctor.changeset(doctor)
    render(conn, "edit.html", doctor: doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Repo.get!(Doctor, id)
    changeset = Doctor.changeset(doctor, doctor_params)

    case Repo.update(changeset) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor updated successfully.")
        |> redirect(to: doctor_path(conn, :show, doctor))
      {:error, changeset} ->
        render(conn, "edit.html", doctor: doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Repo.get!(Doctor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(doctor)

    conn
    |> put_flash(:info, "Doctor deleted successfully.")
    |> redirect(to: doctor_path(conn, :index))
  end
end
