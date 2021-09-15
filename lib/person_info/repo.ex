defmodule PersonInfo.Repo do
  use Ecto.Repo,
    otp_app: :person_info,
    adapter: Ecto.Adapters.Postgres
end
