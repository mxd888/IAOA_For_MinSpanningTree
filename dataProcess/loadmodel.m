function model = loadmodel(index)
    switch index
        case 1
            load('data/cities_data/coordinates_25_cities.mat');
        case 2
            load('data/cities_data/coordinates_50_cities.mat');
        case 3
            load('data/cities_data/coordinates_75_cities.mat');
        case 4
            load('data/cities_data/coordinates_100_cities.mat');  
        case 5
            load('data/cities_data/coordinates_125_cities.mat');    
        case 6
            load('data/cities_data/coordinates_150_cities.mat');  
        case 7
            load('data/cities_data/coordinates_175_cities.mat');  
        case 8
            load('data/cities_data/coordinates_200_cities.mat');
        case 9
            load('data/cities_data/coordinates_250_cities.mat');
        case 10
            load('data/cities_data/coordinates_300_cities.mat');
        case 11
            load('data/cities_data/coordinates_350_cities.mat');   
        case 12
            load('data/cities_data/coordinates_400_cities.mat');  
        case 13
            load('data/cities_data/coordinates_500_cities.mat');  
        case 14
            load('data/cities_data/coordinates_600_cities.mat');
        case 15
            load('data/cities_data/coordinates_700_cities.mat');
        case 16
            load('data/cities_data/coordinates_800_cities.mat');
        case 17
            load('data/cities_data/coordinates_900_cities.mat');   
        case 18
            load('data/cities_data/coordinates_1000_cities.mat');  
        case 19
            load('data/cities_data/coordinates_1200_cities.mat');
        case 20
            load('data/cities_data/coordinates_1400_cities.mat');
        case 21
            load('data/cities_data/coordinates_1600_cities.mat');
        case 22
            load('data/cities_data/coordinates_1800_cities.mat');   
        case 23
            load('data/cities_data/coordinates_2000_cities.mat');  
        case 24
            load('data/cities_data/coordinates_1500_cities.mat');  
    end
    model.X = coordinates(:,1);
    model.Y = coordinates(:,2);
    model.Z = coordinates(:,3);
    model.n=size(model.X,1);
    model.d = distance(model);
end