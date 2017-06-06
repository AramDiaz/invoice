defmodule INVOICE do

  @moduledoc """
    Main Module
  """

  def main do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!("2017-01-01")
    finish = Date.from_iso8601!("2017-12-31")
    response = QueryInvoices.start(id, start, finish)
    IO.puts(["Total de Facturas: ", Integer.to_string(response[:total_sum])])
    IO.puts(["Total de Peticiones: ", Integer.to_string(response[:total_req])])
  end

  def mainparms(date_start, date_finish) do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!(date_start)
    finish = Date.from_iso8601!(date_finish)
    response = QueryInvoices.start(id, start, finish)
    IO.puts(["Total de Facturas: ", Integer.to_string(response[:total_sum])])
    IO.puts(["Total de Peticiones: ", Integer.to_string(response[:total_req])])
  end
end
