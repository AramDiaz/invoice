defmodule INVOICETest do
  use ExUnit.Case
  doctest INVOICE

  test "QueryInvoices" do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!("2017-05-01")
    finish = Date.from_iso8601!("2017-05-30")
    assert QueryInvoices.start(id, start, finish)
  end

  test "RequestApi" do
    id = "9918808d-8c8f-4b2e-8d7f-d53b89395f45"
    start = Date.from_iso8601!("2017-05-01")
    finish = Date.from_iso8601!("2017-05-30")
    assert InvoiceAPIImp.getInvoice(id, start, finish)
  end
end
