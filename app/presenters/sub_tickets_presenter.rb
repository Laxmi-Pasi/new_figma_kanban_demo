class SubTicketsPresenter
  def initialize(kanban_columns, client_requests)
    @kanban_columns = kanban_columns
    @client_requests = client_requests
  end

  def client_details
    # col_hash = Hash.new
    # @kanban_columns.each do |col|
    #   col_arr = []
    #   @client_requests.each do |client|
    #     client_hash = Hash.new
    #     client_arr = []
    #     client.departments.each do |dept|
    #       dept_hash = Hash.new
    #       dev_arr = []
    #       dept.developers.each do |dev|
    #         if col.name == dev.developer_status && client.kanban_column.name !=  dev.developer_status
    #           # binding.pry
    #           dev_arr.push(dev)
    #         end
    #       end
    #       key_value = { "dept_id" => dept.id, "dept_name" => dept.name, "developers" => dev_arr }
    #       key_value.each do |key, value|
    #         dept_hash[key] = value
    #       end
    #       client_arr.push(dept_hash)
    #     end
    #     key_value = {"id" => client.id, "customer_name" => client.customer_name, "departments" => client_arr}
    #     key_value.each do |key, value|
    #       client_hash[key] = value
    #     end
    #     col_arr.push(client_hash)
    #   end
    #   col_hash.store(col.name , col_arr )
    # end

    col_hash = {}
    @kanban_columns.each do |col|
      col_arr = []
      @client_requests.each do |client|
        client_hash = {}
        dev_arr = []
        client.departments.each do |dept|
          dept.developers.each do |dev|
            dev_arr.push(dev) if col.name == dev.developer_status && client.kanban_column.name != dev.developer_status
          end
        end
        key_value = { 'id' => client.id, 'customer_name' => client.customer_name, 'developers' => dev_arr }
        key_value.each do |key, value|
          client_hash[key] = value
        end
        col_arr.push(client_hash)
      end
      col_hash.store(col.name, col_arr)
    end
    binding.pry
    col_hash
  end
end

# {
#   assign_dev:
#     {
#       client_request1: {
#         id: "1",
#         developers: [{},{}]
#       },

#       client_request2: {
#         id: "1",
#         developers: [{},{}]
#       },
#     },

#     sched_dev: {
#       client_request1: {
#         id: "1",
#         developers: [{},{}]
#       },

#       client_request2: {
#         id: "1",
#         developers: [{},{}]
#       },
#     }

# }

# @sub_tickets_details.each do |col_name, client_requests|

# end
# {
#   assign_dev: [
#     client_request1: {
#       id: "1",
#       customer_name: "technosoft",
#       dept: [{ dept_1:{
#         dept_id: "1",
#         dept_name:"ror",
#         [{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"}]
#         },
#       },
#       { dept_2:{
#         dept_id: "2",
#         dept_name:"python",
#         [{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"}]
#         },
#       }]
#     }]
# #
#   },
#   sche_dev: {
#     [{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"},{name:"laxmi",status:"dev1"}]
#     }
# }
