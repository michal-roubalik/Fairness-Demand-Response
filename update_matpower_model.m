function MP_model = update_matpower_model(MP_model, N_running, tg_power)

bus_power = tg_power * N_running;

MP_model.gen(2, 2) = bus_power; 
MP_model.gen(2, 9) = bus_power;
MP_model.gen(2, 10) = bus_power;
end