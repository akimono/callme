defmodule Callme.ZipcodeController do
  use Callme.Web, :controller

  alias Callme.Zipcode

  plug :scrub_params, "zipcode" when action in [:create, :update]

  def index(conn, _params) do
    zipcodes = Repo.all(Zipcode)
    render(conn, "index.html", zipcodes: zipcodes)
  end

  def new(conn, _params) do
    changeset = Zipcode.changeset(%Zipcode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"zipcode" => zipcode_params}) do
    changeset = Zipcode.changeset(%Zipcode{}, zipcode_params)

    case Repo.insert(changeset) do
      {:ok, _zipcode} ->
        conn
        |> put_flash(:info, "Zipcode created successfully.")
        |> redirect(to: zipcode_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    zipcode = Repo.get!(Zipcode, id)
    render(conn, "show.html", zipcode: zipcode)
  end

  def edit(conn, %{"id" => id}) do
    zipcode = Repo.get!(Zipcode, id)
    changeset = Zipcode.changeset(zipcode)
    render(conn, "edit.html", zipcode: zipcode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "zipcode" => zipcode_params}) do
    zipcode = Repo.get!(Zipcode, id)
    changeset = Zipcode.changeset(zipcode, zipcode_params)

    case Repo.update(changeset) do
      {:ok, zipcode} ->
        conn
        |> put_flash(:info, "Zipcode updated successfully.")
        |> redirect(to: zipcode_path(conn, :show, zipcode))
      {:error, changeset} ->
        render(conn, "edit.html", zipcode: zipcode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    zipcode = Repo.get!(Zipcode, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(zipcode)

    conn
    |> put_flash(:info, "Zipcode deleted successfully.")
    |> redirect(to: zipcode_path(conn, :index))
  end
end
