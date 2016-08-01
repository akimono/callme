defmodule Callme.Mailer do
  @config domain: "callmemd.com",
          key: "key-0aac767d8bc24b174c9e3272f0ec700d"
  use Mailgun.Client, @config


  @from "contact@callmemd.com"

  def send(user) do
    send_email to: user,
               from: @from,
               subject: "hello!",
               text: "Welcome!"
  end
end