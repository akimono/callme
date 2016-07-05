defmodule Callme.UserView do
  use Callme.Web, :view
def first_name(%User{name: name}) do
name
|> String.split(" ")
|> Enum.at(0)
end
end
