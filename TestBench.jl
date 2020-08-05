#Try that shit !  

include("./APPcore.jl")
using .APPcore

<<<<<<< Updated upstream
DSS = ExctractorBuilder("None.csv",1,1)
DSSbis = ExctractorBuilder("None.cv",1,1)

DSS2 = ExctractorBuilder("TestDataSet.csv",1,1)
DSS2bis = ExctractorBuilder("TestDataSet.csv",3,2)

DSS3 = ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3))
DSS3bis = ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3),dataStopAt=(52,41))

#DSS4 = ExctractorBuilder("DSConfig.txt")
=======
DSS = APPcore.ExctractorBuilder("None.csv",1,1)
DSSbis = APPcore.ExctractorBuilder("None.cv",1,1)
DSS2 = APPcore.ExctractorBuilder("TestDataSet.csv",1,1)
DSS2bis = APPcore.ExctractorBuilder("TestDataSet.csv",3,2)
DSS3 = APPcore.ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3))
DSS3bis = APPcore.ExctractorBuilder("TestDataSet.csv",1,1;dataStartAt=(4,3),dataStopAt=(52,41))
#DSS4 = APPcore.ExctractorBuilder("DSConfig.txt")
>>>>>>> Stashed changes
