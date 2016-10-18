class API < Grape::API
  prefix :api
  mount V1::Methods
end
