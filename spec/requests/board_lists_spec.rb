require 'swagger_helper'

describe 'Board Lists', swagger_doc: 'swagger.json' do
  path '/boards/{board_id}/board_lists' do
    get 'List all available Board Lists' do
      tags 'Board Lists'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board id."

      response 200, 'board lists listed' do
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

    post 'Create Board List' do
      tags 'Board Lists'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :board_id, in: :path, type: :integer, description: "Board id."
      parameter name: :board_list_list, in: :body, schema: {
        type: :object,
        properties: {
          board_list: {
            type: :object,
            properties: {
              name: {
                type: :string
              }
            }
          }
        }
      }

      response 201, 'Board List created' do
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

  path '/boards/{board_id}/board_lists/{id}' do
    get 'Fetch specific Board List' do
      tags 'Board Lists'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board id."
      parameter name: :id, in: :path, type: :integer, description: "Board List id."

      response 200, 'Board List fetched' do
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

    patch 'Update Board List' do
      tags 'Board Lists'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :board_id, in: :path, type: :integer, description: "Board id."
      parameter name: :id, in: :path, type: :integer, description: "Board List id."
      parameter name: :board_list, in: :body, schema: {
        type: :object,
        properties: {
          board_list: {
            type: :object,
            properties: {
              name: {
                type: :string
              }
            }
          }
        }
      }

      response 200, 'Board List updated' do
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

    delete 'Delete Board List' do
      tags 'Board Lists'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board_id, in: :path, type: :integer, description: "Board id."
      parameter name: :id, in: :path, type: :integer, description: "Board List id."

      response 200, 'boards created' do
        schema type: :object,
               properties: {
                 board_list: {
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