
clear; clc; close all;

addpath(genpath('./'))
for i = 100:100:300
    PATH = ['Applicants/4/P' num2str(i)];
    load(PATH);
    for j = 0:90:360
        if j == 0
            continue;
        end
        PlotApplicantSolution(i, j, data);
    end
end

% 1-100-2.1220*5
% 1-200-3.4411*5
% 1-300-5.5662*5

% 2-100-2.3365*5
% 2-200-3.8150*5
% 2-300-5.6246*5

% 3-100-1.9851*5
% 3-200-3.3625*5
% 3-300-5.7574*5

% 4-100-1.8754e+05
% 4-200-3.2515e+05
% 4-300-4.3536e+05
