defmodule PeekqlWeb.Schema do
  use Absinthe.Schema

  alias PeekqlWeb.OrdersResolver

  object :payment do
    field :amount, non_null(:integer)
    field :note, non_null(:string)
    field :order_id, non_null(:id)
  end
  object :order do
    field :id, non_null(:id)
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
    field :payments_applied, non_null(list_of(non_null(:payment)))
  end

  input_object :order_input_type do
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
    field :payments_applied, non_null(list_of(non_null(:payment)))
  end


  query do
    field :all_orders, non_null(list_of(non_null(:order))) do
      resolve &OrdersResolver.all_orders/3
    end
  end

  mutation do
    field :create_order, type: :order do
      arg(:input, non_null(:order_input_type))
      resolve &OrdersResolver.create_order/3
    end
  end
end
