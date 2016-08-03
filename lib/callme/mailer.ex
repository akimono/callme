defmodule Callme.Mailer do
  @config domain: "https://api.mailgun.net/v3/mail.callmemd.com",
          key: "key-0aac767d8bc24b174c9e3272f0ec700d"
  use Mailgun.Client, @config


  @from "contact@callmemd.com"

  def send(user) do
    send_email to: user,
               from: @from,
               subject: "hello!",
               text: "Welcome!"
  end
  def servrequest(name, email, comments, doctor, service) do
   send_email to: "contact@callmemd.com",
              from: @from,
              subject: "Information Request - Call Me MD",
              html: "Message from #{name}<br>Email: #{email}<br> Regarding: #{service} provided by #{doctor}<br><br> Comments/Questions: <br>#{comments}"
  end
  def contact(name, email, comments) do
    send_email to: "contact@callmemd.com",
                from: @from,
                subject: "Contact Form Request",
                html: "Message from #{name}<br>Email: #{email}<br> Comments/Questions: <br>#{comments}"
  end
  def providerform(name, email, comments) do
      send_email to: "contact@callmemd.com",
                from: @from,
                subject: "Provider Form Request",
                html: "Message from #{name}<br>Email: #{email}<br> What he/she is interested in doing: <br>#{comments}"
  end
end