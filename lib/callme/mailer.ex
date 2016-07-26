defmodule Callme.Mailer do
  use Mailgun.Client,
  domain: "http://callmemd.com",
  key: "key-0aac767d8bc24b174c9e3272f0ec700d"
  def send_welcome_text_email(email_address) do
  send_email to: email_address,
             from: "contact@callmemd.com",
             subject: "Welcome!",
             text: "Welcome to CallMeMD!"
end
end
