require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/rps')

get('/roll/') do
  # do a random throw
  choices = ['rock','scissors','paper']
  player1_roll = choices.sample
  player2_roll = choices.sample
  url = "/throw/#{player1_roll}/#{player2_roll}"
  redirect url
end

get('/throw/:player1/:player2') do
  # no logic in here; RockScissorsPaper is
  # the model and handles data and business rules
  @roll_1 = params['player1']
  @roll_2 = params['player2']
  p @roll_1
  p @roll_2
  @result = RockScissorsPaper.new().check_win(@roll_1,@roll_2)
  describe = {
    "player1" => "Player 1 wins",
    "player2" => "Player 2 wins",
    "draw" => "Draw!"
  }
  p describe[@result]
  @result2 = describe[@result]
  @roll1_graphic = "/"+@roll_1+".jpg"
  p @roll1_graphic
  @roll2_graphic = "/"+@roll_2+".jpg"
  p @roll2_graphic
  erb(:go)
end
