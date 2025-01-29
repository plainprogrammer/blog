class CVController < ApplicationController
  allow_unauthenticated_access

  def index
    @work_tenures = CV::WorkTenure.order(from_year: :desc, from_month: :desc).all
    @educations = CV::Education.order(to_year: :desc, to_month: :desc).all
  end
end
