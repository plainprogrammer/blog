class CV::Educations::Show < ViewComponent::Base
  def initialize(education)
    @education = education
  end

  attr_reader :education
end
