class CV::Educations::List < ViewComponent::Base
  def educations
    @educations ||= CV::Education.order(to_year: :desc, to_month: :desc).all
  end
end
