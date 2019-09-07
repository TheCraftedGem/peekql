require IEx
defmodule PeekqlWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: Peekql.Repo
  import_types Absinthe.Type.Custom

  alias PeekqlWeb.OrdersResolver

  object :payment do
    field :id, non_null(:id)
    field :amount, non_null(:integer)
    field :note, :string
    field :order_id, non_null(:id)
    field :order, :order, resolve: assoc(:order)
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end

  object :order do
    field :id, non_null(:id)
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
    field :payments, list_of(:payment)
  end

  input_object :order_input_type do
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
  end

  input_object :payment_input_type do
    field :amount, non_null(:integer)
    field :note, non_null(:string)
    field :order_id, non_null(:id)
  end


  query do
    @desc "Shows All Orders"
    field :all_orders, non_null(list_of(non_null(:order))) do
      resolve &OrdersResolver.all_orders/3
    end

    @desc "Find One Order"
    field :find_order, :order do
      arg :id, non_null(:id)
      resolve &OrdersResolver.find_order/3
    end
  end

  mutation do
    @desc "Creates Order"
    field :create_order, :order do
      arg(:input, non_null(:order_input_type))
      resolve &OrdersResolver.create_order/3
    end

    @desc "Creates Payment For Order"
    field :place_payment, :payment do
      arg(:input, non_null(:payment_input_type))
      resolve &OrdersResolver.place_payment/3
    end

  end

  scalar :utc_datetime, name: "utc_dateTime" do
    # We will serialize a datetime to iso8601
    serialize(&NaiveDateTime.to_iso8601/1)
    # We will define a `parse_datetime/1` function for parsing
    parse(&parse_datetime/1)
  end

  defp parse_datetime(%Absinthe.Blueprint.Input.String{value: value}) do
    case DateTime.from_iso8601(value) do
      {:ok, datetime, 0} -> {:ok, datetime}
      {:ok, _datetime, _offset} -> :error
      _error -> :error
    end
  end

  defp parse_datetime(%Absinthe.Blueprint.Input.Null{}) do
    {:ok, nil}
  end

  defp parse_datetime(_) do
    :error
  end
end
