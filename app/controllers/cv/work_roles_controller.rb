class CV::WorkRolesController < ApplicationController
  def edit
    @role = CV::WorkRole.find(params[:id])
  end

  def update
    @role = CV::WorkRole.find(params[:id])
    @role.update(role_params)
    render partial: "cv/work_role", locals: { role: @role }
  end

  private

  def role_params
    params.require(:cv_work_role).permit(:title, :summary)
  end
end
