# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Peekql.Repo.insert!(%Peekql.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
  order_1 = %{id: 1, description: "some description", total: 10000, balance_due: 500}
  order_2 = %{id: 2, description: "some description", total: 10000, balance_due: 500}
  order_3 = %{id: 3, description: "some description", total: 10000, balance_due: 500}

  {:ok, order_1} = Peekql.Orders.create_order(order_1)
  {:ok, order_2} = Peekql.Orders.create_order(order_2)
  {:ok, order_3} = Peekql.Orders.create_order(order_3)
