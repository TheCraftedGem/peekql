require IEx
defmodule Peekql.OrderResolverTest do
  use PeekqlWeb.ConnCase
  alias Peekql.Orders
  alias Peekql.AbsintheHelpers

  @order_1 %{description: "some description", total: 10000, balance_due: 500, payments_applied: []}
  @order_2 %{description: "some description", total: 10000, balance_due: 500, payments_applied: []}
  @order_3 %{description: "some description", total: 10000, balance_due: 500, payments_applied: []}

  describe "Order Resolver" do
    test "returns all order ids", context do
      {:ok, order_1} = Orders.create_order(@order_1)
      {:ok, order_2} = Orders.create_order(@order_2)
      {:ok, order_3} = Orders.create_order(@order_3)


      query = """
      {
        allOrders{
          id
        }
      }
      """

      res = context.conn
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "allOrders"))

      assert Enum.map(json_response(res, 200)["data"]["allOrders"], fn order -> order["id"] end)  == [to_string(order_1.id), to_string(order_2.id), to_string(order_3.id)]
    end

    test "returns all order descriptions", context do
      {:ok, order_1} = Orders.create_order(@order_1)
      {:ok, order_2} = Orders.create_order(@order_2)
      {:ok, order_3} = Orders.create_order(@order_3)


      query = """
      {
        allOrders{
          description
        }
      }
      """

      res = context.conn
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "allOrders"))

      assert Enum.map(json_response(res, 200)["data"]["allOrders"], fn order -> order["description"] end)  == [order_1.description, order_2.description, order_3.description]
    end
  end
end
