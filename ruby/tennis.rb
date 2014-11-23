
class TennisGame1
  attr_accessor :points

  TENNIS_SCORES = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty"
  }.freeze

  def initialize(player1, player2)
    self.points = { player1 => 0, player2 => 0}
  end

  def scores
    points.values
  end

  def won_point(player_name)
    points[player_name] += 1
  end

  def points_difference
    (scores[0] - scores[1]).abs
  end

  def score
    if points_difference == 0
      tie
    elsif scores.any? { |score| score >= 4}
      score_after_forty
    else
      TENNIS_SCORES[scores.first] + "-" + TENNIS_SCORES[scores.last]
    end
  end

  def tie
    scores.first > 2 ? "Deuce" : TENNIS_SCORES[scores.first] + "-All"
  end

  def score_after_forty
    leader = points.key(scores.max)
    if points_difference == 1
      "Advantage " + leader
    else
      "Win for " + leader
    end
  end
end

class TennisGame2

  TENNIS_SCORES = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty"
  }.freeze


  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1_name
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    return  "Deuce" if (@p1points==@p2points && @p1points > 2)
    return TENNIS_SCORES[@p1points] + "-All" if @p1points == @p2points
    if @p2points >= 3 && @p1points >= 3 && (@p2points - @p1points).abs == 1
      return "Advantage " + @player1_name if @p1points > @p2points
      return "Advantage " + @player2_name
    end
    if @p1points >= 4 || @p2points >= 4
      return "Win for " + @player1_name if @p1points > @p2points
      return "Win for " + @player2_name
    end

    "#{TENNIS_SCORES[@p1points]}-#{TENNIS_SCORES[@p2points]}"
  end
end

class TennisGame3 #This one is terrible
  TENNIS_SCORES = ["Love", "Fifteen", "Thirty", "Forty"]
  attr_accessor :player_score

  def initialize(player1, player2)
    self.player_score = { player1 => 0, player2 => 0}
  end

  def won_point(player_name)
    player_score[player_name] += 1
  end

  def score
    if point_difference == 0
      tie_score
    elsif points.any? { |score| score >= 4}
      score_after_forty
    else
      TENNIS_SCORES[points.first] + "-" + TENNIS_SCORES[points.last]
    end
  end

  private

  def points
    player_score.values
  end

  def point_difference
    points.inject(:-).abs
  end

  def tie_score
    points.first > 2 ? "Deuce" : TENNIS_SCORES[points.first] + "-All"
  end

  def score_after_forty
    leader = player_score.key(points.max)
    if point_difference == 1
      "Advantage " + leader
    else
      "Win for " + leader
    end
  end
end
