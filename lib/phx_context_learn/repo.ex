defmodule PhxContextLearn.Repo do
  use Ecto.Repo,
    otp_app: :phx_context_learn,
    adapter: Ecto.Adapters.Postgres
end
