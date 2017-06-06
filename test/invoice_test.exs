defmodule INVOICETest do
  use ExUnit.Case
  doctest INVOICE

  #Test 1 request
  test "RequestApi" do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!("2017-01-01")
    finish = Date.from_iso8601!("2017-01-31")
    assert InvoiceAPIImp.getInvoice(id, start, finish)
  end

  #Test todo el algoritmo completo
  test "AlgoritmoQueryInvoices" do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!("2017-01-01")
    finish = Date.from_iso8601!("2017-12-31")
    assert QueryInvoices.start(id, start, finish)
  end

end
