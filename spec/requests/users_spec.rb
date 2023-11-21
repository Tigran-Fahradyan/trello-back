require 'swagger_helper'

describe 'Users', swagger_doc: 'swagger.json' do
  path '/users' do
    get 'List all users' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      response 200, 'users listed' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: {
                     type: :integer
                   },
                   full_name: {
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

    post 'Create User' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              full_name: {
                type: :string
              }
            }
          }
        }
      }

      response 201, 'user created' do
        schema type: :object,
               properties: {
                 id: {
                   type: :integer
                 },
                 full_name: {
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

  path '/users/{id}' do
    get 'Fetch specific user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "user id."

      response 200, 'user fetched' do
        schema type: :object,
               properties: {
                 full_name: {
                   type: :string
                 }
               },
               required: [:id]
        run_test!
      end
    end

    patch 'Update User' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "user id."
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              full_name: {
                type: :string
              }
            }
          }
        }
      }

      response 200, 'user updated' do
        schema type: :object,
               properties: {
                 id: {
                   type: :integer
                 },
                 full_name: {
                   type: :string
                 },
                 email: {
                   type: :string
                 }
               }
        run_test!
      end
    end

    delete 'Delete User' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "user id."

      response 200, 'users created' do
        schema type: :object,
               properties: {
                 user: {
                   type: :object,
                   properties: {
                     full_name: {
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