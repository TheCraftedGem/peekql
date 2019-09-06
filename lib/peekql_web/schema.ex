defmodule PeekqlWeb.Schema do
  use Absinthe.Schema

  alias PeekqlWeb.OrdersResolver

  object :order do
    field :id, non_null(:id)
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
    # field :payments_applied, non_null(list_of(non_null(:payment)))
  end

  query do
    field :all_orders, non_null(list_of(non_null(:order))) do
      resolve &OrdersResolver.all_orders/3
    end
  end
end
