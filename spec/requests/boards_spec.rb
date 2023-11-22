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

      response 200, 'board deleted' do
        schema type: :object,
               properties: {
               },
               required: [:id]
        run_test!
      end
    end
  end

  path '/boards/{id}/assign_user' do
    post 'Assign User' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."
      parameter name: :board_user, in: :body, schema: {
        type: :object,
        properties: {
          board_user: {
            type: :object,
            properties: {
              user_id: {
                type: :integer
              }
            }
          }
        }
      }

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

  path '/boards/{id}/unassign_user' do
    delete 'Unassign User' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."
      parameter name: :board_user, in: :body, schema: {
        type: :object,
        properties: {
          board_user: {
            type: :object,
            properties: {
              user_id: {
                type: :integer
              }
            }
          }
        }
      }

      response 200, 'User unassigned' do
        schema type: :object,
               properties: {
               },
               required: [:id, :user_id]
        run_test!
      end
    end
  end

  path '/boards/{id}/users' do
    get 'List all available board users' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: "Board id."

      response 200, 'board users listed' do
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