defmodule Rumbl.Video do
  use Rumbl.Web, :model
  @required_fields [:url, :title, :description]
  @optional_fields []

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    # |> cast(params, [:url, :title, :description])
    |> cast(params, @required_fields, @optional_fields)
    # |> validate_required([:url, :title, :description])
    |> validate_required(@required_fields)
  end
end
