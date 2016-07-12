defmodule Callme.SessionController do
  use Callme.Web, :controller
    def create(conn, _params) do
    	session = _params["session"]
    	success = "nothing"
    	email = session["email"]
    	password = session["password"]

    	case Repo.get_by(User, email: email) do 
    		nil -> 
    			conn
    			|> put_flash(:error, "Email incorrect")
    			|> redirect(to: user_path(conn, :index))
    		_ -> user = Repo.get_by(User, email: email)
    		    userpassword = user.crypted_password
    		    result = Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    		    case result do
    	         :true -> success = "succesufl decrypt"
    		    _ -> success = "unsuccessful decrypt"
    		   end
    	end
   render conn, "index.html", email: email, success: result, user: user.name, userpassword: user.crypted_password, password: password
  end
  def delete(conn, _) do

end
end