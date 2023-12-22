# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Account.create( email: "admin@mail.ru", role_id: 1, password: "123123" )

Account.create( email: "manager0@mail.ru", role_id: 2, password: "123123" )
Account.create( email: "manager1@mail.ru", role_id: 2, password: "123123" )

Account.create( email: "worker1-1@mail.ru", role_id: 3, password: "123123" )
Account.create( email: "worker1-2@mail.ru", role_id: 3, password: "123123" )

Account.create( email: "worker2-1@mail.ru", role_id: 4, password: "123123" )
Account.create( email: "worker2-2@mail.ru", role_id: 4, password: "123123" )

Account.create( email: "worker3-1@mail.ru", role_id: 5, password: "123123" )
Account.create( email: "worker3-2@mail.ru", role_id: 5, password: "123123" )

Account.create( email: "client0@mail.ru", role_id: 6, password: "123123" )
Account.create( email: "client1@mail.ru", role_id: 6, password: "123123" )

Role.create( role_name: "Администратор" )
Role.create( role_name: "Менеджер" )
Role.create( role_name: "Работник 1 линии" )
Role.create( role_name: "Работник 2 линии" )
Role.create( role_name: "Работник 3 линии" )
Role.create( role_name: "Клиент" )

TicketStatus.create( status_name: "Новая" )
TicketStatus.create( status_name: "В работе" )
TicketStatus.create( status_name: "Клиент проверяет" )
TicketStatus.create( status_name: "Закрыта" )

TicketType.create( type_name: "Обычная" )
TicketType.create( type_name: "Плановое обслуживание" )
TicketType.create( type_name: "Экстренная" )