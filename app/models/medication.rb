class Medication < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [ :commercial_name, :active_substance ],
  #   using: {
  #     tsearch: { prefix: true}
  #   }

    pg_search_scope :search_by_name_or_substance,
      against: [ :commercial_name, :active_substance ],
      using: {
        tsearch: { prefix: true}
      }


  def add_keywords_to_profile(user)
    io = open(user.resume_pdf.to_s)
    reader = PDF::Reader.new(io)
    reader.pages.each do |page|
      string = page.text
      KeywordHelper.keywords.each do |word|
        if string.downcase.include?(word.downcase)
          user.keywords.push(word)
          user.save
        end
      end
    end
  end

  has_many :medicationorders

  def name_and_concentration
    return "#{commercial_name} - #{concentration}"
  end
end
