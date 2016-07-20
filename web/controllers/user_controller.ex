defmodule Callme.UserController do
  use Callme.Web, :controller
  plug :authenticate when action in [:show]
  def index(conn, _params) do
    user = nil
    changeset = Session.changeset(%Session{})
    users = Repo.all(User)
    render conn, "index.html", users: users, changeset:  changeset, user: user
  end
  def show(conn, %{"id" => id}) do
  	user = Repo.get(User, id)
    render conn, "show.html", user: user
  end
  def new(conn, _params) do
  changeset = User.changeset(%User{})
  render conn, "new.html", changeset: changeset
  end
 def create(conn, %{"user" => user_params}) do
changeset = User.login_changeset(%User{}, user_params)
case Repo.insert(changeset) do
{:ok, user} ->
conn
|> Callme.Auth.login(user)
|> put_flash(:info, "#{user.name} created!")
|> redirect(to: user_path(conn, :index), user: user)
{:error, changeset} ->
render(conn, "new.html", changeset: changeset)
end
end
def edit(conn, %{"id" => id}) do
  user = Repo.get(User, id)
  changeset = User.changeset(%User{})
  render conn, "edit.html", changeset: changeset, user: user
  end
def update(conn, %{"id" => id, "user" => user_params}) do
  user = Repo.get(User, id)
  admin = user_params["admin"]
  if admin == "true" do 
    admin = true
  else
    admin = false 
  end
  user = %{user | email: user_params["email"], name: user_params["name"], admin: admin}
  case Repo.update(user) do
    {:ok, user} ->
conn
|> put_flash(:info, "#{user.name} updated!")
|> redirect(to: user_path(conn, :index), user: user)
{:error, changeset} ->
render(conn, "edit.html", user: user, changeset: changeset)
  end
end
def delete(conn, %{"id" => id}) do 
   changeset = Session.changeset(%Session{})
  user = Repo.get(User, id)
  Repo.delete!(user)
   users = Repo.all(User)
  render(conn, "index.html", changeset: changeset, users: users)
end
def logincreate(conn,  session_params) do
  session = session_params["session"]
  email = session["email"]
  user = Repo.get_by(User, email: email)
  Callme.Auth.login(conn, user)
  render conn, Callme.SessionView, "index.html", user: user
  end
defp authenticate(conn, _opts) do
if conn.assigns.current_user do
conn
else
conn
|> put_flash(:error, "You must be logged in to access that page")
|> redirect(to: page_path(conn, :index))
|> halt()
end
end
end