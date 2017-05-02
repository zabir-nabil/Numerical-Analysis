function [ p ] = population_growth( r, year, initial_population )

t = ode45('predictive_model',[0 year],initial_population)*r;

p = y;

end



