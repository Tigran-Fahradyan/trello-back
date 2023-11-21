require 'swagger_helper'

describe 'List Tasks', swagger_doc: 'swagger.json' do
  path '/list_tasks' do
    get 'List all available Lists Tasks' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'

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
                   email: {
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

      parameter name: :list_task, in: :body, schema: {
        type: :object,
        properties: {
          list_task: {
            type: :object,
            properties: {
              name: {
                type: :string
              }
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
                 email: {
                   type: :string
                 }
               }
        run_test!
      end
    end
  end

  path '/list_tasks/{id}' do
    get 'Fetch specific List Task' do
      tags 'List Tasks'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "List Task id."

      response 200, 'List Task fetched' do
        schema type: :object,
               properties: {
                 name: {
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
      
      parameter name: :id, in: :path, type: :integer, description: "List Task id."
      parameter name: :list_task, in: :body, schema: {
        type: :object,
        properties: {
          list_task: {
            type: :object,
            properties: {
              name: {
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
                 email: {
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
      parameter name: :id, in: :path, type: :integer, description: "List Task id."

      response 200, 'list task created' do
        schema type: :object,
               properties: {
                 list_task: {
                   type: :object,
                   properties: {
                     name: {
                       type: :string
                     }
                   }
                 }
               },
               required: [:id]
        run_test!
      end
    end
  end


end