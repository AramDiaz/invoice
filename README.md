# INVOICE

  **TODO: Consulta el número de facturas de Api Invoice**

## Instalación

### 1.-Instalar Elixir

  Instalar de acuerdo a la [documentación oficial](https://elixir-lang.org/install.html).

### 2.-Clonar Repositorio

```bash
$ git init
$ git clone git://github.com/AramDiaz/invoice.git invoice
```

  Nota: considera tener instalado git puedes checar la [documentación oficial](https://git-scm.com/downloads) para instalarlo.

### 3.-Instalamos las dependencias y compilamos

  Instalación de dependencias...

```bash
$ cd invoice
$ mix deps.get
```

  Compilamos...

```bash
$ mix compile
```

## Ejecutando el proyecto

```bash
$ iex -S mix
```

  `INVOICE.main` no pide parametros simplemente lo ejecutamos, es posible ajustar los parametros en el codigo.

```elixir
iex<1>> INVOICE.main
```

  Output...

```elixir
Total de Facturas: 805
Total de Peticiones: 24
:ok
```

  `INVOICE.mainparms(date_start, date_finish)`.
  `date_start` y `date_finish` en formato YYYY-mm-dd

```elixir
iex<1>> INVOICE.mainparms("2017-05-01","2017-05-15")
```

  Output...

```elixir
Total de Facturas: 292
Total de Peticiones: 9
:ok
```

## Testing

  El archivo `test/invoice_test.exs` contiene 2 scripts.
  * Test a 1 petición.
  * Test al algoritmo completo.

### Ejecutando Test

```bash
$ mix test
```

Output...

```bash
..

Finished in 3.5 seconds
2 tests, 0 failures

Randomized with seed 35000
```

## ¡¡¡ Gracias !!!
