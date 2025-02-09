class CV::EducationsController < ApplicationController
  def show
    render CV::Educations::Show.new(education)
  end

  def edit
    render CV::Educations::Edit.new(education)
  end

  def update
    education.update!(education_params)
    redirect_to education
  rescue ActiveRecord::RecordInvalid
    render CV::Educations::Edit.new(education)
  end

  def destroy
    education.destroy!
    redirect_to cv_educations_url
  end

  private

  def education
    CV::Education.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:institution, :degree, :to_month, :to_year)
  end
end
