class CV::Experience < ViewComponent::Base
  def initialize
    @work_tenures = CV::WorkTenure.includes(:roles).order(from_year: :desc, from_month: :desc).all
  end
end
