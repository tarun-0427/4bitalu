# Create virtual clock
create_clock -name VCLK -period 10

# Constrain IO delays relative to clock
set_input_delay 1 -clock VCLK [all_inputs]
set_output_delay 1 -clock VCLK [all_outputs]
