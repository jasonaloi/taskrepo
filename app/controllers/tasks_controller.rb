class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    redirect_to task_path Task.last
  end

  def show
    redirect_to @task.project
  end

  def new
    @task = Task.new
    @task.name = 'New Task'
    @task.project_id = params[:project]
    @task.save
    redirect_to @task
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { respond_with_bip(@task) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@task) }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to @task.project
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :project)
    end
end
