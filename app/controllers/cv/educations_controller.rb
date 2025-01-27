class CV::EducationsController < ApplicationController
  def edit
    @education = CV::Education.find(params[:id])
  end

  def update
    @education = CV::Education.find(params[:id])
    @education.update(education_params)
    render partial: "cv/education", locals: { education: @education }
  end

  private

  def education_params
    params.require(:cv_education).permit(:institution, :degree, :to_month, :to_year)
  end
end
