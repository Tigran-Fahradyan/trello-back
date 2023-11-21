require 'swagger_helper'

describe 'Boards', swagger_doc: 'swagger.json' do
  path '/boards' do
    get 'List all available boards' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'

      response 200, 'boards listed' do
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

    post 'Create Board' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :board, in: :body, schema: {
        type: :object,
        properties: {
          board: {
            type: :object,
            properties: {
              name: {
                type: :string
              }
            }
          }
        }
      }

      response 201, 'Board created' do
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

  path '/boards/{id}' do
    get 'Fetch specific Board' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."

      response 200, 'Board fetched' do
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

    patch 'Update Board' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."
      parameter name: :board, in: :body, schema: {
        type: :object,
        properties: {
          board: {
            type: :object,
            properties: {
              name: {
                type: :string
              }
            }
          }
        }
      }

      response 200, 'Board updated' do
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

    delete 'Delete Board' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."

      response 200, 'boards created' do
        schema type: :object,
               properties: {
                 board: {
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