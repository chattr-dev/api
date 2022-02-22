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
alias PfApi.Schema.Project
alias PfApi.Schema.Client
alias PfApi.Schema.UserProject

Repo.delete_all(UserProject)
Repo.delete_all(User)
Repo.delete_all(Project)
Repo.delete_all(Client)

Repo.insert!(%User{
    address: "52 Puppet Ln",
    authid: "auth0|621138e1c41ff000728542be",
    city: "columbus",
    email: "james_h@gmail.com",
    state: "OH",
    zip: "43215",
    id: 120
})

Repo.insert!(%Client{name: "metallix", id: 125})

Repo.insert!(%Project{type: "website", id: 130, client_id: 125})
Repo.insert!(%Project{type: "Online Store", id: 145, client_id: 125})

Repo.insert!(%UserProject{user_id: 120, project_id: 130})
Repo.insert!(%UserProject{user_id: 120, project_id: 145})
