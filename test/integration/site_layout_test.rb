# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test 'layout links of the webpage as a non-logged user' do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get signup_path
    assert_select 'title', full_title('Sign up')
    get contact_path
    assert_select 'title', full_title('Contact')
  end

  test 'layout links of the webpage as a logged-in user' do
    get login_path
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', users_path
  end
end
