class V1::Methods < Grape::API

  # TODO: put common block into separate file

  # ---<common>---

  version 'v1', using: :path
  format :json

  # ---</common>---

  get :ping do
    { message: 'pong' }
  end

  # curl -H "Content-type: application/json" -X POST -d '{"arr1":[{"hash1":{"something":"value"}}]}' http://localhost:3000/api/v1/nested_params_test_1
  desc 'Bughunt#1'
  params do
    requires :arr1, type: Array do
      requires :hash1, type: Hash do
        requires :something, type: String
      end
    end
  end
  post :nested_params_test_1 do
    { message: 'ok' }
  end

  # curl -H "Content-type: application/json" -X POST -d '{"arr1":[{"hash1":{"arr2":[{"something":"value"}]}}]}' http://localhost:3000/api/v1/nested_params_test_2
  desc 'Bughunt#2'
  params do
    requires :arr1, type: Array do
      requires :hash1, type: Hash do
        requires :arr2, type: Array do
          requires :something, type: String
        end
      end
    end
  end
  post :nested_params_test_2 do
    { message: 'ok' }
  end

  # curl -H "Content-type: application/json" -X POST -d '{"arr1":[{"hash1":{"hash2":{"hash3":{"something":"value"}}}}]}' http://localhost:3000/api/v1/nested_params_test_3
  desc 'Bughunt#3'
  params do
    requires :arr1, type: Array do
      requires :hash1, type: Hash do
        requires :hash2, type: Hash do
          requires :hash3, type: Hash do
            requires :something, type: String
          end
        end
      end
    end
  end
  post :nested_params_test_3 do
    { message: 'ok' }
  end

  # curl -H "Content-type: application/json" -X POST -d '{"arr1":[{"hash1":{"arr2":[{"hash2":{"something":"value"}}]}}]}' http://localhost:3000/api/v1/nested_params_test_4
  desc 'Bughunt#4'
  params do
    requires :arr1, type: Array do
      requires :hash1, type: Hash do
        requires :arr2, type: Array do
          requires :hash2, type: Hash do
            requires :something, type: String
          end
        end
      end
    end
  end
  post :nested_params_test_4 do
    { message: 'ok' }
  end
end
