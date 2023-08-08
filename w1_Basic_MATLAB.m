% Week 1 - Basic MATLAB Plotting

% 1. Create arrays / matrices
A = [1, 2, 3;
    4, 5, 6]
B = [(1:3);
    (4:6);
    (7:9)]
C = [A;
    B] % concencate two matrices

% 2. Access sections of arrays
e = C(1, 1)
f = C(5, 3)
D = C(:, 1)
E = C(:, [1:3])
F = C(end, :)

% 3. Matrix Multiplication
G = A * B'

% -----Example 1: Plotting-----
colors = repmat('krgbmc',1,300) ;
Rtot = 20 ;
L = 0:0.01:200 ;
KDs = 10:20:90 ;
figure
hold on
for i=1:length(KDs) 
  KD = KDs(i) ;
  LR = Rtot*L./(L + KD) ;
  plot(L,LR,colors(i)) ;
  LR_all(i,:) = LR ;
  figurelegend{i} = ['K_D = ',int2str(KD),' uM'] ;
end 
xlabel('[Ligand] (uM)')
ylabel('[Ligand-Receptor] (nM)')
legend(figurelegend,'Location','SouthEast')

% -----Example 2: Normalization-----

data = dlmread("/Users/pc/Desktop/System Biology/Dymanic Modelling/sampledata1.DAT") ;
time = data(: , 1) ;
f1 = data(:,2) ; 
[minimum,index] = min(abs(time-50)) ;
sum = 0 ;
for i=1:index
  sum = sum + f1(i) ;  
end
f1avg = sum/index ;
f1_norm = f1/f1avg ;
    
f2 = data(:,3) ;
sum = 0 ;
for i=1:index
  sum = sum + f2(i) ;  
end
f2avg = sum/index ;
f2_norm = f2/f2avg ;

f3 = data(:,4) ;
sum = 0 ;
for i=1:index
  sum = sum + f3(i) ;  
end
f3avg = sum/index ;
f3_norm = f3/f3avg ;

figure
hold on 
plot(time,f1_norm,'b')
plot(time,f2_norm,'g')
plot(time,f3_norm,'r')

% -----Assignment 1-----

% question1
% Step 1. Read in the data and transpose
data = imread("/Users/pc/Desktop/System Biology/Dymanic Modelling/flash4.jpg", "jpg") ;
data_transposed = data' ;

% Display using imagesc
%imagesc(data_transposed) ;

% question2
data_file = load('-mat', "/Users/pc/Desktop/System Biology/Dymanic Modelling/sampledata2.mat") ; 
column_names = {'Patients_Age', 'Number_of_drinks_weekly', 'Clinical_Status'} ;
table_data = array2table(data_file.data, 'VariableNames', column_names) ;
%disp(table_data(1:5, :))

% choice 1
num_of_patients_more_than_5_drinks = 0 ;
for i = 1:300
    if table_data.Number_of_drinks_weekly(i) > 5
        num_of_patients_more_than_5_drinks = num_of_patients_more_than_5_drinks + 1 ;
    end
end
if num_of_patients_more_than_5_drinks > (300 / 2)
    fprintf("The number of patients is " + num_of_patients_more_than_5_drinks) ;
    fprintf("More than half of the patients drink more than 5 times per week.") ;
else
    fprintf("The number of patients is " + num_of_patients_more_than_5_drinks + "\n") ;
    fprintf("Less than half of the patients drink more than 5 times per week. \n") ;
end

% choice 2
Number_of_patients_cancer    = 0 ;
Number_of_patients_no_cancer = 0 ; 
for i = 1:300
    if table_data.Clinical_Status(i) == 1
        Number_of_patients_cancer    = Number_of_patients_cancer    + 1 ;
    else
        Number_of_patients_no_cancer = Number_of_patients_no_cancer + 1 ;
    end
end
if Number_of_patients_cancer < Number_of_patients_no_cancer
    fprintf("Number of patients who have cancer is less than whose without cancer\n") ;
else
    fprintf("Number of patients who have cancer is more than whose without cancer\n") ;
end

% choice 3
Number_of_patients_more_than_6 = 0 ;
Number_of_patients_less_than_5 = 0 ;
for i = 1:300
    if table_data.Number_of_drinks_weekly(i) > 6
        Number_of_patients_more_than_6 = Number_of_patients_more_than_6 + 1 ;
    elseif table_data.Number_of_drinks_weekly(i) < 5
        Number_of_patients_less_than_5 = Number_of_patients_less_than_5 + 1 ;
    end
end
if Number_of_patients_more_than_6 > Number_of_patients_less_than_5
    fprintf("There are more patients who drink more than 6 times per week compared to those who drink less than 5 times per week.\n") ;
else
    fprintf("There are less patients who drink more than 6 times per week compared to those who drink less than 5 times per week.\n") ;
end

% choice 4
Number_of_patients_older_than_50   = 0 ;
Number_of_patients_younger_than_20 = 0 ;
for i = 1:300
    if table_data.Patients_Age(i) > 50
        Number_of_patients_older_than_50   = Number_of_patients_older_than_50   + 1 ;
    elseif table_data.Patients_Age(i) < 20
        Number_of_patients_younger_than_20 = Number_of_patients_younger_than_20 + 1 ;
    end
end
if Number_of_patients_older_than_50 > Number_of_patients_younger_than_20
    fprintf("There are more patients who are older than 50 compared to those who are younger than 20.\n") ;
else
    fprintf("There are less patients who are older than 50 compared to those who are younger than 20.\n") ;
end

% question3
ages_of_patients_cancer    = table_data.Patients_Age(table_data.Clinical_Status == 1) ;
ages_of_patients_no_cancer = table_data.Patients_Age(table_data.Clinical_Status == 0) ;
hist(ages_of_patients_cancer)
xlabel("Age")
ylabel("Number of patients with cancer")

hist(ages_of_patients_no_cancer)
xlabel("Age")
ylabel("Number of patients with no cancer")

% question4
% choice 1
patients_cancer_younger_than_30 = sum(ages_of_patients_cancer < 30) ;
patients_cancer_older_than_60   = sum(ages_of_patients_cancer > 60) ;
if patients_cancer_younger_than_30 > patients_cancer_older_than_60
    fprintf("Among patients with cancer, there are more people younger than 30 compared to those older than 60.\n")
else
    fprintf("Among patients with cancer, there are less people younger than 30 compared to those older than 60.\n")
end

% choice 2
patients_cancer_younger_than_45 = sum(ages_of_patients_cancer < 45) ;
patients_cancer_older_than_45   = sum(ages_of_patients_cancer > 45) ;
if patients_cancer_younger_than_30 < patients_cancer_older_than_60
    fprintf("Among patients with cancer, there are more people older than 45 compared to those younger than 60.\n")
else
    fprintf("Among patients with cancer, there are less people older than 45 compared to those younger than 60.\n")
end

% choice 3
patients_no_cancer_younger_than_35 = sum(ages_of_patients_no_cancer < 35) ;
patients_no_cancer_older_than_35   = sum(ages_of_patients_no_cancer > 35) ;
if patients_no_cancer_younger_than_35 > patients_no_cancer_older_than_35
    fprintf("Among patients with cancer, there are more people younger than 35 compared to those older than 35.\n")
else
    fprintf("Among patients with cancer, there are less people younger than 35 compared to those older than 35.\n")
end

% choice 4
patients_no_cancer_younger_than_25 = sum(ages_of_patients_no_cancer < 25);
patients_no_cancer_older_than_55   = sum(ages_of_patients_no_cancer > 55) ;
if patients_no_cancer_younger_than_25 < patients_no_cancer_older_than_55
    fprintf("Among patients with cancer, there are more people older than 55 compared to those younger than 25.\n")
else
    fprintf("Among patients with cancer, there are less people older than 55 compared to those younger than 25.\n")
end

% question6
percent_of_patients_cancer_older_than_35 = sum(ages_of_patients_cancer > 35) / length(ages_of_patients_cancer) ;
fprintf("The percent of patients with cancer are older than 35 is: " + percent_of_patients_cancer_older_than_35 + ".\n")

% question7
percent_of_patients_cancer_younger_than_25 = sum(table_data.Patients_Age < 25) / length(table_data.Patients_Age) ;
fprintf("The percent of patients are younger than 25 is: " + percent_of_patients_cancer_younger_than_25 + ".\n")

% question8
percent_of_patients_cancer_more_than_3 = sum(table_data.Number_of_drinks_weekly > 3 & table_data.Clinical_Status == 1) / sum(table_data.Number_of_drinks_weekly > 3) ;
fprintf("The percent of patients who drink more than 3 times per week have cancer is: " + percent_of_patients_cancer_more_than_3 + ".\n")





