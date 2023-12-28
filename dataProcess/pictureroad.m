clear;close all;clc;
for i = 23:23
    if i == 3
        continue;
    end
    switch i
        case 1
            func_num = 'The best route for 25 cities';
        case 2
            func_num = 'The best route for 50 cities';
        case 3
            func_num = 'The best route for 75 cities';
        case 4
            func_num = 'The best route for 100 cities';
        case 5
            func_num = 'The best route for 125 cities';
        case 6
            func_num = 'The best route for 150 cities';
        case 7
            func_num = 'The best route for 175 cities';
        case 8
            func_num = 'The best route for 200 cities';
        case 9
            func_num = 'The best route for 250 cities';
        case 10
            func_num = 'The best route for 300 cities';
        case 11
            func_num = 'The best route for 350 cities';
        case 12
            func_num = 'The best route for 400 cities';
        case 13
            func_num = 'The best route for 500 cities';
        case 14
            func_num = 'The best route for 600 cities';
        case 15
            func_num = 'The best route for 700 cities';
        case 16
            func_num = 'The best route for 800 cities';
        case 17
            func_num = 'The best route for 900 cities';
        case 18
            func_num = 'The best route for 1000 cities';
        case 19
            func_num = 'The best route for 1200 cities';
        case 20
            func_num = 'The best route for 1400 cities';
        case 21
            func_num = 'The best route for 1600 cities';
        case 22
            func_num = 'The best route for 1800 cities';
        case 23
            func_num = 'The best route for 2000 cities';
        case 24
            func_num = 'The best route for 1500 cities';
    end
    
    name = ['data/4/data/P' num2str(i)];
    load([name '.mat']);
    model = loadmodel(i);
    figure;
    PlotSolution(data(1).Sol,model);
    title(['\fontsize{12}\bf',func_num]);
%     plot(X,Y,'ko','MarkerSize',12,'MarkerFaceColor',[1 1 0]);

% semilogy
end