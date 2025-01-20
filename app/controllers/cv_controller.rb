class CVController < ApplicationController
  def index
    @work_tenures = CV::WorkTenure.order(from_year: :desc, from_month: :desc).all
    @education = CV::Education.order(to_year: :desc, to_month: :desc).all
  end
end
