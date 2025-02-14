class CV::Educations::Edit < ViewComponent::Base
  def initialize(education)
    @education = education
  end

  attr_reader :education
end
