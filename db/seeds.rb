# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Author", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Octavia", email: "octavia@skaikru.com", password: "octaviablake", password_confirmation: "octaviablake", role_id: r1.id})
u2 = User.create({name: "Lexa", email: "lexa@trigeda.com", password: "lexawoods", password_confirmation: "lexawoods", role_id: r2.id})
u3 = User.create({name: "Clarke", email: "clarke@skaikru.com", password: "clarkegriffin", password_confirmation: "clarkegriffin", role_id: r2.id})
u4 = User.create({name: "Raven", email: "raven@skaikru.com", password: "ravenreyes", password_confirmation: "ravenreyes", role_id: r3.id})

p1 = Post.create({title: "Jus drein jus daun", content: "Yu gonplei ste odon.", user_id: u2.id})
p2 = Post.create({title: "Ai laik heda", content: "Non na throu daun gon ai.", user_id: u2.id})
p3 = Post.create({title: "Landed!", content: "We made it to the ground!", user_id: u3.id})

a1 = Affiliation.create({name: "Trikru"})
a2 = Affiliation.create({name: "Skaikru"})
a3 = Affiliation.create({name: "Floukru"})
a4 = Affiliation.create({name: "None"})


# Unregistered users are redirected to the sign up page
# Registered users: can view items
# Authors: can view items, create items, as well as update and destroy any items that belong to them
# Admin: can perform any CRUD operation on any resource