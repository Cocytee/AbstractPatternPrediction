#Main file for include and functions management.
#Call everybody for the party.

module APPcore

using Statistics,CSV

include("APP_Abstract.jl")
include("APP_Format.jl")
include("APP_Predict.jl")

end