class CV::Experience < ViewComponent::Base
  def work_tenures
    @work_tenures ||= CV::WorkTenure.includes(:roles).order(from_year: :desc, from_month: :desc).all
  end
end
