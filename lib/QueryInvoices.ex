defmodule QueryInvoices do

  @moduledoc """
    Consulta número de facturas y de peticiones
  """

  @doc """
    Inicia el proceso
    Si en el Loop 1 hay info, termina, si no Itera
  """
  def start(id, start, finish) do
    total_sum = 0
    total_req = 0
    data = send_api(id, start, finish, total_sum, total_req)
    if(data[:success]) do data
    else
      divide_date(id, start, finish, data)
    end
  end

  @doc """
    Divide el rango de fechas entre 2 generando nuevos rangos de fechas,
    si la consulta es mayor a 100 vuelve a dividir e itera,
    si es menor a 100 acomula el total de facturas,
    termina hasta que ya no es posible generar más rangos de fechas.
    El numero de rangos generados depende de la condición de las 100 facturas,
    asi mismo el numero de as peticiones depende de la información de la base de datos
    que van en funcion para generar los rangos. se podria decir que son dinamicos.
  """
  defp divide_date(id, start, finish, data) when start != finish do
    diff = finish |> Calendar.Date.diff(start)
    days = Integer.floor_div(diff, 2)
    new_finish = start |> Calendar.Date.advance!(days)
    new_start = new_finish |> Calendar.Date.next_day!
    data_range1 = send_api(id, start, new_finish, data[:total_sum], data[:total_req])
    data_range2 = send_api(id, new_start, finish, data_range1[:total_sum], data_range1[:total_req])
    cond do
      data_range1[:success] and data_range2[:success] ->
        data_range2
      data_range1[:success] == false and data_range2[:success] ->
        divide_date(id, start, new_finish, data_range2)
      data_range1[:success] and data_range2[:success] == false ->
        divide_date(id, new_start, finish, data_range1)
      data_range1[:success] == false and data_range2[:success] == false ->
        drt = divide_date(id, start, new_finish, data_range2)
        divide_date(id, new_start, finish, drt)
    end
  end

  @doc """
    Recursive Aux módulo devuelve los datos
  """
  defp divide_date(id, start, finish, data),
    do: %{:total_sum => data[:total_sum], :total_req => data[:total_req]}

  @doc """
    Consulta API
  """
  defp send_api(id, start, finish, total_sum, total_req) do
    InvoiceAPIImp.process(id, start, finish, total_sum, total_req)
  end

end
