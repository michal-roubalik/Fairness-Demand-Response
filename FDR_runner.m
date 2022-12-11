function FDR_runner(config)
%% Create elements of control loop
loop_model.A = create_accumulator;
loop_model.F = create_filter;
loop_model.Cpi = create_controller('PI', config);
loop_model.Clag = create_controller('lag', config);

%% Simulation x_c = positive, PI controller
x_c0 = config.x_c0_magnitude;
regulator_type = 'PI';

if strcmp(config.problem, 'abstract')
    resultsFDR.pi_plus = run_simulation_abstract(loop_model, regulator_type, x_c0, config);
elseif strcmp(config.problem, 'matpower')
    resultsFDR.pi_plus = run_simulation_matpower(loop_model, regulator_type, x_c0, config);
else
    error('Unknown type of problem, choose between abstract and matpower');
end

%% Simulation x_c = negative, PI controller
x_c0 = -config.x_c0_magnitude;
regulator_type = 'PI';

if strcmp(config.problem, 'abstract')
    resultsFDR.pi_minus = run_simulation_abstract(loop_model, regulator_type, x_c0, config);
elseif strcmp(config.problem, 'matpower')
    resultsFDR.pi_minus = run_simulation_matpower(loop_model, regulator_type, x_c0, config);
else
    error('Unknown type of problem, choose between abstract and matpower');
end

%% Simulation x_c = positive, Lag controller
x_c0 = config.x_c0_magnitude;
regulator_type = 'lag';

if strcmp(config.problem, 'abstract')
    resultsFDR.lag_plus = run_simulation_abstract(loop_model, regulator_type, x_c0, config);
elseif strcmp(config.problem, 'matpower')
    resultsFDR.lag_plus = run_simulation_matpower(loop_model, regulator_type, x_c0, config);
else
    error('Unknown type of problem, choose between abstract and matpower');
end

%% Simulation x_c = negative, Lag controller
x_c0 = -config.x_c0_magnitude;
regulator_type = 'lag';

if strcmp(config.problem, 'abstract')
    resultsFDR.lag_minus = run_simulation_abstract(loop_model, regulator_type, x_c0, config);
elseif strcmp(config.problem, 'matpower')
    resultsFDR.lag_minus = run_simulation_matpower(loop_model, regulator_type, x_c0, config);
else
    error('Unknown type of problem, choose between abstract and matpower');
end

%% Graphic output
create_graphs_abstract(resultsFDR, config);

end