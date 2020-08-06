#Try that shit !  

include("./APPcore.jl")
using .APPcore

DSS = APPcore.ExctractorBuilder("None.csv",1,1)
DSSbis = APPcore.ExctractorBuilder("None.cv",1,1)

DSS2 = APPcore.ExctractorBuilder("TestDataSet.csv",1,1)
DSS2bis = APPcore.ExctractorBuilder("TestDataSet.csv",3,1)
DSS2bisbis = APPcore.ExctractorBuilder("TestDataSet.csv",15,1)

DSS3 = APPcore.ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3))
DSS3bis = APPcore.ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3),dataStopAt=(52,41))
