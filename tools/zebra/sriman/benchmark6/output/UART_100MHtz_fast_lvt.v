
// Generated by Cadence Genus(TM) Synthesis Solution 20.10-p001_1
// Generated on: Nov 26 2024 05:07:56 IST (Nov 25 2024 23:37:56 UTC)

// Verification Directory fv/UART 

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
  wire n_40, n_41, n_42, n_43, n_44;
  DFFRHQX1LVT sampled_bit_reg(.RN (RST), .CK (CLK), .D (n_44), .Q
       (sampled_bit));
  NOR2BX1LVT g919__2398(.AN (Enable), .B (n_43), .Y (n_44));
  AOI22XLLVT g920__5107(.A0 (Samples[2]), .A1 (n_42), .B0 (Samples[0]),
       .B1 (Samples[1]), .Y (n_43));
  OR2XLLVT g921__6260(.A (Samples[0]), .B (Samples[1]), .Y (n_42));
  DFFRHQX1LVT \Samples_reg[1] (.RN (RST), .CK (CLK), .D (n_41), .Q
       (Samples[1]));
  DFFRHQX1LVT \Samples_reg[2] (.RN (RST), .CK (CLK), .D (n_39), .Q
       (Samples[2]));
  OAI2BB1X1LVT g1599__4319(.A0N (S_DATA), .A1N (n_37), .B0 (n_40), .Y
       (n_41));
  NAND3BXLLVT g1600__8428(.AN (n_37), .B (Enable), .C (Samples[1]), .Y
       (n_40));
  OAI2BB1X1LVT g1601__5526(.A0N (S_DATA), .A1N (n_34), .B0 (n_38), .Y
       (n_39));
  DFFRHQX1LVT \Samples_reg[0] (.RN (RST), .CK (CLK), .D (n_36), .Q
       (Samples[0]));
  NAND3BXLLVT g1603__6783(.AN (n_34), .B (Enable), .C (Samples[2]), .Y
       (n_38));
  NOR4X1LVT g1604__3680(.A (n_20), .B (n_25), .C (n_32), .D
       (edge_count[5]), .Y (n_37));
  INVXLLVT g1605(.A (n_35), .Y (n_36));
  AOI32X1LVT g1606__1617(.A0 (S_DATA), .A1 (Enable), .A2 (n_31), .B0
       (n_33), .B1 (Samples[0]), .Y (n_35));
  NOR4X1LVT g1607__2802(.A (n_4), .B (n_14), .C (n_32), .D
       (edge_count[5]), .Y (n_34));
  INVXLLVT g1608(.A (n_32), .Y (n_33));
  NAND2BX1LVT g1609__1705(.AN (n_31), .B (Enable), .Y (n_32));
  NOR4X1LVT g1610__5122(.A (n_4), .B (n_5), .C (n_30), .D
       (edge_count[5]), .Y (n_31));
  OAI211X1LVT g1611__8246(.A0 (n_20), .A1 (n_23), .B0 (n_27), .C0
       (n_29), .Y (n_30));
  NOR2X1LVT g1612__7098(.A (n_24), .B (n_28), .Y (n_29));
  XNOR2X1LVT g1613__6131(.A (n_26), .B (edge_count[3]), .Y (n_28));
  NAND2XLLVT g1614__1881(.A (n_20), .B (n_23), .Y (n_27));
  OA21X1LVT g1615__5115(.A0 (n_12), .A1 (n_19), .B0 (n_23), .Y (n_26));
  OAI211X1LVT g1616__7482(.A0 (n_15), .A1 (edge_count[2]), .B0 (n_18),
       .C0 (n_22), .Y (n_25));
  XNOR2X1LVT g1617__4733(.A (n_21), .B (edge_count[2]), .Y (n_24));
  NAND2XLLVT g1618__6161(.A (n_12), .B (n_19), .Y (n_23));
  AOI211XLLVT g1619__9315(.A0 (n_12), .A1 (edge_count[3]), .B0 (n_16),
       .C0 (n_17), .Y (n_22));
  AOI2BB1XLLVT g1620__9945(.A0N (n_15), .A1N (n_13), .B0 (n_19), .Y
       (n_21));
  XNOR2X1LVT g1621__2883(.A (n_6), .B (n_10), .Y (n_20));
  NAND2XLLVT g1622__2346(.A (n_15), .B (edge_count[2]), .Y (n_18));
  AND2X1LVT g1623__1666(.A (n_13), .B (n_15), .Y (n_19));
  NOR2XLLVT g1624__7410(.A (n_12), .B (edge_count[3]), .Y (n_17));
  OAI211X1LVT g1625__6417(.A0 (n_7), .A1 (edge_count[1]), .B0 (n_4),
       .C0 (n_11), .Y (n_16));
  AOI21XLLVT g1626__5477(.A0 (Prescale[3]), .A1 (n_1), .B0 (n_8), .Y
       (n_15));
  NAND4XLLVT g1627__2398(.A (n_3), .B (n_2), .C (n_5), .D (n_6), .Y
       (n_14));
  AND2X1LVT g1628__5107(.A (n_7), .B (Prescale[1]), .Y (n_13));
  NAND2XLLVT g1629__6260(.A (n_7), .B (edge_count[1]), .Y (n_11));
  AOI21XLLVT g1630__4319(.A0 (Prescale[4]), .A1 (n_9), .B0 (n_10), .Y
       (n_12));
  NOR2XLLVT g1631__8428(.A (Prescale[4]), .B (n_9), .Y (n_10));
  INVXLLVT g1632(.A (n_8), .Y (n_9));
  NOR3XLLVT g1633__5526(.A (Prescale[2]), .B (Prescale[3]), .C
       (Prescale[1]), .Y (n_8));
  AOI21XLLVT g1634__6783(.A0 (Prescale[1]), .A1 (Prescale[2]), .B0
       (n_0), .Y (n_7));
  XNOR2X1LVT g1635__3680(.A (Prescale[5]), .B (edge_count[4]), .Y
       (n_6));
  XNOR2X1LVT g1636__1617(.A (Prescale[4]), .B (edge_count[3]), .Y
       (n_3));
  XNOR2X1LVT g1637__2802(.A (Prescale[3]), .B (edge_count[2]), .Y
       (n_2));
  XNOR2X1LVT g1638__1705(.A (Prescale[2]), .B (edge_count[1]), .Y
       (n_5));
  CLKXOR2X1LVT g1639__5122(.A (Prescale[1]), .B (edge_count[0]), .Y
       (n_4));
  INVXLLVT g1640(.A (n_0), .Y (n_1));
  NOR2XLLVT g1641__8246(.A (Prescale[1]), .B (Prescale[2]), .Y (n_0));
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
  wire n_16, n_17, n_18, n_19;
  SDFFRHQX1LVT \P_DATA_reg[0] (.RN (RST), .CK (CLK), .D (P_DATA[1]),
       .SI (P_DATA[0]), .SE (n_19), .Q (P_DATA[0]));
  SDFFRHQX1LVT \P_DATA_reg[1] (.RN (RST), .CK (CLK), .D (P_DATA[2]),
       .SI (P_DATA[1]), .SE (n_19), .Q (P_DATA[1]));
  SDFFRHQX1LVT \P_DATA_reg[2] (.RN (RST), .CK (CLK), .D (P_DATA[3]),
       .SI (P_DATA[2]), .SE (n_19), .Q (P_DATA[2]));
  SDFFRHQX1LVT \P_DATA_reg[3] (.RN (RST), .CK (CLK), .D (P_DATA[4]),
       .SI (P_DATA[3]), .SE (n_19), .Q (P_DATA[3]));
  SDFFRHQX1LVT \P_DATA_reg[6] (.RN (RST), .CK (CLK), .D (P_DATA[7]),
       .SI (P_DATA[6]), .SE (n_19), .Q (P_DATA[6]));
  SDFFRHQX1LVT \P_DATA_reg[5] (.RN (RST), .CK (CLK), .D (P_DATA[6]),
       .SI (P_DATA[5]), .SE (n_19), .Q (P_DATA[5]));
  SDFFRHQX1LVT \P_DATA_reg[4] (.RN (RST), .CK (CLK), .D (P_DATA[5]),
       .SI (P_DATA[4]), .SE (n_19), .Q (P_DATA[4]));
  SDFFRHQX1LVT \P_DATA_reg[7] (.RN (RST), .CK (CLK), .D (sampled_bit),
       .SI (P_DATA[7]), .SE (n_19), .Q (P_DATA[7]));
  NAND4XLLVT g619__7098(.A (n_12), .B (n_16), .C (n_18), .D (Enable),
       .Y (n_19));
  AOI211XLLVT g620__6131(.A0 (n_9), .A1 (edge_count[5]), .B0 (n_13),
       .C0 (n_17), .Y (n_18));
  OAI211X1LVT g621__1881(.A0 (n_3), .A1 (edge_count[1]), .B0 (n_8), .C0
       (n_15), .Y (n_17));
  XNOR2X1LVT g622__5115(.A (n_14), .B (edge_count[4]), .Y (n_16));
  AOI221X1LVT g623__7482(.A0 (n_10), .A1 (edge_count[2]), .B0
       (Prescale[0]), .B1 (edge_count[0]), .C0 (n_11), .Y (n_15));
  OAI2BB1X1LVT g624__4733(.A0N (Prescale[4]), .A1N (n_6), .B0 (n_5), .Y
       (n_14));
  OAI22XLLVT g625__6161(.A0 (n_9), .A1 (edge_count[5]), .B0
       (Prescale[0]), .B1 (edge_count[0]), .Y (n_13));
  XOR2XLLVT g626__9315(.A (n_7), .B (edge_count[3]), .Y (n_12));
  NOR2XLLVT g627__9945(.A (n_10), .B (edge_count[2]), .Y (n_11));
  AOI21XLLVT g628__2883(.A0 (Prescale[2]), .A1 (n_2), .B0 (n_4), .Y
       (n_10));
  CLKXOR2X1LVT g629__2346(.A (Prescale[5]), .B (n_5), .Y (n_9));
  NAND2XLLVT g630__1666(.A (n_3), .B (edge_count[1]), .Y (n_8));
  XNOR2X1LVT g631__7410(.A (Prescale[3]), .B (n_4), .Y (n_7));
  NAND2BXLLVT g632__6417(.AN (Prescale[3]), .B (n_4), .Y (n_6));
  NAND2XLLVT g633__5477(.A (n_0), .B (n_4), .Y (n_5));
  NOR3XLLVT g634__2398(.A (Prescale[1]), .B (Prescale[2]), .C
       (Prescale[0]), .Y (n_4));
  AOI21XLLVT g635__5107(.A0 (Prescale[0]), .A1 (Prescale[1]), .B0
       (n_1), .Y (n_3));
  INVXLLVT g636(.A (n_1), .Y (n_2));
  NOR2XLLVT g637__6260(.A (Prescale[0]), .B (Prescale[1]), .Y (n_1));
  NOR2XLLVT g638__4319(.A (Prescale[3]), .B (Prescale[4]), .Y (n_0));
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
  wire n_48, n_49, n_50, n_51, n_52;
  DFFRHQX1LVT \bit_count_reg[3] (.RN (RST), .CK (CLK), .D (n_52), .Q
       (bit_count[3]));
  OAI21X1LVT g1297__8428(.A0 (n_39), .A1 (n_21), .B0 (n_49), .Y (n_52));
  OAI31X1LVT g1298__5526(.A0 (n_39), .A1 (bit_count[2]), .A2 (n_6), .B0
       (n_50), .Y (n_51));
  NAND2X1LVT g1301__6783(.A (n_48), .B (bit_count[2]), .Y (n_50));
  NAND2X1LVT g1302__3680(.A (n_48), .B (bit_count[3]), .Y (n_49));
  SDFFRHQX1LVT \bit_count_reg[0] (.RN (RST), .CK (CLK), .D (n_38), .SI
       (n_36), .SE (bit_count[0]), .Q (bit_count[0]));
  DFFRHQX1LVT \edge_count_reg[4] (.RN (RST), .CK (CLK), .D (n_42), .Q
       (edge_count[4]));
  DFFRHQX1LVT \edge_count_reg[2] (.RN (RST), .CK (CLK), .D (n_43), .Q
       (edge_count[2]));
  DFFRHQX1LVT \edge_count_reg[3] (.RN (RST), .CK (CLK), .D (n_44), .Q
       (edge_count[3]));
  AND2XLLVT g1308__1617(.A (n_36), .B (n_40), .Y (n_47));
  OAI22X1LVT g1309__2802(.A0 (n_39), .A1 (n_9), .B0 (n_37), .B1 (n_1),
       .Y (n_46));
  OAI2BB1X1LVT g1310__1705(.A0N (n_38), .A1N (n_6), .B0 (n_37), .Y
       (n_48));
  NOR2X1LVT g1312__5122(.A (n_37), .B (edge_count[0]), .Y (n_45));
  NOR2X1LVT g1313__8246(.A (n_37), .B (n_29), .Y (n_44));
  NOR2X1LVT g1314__7098(.A (n_37), .B (n_20), .Y (n_43));
  NOR2X1LVT g1315__6131(.A (n_37), .B (n_33), .Y (n_42));
  NOR2X1LVT g1316__1881(.A (n_37), .B (n_11), .Y (n_41));
  XNOR2X1LVT g1317__5115(.A (edge_count[5]), .B (n_32), .Y (n_40));
  INVX1LVT g1318(.A (n_39), .Y (n_38));
  NAND2X1LVT g1319__7482(.A (Enable), .B (n_35), .Y (n_39));
  INVX1LVT g1320(.A (n_37), .Y (n_36));
  NAND2BX1LVT g1321__4733(.AN (n_35), .B (Enable), .Y (n_37));
  AOI221X1LVT g1322__6161(.A0 (n_23), .A1 (edge_count[3]), .B0 (n_14),
       .B1 (edge_count[2]), .C0 (n_34), .Y (n_35));
  OAI221X1LVT g1323__9315(.A0 (n_26), .A1 (n_2), .B0 (n_23), .B1
       (edge_count[3]), .C0 (n_31), .Y (n_34));
  XNOR2X1LVT g1324__9945(.A (edge_count[4]), .B (n_28), .Y (n_33));
  NAND2X1LVT g1325__2883(.A (edge_count[4]), .B (n_28), .Y (n_32));
  AOI221X1LVT g1326__2346(.A0 (n_26), .A1 (n_2), .B0 (n_8), .B1 (n_0),
       .C0 (n_30), .Y (n_31));
  OAI211X1LVT g1327__1666(.A0 (n_17), .A1 (edge_count[4]), .B0 (n_27),
       .C0 (n_24), .Y (n_30));
  XNOR2X1LVT g1328__7410(.A (edge_count[3]), .B (n_19), .Y (n_29));
  AND2X1LVT g1329__6417(.A (n_19), .B (edge_count[3]), .Y (n_28));
  INVXLLVT g1330(.A (n_25), .Y (n_27));
  OAI221X1LVT g1331__5477(.A0 (n_14), .A1 (edge_count[2]), .B0
       (Prescale[0]), .B1 (n_18), .C0 (n_22), .Y (n_25));
  XNOR2X1LVT g1332__2398(.A (Prescale[5]), .B (n_15), .Y (n_26));
  NAND2XLLVT g1333__5107(.A (n_17), .B (edge_count[4]), .Y (n_24));
  AOI21XLLVT g1334__6260(.A0 (Prescale[3]), .A1 (n_12), .B0 (n_13), .Y
       (n_23));
  OAI21X1LVT g1335__4319(.A0 (n_10), .A1 (edge_count[0]), .B0
       (Prescale[0]), .Y (n_22));
  AOI21XLLVT g1336__8428(.A0 (bit_count[3]), .A1 (n_5), .B0 (n_16), .Y
       (n_21));
  XNOR2X1LVT g1337__5526(.A (edge_count[2]), .B (n_7), .Y (n_20));
  AOI21X1LVT g1338__6783(.A0 (Prescale[1]), .A1 (edge_count[1]), .B0
       (n_4), .Y (n_18));
  AND2XLLVT g1339__3680(.A (edge_count[2]), .B (n_7), .Y (n_19));
  NOR3X1LVT g1340__1617(.A (bit_count[3]), .B (n_5), .C (n_6), .Y
       (n_16));
  OA21X1LVT g1341__2802(.A0 (n_3), .A1 (n_13), .B0 (n_15), .Y (n_17));
  NAND2XLLVT g1342__1705(.A (n_3), .B (n_13), .Y (n_15));
  XNOR2X1LVT g1343__5122(.A (Prescale[2]), .B (n_8), .Y (n_14));
  NAND2BXLLVT g1344__8246(.AN (Prescale[2]), .B (n_8), .Y (n_12));
  NOR3BXLLVT g1345__7098(.AN (n_8), .B (Prescale[2]), .C (Prescale[3]),
       .Y (n_13));
  AOI22XLLVT g1346__6131(.A0 (edge_count[0]), .A1 (n_0), .B0
       (edge_count[1]), .B1 (n_4), .Y (n_11));
  MXI2XLLVT g1347__1881(.A (n_0), .B (edge_count[1]), .S0
       (Prescale[1]), .Y (n_10));
  MXI2XLLVT g1348__5115(.A (bit_count[1]), .B (n_1), .S0
       (bit_count[0]), .Y (n_9));
  NOR2XLLVT g1349__7482(.A (Prescale[0]), .B (Prescale[1]), .Y (n_8));
  NOR2X1LVT g1350__4733(.A (n_4), .B (n_0), .Y (n_7));
  NAND2X1LVT g1351__6161(.A (bit_count[1]), .B (bit_count[0]), .Y
       (n_6));
  INVXLLVT g1354(.A (Prescale[4]), .Y (n_3));
  DFFRX1LVT \bit_count_reg[2] (.RN (RST), .CK (CLK), .D (n_51), .Q
       (bit_count[2]), .QN (n_5));
  DFFRX1LVT \edge_count_reg[0] (.RN (RST), .CK (CLK), .D (n_45), .Q
       (edge_count[0]), .QN (n_4));
  DFFRX1LVT \edge_count_reg[5] (.RN (RST), .CK (CLK), .D (n_47), .Q
       (edge_count[5]), .QN (n_2));
  DFFRX1LVT \bit_count_reg[1] (.RN (RST), .CK (CLK), .D (n_46), .Q
       (bit_count[1]), .QN (n_1));
  DFFRX1LVT \edge_count_reg[1] (.RN (RST), .CK (CLK), .D (n_41), .Q
       (edge_count[1]), .QN (n_0));
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
  SDFFRHQX1LVT par_err_reg(.RN (RST), .CK (CLK), .D (par_err), .SI
       (n_8), .SE (Enable), .Q (par_err));
  XOR2XLLVT g163__9315(.A (n_5), .B (n_7), .Y (n_8));
  XNOR2X1LVT g164__9945(.A (n_0), .B (n_6), .Y (n_7));
  XNOR2X1LVT g165__2883(.A (n_4), .B (n_3), .Y (n_6));
  XNOR2X1LVT g166__2346(.A (n_1), .B (n_2), .Y (n_5));
  XNOR2X1LVT g167__1666(.A (P_DATA[7]), .B (P_DATA[0]), .Y (n_4));
  XNOR2X1LVT g168__7410(.A (P_DATA[4]), .B (P_DATA[2]), .Y (n_3));
  XNOR2X1LVT g169__6417(.A (P_DATA[6]), .B (P_DATA[1]), .Y (n_2));
  XNOR2X1LVT g170__5477(.A (parity_type), .B (sampled_bit), .Y (n_1));
  XNOR2X1LVT g171__2398(.A (P_DATA[5]), .B (P_DATA[3]), .Y (n_0));
endmodule

module stp_chk(CLK, RST, sampled_bit, Enable, stp_err);
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire CLK, RST, sampled_bit, Enable;
  wire stp_err;
  wire n_0;
  SDFFRHQX1LVT stp_err_reg(.RN (RST), .CK (CLK), .D (stp_err), .SI
       (n_0), .SE (Enable), .Q (stp_err));
  INVXLLVT g9(.A (sampled_bit), .Y (n_0));
endmodule

module strt_chk(CLK, RST, sampled_bit, Enable, strt_glitch);
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire CLK, RST, sampled_bit, Enable;
  wire strt_glitch;
  SDFFRHQX1LVT strt_glitch_reg(.RN (RST), .CK (CLK), .D (strt_glitch),
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
  wire n_57, n_61, n_62, n_63, n_68, n_91, n_92, n_93;
  INVX1LVT g2040(.A (n_91), .Y (stp_chk_en));
  INVXLLVT g2038(.A (n_93), .Y (deser_en));
  INVX1LVT g2039(.A (n_92), .Y (par_chk_en));
  NAND3BXLLVT g2149__5107(.AN (current_state[1]), .B (n_68), .C (n_63),
       .Y (dat_samp_en));
  OAI211X1LVT g2150__6260(.A0 (current_state[0]), .A1 (n_7), .B0
       (n_68), .C0 (n_63), .Y (edge_bit_en));
  NAND2X1LVT g2151__4319(.A (n_68), .B (n_61), .Y (strt_chk_en));
  NOR3XLLVT g2152__8428(.A (par_err), .B (stp_err), .C (n_62), .Y
       (data_valid));
  NAND3BXLLVT g2153__5526(.AN (S_DATA), .B (n_7), .C (n_57), .Y (n_68));
  NAND2X1LVT g2154__6783(.A (current_state[1]), .B (n_57), .Y (n_92));
  OR2XLLVT g2155__3680(.A (current_state[1]), .B (n_63), .Y (n_61));
  OR2XLLVT g2156__1617(.A (n_7), .B (n_63), .Y (n_93));
  NAND3BXLLVT g2157__2802(.AN (current_state[0]), .B
       (current_state[1]), .C (current_state[2]), .Y (n_91));
  NAND3X1LVT g2158__1705(.A (current_state[0]), .B (current_state[1]),
       .C (current_state[2]), .Y (n_62));
  NAND2BX1LVT g2159__5122(.AN (current_state[2]), .B
       (current_state[0]), .Y (n_63));
  NOR2X1LVT g2160__8246(.A (current_state[2]), .B (current_state[0]),
       .Y (n_57));
  DFFRHQX1LVT \current_state_reg[0] (.RN (RST), .CK (CLK), .D (n_55),
       .Q (current_state[0]));
  OAI221X1LVT g3146__7098(.A0 (S_DATA), .A1 (n_62), .B0 (n_49), .B1
       (n_61), .C0 (n_53), .Y (n_55));
  OAI211X1LVT g3148__6131(.A0 (current_state[2]), .A1 (n_7), .B0
       (n_50), .C0 (n_91), .Y (n_54));
  INVXLLVT g3149(.A (n_52), .Y (n_53));
  OAI221X1LVT g3150__1881(.A0 (n_40), .A1 (bit_count[2]), .B0 (n_48),
       .B1 (n_93), .C0 (n_68), .Y (n_52));
  DFFRHQX1LVT \current_state_reg[2] (.RN (RST), .CK (CLK), .D (n_51),
       .Q (current_state[2]));
  OAI2BB1X1LVT g3152__5115(.A0N (n_14), .A1N (n_47), .B0 (n_91), .Y
       (n_51));
  NAND3BXLLVT g3153__7482(.AN (bit_count[2]), .B (n_45), .C (n_5), .Y
       (n_50));
  NOR4X1LVT g3154__4733(.A (n_44), .B (bit_count[0]), .C
       (bit_count[2]), .D (bit_count[3]), .Y (n_49));
  NOR2X1LVT g3155__6161(.A (n_46), .B (bit_count[0]), .Y (n_48));
  INVXLLVT g3156(.A (n_46), .Y (n_47));
  NAND3BXLLVT g3157__9315(.AN (bit_count[2]), .B (n_43), .C
       (bit_count[3]), .Y (n_46));
  NOR4BX1LVT g3158__9945(.AN (n_43), .B (bit_count[3]), .C
       (strt_glitch), .D (n_63), .Y (n_45));
  NAND2XLLVT g3159__2883(.A (n_43), .B (strt_glitch), .Y (n_44));
  AOI221X1LVT g3160__2346(.A0 (n_18), .A1 (n_6), .B0 (n_19), .B1
       (edge_count[2]), .C0 (n_42), .Y (n_43));
  OAI211X1LVT g3161__1666(.A0 (n_24), .A1 (edge_count[3]), .B0 (n_27),
       .C0 (n_41), .Y (n_42));
  AOI211XLLVT g3162__7410(.A0 (n_11), .A1 (edge_count[0]), .B0 (n_39),
       .C0 (bit_count[1]), .Y (n_41));
  OR4X1LVT g3163__6417(.A (n_29), .B (n_37), .C (n_3), .D (n_91), .Y
       (n_40));
  OAI211X1LVT g3164__5477(.A0 (n_1), .A1 (n_11), .B0 (n_34), .C0
       (n_38), .Y (n_39));
  AOI221X1LVT g3165__2398(.A0 (n_0), .A1 (edge_count[5]), .B0 (n_1),
       .B1 (n_2), .C0 (n_36), .Y (n_38));
  OAI211X1LVT g3166__5107(.A0 (n_30), .A1 (edge_count[5]), .B0 (n_33),
       .C0 (n_35), .Y (n_37));
  NOR2XLLVT g3167__6260(.A (n_0), .B (edge_count[5]), .Y (n_36));
  AOI221X1LVT g3168__4319(.A0 (n_25), .A1 (edge_count[4]), .B0
       (parity_enable), .B1 (bit_count[0]), .C0 (n_32), .Y (n_35));
  XNOR2X1LVT g3169__8428(.A (n_31), .B (edge_count[4]), .Y (n_34));
  NAND2XLLVT g3170__5526(.A (n_30), .B (edge_count[5]), .Y (n_33));
  OR4X1LVT g3171__6783(.A (n_8), .B (n_11), .C (n_23), .D (n_26), .Y
       (n_32));
  OAI2BB1X1LVT g3173__3680(.A0N (Prescale[4]), .A1N (n_21), .B0 (n_28),
       .Y (n_31));
  OAI22XLLVT g3174__1617(.A0 (n_25), .A1 (edge_count[4]), .B0
       (bit_count[0]), .B1 (bit_count[1]), .Y (n_29));
  XNOR2X1LVT g3175__2802(.A (Prescale[5]), .B (n_22), .Y (n_30));
  NAND2XLLVT g3177__1705(.A (n_1), .B (n_22), .Y (n_28));
  NAND2XLLVT g3178__5122(.A (n_24), .B (edge_count[3]), .Y (n_27));
  OAI221X1LVT g3179__8246(.A0 (n_17), .A1 (edge_count[3]), .B0 (n_13),
       .B1 (n_6), .C0 (n_10), .Y (n_26));
  AOI21XLLVT g3180__7098(.A0 (Prescale[4]), .A1 (n_15), .B0 (n_22), .Y
       (n_25));
  AO22XLLVT g3181__6131(.A0 (n_17), .A1 (edge_count[3]), .B0 (n_13),
       .B1 (n_6), .Y (n_23));
  AOI21XLLVT g3182__1881(.A0 (Prescale[3]), .A1 (n_16), .B0 (n_20), .Y
       (n_24));
  NOR2XLLVT g3183__5115(.A (Prescale[4]), .B (n_15), .Y (n_22));
  INVXLLVT g3184(.A (n_20), .Y (n_21));
  NOR2XLLVT g3185__7482(.A (Prescale[0]), .B (n_15), .Y (n_20));
  INVXLLVT g3186(.A (n_18), .Y (n_19));
  NAND2XLLVT g3187__4733(.A (n_12), .B (n_16), .Y (n_18));
  OA21X1LVT g3188__6161(.A0 (n_4), .A1 (n_9), .B0 (n_15), .Y (n_17));
  NAND2XLLVT g3189__9315(.A (n_1), .B (n_9), .Y (n_16));
  NAND2XLLVT g3190__9945(.A (n_4), .B (n_9), .Y (n_15));
  OAI32X1LVT g3191__2883(.A0 (parity_enable), .A1 (bit_count[0]), .A2
       (n_93), .B0 (n_5), .B1 (n_92), .Y (n_14));
  OAI21XLLVT g3192__2346(.A0 (Prescale[0]), .A1 (Prescale[1]), .B0
       (Prescale[2]), .Y (n_12));
  AO21X1LVT g3193__1666(.A0 (Prescale[1]), .A1 (Prescale[2]), .B0
       (n_9), .Y (n_13));
  AOI22X1LVT g3194__7410(.A0 (Prescale[0]), .A1 (n_2), .B0 (n_1), .B1
       (edge_count[0]), .Y (n_10));
  XNOR2X1LVT g3195__6417(.A (Prescale[1]), .B (edge_count[1]), .Y
       (n_11));
  NOR2XLLVT g3196__5477(.A (Prescale[1]), .B (Prescale[2]), .Y (n_9));
  NOR2BX1LVT g3197__2398(.AN (bit_count[1]), .B (parity_enable), .Y
       (n_8));
  INVX1LVT g3199(.A (edge_count[2]), .Y (n_6));
  INVX1LVT g3200(.A (bit_count[0]), .Y (n_5));
  INVXLLVT g3201(.A (Prescale[3]), .Y (n_4));
  INVXLLVT g3202(.A (bit_count[3]), .Y (n_3));
  INVX1LVT g3203(.A (edge_count[0]), .Y (n_2));
  INVX1LVT g3204(.A (Prescale[0]), .Y (n_1));
  XOR2XLLVT g2__5107(.A (Prescale[5]), .B (n_28), .Y (n_0));
  DFFRX1LVT \current_state_reg[1] (.RN (RST), .CK (CLK), .D (n_54), .Q
       (current_state[1]), .QN (n_7));
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

module Serializer_WIDTH8(CLK, RST, DATA, Enable, Busy, Data_Valid,
     ser_out, ser_done);
  input CLK, RST, Enable, Busy, Data_Valid;
  input [7:0] DATA;
  output ser_out, ser_done;
  wire CLK, RST, Enable, Busy, Data_Valid;
  wire [7:0] DATA;
  wire ser_out, ser_done;
  wire [2:0] ser_count;
  wire [7:0] DATA_V;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  AND3XLLVT g389__6260(.A (ser_count[0]), .B (ser_count[2]), .C
       (ser_count[1]), .Y (ser_done));
  DFFRHQX1LVT \ser_count_reg[2] (.RN (RST), .CK (CLK), .D (n_23), .Q
       (ser_count[2]));
  DFFRHQX1LVT \DATA_V_reg[1] (.RN (RST), .CK (CLK), .D (n_19), .Q
       (DATA_V[1]));
  DFFRHQX1LVT \DATA_V_reg[6] (.RN (RST), .CK (CLK), .D (n_20), .Q
       (DATA_V[6]));
  DFFRHQX1LVT \DATA_V_reg[0] (.RN (RST), .CK (CLK), .D (n_18), .Q
       (ser_out));
  DFFRHQX1LVT \DATA_V_reg[2] (.RN (RST), .CK (CLK), .D (n_22), .Q
       (DATA_V[2]));
  AND2XLLVT g647__4319(.A (n_12), .B (Enable), .Y (n_23));
  DFFRHQX1LVT \DATA_V_reg[4] (.RN (RST), .CK (CLK), .D (n_15), .Q
       (DATA_V[4]));
  DFFRHQX1LVT \DATA_V_reg[3] (.RN (RST), .CK (CLK), .D (n_21), .Q
       (DATA_V[3]));
  DFFRHQX1LVT \DATA_V_reg[5] (.RN (RST), .CK (CLK), .D (n_17), .Q
       (DATA_V[5]));
  OAI2BB1X1LVT g651__8428(.A0N (n_3), .A1N (DATA_V[2]), .B0 (n_9), .Y
       (n_22));
  OAI2BB1X1LVT g652__5526(.A0N (n_3), .A1N (DATA_V[3]), .B0 (n_7), .Y
       (n_21));
  OAI2BB1X1LVT g653__6783(.A0N (n_4), .A1N (DATA_V[7]), .B0 (n_11), .Y
       (n_20));
  DFFRHQX1LVT \DATA_V_reg[7] (.RN (RST), .CK (CLK), .D (n_10), .Q
       (DATA_V[7]));
  DFFRHQX1LVT \ser_count_reg[1] (.RN (RST), .CK (CLK), .D (n_8), .Q
       (ser_count[1]));
  INVXLLVT g656(.A (n_16), .Y (n_19));
  INVXLLVT g657(.A (n_14), .Y (n_18));
  INVXLLVT g658(.A (n_13), .Y (n_17));
  AOI222X1LVT g659__3680(.A0 (n_3), .A1 (DATA_V[1]), .B0 (n_4), .B1
       (DATA_V[2]), .C0 (DATA[1]), .C1 (n_1), .Y (n_16));
  OAI2BB1X1LVT g660__1617(.A0N (n_4), .A1N (DATA_V[5]), .B0 (n_6), .Y
       (n_15));
  AOI222X1LVT g661__2802(.A0 (n_3), .A1 (ser_out), .B0 (n_4), .B1
       (DATA_V[1]), .C0 (DATA[0]), .C1 (n_1), .Y (n_14));
  AOI222X1LVT g662__1705(.A0 (n_3), .A1 (DATA_V[5]), .B0 (n_4), .B1
       (DATA_V[6]), .C0 (DATA[5]), .C1 (n_1), .Y (n_13));
  XNOR2X1LVT g663__5122(.A (ser_count[2]), .B (n_2), .Y (n_12));
  AOI22XLLVT g664__8246(.A0 (n_3), .A1 (DATA_V[6]), .B0 (DATA[6]), .B1
       (n_1), .Y (n_11));
  AO22XLLVT g665__7098(.A0 (n_3), .A1 (DATA_V[7]), .B0 (DATA[7]), .B1
       (n_1), .Y (n_10));
  AOI22XLLVT g666__6131(.A0 (n_4), .A1 (DATA_V[3]), .B0 (DATA[2]), .B1
       (n_1), .Y (n_9));
  INVXLLVT g667(.A (n_5), .Y (n_8));
  AOI22XLLVT g668__1881(.A0 (n_4), .A1 (DATA_V[4]), .B0 (DATA[3]), .B1
       (n_1), .Y (n_7));
  AOI22XLLVT g669__5115(.A0 (n_3), .A1 (DATA_V[4]), .B0 (DATA[4]), .B1
       (n_1), .Y (n_6));
  OAI211X1LVT g670__7482(.A0 (ser_count[0]), .A1 (ser_count[1]), .B0
       (n_2), .C0 (Enable), .Y (n_5));
  DFFRHQX1LVT \ser_count_reg[0] (.RN (RST), .CK (CLK), .D (n_0), .Q
       (ser_count[0]));
  NOR2BX1LVT g672__4733(.AN (Enable), .B (n_1), .Y (n_4));
  NOR2X1LVT g673__6161(.A (n_1), .B (Enable), .Y (n_3));
  NAND2X1LVT g674__9315(.A (ser_count[1]), .B (ser_count[0]), .Y (n_2));
  NOR2BX1LVT g675__9945(.AN (Enable), .B (ser_count[0]), .Y (n_0));
  NOR2BX1LVT g676__2883(.AN (Data_Valid), .B (Busy), .Y (n_1));
endmodule

module uart_tx_fsm(CLK, RST, Data_Valid, ser_done, parity_enable,
     Ser_enable, mux_sel, busy);
  input CLK, RST, Data_Valid, ser_done, parity_enable;
  output Ser_enable, busy;
  output [1:0] mux_sel;
  wire CLK, RST, Data_Valid, ser_done, parity_enable;
  wire Ser_enable, busy;
  wire [1:0] mux_sel;
  wire [2:0] current_state;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_13, n_16, n_20;
  INVX1LVT g333(.A (n_20), .Y (Ser_enable));
  INVXLLVT g332(.A (Data_Valid), .Y (n_9));
  OAI211X1LVT g412__2346(.A0 (n_6), .A1 (n_7), .B0 (n_13), .C0 (n_16),
       .Y (mux_sel[0]));
  DFFRHQX1LVT busy_reg(.RN (RST), .CK (CLK), .D (n_8), .Q (busy));
  OR2XLLVT g414__1666(.A (ser_done), .B (n_16), .Y (n_20));
  OR3XLLVT g415__7410(.A (current_state[2]), .B (current_state[0]), .C
       (current_state[1]), .Y (n_13));
  NAND3X1LVT g416__6417(.A (current_state[0]), .B (current_state[1]),
       .C (n_6), .Y (n_16));
  AOI2BB1X1LVT g417__5477(.A0N (current_state[1]), .A1N (n_6), .B0
       (current_state[0]), .Y (mux_sel[1]));
  OAI2BB1X1LVT g418__2398(.A0N (current_state[0]), .A1N (n_6), .B0
       (n_7), .Y (n_8));
  NAND2BX1LVT g419__5107(.AN (current_state[0]), .B (current_state[1]),
       .Y (n_7));
  DFFRHQX1LVT \current_state_reg[0] (.RN (RST), .CK (CLK), .D (n_5), .Q
       (current_state[0]));
  OAI221X1LVT g395__6260(.A0 (current_state[1]), .A1 (n_2), .B0 (n_9),
       .B1 (n_13), .C0 (n_20), .Y (n_5));
  OAI32X1LVT g396__4319(.A0 (parity_enable), .A1 (n_0), .A2 (n_16), .B0
       (n_1), .B1 (n_2), .Y (n_4));
  DFFRHQX1LVT \current_state_reg[1] (.RN (RST), .CK (CLK), .D (n_3), .Q
       (current_state[1]));
  INVXLLVT g398(.A (n_2), .Y (n_3));
  NAND2BX1LVT g399__8428(.AN (current_state[2]), .B (n_13), .Y (n_2));
  NAND2XLLVT g400__5526(.A (current_state[1]), .B (n_16), .Y (n_1));
  INVXLLVT g401(.A (ser_done), .Y (n_0));
  DFFRX1LVT \current_state_reg[2] (.RN (RST), .CK (CLK), .D (n_4), .Q
       (current_state[2]), .QN (n_6));
endmodule

module mux(CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT);
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  input [1:0] SEL;
  output OUT;
  wire CLK, RST, IN_0, IN_1, IN_2, IN_3;
  wire [1:0] SEL;
  wire OUT;
  wire n_0, n_1;
  DFFRHQX1LVT OUT_reg(.RN (RST), .CK (CLK), .D (n_1), .Q (OUT));
  OAI2BB1X1LVT g40__6783(.A0N (IN_2), .A1N (SEL[1]), .B0 (n_0), .Y
       (n_1));
  OAI21X1LVT g41__3680(.A0 (IN_1), .A1 (SEL[1]), .B0 (SEL[0]), .Y
       (n_0));
endmodule

module parity_calc_WIDTH8(CLK, RST, parity_enable, parity_type, Busy,
     DATA, Data_Valid, parity);
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  input [7:0] DATA;
  output parity;
  wire CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  wire [7:0] DATA;
  wire parity;
  wire [7:0] DATA_V;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8;
  SDFFRHQX1LVT parity_reg(.RN (RST), .CK (CLK), .D (parity), .SI (n_8),
       .SE (parity_enable), .Q (parity));
  XNOR2X1LVT g369__1617(.A (n_7), .B (DATA_V[2]), .Y (n_8));
  XNOR2X1LVT g370__2802(.A (n_6), .B (DATA_V[4]), .Y (n_7));
  XNOR2X1LVT g371__1705(.A (n_5), .B (DATA_V[0]), .Y (n_6));
  XNOR2X1LVT g372__5122(.A (n_4), .B (DATA_V[7]), .Y (n_5));
  XNOR2X1LVT g373__8246(.A (n_3), .B (DATA_V[1]), .Y (n_4));
  XNOR2X1LVT g374__7098(.A (n_2), .B (DATA_V[6]), .Y (n_3));
  SDFFRHQX1LVT \DATA_V_reg[5] (.RN (RST), .CK (CLK), .D (DATA[5]), .SI
       (DATA_V[5]), .SE (n_0), .Q (DATA_V[5]));
  SDFFRHQX1LVT \DATA_V_reg[3] (.RN (RST), .CK (CLK), .D (DATA[3]), .SI
       (DATA_V[3]), .SE (n_0), .Q (DATA_V[3]));
  SDFFRHQX1LVT \DATA_V_reg[2] (.RN (RST), .CK (CLK), .D (DATA[2]), .SI
       (DATA_V[2]), .SE (n_0), .Q (DATA_V[2]));
  SDFFRHQX1LVT \DATA_V_reg[6] (.RN (RST), .CK (CLK), .D (DATA[6]), .SI
       (DATA_V[6]), .SE (n_0), .Q (DATA_V[6]));
  XNOR2X1LVT g379__6131(.A (n_1), .B (DATA_V[3]), .Y (n_2));
  SDFFRHQX1LVT \DATA_V_reg[4] (.RN (RST), .CK (CLK), .D (DATA[4]), .SI
       (DATA_V[4]), .SE (n_0), .Q (DATA_V[4]));
  SDFFRHQX1LVT \DATA_V_reg[7] (.RN (RST), .CK (CLK), .D (DATA[7]), .SI
       (DATA_V[7]), .SE (n_0), .Q (DATA_V[7]));
  SDFFRHQX1LVT \DATA_V_reg[0] (.RN (RST), .CK (CLK), .D (DATA[0]), .SI
       (DATA_V[0]), .SE (n_0), .Q (DATA_V[0]));
  SDFFRHQX1LVT \DATA_V_reg[1] (.RN (RST), .CK (CLK), .D (DATA[1]), .SI
       (DATA_V[1]), .SE (n_0), .Q (DATA_V[1]));
  XNOR2X1LVT g384__1881(.A (parity_type), .B (DATA_V[5]), .Y (n_1));
  NAND2BX1LVT g385__5115(.AN (Busy), .B (Data_Valid), .Y (n_0));
endmodule

module UART_TX_DATA_WIDTH8(CLK, RST, P_DATA, Data_Valid, parity_enable,
     parity_type, TX_OUT, busy);
  input CLK, RST, Data_Valid, parity_enable, parity_type;
  input [7:0] P_DATA;
  output TX_OUT, busy;
  wire CLK, RST, Data_Valid, parity_enable, parity_type;
  wire [7:0] P_DATA;
  wire TX_OUT, busy;
  wire [1:0] mux_sel;
  wire UNCONNECTED_HIER_Z0, UNCONNECTED_HIER_Z1, parity, ser_data,
       seriz_done, seriz_en;
  Serializer_WIDTH8 U0_Serializer(.CLK (CLK), .RST (RST), .DATA
       (P_DATA), .Enable (seriz_en), .Busy (busy), .Data_Valid
       (Data_Valid), .ser_out (ser_data), .ser_done (seriz_done));
  uart_tx_fsm U0_fsm(.CLK (CLK), .RST (RST), .Data_Valid (Data_Valid),
       .ser_done (seriz_done), .parity_enable (parity_enable),
       .Ser_enable (seriz_en), .mux_sel (mux_sel), .busy (busy));
  mux U0_mux(.CLK (CLK), .RST (RST), .IN_0 (UNCONNECTED_HIER_Z0), .IN_1
       (ser_data), .IN_2 (parity), .IN_3 (UNCONNECTED_HIER_Z1), .SEL
       (mux_sel), .OUT (TX_OUT));
  parity_calc_WIDTH8 U0_parity_calc(.CLK (CLK), .RST (RST),
       .parity_enable (parity_enable), .parity_type (parity_type),
       .Busy (busy), .DATA (P_DATA), .Data_Valid (Data_Valid), .parity
       (parity));
endmodule

module UART(RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P,
     TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type,
     parity_error, framing_error);
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable,
       parity_type;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  output [7:0] RX_OUT_P;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable,
       parity_type;
  wire [7:0] TX_IN_P;
  wire [5:0] Prescale;
  wire [7:0] RX_OUT_P;
  wire RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  UART_RX U0_UART_RX(.CLK (RX_CLK), .RST (RST), .RX_IN (RX_IN_S),
       .parity_enable (parity_enable), .parity_type (parity_type),
       .Prescale (Prescale), .P_DATA (RX_OUT_P), .data_valid
       (RX_OUT_V), .parity_error (parity_error), .framing_error
       (framing_error));
  UART_TX_DATA_WIDTH8 U0_UART_TX(.CLK (TX_CLK), .RST (RST), .P_DATA
       (TX_IN_P), .Data_Valid (TX_IN_V), .parity_enable
       (parity_enable), .parity_type (parity_type), .TX_OUT (TX_OUT_S),
       .busy (TX_OUT_V));
endmodule

