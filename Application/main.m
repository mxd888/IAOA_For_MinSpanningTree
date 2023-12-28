% AOAPROMAX×îÓÅ
clear;close all;clc;

N= 300;
runs = 1;
max_it=1000;
starModelNum = 300;
endModelNum = 300;
rng('shuffle');
addpath(genpath('./'))
empty_particle.T=[];
empty_particle.Sol=[];
empty_particle.Fitness=zeros(runs,max_it);
empty_particle.MeanBest=zeros(runs,max_it);
% 25-400
F_Obj = {@(N,max_it,model) IAOA(N,max_it,model); @(N,max_it,model) AOA(N,max_it,model); @(N,max_it,model) MA_BB(N,max_it,model); ...
    @(N,max_it,model) EOCAEFA(N,max_it,model); @(N,max_it,model) pso(N,max_it,model); @(N,max_it,model) ica(N,max_it,model); ...
    @(N,max_it,model) GA(N,max_it,model); @(N,max_it,model) GWO(N,max_it,model); ...
    @(N,max_it,model) SOA(N,max_it,model); @(N,max_it,model) SMA(N,max_it,model); ...
    @(N,max_it,model) DE(N,max_it,model); @(N,max_it,model) AMO(N,max_it,model); ...
    @(N,max_it,model) aco(N,max_it,model); @(N,max_it,model) AO(N,max_it,model);};
% 500-1000
High_Dim = {@(N,max_it,model) IAOA(N,max_it,model); @(N,max_it,model) AOA(N,max_it,model); @(N,max_it,model) MA_BB(N,max_it,model); ...
    @(N,max_it,model) pso(N,max_it,model); @(N,max_it,model) ica(N,max_it,model); ...
    @(N,max_it,model) GA(N,max_it,model); @(N,max_it,model) GWO(N,max_it,model); ...
    @(N,max_it,model) SOA(N,max_it,model); @(N,max_it,model) SMA(N,max_it,model); ...
    @(N,max_it,model) DE(N,max_it,model); @(N,max_it,model) AMO(N,max_it,model); ...
    @(N,max_it,model) aco(N,max_it,model); @(N,max_it,model) AO(N,max_it,model);};
% 1000-2000
SuperHigh_Dim = {@(N,max_it,model) IAOA(N,max_it,model); @(N,max_it,model) AOA(N,max_it,model); ...
    @(N,max_it,model) pso(N,max_it,model); @(N,max_it,model) ica(N,max_it,model); ...
    @(N,max_it,model) GA(N,max_it,model); @(N,max_it,model) GWO(N,max_it,model); ...
    @(N,max_it,model) SOA(N,max_it,model); @(N,max_it,model) SMA(N,max_it,model); ...
    @(N,max_it,model) DE(N,max_it,model); @(N,max_it,model) AMO(N,max_it,model); ...
    @(N,max_it,model) aco(N,max_it,model); @(N,max_it,model) AO(N,max_it,model);};
test_Dim = {@(N,max_it,model) IAOA(N,max_it,model);};
t0 = tic;
for i=starModelNum:endModelNum
    data=repmat(empty_particle,numel(test_Dim),1);

    for r = 1 : runs
        model = loadmodel(starModelNum);
        for j = 1 : numel(test_Dim)
            t1 = tic;
            [sol,best, meanbest]=test_Dim{j,1}(N,max_it,model);
            data(j).Sol = [data(j).Sol sol];
            data(j).Fitness(r,:) = best;
            data(j).MeanBest(r,:) = meanbest;
            data(j).T(r)=toc(t1);
        end
    end
    PATH = ['data/applicants/P' num2str(i)];
    save(PATH, 'data');
    disp(['Running£º ', num2str(((i+1-starModelNum)/(endModelNum-starModelNum+1))*100), '%']);
end
toc(t0);
