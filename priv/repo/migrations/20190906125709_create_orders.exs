defmodule Peekql.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :description, :string
      add :total, :integer
      add :balance_due, :integer

      timestamps()
    end

  end
end
