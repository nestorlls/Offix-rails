class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    # render "index.html.erb"
  end

  def show
    @department = Department.find(params[:id])
    @employees = @department.employees
    # render "show.html.erb"
  end

  def new
    @department = Department.new
    # render "new.html.erb"
  end

  # GET "department/:id/edit"
  def edit
    @department = Department.find(params[:id])
    # render "edit.html.erb"
  end

  # POST "department/create"
  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path # departments
    else
      render "new", status: :unprocessable_entity
    end
  end

  # PATCH "department/:id"
  def update
    @department = Department.find(params[:id])

    if @department.update(department_params)
      redirect_to departments_path

    else
      render "edit", status: :unprocessable_entity
    end
  end

  # DELETE "department/:id"
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path, status: :see_other
  end

  private

  def department_params
    params.require(:department).permit(:name, :description, :cover)
  end
end
