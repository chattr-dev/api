# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PfApi.Repo.insert!(%PfApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias PfApi.Repo
alias PfApi.Schema.User

Repo.insert!(%User{
    address: "52 Puppet Ln",
    authid: "auth0|621138e1c41ff000728542be",
    city: "columbus",
    email: "james_h@gmail.com",
    state: "OH",
    zip: "43215"
})

# field :address, :string
# field :authid, :string
# field :city, :string
# field :email, :string
# field :state, :string
# field :zip, :string
