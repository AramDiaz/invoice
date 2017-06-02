defmodule InvoiceAPIImp do

  @moduledoc """
    Implementación de InvoiceAPI
  """

  @doc """
    Procesa y acomula el total de facturas y peticiones
  """
  def process(id, start, finish, total_sum, total_req) do
    invoices = getInvoice(id, start, finish)
    if invoices == "Hay más de 100 resultados" do
      %{:success   => false,
        :total_sum => total_sum,
        :total_req => (total_req + 1)}
    else
      %{:success   => true,
        :total_sum => (total_sum + invoices),
        :total_req => (total_req + 1)}
    end
  end

  @doc """
    Request al servicio facturas
  """
  def getInvoice(id, start, finish) do
    InvoiceAPI.get("facturas",
        query: %{id: id, start: Date.to_iso8601(start), finish: Date.to_iso8601(finish)})
        .body["response"]
  end

end
