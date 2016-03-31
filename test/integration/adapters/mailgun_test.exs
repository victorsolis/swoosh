defmodule Swoosh.Integration.MailgunAdapterTest do
  use ExUnit.Case, async: true

  alias Swoosh.Adapters.Mailgun
  import Swoosh.Email

  @moduletag external: true

  test "Mailgun Adapter" do
    sandbox_domain = System.get_env("MAILGUN_SANDBOX_DOMAIN")

    config = %{domain: sandbox_domain, api_key: System.get_env("MAILGUN_API_KEY")}

    email =
      %Swoosh.Email{}
      |> from("Mailgun Test <mailgun@#{sandbox_domain}>")
      |> reply_to("mailgun@#{sandbox_domain}")
      |> to("leafybasil+swoosh@gmail.com")
      |> cc("leafybasil+swooshcc@gmail.com")
      |> bcc("leafybasil+swooshbcc@gmail.com")
      |> subject("Mailgun integration test")
      |> text_body("Hey, just testing!")
      |> html_body("<h1>Hey, just <i>testing!</i></h1>")

    assert {:ok, response} = Swoosh.Adapters.Mailgun.deliver(email, config)
  end
end
