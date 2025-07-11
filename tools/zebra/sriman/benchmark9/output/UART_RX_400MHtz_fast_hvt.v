
// Generated by Cadence Genus(TM) Synthesis Solution 20.10-p001_1
// Generated on: Nov 26 2024 05:40:54 IST (Nov 26 2024 00:10:54 UTC)

// Verification Directory fv/UART_RX 

module data_sampling(CLK, RST, S_DATA, Prescale, edge_count, Enable,
     sampled_bit);
  input CLK, RST, S_DATA, Enable;
  input [5:0] Prescale, edge_count;
  output sampled_bit;
  wire CLK, RST, S_DATA, Enable;
  wire [5:0] Prescale, edge_count;
  wire sampled_bit;
  wire [2:0] Samples;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41;
  DFFRHQX1HVT sampled_bit_reg(.RN (RST), .CK (CLK), .D (n_41), .Q
       (sampled_bit));
  NOR2BX1HVT g875__2398(.AN (Enable), .B (n_40), .Y (n_41));
  AOI22XLHVT g876__5107(.A0 (Samples[2]), .A1 (n_39), .B0 (Samples[0]),
       .B1 (Samples[1]), .Y (n_40));
  OR2XLHVT g877__6260(.A (Samples[1]), .B (Samples[0]), .Y (n_39));
  DFFRHQX1HVT \Samples_reg[0] (.RN (RST), .CK (CLK), .D (n_38), .Q
       (Samples[0]));
  NOR2BX1HVT g1412__4319(.AN (Enable), .B (n_37), .Y (n_38));
  MXI2XLHVT g1413__8428(.A (Samples[0]), .B (S_DATA), .S0 (n_36), .Y
       (n_37));
  SDFFRHQX1HVT \Samples_reg[1] (.RN (RST), .CK (CLK), .D (S_DATA), .SI
       (n_2), .SE (n_34), .Q (Samples[1]));
  NOR4X1HVT g1415__5526(.A (n_12), .B (n_31), .C (n_33), .D (n_35), .Y
       (n_36));
  XNOR2X1HVT g1416__6783(.A (n_32), .B (edge_count[4]), .Y (n_35));
  OAI211X1HVT g1417__3680(.A0 (n_17), .A1 (edge_count[2]), .B0 (n_21),
       .C0 (n_30), .Y (n_34));
  XNOR2X1HVT g1418__1617(.A (n_28), .B (edge_count[3]), .Y (n_33));
  XNOR2X1HVT g1419__2802(.A (n_23), .B (n_27), .Y (n_32));
  OAI211X1HVT g1420__1705(.A0 (n_24), .A1 (edge_count[2]), .B0 (n_9),
       .C0 (n_29), .Y (n_31));
  NOR4X1HVT g1421__5122(.A (n_9), .B (n_0), .C (n_26), .D (n_25), .Y
       (n_30));
  AOI21XLHVT g1422__8246(.A0 (n_24), .A1 (edge_count[2]), .B0
       (edge_count[5]), .Y (n_29));
  AOI21XLHVT g1423__7098(.A0 (n_14), .A1 (n_20), .B0 (n_27), .Y (n_28));
  SDFFRHQX1HVT \Samples_reg[2] (.RN (RST), .CK (CLK), .D (S_DATA), .SI
       (n_5), .SE (n_19), .Q (Samples[2]));
  XOR2XLHVT g1425__6131(.A (n_23), .B (edge_count[4]), .Y (n_26));
  NOR2XLHVT g1426__1881(.A (n_14), .B (n_20), .Y (n_27));
  OAI211X1HVT g1427__5115(.A0 (n_10), .A1 (edge_count[1]), .B0 (n_18),
       .C0 (n_22), .Y (n_25));
  OA21X1HVT g1428__7482(.A0 (n_17), .A1 (n_15), .B0 (n_20), .Y (n_24));
  XNOR2X1HVT g1429__4733(.A (n_14), .B (edge_count[3]), .Y (n_22));
  XNOR2X1HVT g1430__6161(.A (Prescale[5]), .B (n_13), .Y (n_23));
  NAND2XLHVT g1431__9315(.A (n_17), .B (edge_count[2]), .Y (n_21));
  NAND4XLHVT g1432__9945(.A (n_7), .B (n_12), .C (n_9), .D (n_16), .Y
       (n_19));
  NAND2XLHVT g1433__2883(.A (n_17), .B (n_15), .Y (n_20));
  AOI21XLHVT g1434__2346(.A0 (n_10), .A1 (edge_count[1]), .B0
       (edge_count[5]), .Y (n_18));
  NOR4X1HVT g1435__1666(.A (n_8), .B (n_6), .C (n_0), .D
       (edge_count[5]), .Y (n_16));
  AOI21XLHVT g1436__7410(.A0 (Prescale[3]), .A1 (n_4), .B0 (n_11), .Y
       (n_17));
  AND2X1HVT g1437__6417(.A (n_10), .B (Prescale[1]), .Y (n_15));
  OAI21XLHVT g1438__5477(.A0 (n_1), .A1 (n_11), .B0 (n_13), .Y (n_14));
  NAND2XLHVT g1439__2398(.A (n_1), .B (n_11), .Y (n_13));
  XNOR2X1HVT g1440__5107(.A (Prescale[2]), .B (edge_count[1]), .Y
       (n_12));
  NOR3XLHVT g1441__6260(.A (Prescale[2]), .B (Prescale[3]), .C
       (Prescale[1]), .Y (n_11));
  AOI21XLHVT g1442__4319(.A0 (Prescale[1]), .A1 (Prescale[2]), .B0
       (n_3), .Y (n_10));
  XOR2XLHVT g1443__8428(.A (Prescale[3]), .B (edge_count[2]), .Y (n_8));
  MXI2XLHVT g1444__5526(.A (Prescale[4]), .B (n_1), .S0
       (edge_count[3]), .Y (n_7));
  XOR2XLHVT g1445__6783(.A (Prescale[5]), .B (edge_count[4]), .Y (n_6));
  XNOR2X1HVT g1446__3680(.A (Prescale[1]), .B (edge_count[0]), .Y
       (n_9));
  AND2XLHVT g1447__1617(.A (Enable), .B (Samples[2]), .Y (n_5));
  INVXLHVT g1448(.A (n_3), .Y (n_4));
  AND2XLHVT g1449__2802(.A (Enable), .B (Samples[1]), .Y (n_2));
  NOR2XLHVT g1450__1705(.A (Prescale[1]), .B (Prescale[2]), .Y (n_3));
  INVXLHVT g1451(.A (Prescale[4]), .Y (n_1));
  INVX1HVT g1452(.A (Enable), .Y (n_0));
endmodule

module deserializer_DATA_WIDTH8(CLK, RST, sampled_bit, Enable,
     edge_count, Prescale, P_DATA);
  input CLK, RST, sampled_bit, Enable;
  input [5:0] edge_count, Prescale;
  output [7:0] P_DATA;
  wire CLK, RST, sampled_bit, Enable;
  wire [5:0] edge_count, Prescale;
  wire [7:0] P_DATA;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18;
  SDFFRHQX1HVT \P_DATA_reg[0] (.RN (RST), .CK (CLK), .D (P_DATA[1]),
       .SI (P_DATA[0]), .SE (n_18), .Q (P_DATA[0]));
  SDFFRHQX1HVT \P_DATA_reg[1] (.RN (RST), .CK (CLK), .D (P_DATA[2]),
       .SI (P_DATA[1]), .SE (n_18), .Q (P_DATA[1]));
  SDFFRHQX1HVT \P_DATA_reg[2] (.RN (RST), .CK (CLK), .D (P_DATA[3]),
       .SI (P_DATA[2]), .SE (n_18), .Q (P_DATA[2]));
  SDFFRHQX1HVT \P_DATA_reg[3] (.RN (RST), .CK (CLK), .D (P_DATA[4]),
       .SI (P_DATA[3]), .SE (n_18), .Q (P_DATA[3]));
  SDFFRHQX1HVT \P_DATA_reg[6] (.RN (RST), .CK (CLK), .D (P_DATA[7]),
       .SI (P_DATA[6]), .SE (n_18), .Q (P_DATA[6]));
  SDFFRHQX1HVT \P_DATA_reg[5] (.RN (RST), .CK (CLK), .D (P_DATA[6]),
       .SI (P_DATA[5]), .SE (n_18), .Q (P_DATA[5]));
  SDFFRHQX1HVT \P_DATA_reg[4] (.RN (RST), .CK (CLK), .D (P_DATA[5]),
       .SI (P_DATA[4]), .SE (n_18), .Q (P_DATA[4]));
  SDFFRHQX1HVT \P_DATA_reg[7] (.RN (RST), .CK (CLK), .D (sampled_bit),
       .SI (P_DATA[7]), .SE (n_18), .Q (P_DATA[7]));
  NAND4BX1HVT g545__5122(.AN (n_12), .B (n_16), .C (n_17), .D (Enable),
       .Y (n_18));
  NOR4X1HVT g546__8246(.A (n_4), .B (n_10), .C (n_13), .D (n_15), .Y
       (n_17));
  XNOR2X1HVT g547__7098(.A (n_14), .B (edge_count[4]), .Y (n_16));
  XNOR2X1HVT g548__6131(.A (n_9), .B (edge_count[5]), .Y (n_15));
  OAI2BB1X1HVT g549__1881(.A0N (Prescale[4]), .A1N (n_7), .B0 (n_6), .Y
       (n_14));
  XNOR2X1HVT g550__5115(.A (n_11), .B (edge_count[2]), .Y (n_13));
  XNOR2X1HVT g551__7482(.A (n_8), .B (edge_count[3]), .Y (n_12));
  AOI21XLHVT g552__4733(.A0 (Prescale[2]), .A1 (n_2), .B0 (n_5), .Y
       (n_11));
  XNOR2X1HVT g553__6161(.A (n_3), .B (edge_count[1]), .Y (n_10));
  CLKXOR2X1HVT g554__9315(.A (Prescale[5]), .B (n_6), .Y (n_9));
  XNOR2X1HVT g555__9945(.A (Prescale[3]), .B (n_5), .Y (n_8));
  NAND2BXLHVT g556__2883(.AN (Prescale[3]), .B (n_5), .Y (n_7));
  NAND2XLHVT g557__2346(.A (n_0), .B (n_5), .Y (n_6));
  NOR3XLHVT g558__1666(.A (Prescale[1]), .B (Prescale[2]), .C
       (Prescale[0]), .Y (n_5));
  XNOR2X1HVT g559__7410(.A (Prescale[0]), .B (edge_count[0]), .Y (n_4));
  AOI21XLHVT g560__6417(.A0 (Prescale[0]), .A1 (Prescale[1]), .B0
       (n_1), .Y (n_3));
  INVXLHVT g561(.A (n_1), .Y (n_2));
  NOR2XLHVT g562__5477(.A (Prescale[0]), .B (Prescale[1]), .Y (n_1));
  NOR2XLHVT g563__2398(.A (Prescale[3]), .B (Prescale[4]), .Y (n_0));
endmodule

module edge_bit_counter(CLK, RST, Enable, Prescale, bit_count,
     edge_count);
  input CLK, RST, Enable;
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  wire CLK, RST, Enable;
  wire [5:0] Prescale;
  wire [3:0] bit_count;
  wire [5:0] edge_count;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49;
  DFFRHQX1HVT \bit_count_reg[3] (.RN (RST), .CK (CLK), .D (n_49), .Q
       (bit_count[3]));
  DFFRHQX1HVT \bit_count_reg[2] (.RN (RST), .CK (CLK), .D (n_48), .Q
       (bit_count[2]));
  AO22XLHVT g1188__5107(.A0 (n_47), .A1 (bit_count[3]), .B0 (n_38), .B1
       (n_20), .Y (n_49));
  OAI2BB1X1HVT g1189__6260(.A0N (n_47), .A1N (bit_count[2]), .B0
       (n_39), .Y (n_48));
  DFFRHQX1HVT \bit_count_reg[1] (.RN (RST), .CK (CLK), .D (n_46), .Q
       (bit_count[1]));
  SDFFRHQX1HVT \bit_count_reg[0] (.RN (RST), .CK (CLK), .D (n_38), .SI
       (n_36), .SE (bit_count[0]), .Q (bit_count[0]));
  DFFRHQX1HVT \edge_count_reg[5] (.RN (RST), .CK (CLK), .D (n_43), .Q
       (edge_count[5]));
  DFFRHQX1HVT \edge_count_reg[3] (.RN (RST), .CK (CLK), .D (n_44), .Q
       (edge_count[3]));
  DFFRHQX1HVT \edge_count_reg[0] (.RN (RST), .CK (CLK), .D (n_45), .Q
       (edge_count[0]));
  DFFRHQX1HVT \edge_count_reg[1] (.RN (RST), .CK (CLK), .D (n_40), .Q
       (edge_count[1]));
  AO22XLHVT g1196__4319(.A0 (n_38), .A1 (n_9), .B0 (n_36), .B1
       (bit_count[1]), .Y (n_46));
  OAI2BB1X1HVT g1197__8428(.A0N (n_38), .A1N (n_5), .B0 (n_37), .Y
       (n_47));
  DFFRHQX1HVT \edge_count_reg[2] (.RN (RST), .CK (CLK), .D (n_41), .Q
       (edge_count[2]));
  DFFRHQX1HVT \edge_count_reg[4] (.RN (RST), .CK (CLK), .D (n_42), .Q
       (edge_count[4]));
  NOR2XLHVT g1200__5526(.A (n_37), .B (edge_count[0]), .Y (n_45));
  NOR2XLHVT g1201__6783(.A (n_37), .B (n_27), .Y (n_44));
  NOR2XLHVT g1202__3680(.A (n_37), .B (n_35), .Y (n_43));
  NOR2XLHVT g1203__1617(.A (n_37), .B (n_32), .Y (n_42));
  NOR2XLHVT g1204__2802(.A (n_37), .B (n_19), .Y (n_41));
  NOR2XLHVT g1205__1705(.A (n_37), .B (n_10), .Y (n_40));
  NAND3BXLHVT g1206__5122(.AN (n_5), .B (n_38), .C (n_3), .Y (n_39));
  NOR2BX1HVT g1207__8246(.AN (Enable), .B (n_34), .Y (n_38));
  INVXLHVT g1208(.A (n_37), .Y (n_36));
  XNOR2X1HVT g1209__7098(.A (edge_count[5]), .B (n_31), .Y (n_35));
  NAND2XLHVT g1210__6131(.A (Enable), .B (n_34), .Y (n_37));
  OAI211X1HVT g1211__1881(.A0 (Prescale[0]), .A1 (n_11), .B0 (n_25),
       .C0 (n_33), .Y (n_34));
  AOI211XLHVT g1212__5115(.A0 (Prescale[0]), .A1 (n_14), .B0 (n_28),
       .C0 (n_30), .Y (n_33));
  XNOR2X1HVT g1213__7482(.A (edge_count[4]), .B (n_26), .Y (n_32));
  AND2XLHVT g1214__4733(.A (edge_count[4]), .B (n_26), .Y (n_31));
  OAI211X1HVT g1215__6161(.A0 (n_17), .A1 (edge_count[4]), .B0 (n_23),
       .C0 (n_29), .Y (n_30));
  XNOR2X1HVT g1216__9315(.A (n_24), .B (edge_count[5]), .Y (n_29));
  XNOR2X1HVT g1217__9945(.A (n_22), .B (edge_count[3]), .Y (n_28));
  XNOR2X1HVT g1218__2883(.A (edge_count[3]), .B (n_18), .Y (n_27));
  AND2XLHVT g1219__2346(.A (edge_count[3]), .B (n_18), .Y (n_26));
  AOI221X1HVT g1220__1666(.A0 (n_15), .A1 (edge_count[2]), .B0 (n_8),
       .B1 (n_2), .C0 (n_21), .Y (n_25));
  XNOR2X1HVT g1221__7410(.A (Prescale[5]), .B (n_16), .Y (n_24));
  NAND2XLHVT g1222__6417(.A (n_17), .B (edge_count[4]), .Y (n_23));
  AOI21XLHVT g1223__5477(.A0 (Prescale[3]), .A1 (n_12), .B0 (n_13), .Y
       (n_22));
  NOR2XLHVT g1224__2398(.A (n_15), .B (edge_count[2]), .Y (n_21));
  OAI32X1HVT g1225__5107(.A0 (bit_count[3]), .A1 (n_3), .A2 (n_5), .B0
       (bit_count[2]), .B1 (n_4), .Y (n_20));
  XNOR2X1HVT g1226__6260(.A (edge_count[2]), .B (n_6), .Y (n_19));
  AND2XLHVT g1227__4319(.A (edge_count[2]), .B (n_6), .Y (n_18));
  OA21X1HVT g1228__8428(.A0 (n_1), .A1 (n_13), .B0 (n_16), .Y (n_17));
  NAND2XLHVT g1229__5526(.A (n_1), .B (n_13), .Y (n_16));
  OAI211X1HVT g1230__6783(.A0 (Prescale[1]), .A1 (n_2), .B0 (n_7), .C0
       (n_0), .Y (n_14));
  XNOR2X1HVT g1231__3680(.A (Prescale[2]), .B (n_8), .Y (n_15));
  NAND2BXLHVT g1232__1617(.AN (Prescale[2]), .B (n_8), .Y (n_12));
  NOR3BXLHVT g1233__2802(.AN (n_8), .B (Prescale[2]), .C (Prescale[3]),
       .Y (n_13));
  AOI21XLHVT g1234__1705(.A0 (Prescale[1]), .A1 (edge_count[1]), .B0
       (n_0), .Y (n_11));
  AOI22XLHVT g1235__5122(.A0 (edge_count[0]), .A1 (n_2), .B0
       (edge_count[1]), .B1 (n_0), .Y (n_10));
  XOR2XLHVT g1236__8246(.A (bit_count[0]), .B (bit_count[1]), .Y (n_9));
  NAND2XLHVT g1237__7098(.A (Prescale[1]), .B (n_2), .Y (n_7));
  NOR2XLHVT g1238__6131(.A (Prescale[0]), .B (Prescale[1]), .Y (n_8));
  NOR2XLHVT g1239__1881(.A (n_2), .B (n_0), .Y (n_6));
  NAND2X1HVT g1240__5115(.A (bit_count[1]), .B (bit_count[0]), .Y
       (n_5));
  INVXLHVT g1241(.A (bit_count[3]), .Y (n_4));
  INVXLHVT g1242(.A (bit_count[2]), .Y (n_3));
  INVX1HVT g1243(.A (edge_count[1]), .Y (n_2));
  INVXLHVT g1244(.A (Prescale[4]), .Y (n_1));
  INVX1HVT g1245(.A (edge_count[0]), .Y (n_0));
endmodule

module par_chk_DATA_WIDTH8(CLK, RST, parity_type, sampled_bit, Enable,
     P_DATA, par_err);
  input CLK, RST, parity_type, sampled_bit, Enable;
  input [7:0] P_DATA;
  output par_err;
  wire CLK, RST, parity_type, sampled_bit, Enable;
  wire [7:0] P_DATA;
  wire par_err;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8;
  SDFFRHQX1HVT par_err_reg(.RN (RST), .CK (CLK), .D (par_err), .SI
       (n_8), .SE (Enable), .Q (par_err));
  XOR2XLHVT g183__7482(.A (n_5), .B (n_7), .Y (n_8));
  XNOR2X1HVT g184__4733(.A (n_0), .B (n_6), .Y (n_7));
  XNOR2X1HVT g185__6161(.A (n_4), .B (n_3), .Y (n_6));
  XNOR2X1HVT g186__9315(.A (n_1), .B (n_2), .Y (n_5));
  XNOR2X1HVT g187__9945(.A (P_DATA[7]), .B (P_DATA[0]), .Y (n_4));
  XNOR2X1HVT g188__2883(.A (P_DATA[4]), .B (P_DATA[2]), .Y (n_3));
  XNOR2X1HVT g189__2346(.A (P_DATA[6]), .B (P_DATA[1]), .Y (n_2));
  XNOR2X1HVT g190__1666(.A (parity_type), .B (sampled_bit), .Y (n_1));
  XNOR2X1HVT g191__7410(.A (P_DATA[5]), .B (P_DATA[3]), .Y (n_0));
endmodule

module stp_chk(CLK, RST, sampled_bit, Enable, stp_err);
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire CLK, RST, sampled_bit, Enable;
  wire stp_err;
  wire n_0;
  SDFFRHQX1HVT stp_err_reg(.RN (RST), .CK (CLK), .D (stp_err), .SI
       (n_0), .SE (Enable), .Q (stp_err));
  INVXLHVT g9(.A (sampled_bit), .Y (n_0));
endmodule

module strt_chk(CLK, RST, sampled_bit, Enable, strt_glitch);
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire CLK, RST, sampled_bit, Enable;
  wire strt_glitch;
  SDFFRHQX1HVT strt_glitch_reg(.RN (RST), .CK (CLK), .D (strt_glitch),
       .SI (sampled_bit), .SE (Enable), .Q (strt_glitch));
endmodule

module uart_rx_fsm_DATA_WIDTH8(CLK, RST, S_DATA, Prescale,
     parity_enable, bit_count, edge_count, par_err, stp_err,
     strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
     stp_chk_en, dat_samp_en, data_valid);
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  input [5:0] Prescale, edge_count;
  input [3:0] bit_count;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
       dat_samp_en, data_valid;
  wire CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  wire [5:0] Prescale, edge_count;
  wire [3:0] bit_count;
  wire strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
       dat_samp_en, data_valid;
  wire [2:0] current_state;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_51, n_52, n_53, n_54, n_55;
  wire n_56, n_59, n_60, n_61, n_62, n_63, n_64;
  INVXLHVT g1109(.A (n_61), .Y (stp_chk_en));
  INVXLHVT g1110(.A (n_60), .Y (deser_en));
  NAND2XLHVT g1190__6417(.A (n_64), .B (n_63), .Y (strt_chk_en));
  NOR3XLHVT g1191__5477(.A (par_err), .B (stp_err), .C (n_59), .Y
       (data_valid));
  NAND3BXLHVT g1192__2398(.AN (current_state[1]), .B (n_64), .C (n_55),
       .Y (dat_samp_en));
  NAND3BXLHVT g1193__5107(.AN (n_56), .B (n_64), .C (n_62), .Y
       (edge_bit_en));
  NOR2XLHVT g1194__6260(.A (current_state[2]), .B (n_62), .Y
       (par_chk_en));
  NAND2BX1HVT g1195__4319(.AN (n_62), .B (current_state[2]), .Y (n_61));
  NAND2X1HVT g1197__8428(.A (current_state[1]), .B (n_56), .Y (n_60));
  NAND3X1HVT g1198__5526(.A (current_state[2]), .B (current_state[0]),
       .C (current_state[1]), .Y (n_59));
  OR4X1HVT g1199__6783(.A (S_DATA), .B (current_state[0]), .C
       (current_state[2]), .D (current_state[1]), .Y (n_64));
  NAND2BX1HVT g1200__3680(.AN (current_state[0]), .B
       (current_state[1]), .Y (n_62));
  INVXLHVT g1201(.A (n_56), .Y (n_55));
  NOR2BX1HVT g1202__1617(.AN (current_state[0]), .B (current_state[2]),
       .Y (n_56));
  NAND2BX1HVT g2__2802(.AN (current_state[1]), .B (n_56), .Y (n_63));
  DFFRHQX1HVT \current_state_reg[0] (.RN (RST), .CK (CLK), .D (n_54),
       .Q (current_state[0]));
  DFFRHQX1HVT \current_state_reg[2] (.RN (RST), .CK (CLK), .D (n_53),
       .Q (current_state[2]));
  DFFRHQX1HVT \current_state_reg[1] (.RN (RST), .CK (CLK), .D (n_52),
       .Q (current_state[1]));
  OAI221X1HVT g1944__1705(.A0 (n_51), .A1 (n_63), .B0 (n_47), .B1
       (n_60), .C0 (n_44), .Y (n_54));
  OAI32X1HVT g1945__5122(.A0 (parity_enable), .A1 (n_48), .A2 (n_60),
       .B0 (n_50), .B1 (n_62), .Y (n_53));
  OAI211X1HVT g1946__8246(.A0 (n_49), .A1 (n_6), .B0 (n_62), .C0
       (n_60), .Y (n_52));
  NOR2BX1HVT g1947__7098(.AN (strt_glitch), .B (n_49), .Y (n_51));
  OA21X1HVT g1948__6131(.A0 (n_46), .A1 (n_13), .B0 (n_61), .Y (n_50));
  OR4X1HVT g1949__1881(.A (n_46), .B (bit_count[1]), .C (bit_count[3]),
       .D (n_8), .Y (n_49));
  INVXLHVT g1950(.A (n_47), .Y (n_48));
  NOR3X1HVT g1951__5115(.A (n_46), .B (n_5), .C (n_8), .Y (n_47));
  OAI211X1HVT g1952__7482(.A0 (n_23), .A1 (edge_count[2]), .B0 (n_26),
       .C0 (n_45), .Y (n_46));
  NOR4X1HVT g1953__4733(.A (n_11), .B (n_32), .C (n_38), .D (n_41), .Y
       (n_45));
  INVXLHVT g1954(.A (n_43), .Y (n_44));
  OAI211X1HVT g1955__6161(.A0 (S_DATA), .A1 (n_59), .B0 (n_64), .C0
       (n_42), .Y (n_43));
  OAI211X1HVT g1956__9315(.A0 (parity_enable), .A1 (n_12), .B0 (n_37),
       .C0 (n_40), .Y (n_42));
  NAND2XLHVT g1957__9945(.A (n_34), .B (n_39), .Y (n_41));
  NOR4X1HVT g1958__2883(.A (n_17), .B (n_16), .C (n_33), .D (n_36), .Y
       (n_40));
  AOI22XLHVT g1959__2346(.A0 (n_29), .A1 (edge_count[5]), .B0 (n_35),
       .B1 (edge_count[4]), .Y (n_39));
  OAI22XLHVT g1960__1666(.A0 (n_29), .A1 (edge_count[5]), .B0 (n_35),
       .B1 (edge_count[4]), .Y (n_38));
  AOI211XLHVT g1961__7410(.A0 (n_27), .A1 (edge_count[5]), .B0 (n_31),
       .C0 (n_61), .Y (n_37));
  XNOR2X1HVT g1962__6417(.A (n_30), .B (edge_count[4]), .Y (n_36));
  AOI22XLHVT g1963__5477(.A0 (n_25), .A1 (edge_count[3]), .B0 (n_15),
       .B1 (edge_count[1]), .Y (n_34));
  AOI21XLHVT g1964__2398(.A0 (Prescale[4]), .A1 (n_24), .B0 (n_0), .Y
       (n_35));
  OAI221X1HVT g1965__5107(.A0 (n_22), .A1 (edge_count[3]), .B0 (n_14),
       .B1 (edge_count[2]), .C0 (n_28), .Y (n_33));
  OAI22XLHVT g1966__6260(.A0 (n_25), .A1 (edge_count[3]), .B0 (n_15),
       .B1 (edge_count[1]), .Y (n_32));
  NOR2XLHVT g1967__4319(.A (n_27), .B (edge_count[5]), .Y (n_31));
  AOI21XLHVT g1968__8428(.A0 (Prescale[4]), .A1 (n_19), .B0 (n_21), .Y
       (n_30));
  AOI22XLHVT g1969__5526(.A0 (n_22), .A1 (edge_count[3]), .B0 (n_14),
       .B1 (edge_count[2]), .Y (n_28));
  XNOR2X1HVT g1970__6783(.A (Prescale[5]), .B (n_0), .Y (n_29));
  XNOR2X1HVT g1971__3680(.A (Prescale[5]), .B (n_21), .Y (n_27));
  NAND2XLHVT g1972__1617(.A (n_23), .B (edge_count[2]), .Y (n_26));
  OA21X1HVT g1973__2802(.A0 (n_2), .A1 (n_20), .B0 (n_24), .Y (n_25));
  NAND2XLHVT g1975__1705(.A (n_2), .B (n_20), .Y (n_24));
  AOI21XLHVT g1976__5122(.A0 (Prescale[2]), .A1 (n_10), .B0 (n_20), .Y
       (n_23));
  OA21X1HVT g1977__8246(.A0 (n_2), .A1 (n_4), .B0 (n_19), .Y (n_22));
  NOR3XLHVT g1978__7098(.A (Prescale[4]), .B (Prescale[3]), .C (n_18),
       .Y (n_21));
  NOR2XLHVT g1980__6131(.A (Prescale[0]), .B (n_18), .Y (n_20));
  NAND2XLHVT g1981__1881(.A (n_2), .B (n_4), .Y (n_19));
  INVXLHVT g1982(.A (n_4), .Y (n_18));
  AOI31X1HVT g1983__5115(.A0 (bit_count[3]), .A1 (bit_count[1]), .A2
       (n_7), .B0 (n_1), .Y (n_17));
  OAI211X1HVT g1984__7482(.A0 (Prescale[1]), .A1 (edge_count[1]), .B0
       (n_3), .C0 (n_11), .Y (n_16));
  AOI21XLHVT g1985__4733(.A0 (Prescale[0]), .A1 (Prescale[1]), .B0
       (n_9), .Y (n_15));
  AOI21XLHVT g1986__6161(.A0 (Prescale[1]), .A1 (Prescale[2]), .B0
       (n_4), .Y (n_14));
  INVXLHVT g1987(.A (n_12), .Y (n_13));
  NOR3BX1HVT g1988__9315(.AN (bit_count[0]), .B (bit_count[2]), .C
       (n_5), .Y (n_12));
  XNOR2X1HVT g1989__9945(.A (Prescale[0]), .B (edge_count[0]), .Y
       (n_11));
  INVXLHVT g1990(.A (n_9), .Y (n_10));
  INVXLHVT g1991(.A (n_7), .Y (n_8));
  OR2XLHVT g1992__2883(.A (strt_glitch), .B (n_63), .Y (n_6));
  NOR2XLHVT g1993__2346(.A (Prescale[0]), .B (Prescale[1]), .Y (n_9));
  NOR2X1HVT g1994__1666(.A (bit_count[2]), .B (bit_count[0]), .Y (n_7));
  NAND2XLHVT g1995__7410(.A (Prescale[1]), .B (edge_count[1]), .Y
       (n_3));
  NAND2BX1HVT g1996__6417(.AN (bit_count[1]), .B (bit_count[3]), .Y
       (n_5));
  NOR2XLHVT g1997__5477(.A (Prescale[1]), .B (Prescale[2]), .Y (n_4));
  INVX1HVT g1998(.A (Prescale[3]), .Y (n_2));
  INVXLHVT g1999(.A (parity_enable), .Y (n_1));
  NOR3BXLHVT g1204__2398(.AN (n_20), .B (Prescale[4]), .C
       (Prescale[3]), .Y (n_0));
endmodule

module UART_RX(CLK, RST, RX_IN, parity_enable, parity_type, Prescale,
     P_DATA, data_valid, parity_error, framing_error);
  input CLK, RST, RX_IN, parity_enable, parity_type;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  output data_valid, parity_error, framing_error;
  wire CLK, RST, RX_IN, parity_enable, parity_type;
  wire [5:0] Prescale;
  wire [7:0] P_DATA;
  wire data_valid, parity_error, framing_error;
  wire [5:0] edge_count;
  wire [3:0] bit_count;
  wire UNCONNECTED_HIER_Z, dat_samp_en, deser_en, edge_bit_en,
       par_chk_en, sampled_bit, stp_chk_en, strt_chk_en;
  wire strt_glitch;
  data_sampling U0_data_sampling(.CLK (CLK), .RST (RST), .S_DATA
       (RX_IN), .Prescale ({Prescale[5:1], UNCONNECTED_HIER_Z}),
       .edge_count (edge_count), .Enable (dat_samp_en), .sampled_bit
       (sampled_bit));
  deserializer_DATA_WIDTH8 U0_deserializer(.CLK (CLK), .RST (RST),
       .sampled_bit (sampled_bit), .Enable (deser_en), .edge_count
       (edge_count), .Prescale (Prescale), .P_DATA (P_DATA));
  edge_bit_counter U0_edge_bit_counter(.CLK (CLK), .RST (RST), .Enable
       (edge_bit_en), .Prescale (Prescale), .bit_count (bit_count),
       .edge_count (edge_count));
  par_chk_DATA_WIDTH8 U0_par_chk(.CLK (CLK), .RST (RST), .parity_type
       (parity_type), .sampled_bit (sampled_bit), .Enable (par_chk_en),
       .P_DATA (P_DATA), .par_err (parity_error));
  stp_chk U0_stp_chk(.CLK (CLK), .RST (RST), .sampled_bit
       (sampled_bit), .Enable (stp_chk_en), .stp_err (framing_error));
  strt_chk U0_strt_chk(.CLK (CLK), .RST (RST), .sampled_bit
       (sampled_bit), .Enable (strt_chk_en), .strt_glitch
       (strt_glitch));
  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm(.CLK (CLK), .RST (RST), .S_DATA
       (RX_IN), .Prescale (Prescale), .parity_enable (parity_enable),
       .bit_count (bit_count), .edge_count (edge_count), .par_err
       (parity_error), .stp_err (framing_error), .strt_glitch
       (strt_glitch), .strt_chk_en (strt_chk_en), .edge_bit_en
       (edge_bit_en), .deser_en (deser_en), .par_chk_en (par_chk_en),
       .stp_chk_en (stp_chk_en), .dat_samp_en (dat_samp_en),
       .data_valid (data_valid));
endmodule

