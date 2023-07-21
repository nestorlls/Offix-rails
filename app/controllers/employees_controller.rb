class EmployeesController < ApplicationController
  # GET /employees/new?department_id=:id
  def new
    @employee = Employee.new
    @department = Department.find(params[:department_id])
    @list_order_by_name = Department.order(:name)
    # render new.html.erb
  end

  def edit
    @employee = Employee.find(params[:id])
    @department = @employee.department
    @list_order_by_name = Department.order(:name)
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to department_path(@employee.department)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to department_path(@employee.department)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    department = @employee.department
    @employee.destroy
    redirect_to departments_path(department), status: :see_other
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :nationality, :role, :birth_date, :department_id,
                                     :avatar)
  end
end
