class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save #ここでsaveしつつ条件文。
      flash[:success] = "タスクの作成に成功しました！"
      redirect_to @task    #redirectはshowアクション実施
    else
      flash.now[:danger] = "タスクの作成に失敗しました..."
      render :new          #renderはnewアクション実施しない
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = "タスク更新完了。"
      redirect_to @task
    else
      flash.now[:danger] = "タスク更新失敗しました。"
      render :edit
    end
      
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました。"
    redirect_to tasks_url
    
  end
  
  
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
