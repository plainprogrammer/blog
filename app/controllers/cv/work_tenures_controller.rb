class CV::WorkTenuresController < ApplicationController
  def edit
    @tenure = CV::WorkTenure.find(params[:id])
  end

  def update
    @tenure = CV::WorkTenure.find(params[:id])
    @tenure.update(tenure_params)
    render partial: "cv/work_tenure", locals: { tenure: @tenure }
  end

  private

  def tenure_params
    params.require(:cv_work_tenure).permit(:employer, :from_month, :from_year, :to_month, :to_year, :to_present)
  end
end
