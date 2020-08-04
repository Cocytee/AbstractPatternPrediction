#Try that shit !  

include("./APPcore.jl")
using .APPcore

println(" ~ Testing FileMUX")
(f,ext) = APPcore.FileMUX("TestDataSet.csv")
println("\t -> ",f," :: ",ext)

#DS1 = ExctractorBuilder("TestDataSet.csv",3,2;cSets=1,cCat=2,dataStartAt=(4,3),dataStopAt=(10,42))
#DS2 = ExctractorBuilder("TestDataSet.csv",3,2;cSets=1,cCat=2,dataStartAt=(4,3),dataStopAt=(10,42))
#DS3 = ExctractorBuilder("DSConfig.txt")