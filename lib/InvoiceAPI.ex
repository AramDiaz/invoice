defmodule InvoiceAPI do
  use HTTPotion.Base

  @moduledoc """

  """

  @doc """
    Hello world.
  """
  def process_url(url) do
    "http://74.208.222.55:3001/" <> url
  end

  @doc """

  """
  def process_response_body(body) do
    body |> IO.iodata_to_binary |> :jsx.decode |> Enum.into(%{})
  end

end
