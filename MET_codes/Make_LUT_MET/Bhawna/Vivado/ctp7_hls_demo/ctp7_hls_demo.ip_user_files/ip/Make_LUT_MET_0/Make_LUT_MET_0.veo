// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:Make_LUT_MET:1.0
// IP Revision: 1710091150

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
Make_LUT_MET_0 your_instance_name (
  .MET_0_ap_vld(MET_0_ap_vld),  // output wire MET_0_ap_vld
  .MET_1_ap_vld(MET_1_ap_vld),  // output wire MET_1_ap_vld
  .ap_clk(ap_clk),              // input wire ap_clk
  .ap_rst(ap_rst),              // input wire ap_rst
  .ap_start(ap_start),          // input wire ap_start
  .ap_done(ap_done),            // output wire ap_done
  .ap_idle(ap_idle),            // output wire ap_idle
  .ap_ready(ap_ready),          // output wire ap_ready
  .rgnET_0(rgnET_0),            // input wire [15 : 0] rgnET_0
  .rgnET_1(rgnET_1),            // input wire [15 : 0] rgnET_1
  .rgnET_2(rgnET_2),            // input wire [15 : 0] rgnET_2
  .rgnET_3(rgnET_3),            // input wire [15 : 0] rgnET_3
  .rgnET_4(rgnET_4),            // input wire [15 : 0] rgnET_4
  .rgnET_5(rgnET_5),            // input wire [15 : 0] rgnET_5
  .rgnET_6(rgnET_6),            // input wire [15 : 0] rgnET_6
  .rgnET_7(rgnET_7),            // input wire [15 : 0] rgnET_7
  .rgnET_8(rgnET_8),            // input wire [15 : 0] rgnET_8
  .rgnET_9(rgnET_9),            // input wire [15 : 0] rgnET_9
  .rgnET_10(rgnET_10),          // input wire [15 : 0] rgnET_10
  .rgnET_11(rgnET_11),          // input wire [15 : 0] rgnET_11
  .rgnET_12(rgnET_12),          // input wire [15 : 0] rgnET_12
  .rgnET_13(rgnET_13),          // input wire [15 : 0] rgnET_13
  .rgnET_14(rgnET_14),          // input wire [15 : 0] rgnET_14
  .rgnET_15(rgnET_15),          // input wire [15 : 0] rgnET_15
  .rgnET_16(rgnET_16),          // input wire [15 : 0] rgnET_16
  .rgnET_17(rgnET_17),          // input wire [15 : 0] rgnET_17
  .rgnET_18(rgnET_18),          // input wire [15 : 0] rgnET_18
  .rgnET_19(rgnET_19),          // input wire [15 : 0] rgnET_19
  .rgnET_20(rgnET_20),          // input wire [15 : 0] rgnET_20
  .rgnET_21(rgnET_21),          // input wire [15 : 0] rgnET_21
  .rgnET_22(rgnET_22),          // input wire [15 : 0] rgnET_22
  .rgnET_23(rgnET_23),          // input wire [15 : 0] rgnET_23
  .rgnET_24(rgnET_24),          // input wire [15 : 0] rgnET_24
  .rgnET_25(rgnET_25),          // input wire [15 : 0] rgnET_25
  .rgnET_26(rgnET_26),          // input wire [15 : 0] rgnET_26
  .rgnET_27(rgnET_27),          // input wire [15 : 0] rgnET_27
  .rgnET_28(rgnET_28),          // input wire [15 : 0] rgnET_28
  .rgnET_29(rgnET_29),          // input wire [15 : 0] rgnET_29
  .rgnET_30(rgnET_30),          // input wire [15 : 0] rgnET_30
  .rgnET_31(rgnET_31),          // input wire [15 : 0] rgnET_31
  .rgnET_32(rgnET_32),          // input wire [15 : 0] rgnET_32
  .rgnET_33(rgnET_33),          // input wire [15 : 0] rgnET_33
  .rgnET_34(rgnET_34),          // input wire [15 : 0] rgnET_34
  .rgnET_35(rgnET_35),          // input wire [15 : 0] rgnET_35
  .rgnET_36(rgnET_36),          // input wire [15 : 0] rgnET_36
  .rgnET_37(rgnET_37),          // input wire [15 : 0] rgnET_37
  .rgnET_38(rgnET_38),          // input wire [15 : 0] rgnET_38
  .rgnET_39(rgnET_39),          // input wire [15 : 0] rgnET_39
  .rgnET_40(rgnET_40),          // input wire [15 : 0] rgnET_40
  .rgnET_41(rgnET_41),          // input wire [15 : 0] rgnET_41
  .rgnET_42(rgnET_42),          // input wire [15 : 0] rgnET_42
  .rgnET_43(rgnET_43),          // input wire [15 : 0] rgnET_43
  .rgnET_44(rgnET_44),          // input wire [15 : 0] rgnET_44
  .rgnET_45(rgnET_45),          // input wire [15 : 0] rgnET_45
  .rgnET_46(rgnET_46),          // input wire [15 : 0] rgnET_46
  .rgnET_47(rgnET_47),          // input wire [15 : 0] rgnET_47
  .rgnET_48(rgnET_48),          // input wire [15 : 0] rgnET_48
  .rgnET_49(rgnET_49),          // input wire [15 : 0] rgnET_49
  .rgnET_50(rgnET_50),          // input wire [15 : 0] rgnET_50
  .rgnET_51(rgnET_51),          // input wire [15 : 0] rgnET_51
  .rgnET_52(rgnET_52),          // input wire [15 : 0] rgnET_52
  .rgnET_53(rgnET_53),          // input wire [15 : 0] rgnET_53
  .rgnET_54(rgnET_54),          // input wire [15 : 0] rgnET_54
  .rgnET_55(rgnET_55),          // input wire [15 : 0] rgnET_55
  .rgnET_56(rgnET_56),          // input wire [15 : 0] rgnET_56
  .rgnET_57(rgnET_57),          // input wire [15 : 0] rgnET_57
  .rgnET_58(rgnET_58),          // input wire [15 : 0] rgnET_58
  .rgnET_59(rgnET_59),          // input wire [15 : 0] rgnET_59
  .rgnET_60(rgnET_60),          // input wire [15 : 0] rgnET_60
  .rgnET_61(rgnET_61),          // input wire [15 : 0] rgnET_61
  .rgnET_62(rgnET_62),          // input wire [15 : 0] rgnET_62
  .rgnET_63(rgnET_63),          // input wire [15 : 0] rgnET_63
  .rgnET_64(rgnET_64),          // input wire [15 : 0] rgnET_64
  .rgnET_65(rgnET_65),          // input wire [15 : 0] rgnET_65
  .rgnET_66(rgnET_66),          // input wire [15 : 0] rgnET_66
  .rgnET_67(rgnET_67),          // input wire [15 : 0] rgnET_67
  .rgnET_68(rgnET_68),          // input wire [15 : 0] rgnET_68
  .rgnET_69(rgnET_69),          // input wire [15 : 0] rgnET_69
  .rgnET_70(rgnET_70),          // input wire [15 : 0] rgnET_70
  .rgnET_71(rgnET_71),          // input wire [15 : 0] rgnET_71
  .rgnET_72(rgnET_72),          // input wire [15 : 0] rgnET_72
  .rgnET_73(rgnET_73),          // input wire [15 : 0] rgnET_73
  .rgnET_74(rgnET_74),          // input wire [15 : 0] rgnET_74
  .rgnET_75(rgnET_75),          // input wire [15 : 0] rgnET_75
  .rgnET_76(rgnET_76),          // input wire [15 : 0] rgnET_76
  .rgnET_77(rgnET_77),          // input wire [15 : 0] rgnET_77
  .rgnET_78(rgnET_78),          // input wire [15 : 0] rgnET_78
  .rgnET_79(rgnET_79),          // input wire [15 : 0] rgnET_79
  .rgnET_80(rgnET_80),          // input wire [15 : 0] rgnET_80
  .rgnET_81(rgnET_81),          // input wire [15 : 0] rgnET_81
  .rgnET_82(rgnET_82),          // input wire [15 : 0] rgnET_82
  .rgnET_83(rgnET_83),          // input wire [15 : 0] rgnET_83
  .rgnET_84(rgnET_84),          // input wire [15 : 0] rgnET_84
  .rgnET_85(rgnET_85),          // input wire [15 : 0] rgnET_85
  .rgnET_86(rgnET_86),          // input wire [15 : 0] rgnET_86
  .rgnET_87(rgnET_87),          // input wire [15 : 0] rgnET_87
  .rgnET_88(rgnET_88),          // input wire [15 : 0] rgnET_88
  .rgnET_89(rgnET_89),          // input wire [15 : 0] rgnET_89
  .rgnET_90(rgnET_90),          // input wire [15 : 0] rgnET_90
  .rgnET_91(rgnET_91),          // input wire [15 : 0] rgnET_91
  .rgnET_92(rgnET_92),          // input wire [15 : 0] rgnET_92
  .rgnET_93(rgnET_93),          // input wire [15 : 0] rgnET_93
  .rgnET_94(rgnET_94),          // input wire [15 : 0] rgnET_94
  .rgnET_95(rgnET_95),          // input wire [15 : 0] rgnET_95
  .rgnET_96(rgnET_96),          // input wire [15 : 0] rgnET_96
  .rgnET_97(rgnET_97),          // input wire [15 : 0] rgnET_97
  .rgnET_98(rgnET_98),          // input wire [15 : 0] rgnET_98
  .rgnET_99(rgnET_99),          // input wire [15 : 0] rgnET_99
  .rgnET_100(rgnET_100),        // input wire [15 : 0] rgnET_100
  .rgnET_101(rgnET_101),        // input wire [15 : 0] rgnET_101
  .rgnET_102(rgnET_102),        // input wire [15 : 0] rgnET_102
  .rgnET_103(rgnET_103),        // input wire [15 : 0] rgnET_103
  .rgnET_104(rgnET_104),        // input wire [15 : 0] rgnET_104
  .rgnET_105(rgnET_105),        // input wire [15 : 0] rgnET_105
  .rgnET_106(rgnET_106),        // input wire [15 : 0] rgnET_106
  .rgnET_107(rgnET_107),        // input wire [15 : 0] rgnET_107
  .rgnET_108(rgnET_108),        // input wire [15 : 0] rgnET_108
  .rgnET_109(rgnET_109),        // input wire [15 : 0] rgnET_109
  .rgnET_110(rgnET_110),        // input wire [15 : 0] rgnET_110
  .rgnET_111(rgnET_111),        // input wire [15 : 0] rgnET_111
  .rgnET_112(rgnET_112),        // input wire [15 : 0] rgnET_112
  .rgnET_113(rgnET_113),        // input wire [15 : 0] rgnET_113
  .rgnET_114(rgnET_114),        // input wire [15 : 0] rgnET_114
  .rgnET_115(rgnET_115),        // input wire [15 : 0] rgnET_115
  .rgnET_116(rgnET_116),        // input wire [15 : 0] rgnET_116
  .rgnET_117(rgnET_117),        // input wire [15 : 0] rgnET_117
  .rgnET_118(rgnET_118),        // input wire [15 : 0] rgnET_118
  .rgnET_119(rgnET_119),        // input wire [15 : 0] rgnET_119
  .rgnET_120(rgnET_120),        // input wire [15 : 0] rgnET_120
  .rgnET_121(rgnET_121),        // input wire [15 : 0] rgnET_121
  .rgnET_122(rgnET_122),        // input wire [15 : 0] rgnET_122
  .rgnET_123(rgnET_123),        // input wire [15 : 0] rgnET_123
  .rgnET_124(rgnET_124),        // input wire [15 : 0] rgnET_124
  .rgnET_125(rgnET_125),        // input wire [15 : 0] rgnET_125
  .rgnET_126(rgnET_126),        // input wire [15 : 0] rgnET_126
  .rgnET_127(rgnET_127),        // input wire [15 : 0] rgnET_127
  .rgnET_128(rgnET_128),        // input wire [15 : 0] rgnET_128
  .rgnET_129(rgnET_129),        // input wire [15 : 0] rgnET_129
  .rgnET_130(rgnET_130),        // input wire [15 : 0] rgnET_130
  .rgnET_131(rgnET_131),        // input wire [15 : 0] rgnET_131
  .rgnET_132(rgnET_132),        // input wire [15 : 0] rgnET_132
  .rgnET_133(rgnET_133),        // input wire [15 : 0] rgnET_133
  .rgnET_134(rgnET_134),        // input wire [15 : 0] rgnET_134
  .rgnET_135(rgnET_135),        // input wire [15 : 0] rgnET_135
  .rgnET_136(rgnET_136),        // input wire [15 : 0] rgnET_136
  .rgnET_137(rgnET_137),        // input wire [15 : 0] rgnET_137
  .rgnET_138(rgnET_138),        // input wire [15 : 0] rgnET_138
  .rgnET_139(rgnET_139),        // input wire [15 : 0] rgnET_139
  .rgnET_140(rgnET_140),        // input wire [15 : 0] rgnET_140
  .rgnET_141(rgnET_141),        // input wire [15 : 0] rgnET_141
  .rgnET_142(rgnET_142),        // input wire [15 : 0] rgnET_142
  .rgnET_143(rgnET_143),        // input wire [15 : 0] rgnET_143
  .rgnET_144(rgnET_144),        // input wire [15 : 0] rgnET_144
  .rgnET_145(rgnET_145),        // input wire [15 : 0] rgnET_145
  .rgnET_146(rgnET_146),        // input wire [15 : 0] rgnET_146
  .rgnET_147(rgnET_147),        // input wire [15 : 0] rgnET_147
  .rgnET_148(rgnET_148),        // input wire [15 : 0] rgnET_148
  .rgnET_149(rgnET_149),        // input wire [15 : 0] rgnET_149
  .rgnET_150(rgnET_150),        // input wire [15 : 0] rgnET_150
  .rgnET_151(rgnET_151),        // input wire [15 : 0] rgnET_151
  .rgnET_152(rgnET_152),        // input wire [15 : 0] rgnET_152
  .rgnET_153(rgnET_153),        // input wire [15 : 0] rgnET_153
  .rgnET_154(rgnET_154),        // input wire [15 : 0] rgnET_154
  .rgnET_155(rgnET_155),        // input wire [15 : 0] rgnET_155
  .rgnET_156(rgnET_156),        // input wire [15 : 0] rgnET_156
  .rgnET_157(rgnET_157),        // input wire [15 : 0] rgnET_157
  .rgnET_158(rgnET_158),        // input wire [15 : 0] rgnET_158
  .rgnET_159(rgnET_159),        // input wire [15 : 0] rgnET_159
  .rgnET_160(rgnET_160),        // input wire [15 : 0] rgnET_160
  .rgnET_161(rgnET_161),        // input wire [15 : 0] rgnET_161
  .rgnET_162(rgnET_162),        // input wire [15 : 0] rgnET_162
  .rgnET_163(rgnET_163),        // input wire [15 : 0] rgnET_163
  .rgnET_164(rgnET_164),        // input wire [15 : 0] rgnET_164
  .rgnET_165(rgnET_165),        // input wire [15 : 0] rgnET_165
  .rgnET_166(rgnET_166),        // input wire [15 : 0] rgnET_166
  .rgnET_167(rgnET_167),        // input wire [15 : 0] rgnET_167
  .rgnET_168(rgnET_168),        // input wire [15 : 0] rgnET_168
  .rgnET_169(rgnET_169),        // input wire [15 : 0] rgnET_169
  .rgnET_170(rgnET_170),        // input wire [15 : 0] rgnET_170
  .rgnET_171(rgnET_171),        // input wire [15 : 0] rgnET_171
  .rgnET_172(rgnET_172),        // input wire [15 : 0] rgnET_172
  .rgnET_173(rgnET_173),        // input wire [15 : 0] rgnET_173
  .rgnET_174(rgnET_174),        // input wire [15 : 0] rgnET_174
  .rgnET_175(rgnET_175),        // input wire [15 : 0] rgnET_175
  .rgnET_176(rgnET_176),        // input wire [15 : 0] rgnET_176
  .rgnET_177(rgnET_177),        // input wire [15 : 0] rgnET_177
  .rgnET_178(rgnET_178),        // input wire [15 : 0] rgnET_178
  .rgnET_179(rgnET_179),        // input wire [15 : 0] rgnET_179
  .rgnET_180(rgnET_180),        // input wire [15 : 0] rgnET_180
  .rgnET_181(rgnET_181),        // input wire [15 : 0] rgnET_181
  .rgnET_182(rgnET_182),        // input wire [15 : 0] rgnET_182
  .rgnET_183(rgnET_183),        // input wire [15 : 0] rgnET_183
  .rgnET_184(rgnET_184),        // input wire [15 : 0] rgnET_184
  .rgnET_185(rgnET_185),        // input wire [15 : 0] rgnET_185
  .rgnET_186(rgnET_186),        // input wire [15 : 0] rgnET_186
  .rgnET_187(rgnET_187),        // input wire [15 : 0] rgnET_187
  .rgnET_188(rgnET_188),        // input wire [15 : 0] rgnET_188
  .rgnET_189(rgnET_189),        // input wire [15 : 0] rgnET_189
  .rgnET_190(rgnET_190),        // input wire [15 : 0] rgnET_190
  .rgnET_191(rgnET_191),        // input wire [15 : 0] rgnET_191
  .rgnET_192(rgnET_192),        // input wire [15 : 0] rgnET_192
  .rgnET_193(rgnET_193),        // input wire [15 : 0] rgnET_193
  .rgnET_194(rgnET_194),        // input wire [15 : 0] rgnET_194
  .rgnET_195(rgnET_195),        // input wire [15 : 0] rgnET_195
  .rgnET_196(rgnET_196),        // input wire [15 : 0] rgnET_196
  .rgnET_197(rgnET_197),        // input wire [15 : 0] rgnET_197
  .rgnET_198(rgnET_198),        // input wire [15 : 0] rgnET_198
  .rgnET_199(rgnET_199),        // input wire [15 : 0] rgnET_199
  .rgnET_200(rgnET_200),        // input wire [15 : 0] rgnET_200
  .rgnET_201(rgnET_201),        // input wire [15 : 0] rgnET_201
  .rgnET_202(rgnET_202),        // input wire [15 : 0] rgnET_202
  .rgnET_203(rgnET_203),        // input wire [15 : 0] rgnET_203
  .rgnET_204(rgnET_204),        // input wire [15 : 0] rgnET_204
  .rgnET_205(rgnET_205),        // input wire [15 : 0] rgnET_205
  .rgnET_206(rgnET_206),        // input wire [15 : 0] rgnET_206
  .rgnET_207(rgnET_207),        // input wire [15 : 0] rgnET_207
  .rgnET_208(rgnET_208),        // input wire [15 : 0] rgnET_208
  .rgnET_209(rgnET_209),        // input wire [15 : 0] rgnET_209
  .rgnET_210(rgnET_210),        // input wire [15 : 0] rgnET_210
  .rgnET_211(rgnET_211),        // input wire [15 : 0] rgnET_211
  .rgnET_212(rgnET_212),        // input wire [15 : 0] rgnET_212
  .rgnET_213(rgnET_213),        // input wire [15 : 0] rgnET_213
  .rgnET_214(rgnET_214),        // input wire [15 : 0] rgnET_214
  .rgnET_215(rgnET_215),        // input wire [15 : 0] rgnET_215
  .rgnET_216(rgnET_216),        // input wire [15 : 0] rgnET_216
  .rgnET_217(rgnET_217),        // input wire [15 : 0] rgnET_217
  .rgnET_218(rgnET_218),        // input wire [15 : 0] rgnET_218
  .rgnET_219(rgnET_219),        // input wire [15 : 0] rgnET_219
  .rgnET_220(rgnET_220),        // input wire [15 : 0] rgnET_220
  .rgnET_221(rgnET_221),        // input wire [15 : 0] rgnET_221
  .rgnET_222(rgnET_222),        // input wire [15 : 0] rgnET_222
  .rgnET_223(rgnET_223),        // input wire [15 : 0] rgnET_223
  .rgnET_224(rgnET_224),        // input wire [15 : 0] rgnET_224
  .rgnET_225(rgnET_225),        // input wire [15 : 0] rgnET_225
  .rgnET_226(rgnET_226),        // input wire [15 : 0] rgnET_226
  .rgnET_227(rgnET_227),        // input wire [15 : 0] rgnET_227
  .rgnET_228(rgnET_228),        // input wire [15 : 0] rgnET_228
  .rgnET_229(rgnET_229),        // input wire [15 : 0] rgnET_229
  .rgnET_230(rgnET_230),        // input wire [15 : 0] rgnET_230
  .rgnET_231(rgnET_231),        // input wire [15 : 0] rgnET_231
  .rgnET_232(rgnET_232),        // input wire [15 : 0] rgnET_232
  .rgnET_233(rgnET_233),        // input wire [15 : 0] rgnET_233
  .rgnET_234(rgnET_234),        // input wire [15 : 0] rgnET_234
  .rgnET_235(rgnET_235),        // input wire [15 : 0] rgnET_235
  .rgnET_236(rgnET_236),        // input wire [15 : 0] rgnET_236
  .rgnET_237(rgnET_237),        // input wire [15 : 0] rgnET_237
  .rgnET_238(rgnET_238),        // input wire [15 : 0] rgnET_238
  .rgnET_239(rgnET_239),        // input wire [15 : 0] rgnET_239
  .rgnET_240(rgnET_240),        // input wire [15 : 0] rgnET_240
  .rgnET_241(rgnET_241),        // input wire [15 : 0] rgnET_241
  .rgnET_242(rgnET_242),        // input wire [15 : 0] rgnET_242
  .rgnET_243(rgnET_243),        // input wire [15 : 0] rgnET_243
  .rgnET_244(rgnET_244),        // input wire [15 : 0] rgnET_244
  .rgnET_245(rgnET_245),        // input wire [15 : 0] rgnET_245
  .rgnET_246(rgnET_246),        // input wire [15 : 0] rgnET_246
  .rgnET_247(rgnET_247),        // input wire [15 : 0] rgnET_247
  .rgnET_248(rgnET_248),        // input wire [15 : 0] rgnET_248
  .rgnET_249(rgnET_249),        // input wire [15 : 0] rgnET_249
  .rgnET_250(rgnET_250),        // input wire [15 : 0] rgnET_250
  .rgnET_251(rgnET_251),        // input wire [15 : 0] rgnET_251
  .rgnPhi_0(rgnPhi_0),          // input wire [15 : 0] rgnPhi_0
  .rgnPhi_1(rgnPhi_1),          // input wire [15 : 0] rgnPhi_1
  .rgnPhi_2(rgnPhi_2),          // input wire [15 : 0] rgnPhi_2
  .rgnPhi_3(rgnPhi_3),          // input wire [15 : 0] rgnPhi_3
  .rgnPhi_4(rgnPhi_4),          // input wire [15 : 0] rgnPhi_4
  .rgnPhi_5(rgnPhi_5),          // input wire [15 : 0] rgnPhi_5
  .rgnPhi_6(rgnPhi_6),          // input wire [15 : 0] rgnPhi_6
  .rgnPhi_7(rgnPhi_7),          // input wire [15 : 0] rgnPhi_7
  .rgnPhi_8(rgnPhi_8),          // input wire [15 : 0] rgnPhi_8
  .rgnPhi_9(rgnPhi_9),          // input wire [15 : 0] rgnPhi_9
  .rgnPhi_10(rgnPhi_10),        // input wire [15 : 0] rgnPhi_10
  .rgnPhi_11(rgnPhi_11),        // input wire [15 : 0] rgnPhi_11
  .rgnPhi_12(rgnPhi_12),        // input wire [15 : 0] rgnPhi_12
  .rgnPhi_13(rgnPhi_13),        // input wire [15 : 0] rgnPhi_13
  .rgnPhi_14(rgnPhi_14),        // input wire [15 : 0] rgnPhi_14
  .rgnPhi_15(rgnPhi_15),        // input wire [15 : 0] rgnPhi_15
  .rgnPhi_16(rgnPhi_16),        // input wire [15 : 0] rgnPhi_16
  .rgnPhi_17(rgnPhi_17),        // input wire [15 : 0] rgnPhi_17
  .MET_0(MET_0),                // output wire [15 : 0] MET_0
  .MET_1(MET_1),                // output wire [15 : 0] MET_1
  .MET_2(MET_2)                // input wire [15 : 0] MET_2
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file Make_LUT_MET_0.v when simulating
// the core, Make_LUT_MET_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

