class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  


  def index
    if logged_in?
       @task = current_user.tasks.build #form_for用
       @tasks = current_user.tasks.order("created_at ASC")
    end
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save #ここでsaveしつつ条件文。
      flash[:success] = "タスクの作成に成功しました！"
      redirect_to root_url    #redirect_toはアクション実施
    else
      flash.now[:danger] = "タスクの作成に失敗しました..."
      render "tasks/index"          #renderはアクション実施しない
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスク更新完了。"
      redirect_to @task
    else
      flash.now[:danger] = "タスク更新失敗しました。"
      render :edit
    end
      
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました。"
    redirect_to tasks_url
    
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
  # binding.pry
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      flash[:danger] = "閲覧/編集出来るのは自分のタスクのみです。"
      redirect_to root_url
    end
  end
  
end
