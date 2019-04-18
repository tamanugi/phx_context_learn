defmodule PhxContextLearn.CMS.Page do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhxContextLearn.CMS.Author

  schema "pages" do
    field :body, :string
    field :title, :string
    field :views, :integer, default: 0
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
