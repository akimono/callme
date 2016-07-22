defmodule Callme.ServiceController do
  use Callme.Web, :controller

  alias Callme.Service

  plug :scrub_params, "service" when action in [:create, :update]

  def index(conn, %{"doctor_id" => doctor_id}) do
    doctor_id = doctor_id
    doctor = Repo.get(Callme.Doctor, doctor_id)
    services = Repo.all(assoc(doctor, :services))
    render(conn, "index.html", services: services, doctor: doctor)
  end

  def new(conn, %{"doctor_id" => doctor_id}) do
    changeset = Service.changeset(%Service{})
    doctor = Repo.get(Callme.Doctor, doctor_id)
    render(conn, "new.html", changeset: changeset, doctor: doctor)
  end

  def create(conn, %{"service" => service_params}) do
    changeset = Service.changeset(%Service{}, service_params)
    doctor_id = service_params["doctor_id"]
    case Repo.insert(changeset) do
      {:ok, _service} ->
        conn
        |> put_flash(:info, "Service created successfully.")
        |> redirect(to: service_path(conn, :index, doctor_id: doctor_id ))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)
    render(conn, "show.html", service: service)
  end

  def edit(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)
    doctor = Repo.get(Callme.Doctor, service.doctor_id)
    changeset = Service.changeset(service)
    render(conn, "edit.html", service: service, changeset: changeset, doctor: doctor)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
   
    service = Repo.get!(Service, id)
     changeset = Service.changeset(service, service_params)

    case Repo.update(changeset) do
      {:ok, service} ->
        conn
        |> put_flash(:info, "Service updated successfully.")
        |> redirect(to: service_path(conn, :show, service))
      {:error, changeset} ->
        render(conn, "edit.html", service: service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(service)

    conn
    |> put_flash(:info, "Service deleted successfully.")
    |> redirect(to: service_path(conn, :index))
  end
end
