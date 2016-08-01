defmodule Callme.Mailer do
  @config domain: System.get_env("MAILGUN_DOMAIN"),
          key: System.get_env("MAILGUN_API_KEY")
  use Mailgun.Client, @config


  @from "contact@callmemd.com"

  def send(user) do
    send_email to: user,
               from: @from,
               subject: "hello!",
               text: "Welcome!"
  end
end