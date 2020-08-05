#Try that shit !  

include("./APPcore.jl")
using .APPcore

DSS = ExctractorBuilder("None.csv",1,1)
DSSbis = ExctractorBuilder("None.cv",1,1)
DSS2 = ExctractorBuilder("TestDataSet.csv",1,1)
DSS2bis = ExctractorBuilder("TestDataSet.csv",3,2)
DSS3 = ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3))
DSS3bis = ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3),dataStopAt=(52,41))
#DSS4 = ExctractorBuilder("DSConfig.txt")