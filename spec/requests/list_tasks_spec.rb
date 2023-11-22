require 'swagger_helper'

describe 'List Tasks', swagger_doc: 'swagger.json' do
  path '/boards/{board_id}/board_lists/{board_list_id}/list_tasks' do
    get 'List all available Lists Tasks' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."

      response 200, 'list tasks listed' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: {
                     type: :integer
                   },
                   name: {
                     type: :string
                   },
                   description: {
                     type: :string
                   }
                 }
               },
               required: []
        run_test!
      end
    end

    post 'Create List Task' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :list_task, in: :body, schema: {
        type: :object,
        properties: {
          list_task: {
            type: :object,
            properties: {
              name: {
                type: :string
              },
              description: {
                type: :string
              },
            }
          }
        }
      }

      response 201, 'List Task created' do
        schema type: :object,
               properties: {
                 id: {
                   type: :integer
                 },
                 name: {
                   type: :string
                 },
                 description: {
                   type: :string
                 }
               }
        run_test!
      end
    end
  end

  path '/boards/{board_id}/board_lists/{board_list_id}/list_tasks/{id}' do
    get 'Fetch specific List Task' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."

      response 200, 'List Task fetched' do
        schema type: :object,
               properties: {
                 name: {
                   type: :string
                 },
                 description: {
                   type: :string
                 }
               },
               required: [:id]
        run_test!
      end
    end

    patch 'Update List Task' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."
      parameter name: :list_task, in: :body, schema: {
        type: :object,
        properties: {
          list_task: {
            type: :object,
            properties: {
              name: {
                type: :string
              },
              description: {
                type: :string
              }
            }
          }
        }
      }

      response 200, 'List Task updated' do
        schema type: :object,
               properties: {
                 id: {
                   type: :integer
                 },
                 name: {
                   type: :string
                 },
                 description: {
                   type: :string
                 }
               }
        run_test!
      end
    end

    delete 'Delete List Task' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."

      response 200, 'list task created' do
        schema type: :object,
               properties: {},
               required: [:id]
        run_test!
      end
    end
  end

  path '/boards/{board_id}/board_lists/{board_list_id}/list_tasks/{id}/assign_user' do
    post 'Assign User' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."
      parameter name: :task_user, in: :body, schema: {
        type: :object,
        properties: {
          task_user: {
            type: :object,
            properties: {
              user_id: {
                type: :integer
              }
            }
          }
        }
      }, required: [:board_id, :board_list_id, :id]

      response 200, 'User assigned' do
        schema type: :object,
               properties: {
                 id: {
                   type: :integer
                 },
                 name: {
                   type: :string
                 },
                 email: {
                   type: :string
                 }
               }
        run_test!
      end
    end
  end

  path '/boards/{board_id}/board_lists/{board_list_id}/list_tasks/{id}/unassign_user' do
    delete 'Unassign User' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."
      parameter name: :task_user, in: :body, schema: {
        type: :object,
        properties: {
          task_user: {
            type: :object,
            properties: {
              user_id: {
                type: :integer
              }
            }
          }
        }
      }, required: [:board_id, :board_list_id, :id]

      response 200, 'User unassigned' do
        schema type: :object,
               properties: {
               },
               required: [:id, :user_id]
        run_test!
      end
    end
  end

  path '/boards/{board_id}/board_lists/{board_list_id}/list_tasks/{id}/users' do
    get 'List all available task users' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board Id."
      parameter name: :board_list_id, in: :path, type: :integer, description: "Board List Id."
      parameter name: :id, in: :path, type: :integer, description: "List Task id."

      response 200, 'task users listed' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: {
                     type: :integer
                   },
                   name: {
                     type: :string
                   },
                   email: {
                     type: :string
                   }
                 }
               },
               required: []
        run_test!
      end
    end
  end

end