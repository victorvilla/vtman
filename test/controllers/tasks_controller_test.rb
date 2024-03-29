require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { client: @task.client, cops: @task.cops, due_date: @task.due_date, notes: @task.notes, number_chapters: @task.number_chapters, rate: @task.rate, rush: @task.rush, status: @task.status, type_script: @task.type_script, video_title: @task.video_title, vtn: @task.vtn }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { client: @task.client, cops: @task.cops, due_date: @task.due_date, notes: @task.notes, number_chapters: @task.number_chapters, rate: @task.rate, rush: @task.rush, status: @task.status, type_script: @task.type_script, video_title: @task.video_title, vtn: @task.vtn }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
