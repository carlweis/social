require 'test_helper'

class ImagePostsControllerTest < ActionController::TestCase

  test 'get new with new post' do
    user1 = users(:user1)

    get :new, {}, {user_id: user1.id}

    image_post = assigns(:image_post)

    assert image_post.new_record?
    assert_response :success
  end

  test 'should create post' do
    user = users(:user1)
    params ={
      image_post: {
        title: 'Test Image Post',
        url: 'https://images.unsplash.com/photo-1452722464566-db26e74a995b?crop=entropy&fit=crop&fm=jpg&h=1000&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1925'
      }
    }

    post :create, params, {user_id: user.id}
    image_post = assigns(:image_post)

    assert image_post.persisted?
    assert_redirected_to post_url(image_post)

  end
end
