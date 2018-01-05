defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo

  def insert_user(attrs \\ %{}) do
    changes = Map.merge(%{ # Map or Keyword in place of Dict (that is deprecated)
      name: "Some User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}"
      }, attrs)

    %Rumbl.User{}
    |> Rumbl.User.registration_changeset(changes)
    |> Repo.insert!()
  end


  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert!()
  end
end