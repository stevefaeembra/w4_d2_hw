class RockScissorsPaper
 
  def check_win(player1_hand,player2_hand)
    # pass in two player throws
    # should be rock, scissors or paper
    # (case insensitive)
    throw_1 = player1_hand.downcase.to_sym
    throw_2 = player2_hand.downcase.to_sym
    outcomes = {
      [:rock,:rock] => :draw,
      [:scissors,:scissors] => :draw,
      [:paper, :paper] => :draw,
      [:paper, :rock] => :player1,
      [:scissors, :paper] => :player1,
      [:rock, :scissors] => :player1,
      [:rock, :paper] => :player2,
      [:paper, :scissors] => :player2,
      [:scissors, :rock] => :player2
    }
    # returns either draw, player1 or player2
    outcomes[[throw_1, throw_2]].to_s
  end

end
