defmodule InvoiceAPI do
  use HTTPotion.Base

  @moduledoc """
    Implementación de Client HTTPotion.Base
  """

  @doc """
    Establece un URL base
  """
  def process_url(url) do
    "http://74.208.222.55:3001/" <> url
  end

  @doc """
    Procesa Json response y lo convierte en un Enum Object
  """
  def process_response_body(body) do
    body |> IO.iodata_to_binary |> :jsx.decode |> Enum.into(%{})
  end

end
