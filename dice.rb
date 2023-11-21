require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/"){
  "<h1>Dice Roll</h1>
  <ul>
    <li><a href='/dice/2/6' >Roll two 6-sided dice</a></li>
    <li><a href='/dice/2/10' >Roll two 10-sided dice</a></li>
    <li><a href='/dice/1/20' >Roll one 20-sided dice</a></li>
    <li><a href='/dice/5/4' >Roll 5 4-sided dice</a></li>
  </ul>
  "
}

get("/dice/2/6"){
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die+second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}</p>
  <a href='/' >Home</a>"
}
get("/dice/2/10"){
  die_1 = rand(1..10)
  die_2 = rand(1..10)
  sum = die_1+die_2

  outcome = "You rolled a #{die_1} and a #{die_2} for a total of #{sum}"

  "<h1>2d10</h1>
  <p>#{outcome}</p>
  <a href='/' >Home</a>"
}
get("/dice/1/20"){
  die = rand(1..20)
  outcome = "You rolled a #{die}"
  "<h1>1d20</h1>
  <p>#{outcome}</p>
  <a href='/' >Home</a>"
}
get("/dice/5/4"){
  die_1 = rand(1..4)
  die_2 = rand(1..4)
  die_3 = rand(1..4)
  die_4 = rand(1..4)
  die_5 = rand(1..4)
  sum = die_1+die_2+die_3+die_4+die_5
  outcome = "You rolled a #{die_1}, #{die_2}, #{die_3}, #{die_4}, and #{die_5} for a total of #{sum}"

  "<h1>5d4</h1>
  <p>#{outcome}</p>
  <a href='/' >Home</a>"
}
