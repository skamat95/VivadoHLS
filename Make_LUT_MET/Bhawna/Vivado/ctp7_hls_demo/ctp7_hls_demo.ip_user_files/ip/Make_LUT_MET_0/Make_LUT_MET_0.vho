-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:Make_LUT_MET:1.0
-- IP Revision: 1710091150

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT Make_LUT_MET_0
  PORT (
    MET_0_ap_vld : OUT STD_LOGIC;
    MET_1_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rgnET_0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_8 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_9 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_10 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_11 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_12 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_13 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_14 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_15 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_17 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_18 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_19 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_20 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_21 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_22 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_23 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_24 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_25 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_26 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_27 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_28 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_29 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_30 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_31 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_32 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_33 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_34 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_35 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_36 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_37 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_38 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_39 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_40 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_41 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_42 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_43 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_44 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_45 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_46 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_47 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_48 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_49 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_50 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_51 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_52 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_53 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_54 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_55 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_56 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_57 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_58 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_59 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_60 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_61 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_62 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_63 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_64 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_65 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_66 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_67 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_68 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_69 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_70 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_71 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_72 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_73 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_74 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_75 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_76 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_77 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_78 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_79 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_80 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_81 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_82 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_83 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_84 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_85 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_86 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_87 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_88 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_89 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_90 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_91 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_92 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_93 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_94 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_95 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_96 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_97 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_98 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_99 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_100 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_101 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_102 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_103 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_104 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_105 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_106 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_107 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_108 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_109 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_110 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_111 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_112 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_113 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_114 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_115 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_116 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_117 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_118 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_119 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_120 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_121 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_122 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_123 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_124 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_125 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_126 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_127 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_128 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_129 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_130 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_131 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_132 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_133 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_134 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_135 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_136 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_137 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_138 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_139 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_140 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_141 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_142 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_143 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_144 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_145 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_146 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_147 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_148 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_149 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_150 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_151 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_152 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_153 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_154 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_155 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_156 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_157 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_158 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_159 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_160 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_161 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_162 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_163 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_164 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_165 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_166 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_167 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_168 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_169 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_170 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_171 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_172 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_173 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_174 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_175 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_176 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_177 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_178 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_179 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_180 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_181 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_182 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_183 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_184 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_185 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_186 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_187 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_188 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_189 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_190 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_191 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_192 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_193 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_194 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_195 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_196 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_197 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_198 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_199 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_200 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_201 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_202 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_203 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_204 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_205 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_206 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_207 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_208 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_209 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_210 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_211 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_212 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_213 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_214 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_215 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_216 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_217 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_218 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_219 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_220 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_221 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_222 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_223 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_224 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_225 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_226 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_227 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_228 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_229 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_230 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_231 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_232 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_233 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_234 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_235 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_236 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_237 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_238 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_239 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_240 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_241 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_242 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_243 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_244 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_245 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_246 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_247 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_248 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_249 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_250 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnET_251 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_8 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_9 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_10 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_11 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_12 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_13 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_14 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_15 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_16 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgnPhi_17 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    MET_0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    MET_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    MET_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : Make_LUT_MET_0
  PORT MAP (
    MET_0_ap_vld => MET_0_ap_vld,
    MET_1_ap_vld => MET_1_ap_vld,
    ap_clk => ap_clk,
    ap_rst => ap_rst,
    ap_start => ap_start,
    ap_done => ap_done,
    ap_idle => ap_idle,
    ap_ready => ap_ready,
    rgnET_0 => rgnET_0,
    rgnET_1 => rgnET_1,
    rgnET_2 => rgnET_2,
    rgnET_3 => rgnET_3,
    rgnET_4 => rgnET_4,
    rgnET_5 => rgnET_5,
    rgnET_6 => rgnET_6,
    rgnET_7 => rgnET_7,
    rgnET_8 => rgnET_8,
    rgnET_9 => rgnET_9,
    rgnET_10 => rgnET_10,
    rgnET_11 => rgnET_11,
    rgnET_12 => rgnET_12,
    rgnET_13 => rgnET_13,
    rgnET_14 => rgnET_14,
    rgnET_15 => rgnET_15,
    rgnET_16 => rgnET_16,
    rgnET_17 => rgnET_17,
    rgnET_18 => rgnET_18,
    rgnET_19 => rgnET_19,
    rgnET_20 => rgnET_20,
    rgnET_21 => rgnET_21,
    rgnET_22 => rgnET_22,
    rgnET_23 => rgnET_23,
    rgnET_24 => rgnET_24,
    rgnET_25 => rgnET_25,
    rgnET_26 => rgnET_26,
    rgnET_27 => rgnET_27,
    rgnET_28 => rgnET_28,
    rgnET_29 => rgnET_29,
    rgnET_30 => rgnET_30,
    rgnET_31 => rgnET_31,
    rgnET_32 => rgnET_32,
    rgnET_33 => rgnET_33,
    rgnET_34 => rgnET_34,
    rgnET_35 => rgnET_35,
    rgnET_36 => rgnET_36,
    rgnET_37 => rgnET_37,
    rgnET_38 => rgnET_38,
    rgnET_39 => rgnET_39,
    rgnET_40 => rgnET_40,
    rgnET_41 => rgnET_41,
    rgnET_42 => rgnET_42,
    rgnET_43 => rgnET_43,
    rgnET_44 => rgnET_44,
    rgnET_45 => rgnET_45,
    rgnET_46 => rgnET_46,
    rgnET_47 => rgnET_47,
    rgnET_48 => rgnET_48,
    rgnET_49 => rgnET_49,
    rgnET_50 => rgnET_50,
    rgnET_51 => rgnET_51,
    rgnET_52 => rgnET_52,
    rgnET_53 => rgnET_53,
    rgnET_54 => rgnET_54,
    rgnET_55 => rgnET_55,
    rgnET_56 => rgnET_56,
    rgnET_57 => rgnET_57,
    rgnET_58 => rgnET_58,
    rgnET_59 => rgnET_59,
    rgnET_60 => rgnET_60,
    rgnET_61 => rgnET_61,
    rgnET_62 => rgnET_62,
    rgnET_63 => rgnET_63,
    rgnET_64 => rgnET_64,
    rgnET_65 => rgnET_65,
    rgnET_66 => rgnET_66,
    rgnET_67 => rgnET_67,
    rgnET_68 => rgnET_68,
    rgnET_69 => rgnET_69,
    rgnET_70 => rgnET_70,
    rgnET_71 => rgnET_71,
    rgnET_72 => rgnET_72,
    rgnET_73 => rgnET_73,
    rgnET_74 => rgnET_74,
    rgnET_75 => rgnET_75,
    rgnET_76 => rgnET_76,
    rgnET_77 => rgnET_77,
    rgnET_78 => rgnET_78,
    rgnET_79 => rgnET_79,
    rgnET_80 => rgnET_80,
    rgnET_81 => rgnET_81,
    rgnET_82 => rgnET_82,
    rgnET_83 => rgnET_83,
    rgnET_84 => rgnET_84,
    rgnET_85 => rgnET_85,
    rgnET_86 => rgnET_86,
    rgnET_87 => rgnET_87,
    rgnET_88 => rgnET_88,
    rgnET_89 => rgnET_89,
    rgnET_90 => rgnET_90,
    rgnET_91 => rgnET_91,
    rgnET_92 => rgnET_92,
    rgnET_93 => rgnET_93,
    rgnET_94 => rgnET_94,
    rgnET_95 => rgnET_95,
    rgnET_96 => rgnET_96,
    rgnET_97 => rgnET_97,
    rgnET_98 => rgnET_98,
    rgnET_99 => rgnET_99,
    rgnET_100 => rgnET_100,
    rgnET_101 => rgnET_101,
    rgnET_102 => rgnET_102,
    rgnET_103 => rgnET_103,
    rgnET_104 => rgnET_104,
    rgnET_105 => rgnET_105,
    rgnET_106 => rgnET_106,
    rgnET_107 => rgnET_107,
    rgnET_108 => rgnET_108,
    rgnET_109 => rgnET_109,
    rgnET_110 => rgnET_110,
    rgnET_111 => rgnET_111,
    rgnET_112 => rgnET_112,
    rgnET_113 => rgnET_113,
    rgnET_114 => rgnET_114,
    rgnET_115 => rgnET_115,
    rgnET_116 => rgnET_116,
    rgnET_117 => rgnET_117,
    rgnET_118 => rgnET_118,
    rgnET_119 => rgnET_119,
    rgnET_120 => rgnET_120,
    rgnET_121 => rgnET_121,
    rgnET_122 => rgnET_122,
    rgnET_123 => rgnET_123,
    rgnET_124 => rgnET_124,
    rgnET_125 => rgnET_125,
    rgnET_126 => rgnET_126,
    rgnET_127 => rgnET_127,
    rgnET_128 => rgnET_128,
    rgnET_129 => rgnET_129,
    rgnET_130 => rgnET_130,
    rgnET_131 => rgnET_131,
    rgnET_132 => rgnET_132,
    rgnET_133 => rgnET_133,
    rgnET_134 => rgnET_134,
    rgnET_135 => rgnET_135,
    rgnET_136 => rgnET_136,
    rgnET_137 => rgnET_137,
    rgnET_138 => rgnET_138,
    rgnET_139 => rgnET_139,
    rgnET_140 => rgnET_140,
    rgnET_141 => rgnET_141,
    rgnET_142 => rgnET_142,
    rgnET_143 => rgnET_143,
    rgnET_144 => rgnET_144,
    rgnET_145 => rgnET_145,
    rgnET_146 => rgnET_146,
    rgnET_147 => rgnET_147,
    rgnET_148 => rgnET_148,
    rgnET_149 => rgnET_149,
    rgnET_150 => rgnET_150,
    rgnET_151 => rgnET_151,
    rgnET_152 => rgnET_152,
    rgnET_153 => rgnET_153,
    rgnET_154 => rgnET_154,
    rgnET_155 => rgnET_155,
    rgnET_156 => rgnET_156,
    rgnET_157 => rgnET_157,
    rgnET_158 => rgnET_158,
    rgnET_159 => rgnET_159,
    rgnET_160 => rgnET_160,
    rgnET_161 => rgnET_161,
    rgnET_162 => rgnET_162,
    rgnET_163 => rgnET_163,
    rgnET_164 => rgnET_164,
    rgnET_165 => rgnET_165,
    rgnET_166 => rgnET_166,
    rgnET_167 => rgnET_167,
    rgnET_168 => rgnET_168,
    rgnET_169 => rgnET_169,
    rgnET_170 => rgnET_170,
    rgnET_171 => rgnET_171,
    rgnET_172 => rgnET_172,
    rgnET_173 => rgnET_173,
    rgnET_174 => rgnET_174,
    rgnET_175 => rgnET_175,
    rgnET_176 => rgnET_176,
    rgnET_177 => rgnET_177,
    rgnET_178 => rgnET_178,
    rgnET_179 => rgnET_179,
    rgnET_180 => rgnET_180,
    rgnET_181 => rgnET_181,
    rgnET_182 => rgnET_182,
    rgnET_183 => rgnET_183,
    rgnET_184 => rgnET_184,
    rgnET_185 => rgnET_185,
    rgnET_186 => rgnET_186,
    rgnET_187 => rgnET_187,
    rgnET_188 => rgnET_188,
    rgnET_189 => rgnET_189,
    rgnET_190 => rgnET_190,
    rgnET_191 => rgnET_191,
    rgnET_192 => rgnET_192,
    rgnET_193 => rgnET_193,
    rgnET_194 => rgnET_194,
    rgnET_195 => rgnET_195,
    rgnET_196 => rgnET_196,
    rgnET_197 => rgnET_197,
    rgnET_198 => rgnET_198,
    rgnET_199 => rgnET_199,
    rgnET_200 => rgnET_200,
    rgnET_201 => rgnET_201,
    rgnET_202 => rgnET_202,
    rgnET_203 => rgnET_203,
    rgnET_204 => rgnET_204,
    rgnET_205 => rgnET_205,
    rgnET_206 => rgnET_206,
    rgnET_207 => rgnET_207,
    rgnET_208 => rgnET_208,
    rgnET_209 => rgnET_209,
    rgnET_210 => rgnET_210,
    rgnET_211 => rgnET_211,
    rgnET_212 => rgnET_212,
    rgnET_213 => rgnET_213,
    rgnET_214 => rgnET_214,
    rgnET_215 => rgnET_215,
    rgnET_216 => rgnET_216,
    rgnET_217 => rgnET_217,
    rgnET_218 => rgnET_218,
    rgnET_219 => rgnET_219,
    rgnET_220 => rgnET_220,
    rgnET_221 => rgnET_221,
    rgnET_222 => rgnET_222,
    rgnET_223 => rgnET_223,
    rgnET_224 => rgnET_224,
    rgnET_225 => rgnET_225,
    rgnET_226 => rgnET_226,
    rgnET_227 => rgnET_227,
    rgnET_228 => rgnET_228,
    rgnET_229 => rgnET_229,
    rgnET_230 => rgnET_230,
    rgnET_231 => rgnET_231,
    rgnET_232 => rgnET_232,
    rgnET_233 => rgnET_233,
    rgnET_234 => rgnET_234,
    rgnET_235 => rgnET_235,
    rgnET_236 => rgnET_236,
    rgnET_237 => rgnET_237,
    rgnET_238 => rgnET_238,
    rgnET_239 => rgnET_239,
    rgnET_240 => rgnET_240,
    rgnET_241 => rgnET_241,
    rgnET_242 => rgnET_242,
    rgnET_243 => rgnET_243,
    rgnET_244 => rgnET_244,
    rgnET_245 => rgnET_245,
    rgnET_246 => rgnET_246,
    rgnET_247 => rgnET_247,
    rgnET_248 => rgnET_248,
    rgnET_249 => rgnET_249,
    rgnET_250 => rgnET_250,
    rgnET_251 => rgnET_251,
    rgnPhi_0 => rgnPhi_0,
    rgnPhi_1 => rgnPhi_1,
    rgnPhi_2 => rgnPhi_2,
    rgnPhi_3 => rgnPhi_3,
    rgnPhi_4 => rgnPhi_4,
    rgnPhi_5 => rgnPhi_5,
    rgnPhi_6 => rgnPhi_6,
    rgnPhi_7 => rgnPhi_7,
    rgnPhi_8 => rgnPhi_8,
    rgnPhi_9 => rgnPhi_9,
    rgnPhi_10 => rgnPhi_10,
    rgnPhi_11 => rgnPhi_11,
    rgnPhi_12 => rgnPhi_12,
    rgnPhi_13 => rgnPhi_13,
    rgnPhi_14 => rgnPhi_14,
    rgnPhi_15 => rgnPhi_15,
    rgnPhi_16 => rgnPhi_16,
    rgnPhi_17 => rgnPhi_17,
    MET_0 => MET_0,
    MET_1 => MET_1,
    MET_2 => MET_2
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file Make_LUT_MET_0.vhd when simulating
-- the core, Make_LUT_MET_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

