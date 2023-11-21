require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/"){
  erb(:elephant, {:layout => :elephant})
}

get("/dice/2/6"){
  @rolls = []
  2.times{
    die = rand(2..6)
    @rolls.push(die)
  }

  erb(:two_six)
}
get("/dice/2/10"){
  @rolls = []
  2.times{
    die = rand(1..10)
    @rolls.push(die)
  }

  erb(:two_ten)
}
get("/dice/1/20"){
  @rolls = []
  1.times{
    die = rand(1..20)
    @rolls.push(die)
  }
  
  erb(:one_twenty)
}
get("/dice/5/4"){
  @rolls = []
  5.times{
    die = rand(1..4)
    @rolls.push(die)
  }

  erb(:five_four)
}
get("/dice/100/6"){
  @rolls=[]
  100.times{
    die = rand(1..6)
    @rolls.push(die)
  }
  erb(:one_hundred_six)
}
