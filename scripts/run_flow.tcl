# ====================================================
# SKY130A HD FULL FLOW FOR alu_4bit
# ====================================================

# =========================
# Paths
# =========================

set tech_lef "/home/a4/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"

set std_lef  "/home/a4/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"

set liberty  "/home/a4/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

set netlist  "synthesis/4bitalu_net.v"

set sdcfile  "synthesis/constraints.sdc"

# =========================
# Read Libraries
# =========================

read_lef $tech_lef
read_lef $std_lef
read_liberty $liberty

# =========================
# Read Design
# =========================

read_verilog $netlist
link_design alu_4bit

# =========================
# Timing Constraints
# =========================

read_sdc $sdcfile

# Set wire RC model (very important for STA realism)
set_wire_rc -layer met1

# =========================
# Floorplan
# =========================

initialize_floorplan \
  -utilization 55 \
  -aspect_ratio 1.0 \
  -core_space 10 \
  -site unithd

make_tracks

# =========================
# IO Placement
# =========================

place_pins -hor_layers met1 -ver_layers met2

# =========================
# Global Placement
# =========================

global_placement

# =========================
# Detailed Placement
# =========================

detailed_placement


check_placement

# =========================
# Estimate Parasitics
# =========================



report_wns
report_tns

# =========================
# Global Routing
# =========================

global_route

# =========================
# Detailed Routing
# =========================

detailed_route

# =========================
# Final Timing
# =========================

estimate_parasitics -global_routing

report_wns
report_tns

# =========================
# Output Files
# =========================

write_def alu_final.def
write_db  alu_final.odb
write_verilog alu_final.v
