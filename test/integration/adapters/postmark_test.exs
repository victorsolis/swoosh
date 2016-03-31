defmodule Swoosh.Integration.PostmarkAdapterTest do
  use ExUnit.Case, async: true

  alias Swoosh.Adapters.Postmark
  import Swoosh.Email

  @moduletag external: true

  test "Postmark Adapter" do
    config = %{api_key: System.get_env("POSTMARK_API_KEY")}

    email =
      %Swoosh.Email{}
      |> from("Postmark Test <admin@playr.io>")
      |> reply_to("leafybasil+swoosh@gmail.com")
      |> to("leafybasil+swoosh@gmail.com")
      |> cc("leafybasil+swooshcc@gmail.com")
      |> bcc("leafybasil+swooshbcc@gmail.com")
      |> subject("Postmark integration test")
      |> text_body("Hey, just testing!")
      |> html_body("<h1>Hey, just <i>testing!</i></h1>")

    assert {:ok, response} = Swoosh.Adapters.Postmark.deliver(email, config)
  end
end
