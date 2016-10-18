class V1::MethodsTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  test 'get ping should return 200' do
    get('/api/v1/ping')
    assert_equal(last_response.status, 200)
  end

  test 'post nested_params_test_1 should return 201' do
    params = { arr1: [{ hash1: { something: 'value' } }] }
    post('/api/v1/nested_params_test_1', params)
    assert_equal(last_response.status, 201)
  end

  test 'post nested_params_test_2 should return 201' do
    params = { arr1: [{ hash1: { arr2: [{ something: 'value' }] } }] }
    post('/api/v1/nested_params_test_2', params)
    assert_equal(last_response.status, 201)
  end

  test 'post nested_params_test_3 should return 201' do
    params = { arr1: [{ hash1: { hash2: { hash3: { something: 'value' } } } }] }
    post('/api/v1/nested_params_test_3', params)
    assert_equal(last_response.status, 201)
  end

  # TypeError: no implicit conversion of Symbol into Integer
  test 'post nested_params_test_4 should return 201' do
    params = { arr1: [{ hash1: { arr2: [{ hash2: { something: 'value' } }] } }] }
    post('/api/v1/nested_params_test_4', params)
    assert_equal(last_response.status, 201)
  end
end
