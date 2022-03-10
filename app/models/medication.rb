class Medication < ApplicationRecord
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
end
