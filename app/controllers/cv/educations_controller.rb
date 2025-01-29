class CV::EducationsController < ApplicationController
  def new
    @education = CV::Education.new
  end

  def create
    CV::Education.create(education_params)
    render partial: "cv/educations", locals: { educations: CV::Education.order(to_year: :desc, to_month: :desc).all }
  end

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
