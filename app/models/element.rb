class Element < ActiveRecord::Base
  belongs_to :assignment

  validates :title, :citation, :assignment, :type_id, presence: true

  def user
    self.assignment.course.user
  end


  def video_embed
    if self.url
      "<iframe width=\"560\" height=\"315\" src=\"#{self.url}\" frameborder=\"0\" allowfullscreen></iframe>"
    else
      ""
    end
  end

  def video_embed=(code)
    doc = Nokogiri::HTML(code)
    if code.to_s.include? 'iframe'
      link = doc.at_css('iframe').attr('src')
      self.url = link
    end
  end
end
