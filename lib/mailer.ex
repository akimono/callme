defmodule Callme.Mailer do
  @config domain: Application.get_env(:callme, :mailgun_domain),
          key: Application.get_env(:callme, :mailgun_key)
  use Mailgun.Client, @config


  @from "contact@callmemd.com"

  def send(user) do
    send_email to: user,
               from: @from,
               subject: "hello!",
               text: "Welcome!"
  end
end