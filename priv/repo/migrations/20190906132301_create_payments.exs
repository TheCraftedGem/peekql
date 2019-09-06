defmodule Peekql.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :integer
      add :note, :text
      add :order_id, references(:orders, on_delete: :nothing)

      timestamps()
    end
    create index(:payments, [:order_id])
  end
end
