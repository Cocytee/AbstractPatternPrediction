#Try that shit !  

include("./APPcore.jl")
using .APPcore

println(" ~ Testing FileMUX")
r = APPcore.FileMUX("TestDataSet.csv")
println("\t -> ",r)
r = APPcore.FileMUX("NoOne.csv")
println("\t -> ",r)

#DS1 = ExctractorBuilder("TestDataSet.csv",3,2;cSets=1,cCat=2,dataStartAt=(4,3),dataStopAt=(10,42))
#DS2 = ExctractorBuilder("TestDataSet.csv",3,2;cSets=1,cCat=2,dataStartAt=(4,3),dataStopAt=(10,42))
#DS3 = ExctractorBuilder("DSConfig.txt")