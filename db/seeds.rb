# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_name = ["Gateway","meditab"]
1.times do |i|
  kanban_column = KanbanColumn.find_or_create_by!(name:i)
  client_request = kanban_column.client_requests.create!(customer_name: customer_name[i])
  dept_name = ["ror","pyhon","php"]
  no_of_resources = [2,3,4]
  3.times do |j|
    dept = client_request.departments.create!(name: dept_name[j], no_of_resources:no_of_resources[j])
  end
end

1.times do |i|
  kanban_column = KanbanColumn.find_or_create_by!(name:i)
  client_request =  kanban_column.client_requests.create!(customer_name: customer_name[i+1])
  dept_name = ["design","ios"]
  no_of_resources = [2,1]
  2.times do |j|
    dept = client_request.departments.create!(name: dept_name[j], no_of_resources:no_of_resources[j])
  end
end
