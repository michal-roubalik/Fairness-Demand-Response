function results = run_simulation_abstract(loop_model, regulator_type, x_c0, config)
%
%
%
%

% Basic simulation parameters and structures
A = loop_model.A;   % Accumulator
F = loop_model.F;   % Filter

iter_max = config.iter_max; % No. of iterations
k_max = config.k_max;       % Time horizon
N = config.N;                   % No. of agents (generators)

% Regulator type
if strcmp(regulator_type, 'PI')
    C = loop_model.Cpi;
else
    C = loop_model.Clag;
end

% Variable allocation
e = zeros(iter_max,k_max);          % error from regulation target value
y = zeros(iter_max,k_max);          % filter output
pi = zeros(iter_max,k_max);         % regulation signal
xc = zeros(iter_max,k_max);         % inner state of controller
X_sum = zeros(iter_max,k_max);      % no. of running agents
X1_sum = zeros(iter_max,k_max);     % no. of running agents of type 1
X2_sum = zeros(iter_max,k_max);     % no. of running agents of type 2
X = cell(N);

% regulated value, in abstract model we expect to run half of the agents
r = N/2;
S = create_systems(config);
for i = 1:N
    X{i} = zeros(iter_max,k_max);
end

dead_band = r / 100 * config.deadband_size;

disp(['Simulation of ', config.problem, ' problem has started, x_c(0) = ', num2str(x_c0)])
% Regulation loop
for i = 1:iter_max
    if mod(i, 10) == 0
        disp(['Iteration ', num2str(i),'/' num2str(iter_max)]);
    end
    % Initial condition
    C.y = 0;
    C.x = x_c0;
    F.x = [0 0];
    F.y = 0;
    
    for ell = 1:N
        if ell <= N/2
            S{ell}.x = 1;
            S{ell}.y = 1;
        else
            S{ell}.x = 0;
            S{ell}.y = 0;
        end
    end
    % Run in time
    for k = 1:k_max
        A = accumulator(A, S);
        F = accfilter(F, A);
        e(i,k) = r - F.y;
        y(i,k) = F.y;
        for ell = 1:N
            X{ell}(i,k) = S{ell}.x;
            if ell <= N/2
                X1_sum(i,k) = X1_sum(i,k) + X{ell}(i,k);
            else
                X2_sum(i,k) = X2_sum(i,k) + X{ell}(i,k);
            end
        end
        X_sum(i,k) = X1_sum(i,k) + X2_sum(i,k);
        if abs(e(i,k)) > dead_band
            C = controller(C,e(i,k));
        end
        xc(i,k) = C.x;
        pi(i,k) = C.y;
        S = systems(S,C.y);
    end
end

results.e = e;
results.y = y;
results.pi = pi;
results.xc = xc;
results.X = X;
results.X_sum = X_sum;
results.X1_sum = X1_sum;
results.X2_sum = X2_sum;

end