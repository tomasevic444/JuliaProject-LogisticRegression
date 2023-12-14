#PR39/2021 Tomasevic Nikola
using GLM				
using DataFrames			
using CSV					
using Lathe.preprocess: TrainTestSplit
using StatsBase	
using MLBase
using StatsModels
using ROC
using Statistics
# Učitavanje podataka, podela na skupove za obuku i testiranje
data = DataFrame(CSV.File("Podaciiii.csv"))
dataTrain, dataTest = TrainTestSplit(data, .80)

display(dataTest)
display(countmap(data[!, :Class]))

# Formula zavisnost Class u odnosu na ostale redove
fm = @formula(Class ~ Cena+Stanje+Tip+Godiste+Kilometraza+Kubikaza+Boja)

# Potrebno nam je  10 logističkih regresora (N*(N-1)/2) N=5

#Pripremamo podatke koje cemo ubaciti u logisticki regresor klase koje uporedjujemo menjamu u 0 ili 1 zato sto samo te vrednosti mogu uci u logisticki regresor
#1
dataTrain12 = deepcopy(dataTrain)
filter!(row -> row.Class != "Mercedes", dataTrain12)
filter!(row -> row.Class != "Citroen", dataTrain12)
filter!(row -> row.Class != "Fiat", dataTrain12)

for i in 1:size(dataTrain12, 1)
    if dataTrain12[i, :Class] == "Audi" 
        dataTrain12[i, :Class] = "0.0"
    end
	if dataTrain12[i, :Class] == "BMW" 
        dataTrain12[i , :Class] = "1.0"
    end
end
dataTrain12[!, :Class] = parse.(Float64, dataTrain12[!, :Class])
display(dataTrain12)

#2
dataTrain13 = deepcopy(dataTrain)
filter!(row -> row.Class != "BMW", dataTrain13)
filter!(row -> row.Class != "Citroen", dataTrain13)
filter!(row -> row.Class != "Fiat", dataTrain13)
for i in 1:size(dataTrain13, 1)
    if dataTrain13[i, :Class] == "Audi" 
        dataTrain13[i, :Class] = "0.0"
    end
	if dataTrain13[i, :Class] == "Mercedes" 
        dataTrain13[i , :Class] = "1.0"
    end
end
dataTrain13[!, :Class] = parse.(Float64, dataTrain13[!, :Class])

#3
dataTrain14 = deepcopy(dataTrain)
filter!(row -> row.Class != "BMW", dataTrain14)
filter!(row -> row.Class != "Mercedes", dataTrain14)
filter!(row -> row.Class != "Fiat", dataTrain14)
for i in 1:size(dataTrain14, 1)
    if dataTrain14[i, :Class] == "Audi" 
        dataTrain14[i, :Class] = "0.0"
    end
	if dataTrain14[i, :Class] == "Citroen" 
        dataTrain14[i , :Class] = "1.0"
    end
end
dataTrain14[!, :Class] = parse.(Float64, dataTrain14[!, :Class])

#4
dataTrain15 = deepcopy(dataTrain)
filter!(row -> row.Class != "BMW", dataTrain15)
filter!(row -> row.Class != "Mercedes", dataTrain15)
filter!(row -> row.Class != "Citroen", dataTrain15)
for i in 1:size(dataTrain15, 1)
    if dataTrain15[i, :Class] == "Audi" 
        dataTrain15[i, :Class] = "0.0"
    end
	if dataTrain15[i, :Class] == "Fiat" 
        dataTrain15[i , :Class] = "1.0"
    end
end
dataTrain15[!, :Class] = parse.(Float64, dataTrain15[!, :Class])

#5
dataTrain23 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain23)
filter!(row -> row.Class != "Citroen", dataTrain23)
filter!(row -> row.Class != "Fiat", dataTrain23)
for i in 1:size(dataTrain23, 1)
    if dataTrain23[i, :Class] == "BMW" 
        dataTrain23[i, :Class] = "0.0"
    end
	if dataTrain23[i, :Class] == "Mercedes" 
        dataTrain23[i , :Class] = "1.0"
    end
end
dataTrain23[!, :Class] = parse.(Float64, dataTrain23[!, :Class])

#6
dataTrain24 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain24)
filter!(row -> row.Class != "Mercedes", dataTrain24)
filter!(row -> row.Class != "Fiat", dataTrain24)
for i in 1:size(dataTrain24, 1)
    if dataTrain24[i, :Class] == "BMW" 
        dataTrain24[i, :Class] = "0.0"
    end
	if dataTrain24[i, :Class] == "Citroen" 
        dataTrain24[i , :Class] = "1.0"
    end
end
dataTrain24[!, :Class] = parse.(Float64, dataTrain24[!, :Class])

#7
dataTrain25 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain25)
filter!(row -> row.Class != "Mercedes", dataTrain25)
filter!(row -> row.Class != "Citroen", dataTrain25)
for i in 1:size(dataTrain25, 1)
    if dataTrain25[i, :Class] == "BMW" 
        dataTrain25[i, :Class] = "0.0"
    end
	if dataTrain25[i, :Class] == "Fiat" 
        dataTrain25[i , :Class] = "1.0"
    end
end
dataTrain25[!, :Class] = parse.(Float64, dataTrain25[!, :Class])

#8
dataTrain34 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain34)
filter!(row -> row.Class != "BMW", dataTrain34)
filter!(row -> row.Class != "Fiat", dataTrain34)
for i in 1:size(dataTrain34, 1)
    if dataTrain34[i, :Class] == "Mercedes" 
        dataTrain34[i, :Class] = "0.0"
    end
	if dataTrain34[i, :Class] == "Citroen" 
        dataTrain34[i , :Class] = "1.0"
    end
end
dataTrain34[!, :Class] = parse.(Float64, dataTrain34[!, :Class])

#9
dataTrain35 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain35)
filter!(row -> row.Class != "BMW", dataTrain35)
filter!(row -> row.Class != "Citroen", dataTrain35)
for i in 1:size(dataTrain35, 1)
    if dataTrain35[i, :Class] == "Mercedes" 
        dataTrain35[i, :Class] = "0.0"
    end
	if dataTrain35[i, :Class] == "Fiat" 
        dataTrain35[i , :Class] = "1.0"
    end
end
dataTrain35[!, :Class] = parse.(Float64, dataTrain35[!, :Class])

#10
dataTrain45 = deepcopy(dataTrain)
filter!(row -> row.Class != "Audi", dataTrain45)
filter!(row -> row.Class != "BMW", dataTrain45)
filter!(row -> row.Class != "Mercedes", dataTrain45)
for i in 1:size(dataTrain45, 1)
    if dataTrain45[i, :Class] == "Citroen" 
        dataTrain45[i, :Class] = "0.0"
    end
	if dataTrain45[i, :Class] == "Fiat" 
        dataTrain45[i , :Class] = "1.0"
    end
end
dataTrain45[!, :Class] = parse.(Float64, dataTrain45[!, :Class])


# Pravimo 10 logističkih regresora
logisticRegressor12 = glm(fm, dataTrain12, Binomial(), ProbitLink())
logisticRegressor13 = glm(fm, dataTrain13, Binomial(), ProbitLink())
logisticRegressor14 = glm(fm, dataTrain14, Binomial(), ProbitLink())
logisticRegressor15 = glm(fm, dataTrain15, Binomial(), ProbitLink())
logisticRegressor23 = glm(fm, dataTrain23, Binomial(), ProbitLink())
logisticRegressor24 = glm(fm, dataTrain24, Binomial(), ProbitLink())
logisticRegressor25 = glm(fm, dataTrain25, Binomial(), ProbitLink())
logisticRegressor34 = glm(fm, dataTrain34, Binomial(), ProbitLink())
logisticRegressor35 = glm(fm, dataTrain35, Binomial(), ProbitLink())
logisticRegressor45 = glm(fm, dataTrain45, Binomial(), ProbitLink())

#predikcija vrednosti
dataPredictTest12 = predict(logisticRegressor12, dataTest)
dataPredictTest13 = predict(logisticRegressor13, dataTest)
dataPredictTest14 = predict(logisticRegressor14, dataTest)
dataPredictTest15 = predict(logisticRegressor15, dataTest)
dataPredictTest23 = predict(logisticRegressor23, dataTest)
dataPredictTest24 = predict(logisticRegressor24, dataTest)
dataPredictTest25 = predict(logisticRegressor25, dataTest)
dataPredictTest34 = predict(logisticRegressor34, dataTest)
dataPredictTest35 = predict(logisticRegressor35, dataTest)
dataPredictTest45 = predict(logisticRegressor45, dataTest)

#pravimo matricu u koju cemo ubacivati podatke 
dataPredictTestClass = repeat(0:0, length(dataTest.Class))

#petlja za dobijanje koja klasa je pobedila u predikciji za dati datatest podatak
for i in 1:length(dataPredictTestClass)

	nizic = [0, 0, 0, 0, 0]

	# 1v2
	if dataPredictTest12[i] < 0.5
		nizic[1] += 1
	else
		nizic[2] += 1
	end

	# 1v3
	if dataPredictTest13[i] < 0.5
		nizic[1] += 1
	else
		nizic[3] += 1
	end

	# 1v4
	if dataPredictTest14[i] < 0.5
		nizic[1] += 1
	else
		nizic[4] += 1
	end
	# 1v5
	if dataPredictTest15[i] < 0.5
		nizic[1] += 1
	else
		nizic[5] += 1
	end

	# 2v3
	if dataPredictTest23[i] < 0.5
		nizic[2] += 1
	else
		nizic[3] += 1
	end

	# 2v4
	if dataPredictTest24[i] < 0.5
		nizic[2] += 1
	else
		nizic[4] += 1
	end
	# 2v5
	if dataPredictTest25[i] < 0.5
		nizic[2] += 1
	else
		nizic[5] += 1
	end
	
	#3 v 4
	if dataPredictTest34[i] < 0.5
		nizic[3] += 1
	else
		nizic[4] += 1
	end
	# 3v5
	if dataPredictTest35[i] < 0.5
		nizic[3] += 1
	else
		nizic[5] += 1
	end
	#4v5
	if dataPredictTest45[i] < 0.5
		nizic[4] += 1
	else
		nizic[5] += 1
	end

	# vraca broj indeksa od najveceg podatka u nizu
	global dataPredictTestClass[i] = argmax(nizic)

end
#nebitno za zadatak ispisao sam za sebe
for i in 1:length(dataPredictTestClass)
	if(dataPredictTestClass[i] == 1)
println("Za $i. uneti podatak predvidjeno  je da ce biti Audi ")
		elseif(dataPredictTestClass[i] == 2)
			println("Za $i. uneti test podatak predvidjeno  je da ce biti BMW ")
		elseif(dataPredictTestClass[i] == 3)
			println("Za $i. uneti test podatak predvidjeno  je da ce biti Mercedes ")
		elseif(dataPredictTestClass[i] == 4)
			println("Za $i. uneti test podatak predvidjeno  je da ce biti Citroen ")
		else
			println("Za $i. uneti test podatak predvidjeno  je da ce biti  Fiat")

	end
end


#racunanje kvaliteta klasifikacije

FPTest1 = 0
FNTest1 = 0
TPTest1 = 0
TNTest1 = 0

FPTest2 = 0
FNTest2 = 0
TPTest2 = 0
TNTest2 = 0

FPTest3 = 0
FNTest3 = 0
TPTest3 = 0
TNTest3 = 0

FPTest4 = 0
FNTest4 = 0
TPTest4 = 0
TNTest4 = 0

FPTest5 = 0
FNTest5 = 0
TPTest5 = 0
TNTest5 = 0

for i in 1:length(dataPredictTestClass)
	
    #1
	if dataPredictTestClass[i] == 1 && dataTest.Class[i] == "Audi"
		global TPTest1 += 1
	elseif dataPredictTestClass[i] == 1 && dataTest.Class[i] != "Audi"
		global FPTest1 += 1
	elseif dataPredictTestClass[i] != 1 && dataTest.Class[i] == "Audi"
		global FNTest1 += 1
    else
        global TNTest1 += 1
    end

	#2
	if dataPredictTestClass[i] == 2 && dataTest.Class[i] == "BMW"
		global TPTest2 += 1
	elseif dataPredictTestClass[i] == 2 && dataTest.Class[i] != "BMW"
		global FPTest2 += 1
	elseif dataPredictTestClass[i] != 2 && dataTest.Class[i] == "BMW"
		global FNTest2 += 1
    else
        global TNTest2 += 1
    end

	#3
	if dataPredictTestClass[i] == 3 && dataTest.Class[i] == "Mercedes"
		global TPTest3 += 1
	elseif dataPredictTestClass[i] == 3 && dataTest.Class[i] != "Mercedes"
		global FPTest3 += 1
	elseif dataPredictTestClass[i] != 3 && dataTest.Class[i] == "Mercedes"
		global FNTest3 += 1
    else
        global TNTest3 += 1
    end

	#4
	if dataPredictTestClass[i] == 4 && dataTest.Class[i] == "Citroen"
		global TPTest4 += 1
	elseif dataPredictTestClass[i] == 4 && dataTest.Class[i] != "Citroen"
		global FPTest4 += 1
	elseif dataPredictTestClass[i] != 4 && dataTest.Class[i] == "Citroen"
		global FNTest4 += 1
	else
		global TNTest4 += 1
	end
	#5
	if dataPredictTestClass[i] == 4 && dataTest.Class[i] == "Fiat"
		global TPTest5 += 1
	elseif dataPredictTestClass[i] == 4 && dataTest.Class[i] != "Fiat"
		global FPTest5 += 1
	elseif dataPredictTestClass[i] != 4 && dataTest.Class[i] == "Fiat"
		global FNTest5 += 1
	else
		global TNTest5 += 1
	end
end

TNSum = TNTest1 + TNTest2 + TNTest3 + TNTest4
TPSum = TPTest1 + TPTest2 + TPTest3 + TPTest4
FNSum = FNTest1 + FNTest2 + FNTest3 + FNTest4
FPSum = FPTest1 + FPTest2 + FPTest3 + FPTest4


accuracyTest = (TPSum + TNSum) / (TPSum + TNSum + FPSum + FNSum)
specificityTest = TNSum/(TNSum+FPSum)
spec1 = TNTest1/(TNTest1+FPTest1) 
spec2 = TNTest2/(TNTest2+FPTest2)
spec3 = TNTest3/(TNTest3+FPTest3)
spec4 = TNTest4/(TNTest4+FPTest4)
spec5 = TNTest5/(TNTest5+FPTest5)




println("Preciznost sistema za datatest je $(round(accuracyTest; digits = 2))")

println("Specificnost za klasu Audi: $(round(spec1; digits = 3))")
println("Specificnost za klasu BMW: $(round(spec2; digits = 3))")
println("Specificnost za klasu Mercedes: $(round(spec3; digits = 3))")
println("Specificnost za klasu Citroen: $(round(spec4; digits = 3))")
println("Specificnost za klasu Fiat: $(round(spec5; digits = 3))")
println("\nSpecificnost za ceo test skup: $(round(specificityTest; digits = 3))")



