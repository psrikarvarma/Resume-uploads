#!/bin/bash

SERVER="dic_lab_02@192.168.88.31"
PASSWORD="sree@man"
REMOTE_BASE_DIR="sriman"

declare -A files_to_upload=(
    ["Downloads/IIR_filter.v"]="benchmark1/rtl"
    ["Downloads/FIR_filter.v"]="benchmark2/rtl"
    ["Downloads/c6288.v"]="benchmark3/rtl"
    ["Downloads/b14.vhd"]="benchmark4/rtl"
    ["Downloads/b15.vhd"]="benchmark5/rtl"
    ["Downloads/UART.v"]="benchmark6/rtl"
    ["Downloads/align_mantisa.v"]="benchmark7/rtl"
    ["Downloads/Extract.v"]="benchmark7/rtl"
    ["Downloads/FADD.v"]="benchmark7/rtl"
    ["Downloads/Normalization.v"]="benchmark7/rtl"
    ["Downloads/Operation.v"]="benchmark7/rtl"
    ["Downloads/Result_and_exception.v"]="benchmark7/rtl"
    ["Downloads/Alignment.v"]="benchmark8/rtl"
    ["Downloads/Extraction.v"]="benchmark8/rtl"
    ["Downloads/FADD_Dual_Main.v"]="benchmark8/rtl"
    ["Downloads/Normalization_1.v"]="benchmark8/rtl"
    ["Downloads/Operation_1.v"]="benchmark8/rtl"
    ["Downloads/Pipeline_Reg.v"]="benchmark8/rtl"
    ["Downloads/Result.v"]="benchmark8/rtl"
    ["Downloads/data_sampling.v"]="benchmark9/rtl"
    ["Downloads/deserializer.v"]="benchmark9/rtl"
    ["Downloads/edge_bit_counter.v"]="benchmark9/rtl"
    ["Downloads/par_chk.v"]="benchmark9/rtl"
    ["Downloads/stp_chk.v"]="benchmark9/rtl"
    ["Downloads/strt_chk.v"]="benchmark9/rtl"
    ["Downloads/uart_rx_fsm.v"]="benchmark9/rtl"
    ["Downloads/UART_RX.v"]="benchmark9/rtl"
    ["Downloads/mux.v"]="benchmark10/rtl"
    ["Downloads/mux_1.v"]="benchmark10/rtl"
    ["Downloads/parity_calc.v"]="benchmark10/rtl"
    ["Downloads/Serializer.v"]="benchmark10/rtl"
    ["Downloads/uart_tx_fsm.v"]="benchmark10/rtl"
    ["Downloads/UART_TX.v"]="benchmark10/rtl"
)

for file in "${!files_to_upload[@]}"; do
    destination="${files_to_upload[$file]}"
    echo "Uploading $file to $SERVER:$REMOTE_BASE_DIR/$destination"
    sshpass -p "$PASSWORD" scp "$file" "$SERVER:$REMOTE_BASE_DIR/$destination"
done

echo "All files uploaded successfully!"
