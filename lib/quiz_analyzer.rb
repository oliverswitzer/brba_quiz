class Analyzer

  attr_reader :character_hash, :character

  def initialize(answer_hash)
    @answer_hash = answer_hash
    @character_hash = { :walter => 0,
                       :skyler => 0,
                       :hank => 0,
                       :jesse => 0
                     }
    count_answers
    @character = return_character
  end

  def count_answers
    @answer_hash.values.each do |answer|
      question_data = answer.scan(/[wjsh]/)
      question_data.each do |person|
        case person
        when "w"
          @character_hash[:walter] += 1
        when "j"
          @character_hash[:jesse] += 1
        when "h"
          @character_hash[:hank] += 1
        when "s"
          @character_hash[:skyler] += 1
        end
      end
    end
  end

  def return_character
    highest_points = @character_hash.values.max
    character_pair = @character_hash.select {|character, points| points == highest_points}
    character_pair.keys[0].to_s.capitalize
  end

end


# an = Analyzer.new({"1" => "w", "2" => "w-j"})
# puts an.character

