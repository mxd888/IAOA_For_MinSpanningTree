function model = loadmodel(n)
    % ×°ÔØÊý¾Ý
    cities=shaperead('worldcities.shp','UseGeoCoords',true);
    model.X = [cities.Lon];
    model.X = model.X(1:n);
    model.Y = [cities.Lat];
    model.Y = model.Y(1:n);
    model.n=numel(model.X);
    model.d = distance(model);
    
end