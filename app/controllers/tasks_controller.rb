class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :toggle_status, :destroy]
    before_action :require_login

    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params)
        @task.user_id = current_user.id
        @task.save
        redirect_to task_path(@task)
    end
    
    def edit
        @task.update(task_params)
    end

    def update
    end

    def toggle_status
        @task.toggle!(:status)
        redirect_to tasks_path
    end

    def toggle_pinned
        @task.toggle!(:pinned)
        redirect_to task_path(@task)
    end

    def destroy
        @task.destroy
        
    end

    private

    def task_params
        params.require(:task).permit(:name, :description, :status, :deadline, :pinned)
    end

    def find_task
        @task = Task.find(params[:id])
    end
end
