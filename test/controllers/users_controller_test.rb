require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new with new user' do
    get :new

    user = assigns(:user)

    assert user.new_record?
    assert_response :success
  end

  test 'should create user' do
    params = {
      user: {
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    post :create, params

    assert_redirected_to root_url
  end

  test 'should not create user' do
    params = {
      user: {
        email: 'user@example.com',
        password: 'passwo',
        password_confirmation: 'password'
      }
    }

    post :create, params

    assert_template 'new'
  end

end
