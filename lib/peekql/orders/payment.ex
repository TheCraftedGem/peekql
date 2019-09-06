defmodule Peekql.Orders.Payment do
  use Ecto.Schema
  import Ecto.Changeset
  # import Ecto.Query
  # alias Peekql.Repo

  schema "payments" do
    field :amount, :integer
    field :note, :string
    belongs_to :order, Peekql.Orders.Order
    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :note, :order_id])
    |> validate_required([])
  end

  # def index do
  #   query = from p in Peekql.Orders.Payment,
  #             inner_join: o in Peekql.Orders.Order, on: p.order_id == o.id
  #   Repo.all(query)
  # end

end
