require 'test_helper'

class VtFilesControllerTest < ActionController::TestCase
  setup do
    @vt_file = vt_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vt_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vt_file" do
    assert_difference('VtFile.count') do
      post :create, vt_file: { path_file: @vt_file.path_file, status: @vt_file.status, task_id: @vt_file.task_id, type: @vt_file.type }
    end

    assert_redirected_to vt_file_path(assigns(:vt_file))
  end

  test "should show vt_file" do
    get :show, id: @vt_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vt_file
    assert_response :success
  end

  test "should update vt_file" do
    patch :update, id: @vt_file, vt_file: { path_file: @vt_file.path_file, status: @vt_file.status, task_id: @vt_file.task_id, type: @vt_file.type }
    assert_redirected_to vt_file_path(assigns(:vt_file))
  end

  test "should destroy vt_file" do
    assert_difference('VtFile.count', -1) do
      delete :destroy, id: @vt_file
    end

    assert_redirected_to vt_files_path
  end
end
