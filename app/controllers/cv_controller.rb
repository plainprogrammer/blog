class CVController < ApplicationController
  def index
    @work_tenures = CV::WorkTenure.order(from_year: :desc, from_month: :desc).all
  end
end
