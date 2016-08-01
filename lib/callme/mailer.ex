defmodule Callme.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:callme, :mailgun_domain),
      key: Application.get_env(:callme, :mailgun_key)

  def send_welcome_text_email(email_address) do
  send_email to: email_address,
             from: "contact@callmemd.com",
             subject: "Welcome!",
             text: "Welcome to CallMeMD!"
end
end
 