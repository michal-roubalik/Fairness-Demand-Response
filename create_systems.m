function S = create_systems(config)
%
%
%

N = config.N; % Number of subsystems
S = cell(1,N);
N0 = 10;

for i = 1:N
    S{i}.x = 0;  %Initial Condition
    
    S{i}.f = cell(1,2); %Iteration Functions
    S{i}.f{1} = @(x) 0;
    S{i}.f{2} = @(x) 1;
    
    S{i}.g = cell(1,2);  %Output Functions
    S{i}.g{1} = @(x) x;
    S{i}.g{2} = @(x) x;
    
    S{i}.y = 0; %Initial Output

    if i <= N/2
        S{i}.k = 100;
        S{i}.x0 = 5;
        % S{i}.p = @(x,k,x0,s) 0.02 + 0.95 / ( 1 + exp(-k*(s - x0) ) );
        S{i}.N0 = N0;
        S{i}.p = @(x,k,x0,N0,s) 0.02 + 0.95 / ( 1 + exp(-k*(s/N*N0 - x0) ) );
    else
        S{i}.k = 100;
        S{i}.x0 = 1;
        % S{i}.p = @(x,k,x0,s) 1 - ( 0.02 + 0.95 / ( 1 + exp(-k*(s - x0) ) ) );
        S{i}.N0 = N0;
        S{i}.p = @(x,k,x0,N0, s) 1 - ( 0.02 + 0.95 / ( 1 + exp(-k*(s/N*N0 - x0) ) ) );
    end
end
end