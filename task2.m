function expected_power = turbineObj(design, fx)

weights = [0.25, 0.45, 0.20, 0.10]; % Weights for each wind speed.
wind_speeds = [4, 5, 6, 7]; % Wind speeds to test turbine.
nSections = length(design) / 2;
weighted_power = 0;

for i = 1:length(wind_speeds)
    [power, rpm] = evaluateTurbine(fx, design(1:nSections), design(nSections + 1:end));
    if (rpm < 0) || (rpm > 200)
        power = 0;
    end
    weighted_power = weighted_power + weights(i) * power;
end

expected_power = -weighted_power;

end

% Sample design to test
airfoil = 'NACA0012';
num_blades = 5;
chord = [0.19, 0.18, 0.17, 0.16, 0.15, 0.14, 0.13, 0.12, 0.11, 0.10, 0.09, ...
0.08, 0.07, 0.06, 0.05];
beta = [25, 22, 19, 17, 15, 13, 11, 9, 8, 7, 6, 5, 4, 3, 2] * pi/180;

turbineObj()