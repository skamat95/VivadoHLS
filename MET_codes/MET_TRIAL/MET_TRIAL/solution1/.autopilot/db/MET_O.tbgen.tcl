set C_TypeInfoList {{ 
"MET_O" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"rgn_in": [[], {"array": ["0", [252]]}] }, {"MET": [[], {"array": ["1", [3]]}] }],[],""], 
"0": [ "uint16_t", {"typedef": [[[], {"scalar": "unsigned short"}],""]}], 
"1": [ "ap_fixed<20, 17, 5, 3, 0>", {"hls_type": {"ap_fixed": [[[[], {"scalar": { "int": 20}}],[[], {"scalar": { "int": 17}}],[[], {"scalar": { "2": 5}}],[[], {"scalar": { "3": 3}}],[[], {"scalar": { "int": 0}}]],""]}}], 
"3": [ "ap_o_mode", {"enum": [[],[],[{"SC_SAT":  {"scalar": "__integer__"}},{"SC_SAT_ZERO":  {"scalar": "__integer__"}},{"SC_SAT_SYM":  {"scalar": "__integer__"}},{"SC_WRAP":  {"scalar": "__integer__"}},{"SC_WRAP_SM":  {"scalar": "__integer__"}}],""]}], 
"2": [ "ap_q_mode", {"enum": [[],[],[{"SC_RND":  {"scalar": "__integer__"}},{"SC_RND_ZERO":  {"scalar": "__integer__"}},{"SC_RND_MIN_INF":  {"scalar": "__integer__"}},{"SC_RND_INF":  {"scalar": "__integer__"}},{"SC_RND_CONV":  {"scalar": "__integer__"}},{"SC_TRN":  {"scalar": "__integer__"}},{"SC_TRN_ZERO":  {"scalar": "__integer__"}}],""]}]
}}
set moduleName MET_O
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {MET_O}
set C_modelType { void 0 }
set C_modelArgList {
	{ rgn_in_0 int 16 regular {pointer 0}  }
	{ rgn_in_1 int 16 regular {pointer 0}  }
	{ rgn_in_2 int 16 regular {pointer 0}  }
	{ rgn_in_3 int 16 regular {pointer 0}  }
	{ rgn_in_4 int 16 regular {pointer 0}  }
	{ rgn_in_5 int 16 regular {pointer 0}  }
	{ rgn_in_6 int 16 regular {pointer 0}  }
	{ rgn_in_7 int 16 regular {pointer 0}  }
	{ rgn_in_8 int 16 regular {pointer 0}  }
	{ rgn_in_9 int 16 regular {pointer 0}  }
	{ rgn_in_10 int 16 regular {pointer 0}  }
	{ rgn_in_11 int 16 regular {pointer 0}  }
	{ rgn_in_12 int 16 regular {pointer 0}  }
	{ rgn_in_13 int 16 regular {pointer 0}  }
	{ rgn_in_14 int 16 regular {pointer 0}  }
	{ rgn_in_15 int 16 regular {pointer 0}  }
	{ rgn_in_16 int 16 regular {pointer 0}  }
	{ rgn_in_17 int 16 regular {pointer 0}  }
	{ rgn_in_18 int 16 regular {pointer 0}  }
	{ rgn_in_19 int 16 regular {pointer 0}  }
	{ rgn_in_20 int 16 regular {pointer 0}  }
	{ rgn_in_21 int 16 regular {pointer 0}  }
	{ rgn_in_22 int 16 regular {pointer 0}  }
	{ rgn_in_23 int 16 regular {pointer 0}  }
	{ rgn_in_24 int 16 regular {pointer 0}  }
	{ rgn_in_25 int 16 regular {pointer 0}  }
	{ rgn_in_26 int 16 regular {pointer 0}  }
	{ rgn_in_27 int 16 regular {pointer 0}  }
	{ rgn_in_28 int 16 regular {pointer 0}  }
	{ rgn_in_29 int 16 regular {pointer 0}  }
	{ rgn_in_30 int 16 regular {pointer 0}  }
	{ rgn_in_31 int 16 regular {pointer 0}  }
	{ rgn_in_32 int 16 regular {pointer 0}  }
	{ rgn_in_33 int 16 regular {pointer 0}  }
	{ rgn_in_34 int 16 regular {pointer 0}  }
	{ rgn_in_35 int 16 regular {pointer 0}  }
	{ rgn_in_36 int 16 regular {pointer 0}  }
	{ rgn_in_37 int 16 regular {pointer 0}  }
	{ rgn_in_38 int 16 regular {pointer 0}  }
	{ rgn_in_39 int 16 regular {pointer 0}  }
	{ rgn_in_40 int 16 regular {pointer 0}  }
	{ rgn_in_41 int 16 regular {pointer 0}  }
	{ rgn_in_42 int 16 regular {pointer 0}  }
	{ rgn_in_43 int 16 regular {pointer 0}  }
	{ rgn_in_44 int 16 regular {pointer 0}  }
	{ rgn_in_45 int 16 regular {pointer 0}  }
	{ rgn_in_46 int 16 regular {pointer 0}  }
	{ rgn_in_47 int 16 regular {pointer 0}  }
	{ rgn_in_48 int 16 regular {pointer 0}  }
	{ rgn_in_49 int 16 regular {pointer 0}  }
	{ rgn_in_50 int 16 regular {pointer 0}  }
	{ rgn_in_51 int 16 regular {pointer 0}  }
	{ rgn_in_52 int 16 regular {pointer 0}  }
	{ rgn_in_53 int 16 regular {pointer 0}  }
	{ rgn_in_54 int 16 regular {pointer 0}  }
	{ rgn_in_55 int 16 regular {pointer 0}  }
	{ rgn_in_56 int 16 regular {pointer 0}  }
	{ rgn_in_57 int 16 regular {pointer 0}  }
	{ rgn_in_58 int 16 regular {pointer 0}  }
	{ rgn_in_59 int 16 regular {pointer 0}  }
	{ rgn_in_60 int 16 regular {pointer 0}  }
	{ rgn_in_61 int 16 regular {pointer 0}  }
	{ rgn_in_62 int 16 regular {pointer 0}  }
	{ rgn_in_63 int 16 regular {pointer 0}  }
	{ rgn_in_64 int 16 regular {pointer 0}  }
	{ rgn_in_65 int 16 regular {pointer 0}  }
	{ rgn_in_66 int 16 regular {pointer 0}  }
	{ rgn_in_67 int 16 regular {pointer 0}  }
	{ rgn_in_68 int 16 regular {pointer 0}  }
	{ rgn_in_69 int 16 regular {pointer 0}  }
	{ rgn_in_70 int 16 regular {pointer 0}  }
	{ rgn_in_71 int 16 regular {pointer 0}  }
	{ rgn_in_72 int 16 regular {pointer 0}  }
	{ rgn_in_73 int 16 regular {pointer 0}  }
	{ rgn_in_74 int 16 regular {pointer 0}  }
	{ rgn_in_75 int 16 regular {pointer 0}  }
	{ rgn_in_76 int 16 regular {pointer 0}  }
	{ rgn_in_77 int 16 regular {pointer 0}  }
	{ rgn_in_78 int 16 regular {pointer 0}  }
	{ rgn_in_79 int 16 regular {pointer 0}  }
	{ rgn_in_80 int 16 regular {pointer 0}  }
	{ rgn_in_81 int 16 regular {pointer 0}  }
	{ rgn_in_82 int 16 regular {pointer 0}  }
	{ rgn_in_83 int 16 regular {pointer 0}  }
	{ rgn_in_84 int 16 regular {pointer 0}  }
	{ rgn_in_85 int 16 regular {pointer 0}  }
	{ rgn_in_86 int 16 regular {pointer 0}  }
	{ rgn_in_87 int 16 regular {pointer 0}  }
	{ rgn_in_88 int 16 regular {pointer 0}  }
	{ rgn_in_89 int 16 regular {pointer 0}  }
	{ rgn_in_90 int 16 regular {pointer 0}  }
	{ rgn_in_91 int 16 regular {pointer 0}  }
	{ rgn_in_92 int 16 regular {pointer 0}  }
	{ rgn_in_93 int 16 regular {pointer 0}  }
	{ rgn_in_94 int 16 regular {pointer 0}  }
	{ rgn_in_95 int 16 regular {pointer 0}  }
	{ rgn_in_96 int 16 regular {pointer 0}  }
	{ rgn_in_97 int 16 regular {pointer 0}  }
	{ rgn_in_98 int 16 regular {pointer 0}  }
	{ rgn_in_99 int 16 regular {pointer 0}  }
	{ rgn_in_100 int 16 regular {pointer 0}  }
	{ rgn_in_101 int 16 regular {pointer 0}  }
	{ rgn_in_102 int 16 regular {pointer 0}  }
	{ rgn_in_103 int 16 regular {pointer 0}  }
	{ rgn_in_104 int 16 regular {pointer 0}  }
	{ rgn_in_105 int 16 regular {pointer 0}  }
	{ rgn_in_106 int 16 regular {pointer 0}  }
	{ rgn_in_107 int 16 regular {pointer 0}  }
	{ rgn_in_108 int 16 regular {pointer 0}  }
	{ rgn_in_109 int 16 regular {pointer 0}  }
	{ rgn_in_110 int 16 regular {pointer 0}  }
	{ rgn_in_111 int 16 regular {pointer 0}  }
	{ rgn_in_112 int 16 unused {pointer 0}  }
	{ rgn_in_113 int 16 unused {pointer 0}  }
	{ rgn_in_114 int 16 unused {pointer 0}  }
	{ rgn_in_115 int 16 unused {pointer 0}  }
	{ rgn_in_116 int 16 unused {pointer 0}  }
	{ rgn_in_117 int 16 unused {pointer 0}  }
	{ rgn_in_118 int 16 unused {pointer 0}  }
	{ rgn_in_119 int 16 unused {pointer 0}  }
	{ rgn_in_120 int 16 unused {pointer 0}  }
	{ rgn_in_121 int 16 unused {pointer 0}  }
	{ rgn_in_122 int 16 unused {pointer 0}  }
	{ rgn_in_123 int 16 unused {pointer 0}  }
	{ rgn_in_124 int 16 unused {pointer 0}  }
	{ rgn_in_125 int 16 unused {pointer 0}  }
	{ rgn_in_126 int 16 regular {pointer 0}  }
	{ rgn_in_127 int 16 regular {pointer 0}  }
	{ rgn_in_128 int 16 regular {pointer 0}  }
	{ rgn_in_129 int 16 regular {pointer 0}  }
	{ rgn_in_130 int 16 regular {pointer 0}  }
	{ rgn_in_131 int 16 regular {pointer 0}  }
	{ rgn_in_132 int 16 regular {pointer 0}  }
	{ rgn_in_133 int 16 regular {pointer 0}  }
	{ rgn_in_134 int 16 regular {pointer 0}  }
	{ rgn_in_135 int 16 regular {pointer 0}  }
	{ rgn_in_136 int 16 regular {pointer 0}  }
	{ rgn_in_137 int 16 regular {pointer 0}  }
	{ rgn_in_138 int 16 regular {pointer 0}  }
	{ rgn_in_139 int 16 regular {pointer 0}  }
	{ rgn_in_140 int 16 regular {pointer 0}  }
	{ rgn_in_141 int 16 regular {pointer 0}  }
	{ rgn_in_142 int 16 regular {pointer 0}  }
	{ rgn_in_143 int 16 regular {pointer 0}  }
	{ rgn_in_144 int 16 regular {pointer 0}  }
	{ rgn_in_145 int 16 regular {pointer 0}  }
	{ rgn_in_146 int 16 regular {pointer 0}  }
	{ rgn_in_147 int 16 regular {pointer 0}  }
	{ rgn_in_148 int 16 regular {pointer 0}  }
	{ rgn_in_149 int 16 regular {pointer 0}  }
	{ rgn_in_150 int 16 regular {pointer 0}  }
	{ rgn_in_151 int 16 regular {pointer 0}  }
	{ rgn_in_152 int 16 regular {pointer 0}  }
	{ rgn_in_153 int 16 regular {pointer 0}  }
	{ rgn_in_154 int 16 regular {pointer 0}  }
	{ rgn_in_155 int 16 regular {pointer 0}  }
	{ rgn_in_156 int 16 regular {pointer 0}  }
	{ rgn_in_157 int 16 regular {pointer 0}  }
	{ rgn_in_158 int 16 regular {pointer 0}  }
	{ rgn_in_159 int 16 regular {pointer 0}  }
	{ rgn_in_160 int 16 regular {pointer 0}  }
	{ rgn_in_161 int 16 regular {pointer 0}  }
	{ rgn_in_162 int 16 regular {pointer 0}  }
	{ rgn_in_163 int 16 regular {pointer 0}  }
	{ rgn_in_164 int 16 regular {pointer 0}  }
	{ rgn_in_165 int 16 regular {pointer 0}  }
	{ rgn_in_166 int 16 regular {pointer 0}  }
	{ rgn_in_167 int 16 regular {pointer 0}  }
	{ rgn_in_168 int 16 regular {pointer 0}  }
	{ rgn_in_169 int 16 regular {pointer 0}  }
	{ rgn_in_170 int 16 regular {pointer 0}  }
	{ rgn_in_171 int 16 regular {pointer 0}  }
	{ rgn_in_172 int 16 regular {pointer 0}  }
	{ rgn_in_173 int 16 regular {pointer 0}  }
	{ rgn_in_174 int 16 regular {pointer 0}  }
	{ rgn_in_175 int 16 regular {pointer 0}  }
	{ rgn_in_176 int 16 regular {pointer 0}  }
	{ rgn_in_177 int 16 regular {pointer 0}  }
	{ rgn_in_178 int 16 regular {pointer 0}  }
	{ rgn_in_179 int 16 regular {pointer 0}  }
	{ rgn_in_180 int 16 regular {pointer 0}  }
	{ rgn_in_181 int 16 regular {pointer 0}  }
	{ rgn_in_182 int 16 regular {pointer 0}  }
	{ rgn_in_183 int 16 regular {pointer 0}  }
	{ rgn_in_184 int 16 regular {pointer 0}  }
	{ rgn_in_185 int 16 regular {pointer 0}  }
	{ rgn_in_186 int 16 regular {pointer 0}  }
	{ rgn_in_187 int 16 regular {pointer 0}  }
	{ rgn_in_188 int 16 regular {pointer 0}  }
	{ rgn_in_189 int 16 regular {pointer 0}  }
	{ rgn_in_190 int 16 regular {pointer 0}  }
	{ rgn_in_191 int 16 regular {pointer 0}  }
	{ rgn_in_192 int 16 regular {pointer 0}  }
	{ rgn_in_193 int 16 regular {pointer 0}  }
	{ rgn_in_194 int 16 regular {pointer 0}  }
	{ rgn_in_195 int 16 regular {pointer 0}  }
	{ rgn_in_196 int 16 regular {pointer 0}  }
	{ rgn_in_197 int 16 regular {pointer 0}  }
	{ rgn_in_198 int 16 regular {pointer 0}  }
	{ rgn_in_199 int 16 regular {pointer 0}  }
	{ rgn_in_200 int 16 regular {pointer 0}  }
	{ rgn_in_201 int 16 regular {pointer 0}  }
	{ rgn_in_202 int 16 regular {pointer 0}  }
	{ rgn_in_203 int 16 regular {pointer 0}  }
	{ rgn_in_204 int 16 regular {pointer 0}  }
	{ rgn_in_205 int 16 regular {pointer 0}  }
	{ rgn_in_206 int 16 regular {pointer 0}  }
	{ rgn_in_207 int 16 regular {pointer 0}  }
	{ rgn_in_208 int 16 regular {pointer 0}  }
	{ rgn_in_209 int 16 regular {pointer 0}  }
	{ rgn_in_210 int 16 regular {pointer 0}  }
	{ rgn_in_211 int 16 regular {pointer 0}  }
	{ rgn_in_212 int 16 regular {pointer 0}  }
	{ rgn_in_213 int 16 regular {pointer 0}  }
	{ rgn_in_214 int 16 regular {pointer 0}  }
	{ rgn_in_215 int 16 regular {pointer 0}  }
	{ rgn_in_216 int 16 regular {pointer 0}  }
	{ rgn_in_217 int 16 regular {pointer 0}  }
	{ rgn_in_218 int 16 regular {pointer 0}  }
	{ rgn_in_219 int 16 regular {pointer 0}  }
	{ rgn_in_220 int 16 regular {pointer 0}  }
	{ rgn_in_221 int 16 regular {pointer 0}  }
	{ rgn_in_222 int 16 regular {pointer 0}  }
	{ rgn_in_223 int 16 regular {pointer 0}  }
	{ rgn_in_224 int 16 regular {pointer 0}  }
	{ rgn_in_225 int 16 regular {pointer 0}  }
	{ rgn_in_226 int 16 regular {pointer 0}  }
	{ rgn_in_227 int 16 regular {pointer 0}  }
	{ rgn_in_228 int 16 regular {pointer 0}  }
	{ rgn_in_229 int 16 regular {pointer 0}  }
	{ rgn_in_230 int 16 regular {pointer 0}  }
	{ rgn_in_231 int 16 regular {pointer 0}  }
	{ rgn_in_232 int 16 regular {pointer 0}  }
	{ rgn_in_233 int 16 regular {pointer 0}  }
	{ rgn_in_234 int 16 regular {pointer 0}  }
	{ rgn_in_235 int 16 regular {pointer 0}  }
	{ rgn_in_236 int 16 regular {pointer 0}  }
	{ rgn_in_237 int 16 regular {pointer 0}  }
	{ rgn_in_238 int 16 regular {pointer 0}  }
	{ rgn_in_239 int 16 regular {pointer 0}  }
	{ rgn_in_240 int 16 regular {pointer 0}  }
	{ rgn_in_241 int 16 regular {pointer 0}  }
	{ rgn_in_242 int 16 regular {pointer 0}  }
	{ rgn_in_243 int 16 regular {pointer 0}  }
	{ rgn_in_244 int 16 regular {pointer 0}  }
	{ rgn_in_245 int 16 regular {pointer 0}  }
	{ rgn_in_246 int 16 regular {pointer 0}  }
	{ rgn_in_247 int 16 regular {pointer 0}  }
	{ rgn_in_248 int 16 regular {pointer 0}  }
	{ rgn_in_249 int 16 regular {pointer 0}  }
	{ rgn_in_250 int 16 regular {pointer 0}  }
	{ rgn_in_251 int 16 regular {pointer 0}  }
	{ MET_0_V int 20 regular {pointer 1}  }
	{ MET_1_V int 20 regular {pointer 1}  }
	{ MET_2_V int 20 unused {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rgn_in_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_15", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_17", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_18", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 18,"up" : 18,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_19", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 19,"up" : 19,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_20", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 20,"up" : 20,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_21", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 21,"up" : 21,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_22", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 22,"up" : 22,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_23", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 23,"up" : 23,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_24", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 24,"up" : 24,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_25", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 25,"up" : 25,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_26", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 26,"up" : 26,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_27", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 27,"up" : 27,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_28", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 28,"up" : 28,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_29", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 29,"up" : 29,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_30", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 30,"up" : 30,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_31", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 31,"up" : 31,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_32", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 32,"up" : 32,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_33", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 33,"up" : 33,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_34", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 34,"up" : 34,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_35", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 35,"up" : 35,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_36", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 36,"up" : 36,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_37", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 37,"up" : 37,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_38", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 38,"up" : 38,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_39", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 39,"up" : 39,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_40", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 40,"up" : 40,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_41", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 41,"up" : 41,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_42", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 42,"up" : 42,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_43", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 43,"up" : 43,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_44", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 44,"up" : 44,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_45", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 45,"up" : 45,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_46", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 46,"up" : 46,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_47", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 47,"up" : 47,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_48", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 48,"up" : 48,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_49", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 49,"up" : 49,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_50", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 50,"up" : 50,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_51", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 51,"up" : 51,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_52", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 52,"up" : 52,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_53", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 53,"up" : 53,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_54", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 54,"up" : 54,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_55", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 55,"up" : 55,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_56", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 56,"up" : 56,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_57", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 57,"up" : 57,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_58", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 58,"up" : 58,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_59", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 59,"up" : 59,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_60", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 60,"up" : 60,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_61", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 61,"up" : 61,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_62", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 62,"up" : 62,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_63", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 63,"up" : 63,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_64", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 64,"up" : 64,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_65", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 65,"up" : 65,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_66", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 66,"up" : 66,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_67", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 67,"up" : 67,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_68", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 68,"up" : 68,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_69", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 69,"up" : 69,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_70", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 70,"up" : 70,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_71", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 71,"up" : 71,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_72", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 72,"up" : 72,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_73", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 73,"up" : 73,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_74", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 74,"up" : 74,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_75", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 75,"up" : 75,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_76", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 76,"up" : 76,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_77", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 77,"up" : 77,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_78", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 78,"up" : 78,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_79", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 79,"up" : 79,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_80", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 80,"up" : 80,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_81", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 81,"up" : 81,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_82", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 82,"up" : 82,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_83", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 83,"up" : 83,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_84", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 84,"up" : 84,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_85", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 85,"up" : 85,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_86", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 86,"up" : 86,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_87", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 87,"up" : 87,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_88", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 88,"up" : 88,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_89", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 89,"up" : 89,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_90", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 90,"up" : 90,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_91", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 91,"up" : 91,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_92", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 92,"up" : 92,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_93", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 93,"up" : 93,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_94", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 94,"up" : 94,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_95", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 95,"up" : 95,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_96", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 96,"up" : 96,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_97", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 97,"up" : 97,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_98", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 98,"up" : 98,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_99", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 99,"up" : 99,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_100", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 100,"up" : 100,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_101", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 101,"up" : 101,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_102", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 102,"up" : 102,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_103", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 103,"up" : 103,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_104", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 104,"up" : 104,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_105", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 105,"up" : 105,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_106", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 106,"up" : 106,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_107", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 107,"up" : 107,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_108", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 108,"up" : 108,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_109", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 109,"up" : 109,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_110", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 110,"up" : 110,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_111", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 111,"up" : 111,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_112", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 112,"up" : 112,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_113", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 113,"up" : 113,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_114", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 114,"up" : 114,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_115", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 115,"up" : 115,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_116", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 116,"up" : 116,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_117", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 117,"up" : 117,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_118", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 118,"up" : 118,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_119", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 119,"up" : 119,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_120", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 120,"up" : 120,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_121", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 121,"up" : 121,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_122", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 122,"up" : 122,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_123", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 123,"up" : 123,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_124", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 124,"up" : 124,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_125", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 125,"up" : 125,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_126", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 126,"up" : 126,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_127", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 127,"up" : 127,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_128", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 128,"up" : 128,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_129", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 129,"up" : 129,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_130", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 130,"up" : 130,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_131", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 131,"up" : 131,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_132", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 132,"up" : 132,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_133", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 133,"up" : 133,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_134", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 134,"up" : 134,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_135", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 135,"up" : 135,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_136", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 136,"up" : 136,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_137", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 137,"up" : 137,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_138", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 138,"up" : 138,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_139", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 139,"up" : 139,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_140", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 140,"up" : 140,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_141", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 141,"up" : 141,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_142", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 142,"up" : 142,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_143", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 143,"up" : 143,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_144", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 144,"up" : 144,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_145", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 145,"up" : 145,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_146", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 146,"up" : 146,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_147", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 147,"up" : 147,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_148", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 148,"up" : 148,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_149", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 149,"up" : 149,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_150", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 150,"up" : 150,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_151", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 151,"up" : 151,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_152", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 152,"up" : 152,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_153", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 153,"up" : 153,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_154", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 154,"up" : 154,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_155", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 155,"up" : 155,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_156", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 156,"up" : 156,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_157", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 157,"up" : 157,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_158", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 158,"up" : 158,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_159", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 159,"up" : 159,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_160", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 160,"up" : 160,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_161", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 161,"up" : 161,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_162", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 162,"up" : 162,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_163", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 163,"up" : 163,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_164", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 164,"up" : 164,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_165", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 165,"up" : 165,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_166", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 166,"up" : 166,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_167", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 167,"up" : 167,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_168", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 168,"up" : 168,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_169", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 169,"up" : 169,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_170", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 170,"up" : 170,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_171", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 171,"up" : 171,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_172", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 172,"up" : 172,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_173", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 173,"up" : 173,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_174", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 174,"up" : 174,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_175", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 175,"up" : 175,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_176", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 176,"up" : 176,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_177", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 177,"up" : 177,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_178", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 178,"up" : 178,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_179", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 179,"up" : 179,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_180", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 180,"up" : 180,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_181", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 181,"up" : 181,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_182", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 182,"up" : 182,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_183", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 183,"up" : 183,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_184", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 184,"up" : 184,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_185", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 185,"up" : 185,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_186", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 186,"up" : 186,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_187", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 187,"up" : 187,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_188", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 188,"up" : 188,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_189", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 189,"up" : 189,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_190", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 190,"up" : 190,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_191", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 191,"up" : 191,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_192", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 192,"up" : 192,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_193", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 193,"up" : 193,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_194", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 194,"up" : 194,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_195", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 195,"up" : 195,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_196", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 196,"up" : 196,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_197", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 197,"up" : 197,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_198", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 198,"up" : 198,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_199", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 199,"up" : 199,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_200", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 200,"up" : 200,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_201", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 201,"up" : 201,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_202", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 202,"up" : 202,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_203", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 203,"up" : 203,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_204", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 204,"up" : 204,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_205", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 205,"up" : 205,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_206", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 206,"up" : 206,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_207", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 207,"up" : 207,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_208", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 208,"up" : 208,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_209", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 209,"up" : 209,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_210", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 210,"up" : 210,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_211", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 211,"up" : 211,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_212", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 212,"up" : 212,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_213", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 213,"up" : 213,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_214", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 214,"up" : 214,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_215", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 215,"up" : 215,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_216", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 216,"up" : 216,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_217", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 217,"up" : 217,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_218", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 218,"up" : 218,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_219", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 219,"up" : 219,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_220", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 220,"up" : 220,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_221", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 221,"up" : 221,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_222", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 222,"up" : 222,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_223", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 223,"up" : 223,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_224", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 224,"up" : 224,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_225", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 225,"up" : 225,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_226", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 226,"up" : 226,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_227", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 227,"up" : 227,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_228", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 228,"up" : 228,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_229", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 229,"up" : 229,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_230", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 230,"up" : 230,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_231", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 231,"up" : 231,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_232", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 232,"up" : 232,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_233", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 233,"up" : 233,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_234", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 234,"up" : 234,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_235", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 235,"up" : 235,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_236", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 236,"up" : 236,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_237", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 237,"up" : 237,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_238", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 238,"up" : 238,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_239", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 239,"up" : 239,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_240", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 240,"up" : 240,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_241", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 241,"up" : 241,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_242", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 242,"up" : 242,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_243", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 243,"up" : 243,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_244", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 244,"up" : 244,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_245", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 245,"up" : 245,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_246", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 246,"up" : 246,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_247", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 247,"up" : 247,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_248", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 248,"up" : 248,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_249", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 249,"up" : 249,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_250", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 250,"up" : 250,"step" : 2}]}]}]} , 
 	{ "Name" : "rgn_in_251", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rgn_in","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 251,"up" : 251,"step" : 2}]}]}]} , 
 	{ "Name" : "MET_0_V", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":19,"cElement": [{"cName": "MET.V","cData": "int20","bit_use": { "low": 0,"up": 19},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "MET_1_V", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":19,"cElement": [{"cName": "MET.V","cData": "int20","bit_use": { "low": 0,"up": 19},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "MET_2_V", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY", "bitSlice":[{"low":0,"up":19,"cElement": [{"cName": "MET.V","cData": "int20","bit_use": { "low": 0,"up": 19},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} ]}
# RTL Port declarations: 
set portNum 263
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rgn_in_0 sc_in sc_lv 16 signal 0 } 
	{ rgn_in_1 sc_in sc_lv 16 signal 1 } 
	{ rgn_in_2 sc_in sc_lv 16 signal 2 } 
	{ rgn_in_3 sc_in sc_lv 16 signal 3 } 
	{ rgn_in_4 sc_in sc_lv 16 signal 4 } 
	{ rgn_in_5 sc_in sc_lv 16 signal 5 } 
	{ rgn_in_6 sc_in sc_lv 16 signal 6 } 
	{ rgn_in_7 sc_in sc_lv 16 signal 7 } 
	{ rgn_in_8 sc_in sc_lv 16 signal 8 } 
	{ rgn_in_9 sc_in sc_lv 16 signal 9 } 
	{ rgn_in_10 sc_in sc_lv 16 signal 10 } 
	{ rgn_in_11 sc_in sc_lv 16 signal 11 } 
	{ rgn_in_12 sc_in sc_lv 16 signal 12 } 
	{ rgn_in_13 sc_in sc_lv 16 signal 13 } 
	{ rgn_in_14 sc_in sc_lv 16 signal 14 } 
	{ rgn_in_15 sc_in sc_lv 16 signal 15 } 
	{ rgn_in_16 sc_in sc_lv 16 signal 16 } 
	{ rgn_in_17 sc_in sc_lv 16 signal 17 } 
	{ rgn_in_18 sc_in sc_lv 16 signal 18 } 
	{ rgn_in_19 sc_in sc_lv 16 signal 19 } 
	{ rgn_in_20 sc_in sc_lv 16 signal 20 } 
	{ rgn_in_21 sc_in sc_lv 16 signal 21 } 
	{ rgn_in_22 sc_in sc_lv 16 signal 22 } 
	{ rgn_in_23 sc_in sc_lv 16 signal 23 } 
	{ rgn_in_24 sc_in sc_lv 16 signal 24 } 
	{ rgn_in_25 sc_in sc_lv 16 signal 25 } 
	{ rgn_in_26 sc_in sc_lv 16 signal 26 } 
	{ rgn_in_27 sc_in sc_lv 16 signal 27 } 
	{ rgn_in_28 sc_in sc_lv 16 signal 28 } 
	{ rgn_in_29 sc_in sc_lv 16 signal 29 } 
	{ rgn_in_30 sc_in sc_lv 16 signal 30 } 
	{ rgn_in_31 sc_in sc_lv 16 signal 31 } 
	{ rgn_in_32 sc_in sc_lv 16 signal 32 } 
	{ rgn_in_33 sc_in sc_lv 16 signal 33 } 
	{ rgn_in_34 sc_in sc_lv 16 signal 34 } 
	{ rgn_in_35 sc_in sc_lv 16 signal 35 } 
	{ rgn_in_36 sc_in sc_lv 16 signal 36 } 
	{ rgn_in_37 sc_in sc_lv 16 signal 37 } 
	{ rgn_in_38 sc_in sc_lv 16 signal 38 } 
	{ rgn_in_39 sc_in sc_lv 16 signal 39 } 
	{ rgn_in_40 sc_in sc_lv 16 signal 40 } 
	{ rgn_in_41 sc_in sc_lv 16 signal 41 } 
	{ rgn_in_42 sc_in sc_lv 16 signal 42 } 
	{ rgn_in_43 sc_in sc_lv 16 signal 43 } 
	{ rgn_in_44 sc_in sc_lv 16 signal 44 } 
	{ rgn_in_45 sc_in sc_lv 16 signal 45 } 
	{ rgn_in_46 sc_in sc_lv 16 signal 46 } 
	{ rgn_in_47 sc_in sc_lv 16 signal 47 } 
	{ rgn_in_48 sc_in sc_lv 16 signal 48 } 
	{ rgn_in_49 sc_in sc_lv 16 signal 49 } 
	{ rgn_in_50 sc_in sc_lv 16 signal 50 } 
	{ rgn_in_51 sc_in sc_lv 16 signal 51 } 
	{ rgn_in_52 sc_in sc_lv 16 signal 52 } 
	{ rgn_in_53 sc_in sc_lv 16 signal 53 } 
	{ rgn_in_54 sc_in sc_lv 16 signal 54 } 
	{ rgn_in_55 sc_in sc_lv 16 signal 55 } 
	{ rgn_in_56 sc_in sc_lv 16 signal 56 } 
	{ rgn_in_57 sc_in sc_lv 16 signal 57 } 
	{ rgn_in_58 sc_in sc_lv 16 signal 58 } 
	{ rgn_in_59 sc_in sc_lv 16 signal 59 } 
	{ rgn_in_60 sc_in sc_lv 16 signal 60 } 
	{ rgn_in_61 sc_in sc_lv 16 signal 61 } 
	{ rgn_in_62 sc_in sc_lv 16 signal 62 } 
	{ rgn_in_63 sc_in sc_lv 16 signal 63 } 
	{ rgn_in_64 sc_in sc_lv 16 signal 64 } 
	{ rgn_in_65 sc_in sc_lv 16 signal 65 } 
	{ rgn_in_66 sc_in sc_lv 16 signal 66 } 
	{ rgn_in_67 sc_in sc_lv 16 signal 67 } 
	{ rgn_in_68 sc_in sc_lv 16 signal 68 } 
	{ rgn_in_69 sc_in sc_lv 16 signal 69 } 
	{ rgn_in_70 sc_in sc_lv 16 signal 70 } 
	{ rgn_in_71 sc_in sc_lv 16 signal 71 } 
	{ rgn_in_72 sc_in sc_lv 16 signal 72 } 
	{ rgn_in_73 sc_in sc_lv 16 signal 73 } 
	{ rgn_in_74 sc_in sc_lv 16 signal 74 } 
	{ rgn_in_75 sc_in sc_lv 16 signal 75 } 
	{ rgn_in_76 sc_in sc_lv 16 signal 76 } 
	{ rgn_in_77 sc_in sc_lv 16 signal 77 } 
	{ rgn_in_78 sc_in sc_lv 16 signal 78 } 
	{ rgn_in_79 sc_in sc_lv 16 signal 79 } 
	{ rgn_in_80 sc_in sc_lv 16 signal 80 } 
	{ rgn_in_81 sc_in sc_lv 16 signal 81 } 
	{ rgn_in_82 sc_in sc_lv 16 signal 82 } 
	{ rgn_in_83 sc_in sc_lv 16 signal 83 } 
	{ rgn_in_84 sc_in sc_lv 16 signal 84 } 
	{ rgn_in_85 sc_in sc_lv 16 signal 85 } 
	{ rgn_in_86 sc_in sc_lv 16 signal 86 } 
	{ rgn_in_87 sc_in sc_lv 16 signal 87 } 
	{ rgn_in_88 sc_in sc_lv 16 signal 88 } 
	{ rgn_in_89 sc_in sc_lv 16 signal 89 } 
	{ rgn_in_90 sc_in sc_lv 16 signal 90 } 
	{ rgn_in_91 sc_in sc_lv 16 signal 91 } 
	{ rgn_in_92 sc_in sc_lv 16 signal 92 } 
	{ rgn_in_93 sc_in sc_lv 16 signal 93 } 
	{ rgn_in_94 sc_in sc_lv 16 signal 94 } 
	{ rgn_in_95 sc_in sc_lv 16 signal 95 } 
	{ rgn_in_96 sc_in sc_lv 16 signal 96 } 
	{ rgn_in_97 sc_in sc_lv 16 signal 97 } 
	{ rgn_in_98 sc_in sc_lv 16 signal 98 } 
	{ rgn_in_99 sc_in sc_lv 16 signal 99 } 
	{ rgn_in_100 sc_in sc_lv 16 signal 100 } 
	{ rgn_in_101 sc_in sc_lv 16 signal 101 } 
	{ rgn_in_102 sc_in sc_lv 16 signal 102 } 
	{ rgn_in_103 sc_in sc_lv 16 signal 103 } 
	{ rgn_in_104 sc_in sc_lv 16 signal 104 } 
	{ rgn_in_105 sc_in sc_lv 16 signal 105 } 
	{ rgn_in_106 sc_in sc_lv 16 signal 106 } 
	{ rgn_in_107 sc_in sc_lv 16 signal 107 } 
	{ rgn_in_108 sc_in sc_lv 16 signal 108 } 
	{ rgn_in_109 sc_in sc_lv 16 signal 109 } 
	{ rgn_in_110 sc_in sc_lv 16 signal 110 } 
	{ rgn_in_111 sc_in sc_lv 16 signal 111 } 
	{ rgn_in_112 sc_in sc_lv 16 signal 112 } 
	{ rgn_in_113 sc_in sc_lv 16 signal 113 } 
	{ rgn_in_114 sc_in sc_lv 16 signal 114 } 
	{ rgn_in_115 sc_in sc_lv 16 signal 115 } 
	{ rgn_in_116 sc_in sc_lv 16 signal 116 } 
	{ rgn_in_117 sc_in sc_lv 16 signal 117 } 
	{ rgn_in_118 sc_in sc_lv 16 signal 118 } 
	{ rgn_in_119 sc_in sc_lv 16 signal 119 } 
	{ rgn_in_120 sc_in sc_lv 16 signal 120 } 
	{ rgn_in_121 sc_in sc_lv 16 signal 121 } 
	{ rgn_in_122 sc_in sc_lv 16 signal 122 } 
	{ rgn_in_123 sc_in sc_lv 16 signal 123 } 
	{ rgn_in_124 sc_in sc_lv 16 signal 124 } 
	{ rgn_in_125 sc_in sc_lv 16 signal 125 } 
	{ rgn_in_126 sc_in sc_lv 16 signal 126 } 
	{ rgn_in_127 sc_in sc_lv 16 signal 127 } 
	{ rgn_in_128 sc_in sc_lv 16 signal 128 } 
	{ rgn_in_129 sc_in sc_lv 16 signal 129 } 
	{ rgn_in_130 sc_in sc_lv 16 signal 130 } 
	{ rgn_in_131 sc_in sc_lv 16 signal 131 } 
	{ rgn_in_132 sc_in sc_lv 16 signal 132 } 
	{ rgn_in_133 sc_in sc_lv 16 signal 133 } 
	{ rgn_in_134 sc_in sc_lv 16 signal 134 } 
	{ rgn_in_135 sc_in sc_lv 16 signal 135 } 
	{ rgn_in_136 sc_in sc_lv 16 signal 136 } 
	{ rgn_in_137 sc_in sc_lv 16 signal 137 } 
	{ rgn_in_138 sc_in sc_lv 16 signal 138 } 
	{ rgn_in_139 sc_in sc_lv 16 signal 139 } 
	{ rgn_in_140 sc_in sc_lv 16 signal 140 } 
	{ rgn_in_141 sc_in sc_lv 16 signal 141 } 
	{ rgn_in_142 sc_in sc_lv 16 signal 142 } 
	{ rgn_in_143 sc_in sc_lv 16 signal 143 } 
	{ rgn_in_144 sc_in sc_lv 16 signal 144 } 
	{ rgn_in_145 sc_in sc_lv 16 signal 145 } 
	{ rgn_in_146 sc_in sc_lv 16 signal 146 } 
	{ rgn_in_147 sc_in sc_lv 16 signal 147 } 
	{ rgn_in_148 sc_in sc_lv 16 signal 148 } 
	{ rgn_in_149 sc_in sc_lv 16 signal 149 } 
	{ rgn_in_150 sc_in sc_lv 16 signal 150 } 
	{ rgn_in_151 sc_in sc_lv 16 signal 151 } 
	{ rgn_in_152 sc_in sc_lv 16 signal 152 } 
	{ rgn_in_153 sc_in sc_lv 16 signal 153 } 
	{ rgn_in_154 sc_in sc_lv 16 signal 154 } 
	{ rgn_in_155 sc_in sc_lv 16 signal 155 } 
	{ rgn_in_156 sc_in sc_lv 16 signal 156 } 
	{ rgn_in_157 sc_in sc_lv 16 signal 157 } 
	{ rgn_in_158 sc_in sc_lv 16 signal 158 } 
	{ rgn_in_159 sc_in sc_lv 16 signal 159 } 
	{ rgn_in_160 sc_in sc_lv 16 signal 160 } 
	{ rgn_in_161 sc_in sc_lv 16 signal 161 } 
	{ rgn_in_162 sc_in sc_lv 16 signal 162 } 
	{ rgn_in_163 sc_in sc_lv 16 signal 163 } 
	{ rgn_in_164 sc_in sc_lv 16 signal 164 } 
	{ rgn_in_165 sc_in sc_lv 16 signal 165 } 
	{ rgn_in_166 sc_in sc_lv 16 signal 166 } 
	{ rgn_in_167 sc_in sc_lv 16 signal 167 } 
	{ rgn_in_168 sc_in sc_lv 16 signal 168 } 
	{ rgn_in_169 sc_in sc_lv 16 signal 169 } 
	{ rgn_in_170 sc_in sc_lv 16 signal 170 } 
	{ rgn_in_171 sc_in sc_lv 16 signal 171 } 
	{ rgn_in_172 sc_in sc_lv 16 signal 172 } 
	{ rgn_in_173 sc_in sc_lv 16 signal 173 } 
	{ rgn_in_174 sc_in sc_lv 16 signal 174 } 
	{ rgn_in_175 sc_in sc_lv 16 signal 175 } 
	{ rgn_in_176 sc_in sc_lv 16 signal 176 } 
	{ rgn_in_177 sc_in sc_lv 16 signal 177 } 
	{ rgn_in_178 sc_in sc_lv 16 signal 178 } 
	{ rgn_in_179 sc_in sc_lv 16 signal 179 } 
	{ rgn_in_180 sc_in sc_lv 16 signal 180 } 
	{ rgn_in_181 sc_in sc_lv 16 signal 181 } 
	{ rgn_in_182 sc_in sc_lv 16 signal 182 } 
	{ rgn_in_183 sc_in sc_lv 16 signal 183 } 
	{ rgn_in_184 sc_in sc_lv 16 signal 184 } 
	{ rgn_in_185 sc_in sc_lv 16 signal 185 } 
	{ rgn_in_186 sc_in sc_lv 16 signal 186 } 
	{ rgn_in_187 sc_in sc_lv 16 signal 187 } 
	{ rgn_in_188 sc_in sc_lv 16 signal 188 } 
	{ rgn_in_189 sc_in sc_lv 16 signal 189 } 
	{ rgn_in_190 sc_in sc_lv 16 signal 190 } 
	{ rgn_in_191 sc_in sc_lv 16 signal 191 } 
	{ rgn_in_192 sc_in sc_lv 16 signal 192 } 
	{ rgn_in_193 sc_in sc_lv 16 signal 193 } 
	{ rgn_in_194 sc_in sc_lv 16 signal 194 } 
	{ rgn_in_195 sc_in sc_lv 16 signal 195 } 
	{ rgn_in_196 sc_in sc_lv 16 signal 196 } 
	{ rgn_in_197 sc_in sc_lv 16 signal 197 } 
	{ rgn_in_198 sc_in sc_lv 16 signal 198 } 
	{ rgn_in_199 sc_in sc_lv 16 signal 199 } 
	{ rgn_in_200 sc_in sc_lv 16 signal 200 } 
	{ rgn_in_201 sc_in sc_lv 16 signal 201 } 
	{ rgn_in_202 sc_in sc_lv 16 signal 202 } 
	{ rgn_in_203 sc_in sc_lv 16 signal 203 } 
	{ rgn_in_204 sc_in sc_lv 16 signal 204 } 
	{ rgn_in_205 sc_in sc_lv 16 signal 205 } 
	{ rgn_in_206 sc_in sc_lv 16 signal 206 } 
	{ rgn_in_207 sc_in sc_lv 16 signal 207 } 
	{ rgn_in_208 sc_in sc_lv 16 signal 208 } 
	{ rgn_in_209 sc_in sc_lv 16 signal 209 } 
	{ rgn_in_210 sc_in sc_lv 16 signal 210 } 
	{ rgn_in_211 sc_in sc_lv 16 signal 211 } 
	{ rgn_in_212 sc_in sc_lv 16 signal 212 } 
	{ rgn_in_213 sc_in sc_lv 16 signal 213 } 
	{ rgn_in_214 sc_in sc_lv 16 signal 214 } 
	{ rgn_in_215 sc_in sc_lv 16 signal 215 } 
	{ rgn_in_216 sc_in sc_lv 16 signal 216 } 
	{ rgn_in_217 sc_in sc_lv 16 signal 217 } 
	{ rgn_in_218 sc_in sc_lv 16 signal 218 } 
	{ rgn_in_219 sc_in sc_lv 16 signal 219 } 
	{ rgn_in_220 sc_in sc_lv 16 signal 220 } 
	{ rgn_in_221 sc_in sc_lv 16 signal 221 } 
	{ rgn_in_222 sc_in sc_lv 16 signal 222 } 
	{ rgn_in_223 sc_in sc_lv 16 signal 223 } 
	{ rgn_in_224 sc_in sc_lv 16 signal 224 } 
	{ rgn_in_225 sc_in sc_lv 16 signal 225 } 
	{ rgn_in_226 sc_in sc_lv 16 signal 226 } 
	{ rgn_in_227 sc_in sc_lv 16 signal 227 } 
	{ rgn_in_228 sc_in sc_lv 16 signal 228 } 
	{ rgn_in_229 sc_in sc_lv 16 signal 229 } 
	{ rgn_in_230 sc_in sc_lv 16 signal 230 } 
	{ rgn_in_231 sc_in sc_lv 16 signal 231 } 
	{ rgn_in_232 sc_in sc_lv 16 signal 232 } 
	{ rgn_in_233 sc_in sc_lv 16 signal 233 } 
	{ rgn_in_234 sc_in sc_lv 16 signal 234 } 
	{ rgn_in_235 sc_in sc_lv 16 signal 235 } 
	{ rgn_in_236 sc_in sc_lv 16 signal 236 } 
	{ rgn_in_237 sc_in sc_lv 16 signal 237 } 
	{ rgn_in_238 sc_in sc_lv 16 signal 238 } 
	{ rgn_in_239 sc_in sc_lv 16 signal 239 } 
	{ rgn_in_240 sc_in sc_lv 16 signal 240 } 
	{ rgn_in_241 sc_in sc_lv 16 signal 241 } 
	{ rgn_in_242 sc_in sc_lv 16 signal 242 } 
	{ rgn_in_243 sc_in sc_lv 16 signal 243 } 
	{ rgn_in_244 sc_in sc_lv 16 signal 244 } 
	{ rgn_in_245 sc_in sc_lv 16 signal 245 } 
	{ rgn_in_246 sc_in sc_lv 16 signal 246 } 
	{ rgn_in_247 sc_in sc_lv 16 signal 247 } 
	{ rgn_in_248 sc_in sc_lv 16 signal 248 } 
	{ rgn_in_249 sc_in sc_lv 16 signal 249 } 
	{ rgn_in_250 sc_in sc_lv 16 signal 250 } 
	{ rgn_in_251 sc_in sc_lv 16 signal 251 } 
	{ MET_0_V sc_out sc_lv 20 signal 252 } 
	{ MET_0_V_ap_vld sc_out sc_logic 1 outvld 252 } 
	{ MET_1_V sc_out sc_lv 20 signal 253 } 
	{ MET_1_V_ap_vld sc_out sc_logic 1 outvld 253 } 
	{ MET_2_V sc_in sc_lv 20 signal 254 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rgn_in_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_0", "role": "default" }} , 
 	{ "name": "rgn_in_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_1", "role": "default" }} , 
 	{ "name": "rgn_in_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_2", "role": "default" }} , 
 	{ "name": "rgn_in_3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_3", "role": "default" }} , 
 	{ "name": "rgn_in_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_4", "role": "default" }} , 
 	{ "name": "rgn_in_5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_5", "role": "default" }} , 
 	{ "name": "rgn_in_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_6", "role": "default" }} , 
 	{ "name": "rgn_in_7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_7", "role": "default" }} , 
 	{ "name": "rgn_in_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_8", "role": "default" }} , 
 	{ "name": "rgn_in_9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_9", "role": "default" }} , 
 	{ "name": "rgn_in_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_10", "role": "default" }} , 
 	{ "name": "rgn_in_11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_11", "role": "default" }} , 
 	{ "name": "rgn_in_12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_12", "role": "default" }} , 
 	{ "name": "rgn_in_13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_13", "role": "default" }} , 
 	{ "name": "rgn_in_14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_14", "role": "default" }} , 
 	{ "name": "rgn_in_15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_15", "role": "default" }} , 
 	{ "name": "rgn_in_16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_16", "role": "default" }} , 
 	{ "name": "rgn_in_17", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_17", "role": "default" }} , 
 	{ "name": "rgn_in_18", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_18", "role": "default" }} , 
 	{ "name": "rgn_in_19", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_19", "role": "default" }} , 
 	{ "name": "rgn_in_20", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_20", "role": "default" }} , 
 	{ "name": "rgn_in_21", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_21", "role": "default" }} , 
 	{ "name": "rgn_in_22", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_22", "role": "default" }} , 
 	{ "name": "rgn_in_23", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_23", "role": "default" }} , 
 	{ "name": "rgn_in_24", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_24", "role": "default" }} , 
 	{ "name": "rgn_in_25", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_25", "role": "default" }} , 
 	{ "name": "rgn_in_26", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_26", "role": "default" }} , 
 	{ "name": "rgn_in_27", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_27", "role": "default" }} , 
 	{ "name": "rgn_in_28", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_28", "role": "default" }} , 
 	{ "name": "rgn_in_29", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_29", "role": "default" }} , 
 	{ "name": "rgn_in_30", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_30", "role": "default" }} , 
 	{ "name": "rgn_in_31", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_31", "role": "default" }} , 
 	{ "name": "rgn_in_32", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_32", "role": "default" }} , 
 	{ "name": "rgn_in_33", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_33", "role": "default" }} , 
 	{ "name": "rgn_in_34", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_34", "role": "default" }} , 
 	{ "name": "rgn_in_35", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_35", "role": "default" }} , 
 	{ "name": "rgn_in_36", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_36", "role": "default" }} , 
 	{ "name": "rgn_in_37", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_37", "role": "default" }} , 
 	{ "name": "rgn_in_38", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_38", "role": "default" }} , 
 	{ "name": "rgn_in_39", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_39", "role": "default" }} , 
 	{ "name": "rgn_in_40", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_40", "role": "default" }} , 
 	{ "name": "rgn_in_41", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_41", "role": "default" }} , 
 	{ "name": "rgn_in_42", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_42", "role": "default" }} , 
 	{ "name": "rgn_in_43", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_43", "role": "default" }} , 
 	{ "name": "rgn_in_44", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_44", "role": "default" }} , 
 	{ "name": "rgn_in_45", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_45", "role": "default" }} , 
 	{ "name": "rgn_in_46", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_46", "role": "default" }} , 
 	{ "name": "rgn_in_47", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_47", "role": "default" }} , 
 	{ "name": "rgn_in_48", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_48", "role": "default" }} , 
 	{ "name": "rgn_in_49", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_49", "role": "default" }} , 
 	{ "name": "rgn_in_50", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_50", "role": "default" }} , 
 	{ "name": "rgn_in_51", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_51", "role": "default" }} , 
 	{ "name": "rgn_in_52", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_52", "role": "default" }} , 
 	{ "name": "rgn_in_53", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_53", "role": "default" }} , 
 	{ "name": "rgn_in_54", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_54", "role": "default" }} , 
 	{ "name": "rgn_in_55", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_55", "role": "default" }} , 
 	{ "name": "rgn_in_56", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_56", "role": "default" }} , 
 	{ "name": "rgn_in_57", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_57", "role": "default" }} , 
 	{ "name": "rgn_in_58", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_58", "role": "default" }} , 
 	{ "name": "rgn_in_59", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_59", "role": "default" }} , 
 	{ "name": "rgn_in_60", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_60", "role": "default" }} , 
 	{ "name": "rgn_in_61", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_61", "role": "default" }} , 
 	{ "name": "rgn_in_62", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_62", "role": "default" }} , 
 	{ "name": "rgn_in_63", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_63", "role": "default" }} , 
 	{ "name": "rgn_in_64", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_64", "role": "default" }} , 
 	{ "name": "rgn_in_65", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_65", "role": "default" }} , 
 	{ "name": "rgn_in_66", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_66", "role": "default" }} , 
 	{ "name": "rgn_in_67", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_67", "role": "default" }} , 
 	{ "name": "rgn_in_68", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_68", "role": "default" }} , 
 	{ "name": "rgn_in_69", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_69", "role": "default" }} , 
 	{ "name": "rgn_in_70", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_70", "role": "default" }} , 
 	{ "name": "rgn_in_71", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_71", "role": "default" }} , 
 	{ "name": "rgn_in_72", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_72", "role": "default" }} , 
 	{ "name": "rgn_in_73", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_73", "role": "default" }} , 
 	{ "name": "rgn_in_74", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_74", "role": "default" }} , 
 	{ "name": "rgn_in_75", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_75", "role": "default" }} , 
 	{ "name": "rgn_in_76", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_76", "role": "default" }} , 
 	{ "name": "rgn_in_77", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_77", "role": "default" }} , 
 	{ "name": "rgn_in_78", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_78", "role": "default" }} , 
 	{ "name": "rgn_in_79", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_79", "role": "default" }} , 
 	{ "name": "rgn_in_80", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_80", "role": "default" }} , 
 	{ "name": "rgn_in_81", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_81", "role": "default" }} , 
 	{ "name": "rgn_in_82", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_82", "role": "default" }} , 
 	{ "name": "rgn_in_83", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_83", "role": "default" }} , 
 	{ "name": "rgn_in_84", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_84", "role": "default" }} , 
 	{ "name": "rgn_in_85", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_85", "role": "default" }} , 
 	{ "name": "rgn_in_86", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_86", "role": "default" }} , 
 	{ "name": "rgn_in_87", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_87", "role": "default" }} , 
 	{ "name": "rgn_in_88", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_88", "role": "default" }} , 
 	{ "name": "rgn_in_89", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_89", "role": "default" }} , 
 	{ "name": "rgn_in_90", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_90", "role": "default" }} , 
 	{ "name": "rgn_in_91", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_91", "role": "default" }} , 
 	{ "name": "rgn_in_92", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_92", "role": "default" }} , 
 	{ "name": "rgn_in_93", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_93", "role": "default" }} , 
 	{ "name": "rgn_in_94", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_94", "role": "default" }} , 
 	{ "name": "rgn_in_95", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_95", "role": "default" }} , 
 	{ "name": "rgn_in_96", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_96", "role": "default" }} , 
 	{ "name": "rgn_in_97", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_97", "role": "default" }} , 
 	{ "name": "rgn_in_98", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_98", "role": "default" }} , 
 	{ "name": "rgn_in_99", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_99", "role": "default" }} , 
 	{ "name": "rgn_in_100", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_100", "role": "default" }} , 
 	{ "name": "rgn_in_101", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_101", "role": "default" }} , 
 	{ "name": "rgn_in_102", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_102", "role": "default" }} , 
 	{ "name": "rgn_in_103", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_103", "role": "default" }} , 
 	{ "name": "rgn_in_104", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_104", "role": "default" }} , 
 	{ "name": "rgn_in_105", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_105", "role": "default" }} , 
 	{ "name": "rgn_in_106", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_106", "role": "default" }} , 
 	{ "name": "rgn_in_107", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_107", "role": "default" }} , 
 	{ "name": "rgn_in_108", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_108", "role": "default" }} , 
 	{ "name": "rgn_in_109", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_109", "role": "default" }} , 
 	{ "name": "rgn_in_110", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_110", "role": "default" }} , 
 	{ "name": "rgn_in_111", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_111", "role": "default" }} , 
 	{ "name": "rgn_in_112", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_112", "role": "default" }} , 
 	{ "name": "rgn_in_113", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_113", "role": "default" }} , 
 	{ "name": "rgn_in_114", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_114", "role": "default" }} , 
 	{ "name": "rgn_in_115", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_115", "role": "default" }} , 
 	{ "name": "rgn_in_116", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_116", "role": "default" }} , 
 	{ "name": "rgn_in_117", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_117", "role": "default" }} , 
 	{ "name": "rgn_in_118", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_118", "role": "default" }} , 
 	{ "name": "rgn_in_119", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_119", "role": "default" }} , 
 	{ "name": "rgn_in_120", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_120", "role": "default" }} , 
 	{ "name": "rgn_in_121", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_121", "role": "default" }} , 
 	{ "name": "rgn_in_122", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_122", "role": "default" }} , 
 	{ "name": "rgn_in_123", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_123", "role": "default" }} , 
 	{ "name": "rgn_in_124", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_124", "role": "default" }} , 
 	{ "name": "rgn_in_125", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_125", "role": "default" }} , 
 	{ "name": "rgn_in_126", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_126", "role": "default" }} , 
 	{ "name": "rgn_in_127", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_127", "role": "default" }} , 
 	{ "name": "rgn_in_128", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_128", "role": "default" }} , 
 	{ "name": "rgn_in_129", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_129", "role": "default" }} , 
 	{ "name": "rgn_in_130", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_130", "role": "default" }} , 
 	{ "name": "rgn_in_131", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_131", "role": "default" }} , 
 	{ "name": "rgn_in_132", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_132", "role": "default" }} , 
 	{ "name": "rgn_in_133", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_133", "role": "default" }} , 
 	{ "name": "rgn_in_134", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_134", "role": "default" }} , 
 	{ "name": "rgn_in_135", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_135", "role": "default" }} , 
 	{ "name": "rgn_in_136", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_136", "role": "default" }} , 
 	{ "name": "rgn_in_137", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_137", "role": "default" }} , 
 	{ "name": "rgn_in_138", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_138", "role": "default" }} , 
 	{ "name": "rgn_in_139", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_139", "role": "default" }} , 
 	{ "name": "rgn_in_140", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_140", "role": "default" }} , 
 	{ "name": "rgn_in_141", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_141", "role": "default" }} , 
 	{ "name": "rgn_in_142", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_142", "role": "default" }} , 
 	{ "name": "rgn_in_143", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_143", "role": "default" }} , 
 	{ "name": "rgn_in_144", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_144", "role": "default" }} , 
 	{ "name": "rgn_in_145", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_145", "role": "default" }} , 
 	{ "name": "rgn_in_146", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_146", "role": "default" }} , 
 	{ "name": "rgn_in_147", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_147", "role": "default" }} , 
 	{ "name": "rgn_in_148", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_148", "role": "default" }} , 
 	{ "name": "rgn_in_149", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_149", "role": "default" }} , 
 	{ "name": "rgn_in_150", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_150", "role": "default" }} , 
 	{ "name": "rgn_in_151", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_151", "role": "default" }} , 
 	{ "name": "rgn_in_152", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_152", "role": "default" }} , 
 	{ "name": "rgn_in_153", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_153", "role": "default" }} , 
 	{ "name": "rgn_in_154", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_154", "role": "default" }} , 
 	{ "name": "rgn_in_155", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_155", "role": "default" }} , 
 	{ "name": "rgn_in_156", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_156", "role": "default" }} , 
 	{ "name": "rgn_in_157", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_157", "role": "default" }} , 
 	{ "name": "rgn_in_158", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_158", "role": "default" }} , 
 	{ "name": "rgn_in_159", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_159", "role": "default" }} , 
 	{ "name": "rgn_in_160", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_160", "role": "default" }} , 
 	{ "name": "rgn_in_161", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_161", "role": "default" }} , 
 	{ "name": "rgn_in_162", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_162", "role": "default" }} , 
 	{ "name": "rgn_in_163", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_163", "role": "default" }} , 
 	{ "name": "rgn_in_164", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_164", "role": "default" }} , 
 	{ "name": "rgn_in_165", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_165", "role": "default" }} , 
 	{ "name": "rgn_in_166", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_166", "role": "default" }} , 
 	{ "name": "rgn_in_167", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_167", "role": "default" }} , 
 	{ "name": "rgn_in_168", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_168", "role": "default" }} , 
 	{ "name": "rgn_in_169", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_169", "role": "default" }} , 
 	{ "name": "rgn_in_170", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_170", "role": "default" }} , 
 	{ "name": "rgn_in_171", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_171", "role": "default" }} , 
 	{ "name": "rgn_in_172", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_172", "role": "default" }} , 
 	{ "name": "rgn_in_173", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_173", "role": "default" }} , 
 	{ "name": "rgn_in_174", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_174", "role": "default" }} , 
 	{ "name": "rgn_in_175", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_175", "role": "default" }} , 
 	{ "name": "rgn_in_176", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_176", "role": "default" }} , 
 	{ "name": "rgn_in_177", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_177", "role": "default" }} , 
 	{ "name": "rgn_in_178", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_178", "role": "default" }} , 
 	{ "name": "rgn_in_179", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_179", "role": "default" }} , 
 	{ "name": "rgn_in_180", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_180", "role": "default" }} , 
 	{ "name": "rgn_in_181", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_181", "role": "default" }} , 
 	{ "name": "rgn_in_182", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_182", "role": "default" }} , 
 	{ "name": "rgn_in_183", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_183", "role": "default" }} , 
 	{ "name": "rgn_in_184", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_184", "role": "default" }} , 
 	{ "name": "rgn_in_185", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_185", "role": "default" }} , 
 	{ "name": "rgn_in_186", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_186", "role": "default" }} , 
 	{ "name": "rgn_in_187", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_187", "role": "default" }} , 
 	{ "name": "rgn_in_188", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_188", "role": "default" }} , 
 	{ "name": "rgn_in_189", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_189", "role": "default" }} , 
 	{ "name": "rgn_in_190", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_190", "role": "default" }} , 
 	{ "name": "rgn_in_191", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_191", "role": "default" }} , 
 	{ "name": "rgn_in_192", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_192", "role": "default" }} , 
 	{ "name": "rgn_in_193", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_193", "role": "default" }} , 
 	{ "name": "rgn_in_194", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_194", "role": "default" }} , 
 	{ "name": "rgn_in_195", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_195", "role": "default" }} , 
 	{ "name": "rgn_in_196", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_196", "role": "default" }} , 
 	{ "name": "rgn_in_197", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_197", "role": "default" }} , 
 	{ "name": "rgn_in_198", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_198", "role": "default" }} , 
 	{ "name": "rgn_in_199", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_199", "role": "default" }} , 
 	{ "name": "rgn_in_200", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_200", "role": "default" }} , 
 	{ "name": "rgn_in_201", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_201", "role": "default" }} , 
 	{ "name": "rgn_in_202", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_202", "role": "default" }} , 
 	{ "name": "rgn_in_203", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_203", "role": "default" }} , 
 	{ "name": "rgn_in_204", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_204", "role": "default" }} , 
 	{ "name": "rgn_in_205", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_205", "role": "default" }} , 
 	{ "name": "rgn_in_206", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_206", "role": "default" }} , 
 	{ "name": "rgn_in_207", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_207", "role": "default" }} , 
 	{ "name": "rgn_in_208", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_208", "role": "default" }} , 
 	{ "name": "rgn_in_209", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_209", "role": "default" }} , 
 	{ "name": "rgn_in_210", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_210", "role": "default" }} , 
 	{ "name": "rgn_in_211", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_211", "role": "default" }} , 
 	{ "name": "rgn_in_212", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_212", "role": "default" }} , 
 	{ "name": "rgn_in_213", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_213", "role": "default" }} , 
 	{ "name": "rgn_in_214", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_214", "role": "default" }} , 
 	{ "name": "rgn_in_215", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_215", "role": "default" }} , 
 	{ "name": "rgn_in_216", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_216", "role": "default" }} , 
 	{ "name": "rgn_in_217", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_217", "role": "default" }} , 
 	{ "name": "rgn_in_218", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_218", "role": "default" }} , 
 	{ "name": "rgn_in_219", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_219", "role": "default" }} , 
 	{ "name": "rgn_in_220", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_220", "role": "default" }} , 
 	{ "name": "rgn_in_221", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_221", "role": "default" }} , 
 	{ "name": "rgn_in_222", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_222", "role": "default" }} , 
 	{ "name": "rgn_in_223", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_223", "role": "default" }} , 
 	{ "name": "rgn_in_224", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_224", "role": "default" }} , 
 	{ "name": "rgn_in_225", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_225", "role": "default" }} , 
 	{ "name": "rgn_in_226", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_226", "role": "default" }} , 
 	{ "name": "rgn_in_227", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_227", "role": "default" }} , 
 	{ "name": "rgn_in_228", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_228", "role": "default" }} , 
 	{ "name": "rgn_in_229", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_229", "role": "default" }} , 
 	{ "name": "rgn_in_230", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_230", "role": "default" }} , 
 	{ "name": "rgn_in_231", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_231", "role": "default" }} , 
 	{ "name": "rgn_in_232", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_232", "role": "default" }} , 
 	{ "name": "rgn_in_233", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_233", "role": "default" }} , 
 	{ "name": "rgn_in_234", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_234", "role": "default" }} , 
 	{ "name": "rgn_in_235", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_235", "role": "default" }} , 
 	{ "name": "rgn_in_236", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_236", "role": "default" }} , 
 	{ "name": "rgn_in_237", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_237", "role": "default" }} , 
 	{ "name": "rgn_in_238", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_238", "role": "default" }} , 
 	{ "name": "rgn_in_239", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_239", "role": "default" }} , 
 	{ "name": "rgn_in_240", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_240", "role": "default" }} , 
 	{ "name": "rgn_in_241", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_241", "role": "default" }} , 
 	{ "name": "rgn_in_242", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_242", "role": "default" }} , 
 	{ "name": "rgn_in_243", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_243", "role": "default" }} , 
 	{ "name": "rgn_in_244", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_244", "role": "default" }} , 
 	{ "name": "rgn_in_245", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_245", "role": "default" }} , 
 	{ "name": "rgn_in_246", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_246", "role": "default" }} , 
 	{ "name": "rgn_in_247", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_247", "role": "default" }} , 
 	{ "name": "rgn_in_248", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_248", "role": "default" }} , 
 	{ "name": "rgn_in_249", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_249", "role": "default" }} , 
 	{ "name": "rgn_in_250", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_250", "role": "default" }} , 
 	{ "name": "rgn_in_251", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rgn_in_251", "role": "default" }} , 
 	{ "name": "MET_0_V", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "MET_0_V", "role": "default" }} , 
 	{ "name": "MET_0_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "MET_0_V", "role": "ap_vld" }} , 
 	{ "name": "MET_1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "MET_1_V", "role": "default" }} , 
 	{ "name": "MET_1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "MET_1_V", "role": "ap_vld" }} , 
 	{ "name": "MET_2_V", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "MET_2_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "MET_O",
		"VariableLatency" : "0",
		"AlignedPipeline" : "1",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "rgn_in_0", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_1", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_2", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_3", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_4", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_5", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_6", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_7", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_8", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_9", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_10", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_11", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_12", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_13", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_14", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_15", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_16", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_17", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_18", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_19", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_20", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_21", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_22", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_23", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_24", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_25", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_26", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_27", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_28", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_29", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_30", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_31", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_32", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_33", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_34", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_35", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_36", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_37", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_38", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_39", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_40", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_41", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_42", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_43", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_44", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_45", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_46", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_47", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_48", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_49", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_50", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_51", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_52", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_53", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_54", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_55", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_56", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_57", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_58", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_59", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_60", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_61", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_62", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_63", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_64", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_65", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_66", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_67", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_68", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_69", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_70", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_71", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_72", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_73", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_74", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_75", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_76", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_77", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_78", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_79", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_80", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_81", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_82", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_83", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_84", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_85", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_86", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_87", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_88", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_89", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_90", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_91", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_92", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_93", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_94", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_95", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_96", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_97", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_98", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_99", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_100", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_101", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_102", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_103", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_104", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_105", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_106", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_107", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_108", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_109", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_110", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_111", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_112", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_113", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_114", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_115", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_116", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_117", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_118", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_119", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_120", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_121", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_122", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_123", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_124", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_125", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_126", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_127", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_128", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_129", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_130", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_131", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_132", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_133", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_134", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_135", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_136", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_137", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_138", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_139", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_140", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_141", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_142", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_143", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_144", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_145", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_146", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_147", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_148", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_149", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_150", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_151", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_152", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_153", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_154", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_155", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_156", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_157", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_158", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_159", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_160", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_161", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_162", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_163", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_164", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_165", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_166", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_167", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_168", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_169", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_170", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_171", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_172", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_173", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_174", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_175", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_176", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_177", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_178", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_179", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_180", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_181", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_182", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_183", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_184", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_185", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_186", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_187", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_188", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_189", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_190", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_191", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_192", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_193", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_194", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_195", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_196", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_197", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_198", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_199", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_200", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_201", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_202", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_203", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_204", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_205", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_206", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_207", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_208", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_209", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_210", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_211", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_212", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_213", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_214", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_215", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_216", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_217", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_218", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_219", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_220", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_221", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_222", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_223", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_224", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_225", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_226", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_227", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_228", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_229", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_230", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_231", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_232", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_233", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_234", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_235", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_236", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_237", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_238", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_239", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_240", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_241", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_242", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_243", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_244", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_245", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_246", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_247", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_248", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_249", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_250", "Type" : "None", "Direction" : "I"},
		{"Name" : "rgn_in_251", "Type" : "None", "Direction" : "I"},
		{"Name" : "MET_0_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "MET_1_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "MET_2_V", "Type" : "None", "Direction" : "I"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "15", "Max" : "15"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set Spec2ImplPortList { 
	rgn_in_0 { ap_none {  { rgn_in_0 in_data 0 16 } } }
	rgn_in_1 { ap_none {  { rgn_in_1 in_data 0 16 } } }
	rgn_in_2 { ap_none {  { rgn_in_2 in_data 0 16 } } }
	rgn_in_3 { ap_none {  { rgn_in_3 in_data 0 16 } } }
	rgn_in_4 { ap_none {  { rgn_in_4 in_data 0 16 } } }
	rgn_in_5 { ap_none {  { rgn_in_5 in_data 0 16 } } }
	rgn_in_6 { ap_none {  { rgn_in_6 in_data 0 16 } } }
	rgn_in_7 { ap_none {  { rgn_in_7 in_data 0 16 } } }
	rgn_in_8 { ap_none {  { rgn_in_8 in_data 0 16 } } }
	rgn_in_9 { ap_none {  { rgn_in_9 in_data 0 16 } } }
	rgn_in_10 { ap_none {  { rgn_in_10 in_data 0 16 } } }
	rgn_in_11 { ap_none {  { rgn_in_11 in_data 0 16 } } }
	rgn_in_12 { ap_none {  { rgn_in_12 in_data 0 16 } } }
	rgn_in_13 { ap_none {  { rgn_in_13 in_data 0 16 } } }
	rgn_in_14 { ap_none {  { rgn_in_14 in_data 0 16 } } }
	rgn_in_15 { ap_none {  { rgn_in_15 in_data 0 16 } } }
	rgn_in_16 { ap_none {  { rgn_in_16 in_data 0 16 } } }
	rgn_in_17 { ap_none {  { rgn_in_17 in_data 0 16 } } }
	rgn_in_18 { ap_none {  { rgn_in_18 in_data 0 16 } } }
	rgn_in_19 { ap_none {  { rgn_in_19 in_data 0 16 } } }
	rgn_in_20 { ap_none {  { rgn_in_20 in_data 0 16 } } }
	rgn_in_21 { ap_none {  { rgn_in_21 in_data 0 16 } } }
	rgn_in_22 { ap_none {  { rgn_in_22 in_data 0 16 } } }
	rgn_in_23 { ap_none {  { rgn_in_23 in_data 0 16 } } }
	rgn_in_24 { ap_none {  { rgn_in_24 in_data 0 16 } } }
	rgn_in_25 { ap_none {  { rgn_in_25 in_data 0 16 } } }
	rgn_in_26 { ap_none {  { rgn_in_26 in_data 0 16 } } }
	rgn_in_27 { ap_none {  { rgn_in_27 in_data 0 16 } } }
	rgn_in_28 { ap_none {  { rgn_in_28 in_data 0 16 } } }
	rgn_in_29 { ap_none {  { rgn_in_29 in_data 0 16 } } }
	rgn_in_30 { ap_none {  { rgn_in_30 in_data 0 16 } } }
	rgn_in_31 { ap_none {  { rgn_in_31 in_data 0 16 } } }
	rgn_in_32 { ap_none {  { rgn_in_32 in_data 0 16 } } }
	rgn_in_33 { ap_none {  { rgn_in_33 in_data 0 16 } } }
	rgn_in_34 { ap_none {  { rgn_in_34 in_data 0 16 } } }
	rgn_in_35 { ap_none {  { rgn_in_35 in_data 0 16 } } }
	rgn_in_36 { ap_none {  { rgn_in_36 in_data 0 16 } } }
	rgn_in_37 { ap_none {  { rgn_in_37 in_data 0 16 } } }
	rgn_in_38 { ap_none {  { rgn_in_38 in_data 0 16 } } }
	rgn_in_39 { ap_none {  { rgn_in_39 in_data 0 16 } } }
	rgn_in_40 { ap_none {  { rgn_in_40 in_data 0 16 } } }
	rgn_in_41 { ap_none {  { rgn_in_41 in_data 0 16 } } }
	rgn_in_42 { ap_none {  { rgn_in_42 in_data 0 16 } } }
	rgn_in_43 { ap_none {  { rgn_in_43 in_data 0 16 } } }
	rgn_in_44 { ap_none {  { rgn_in_44 in_data 0 16 } } }
	rgn_in_45 { ap_none {  { rgn_in_45 in_data 0 16 } } }
	rgn_in_46 { ap_none {  { rgn_in_46 in_data 0 16 } } }
	rgn_in_47 { ap_none {  { rgn_in_47 in_data 0 16 } } }
	rgn_in_48 { ap_none {  { rgn_in_48 in_data 0 16 } } }
	rgn_in_49 { ap_none {  { rgn_in_49 in_data 0 16 } } }
	rgn_in_50 { ap_none {  { rgn_in_50 in_data 0 16 } } }
	rgn_in_51 { ap_none {  { rgn_in_51 in_data 0 16 } } }
	rgn_in_52 { ap_none {  { rgn_in_52 in_data 0 16 } } }
	rgn_in_53 { ap_none {  { rgn_in_53 in_data 0 16 } } }
	rgn_in_54 { ap_none {  { rgn_in_54 in_data 0 16 } } }
	rgn_in_55 { ap_none {  { rgn_in_55 in_data 0 16 } } }
	rgn_in_56 { ap_none {  { rgn_in_56 in_data 0 16 } } }
	rgn_in_57 { ap_none {  { rgn_in_57 in_data 0 16 } } }
	rgn_in_58 { ap_none {  { rgn_in_58 in_data 0 16 } } }
	rgn_in_59 { ap_none {  { rgn_in_59 in_data 0 16 } } }
	rgn_in_60 { ap_none {  { rgn_in_60 in_data 0 16 } } }
	rgn_in_61 { ap_none {  { rgn_in_61 in_data 0 16 } } }
	rgn_in_62 { ap_none {  { rgn_in_62 in_data 0 16 } } }
	rgn_in_63 { ap_none {  { rgn_in_63 in_data 0 16 } } }
	rgn_in_64 { ap_none {  { rgn_in_64 in_data 0 16 } } }
	rgn_in_65 { ap_none {  { rgn_in_65 in_data 0 16 } } }
	rgn_in_66 { ap_none {  { rgn_in_66 in_data 0 16 } } }
	rgn_in_67 { ap_none {  { rgn_in_67 in_data 0 16 } } }
	rgn_in_68 { ap_none {  { rgn_in_68 in_data 0 16 } } }
	rgn_in_69 { ap_none {  { rgn_in_69 in_data 0 16 } } }
	rgn_in_70 { ap_none {  { rgn_in_70 in_data 0 16 } } }
	rgn_in_71 { ap_none {  { rgn_in_71 in_data 0 16 } } }
	rgn_in_72 { ap_none {  { rgn_in_72 in_data 0 16 } } }
	rgn_in_73 { ap_none {  { rgn_in_73 in_data 0 16 } } }
	rgn_in_74 { ap_none {  { rgn_in_74 in_data 0 16 } } }
	rgn_in_75 { ap_none {  { rgn_in_75 in_data 0 16 } } }
	rgn_in_76 { ap_none {  { rgn_in_76 in_data 0 16 } } }
	rgn_in_77 { ap_none {  { rgn_in_77 in_data 0 16 } } }
	rgn_in_78 { ap_none {  { rgn_in_78 in_data 0 16 } } }
	rgn_in_79 { ap_none {  { rgn_in_79 in_data 0 16 } } }
	rgn_in_80 { ap_none {  { rgn_in_80 in_data 0 16 } } }
	rgn_in_81 { ap_none {  { rgn_in_81 in_data 0 16 } } }
	rgn_in_82 { ap_none {  { rgn_in_82 in_data 0 16 } } }
	rgn_in_83 { ap_none {  { rgn_in_83 in_data 0 16 } } }
	rgn_in_84 { ap_none {  { rgn_in_84 in_data 0 16 } } }
	rgn_in_85 { ap_none {  { rgn_in_85 in_data 0 16 } } }
	rgn_in_86 { ap_none {  { rgn_in_86 in_data 0 16 } } }
	rgn_in_87 { ap_none {  { rgn_in_87 in_data 0 16 } } }
	rgn_in_88 { ap_none {  { rgn_in_88 in_data 0 16 } } }
	rgn_in_89 { ap_none {  { rgn_in_89 in_data 0 16 } } }
	rgn_in_90 { ap_none {  { rgn_in_90 in_data 0 16 } } }
	rgn_in_91 { ap_none {  { rgn_in_91 in_data 0 16 } } }
	rgn_in_92 { ap_none {  { rgn_in_92 in_data 0 16 } } }
	rgn_in_93 { ap_none {  { rgn_in_93 in_data 0 16 } } }
	rgn_in_94 { ap_none {  { rgn_in_94 in_data 0 16 } } }
	rgn_in_95 { ap_none {  { rgn_in_95 in_data 0 16 } } }
	rgn_in_96 { ap_none {  { rgn_in_96 in_data 0 16 } } }
	rgn_in_97 { ap_none {  { rgn_in_97 in_data 0 16 } } }
	rgn_in_98 { ap_none {  { rgn_in_98 in_data 0 16 } } }
	rgn_in_99 { ap_none {  { rgn_in_99 in_data 0 16 } } }
	rgn_in_100 { ap_none {  { rgn_in_100 in_data 0 16 } } }
	rgn_in_101 { ap_none {  { rgn_in_101 in_data 0 16 } } }
	rgn_in_102 { ap_none {  { rgn_in_102 in_data 0 16 } } }
	rgn_in_103 { ap_none {  { rgn_in_103 in_data 0 16 } } }
	rgn_in_104 { ap_none {  { rgn_in_104 in_data 0 16 } } }
	rgn_in_105 { ap_none {  { rgn_in_105 in_data 0 16 } } }
	rgn_in_106 { ap_none {  { rgn_in_106 in_data 0 16 } } }
	rgn_in_107 { ap_none {  { rgn_in_107 in_data 0 16 } } }
	rgn_in_108 { ap_none {  { rgn_in_108 in_data 0 16 } } }
	rgn_in_109 { ap_none {  { rgn_in_109 in_data 0 16 } } }
	rgn_in_110 { ap_none {  { rgn_in_110 in_data 0 16 } } }
	rgn_in_111 { ap_none {  { rgn_in_111 in_data 0 16 } } }
	rgn_in_112 { ap_none {  { rgn_in_112 in_data 0 16 } } }
	rgn_in_113 { ap_none {  { rgn_in_113 in_data 0 16 } } }
	rgn_in_114 { ap_none {  { rgn_in_114 in_data 0 16 } } }
	rgn_in_115 { ap_none {  { rgn_in_115 in_data 0 16 } } }
	rgn_in_116 { ap_none {  { rgn_in_116 in_data 0 16 } } }
	rgn_in_117 { ap_none {  { rgn_in_117 in_data 0 16 } } }
	rgn_in_118 { ap_none {  { rgn_in_118 in_data 0 16 } } }
	rgn_in_119 { ap_none {  { rgn_in_119 in_data 0 16 } } }
	rgn_in_120 { ap_none {  { rgn_in_120 in_data 0 16 } } }
	rgn_in_121 { ap_none {  { rgn_in_121 in_data 0 16 } } }
	rgn_in_122 { ap_none {  { rgn_in_122 in_data 0 16 } } }
	rgn_in_123 { ap_none {  { rgn_in_123 in_data 0 16 } } }
	rgn_in_124 { ap_none {  { rgn_in_124 in_data 0 16 } } }
	rgn_in_125 { ap_none {  { rgn_in_125 in_data 0 16 } } }
	rgn_in_126 { ap_none {  { rgn_in_126 in_data 0 16 } } }
	rgn_in_127 { ap_none {  { rgn_in_127 in_data 0 16 } } }
	rgn_in_128 { ap_none {  { rgn_in_128 in_data 0 16 } } }
	rgn_in_129 { ap_none {  { rgn_in_129 in_data 0 16 } } }
	rgn_in_130 { ap_none {  { rgn_in_130 in_data 0 16 } } }
	rgn_in_131 { ap_none {  { rgn_in_131 in_data 0 16 } } }
	rgn_in_132 { ap_none {  { rgn_in_132 in_data 0 16 } } }
	rgn_in_133 { ap_none {  { rgn_in_133 in_data 0 16 } } }
	rgn_in_134 { ap_none {  { rgn_in_134 in_data 0 16 } } }
	rgn_in_135 { ap_none {  { rgn_in_135 in_data 0 16 } } }
	rgn_in_136 { ap_none {  { rgn_in_136 in_data 0 16 } } }
	rgn_in_137 { ap_none {  { rgn_in_137 in_data 0 16 } } }
	rgn_in_138 { ap_none {  { rgn_in_138 in_data 0 16 } } }
	rgn_in_139 { ap_none {  { rgn_in_139 in_data 0 16 } } }
	rgn_in_140 { ap_none {  { rgn_in_140 in_data 0 16 } } }
	rgn_in_141 { ap_none {  { rgn_in_141 in_data 0 16 } } }
	rgn_in_142 { ap_none {  { rgn_in_142 in_data 0 16 } } }
	rgn_in_143 { ap_none {  { rgn_in_143 in_data 0 16 } } }
	rgn_in_144 { ap_none {  { rgn_in_144 in_data 0 16 } } }
	rgn_in_145 { ap_none {  { rgn_in_145 in_data 0 16 } } }
	rgn_in_146 { ap_none {  { rgn_in_146 in_data 0 16 } } }
	rgn_in_147 { ap_none {  { rgn_in_147 in_data 0 16 } } }
	rgn_in_148 { ap_none {  { rgn_in_148 in_data 0 16 } } }
	rgn_in_149 { ap_none {  { rgn_in_149 in_data 0 16 } } }
	rgn_in_150 { ap_none {  { rgn_in_150 in_data 0 16 } } }
	rgn_in_151 { ap_none {  { rgn_in_151 in_data 0 16 } } }
	rgn_in_152 { ap_none {  { rgn_in_152 in_data 0 16 } } }
	rgn_in_153 { ap_none {  { rgn_in_153 in_data 0 16 } } }
	rgn_in_154 { ap_none {  { rgn_in_154 in_data 0 16 } } }
	rgn_in_155 { ap_none {  { rgn_in_155 in_data 0 16 } } }
	rgn_in_156 { ap_none {  { rgn_in_156 in_data 0 16 } } }
	rgn_in_157 { ap_none {  { rgn_in_157 in_data 0 16 } } }
	rgn_in_158 { ap_none {  { rgn_in_158 in_data 0 16 } } }
	rgn_in_159 { ap_none {  { rgn_in_159 in_data 0 16 } } }
	rgn_in_160 { ap_none {  { rgn_in_160 in_data 0 16 } } }
	rgn_in_161 { ap_none {  { rgn_in_161 in_data 0 16 } } }
	rgn_in_162 { ap_none {  { rgn_in_162 in_data 0 16 } } }
	rgn_in_163 { ap_none {  { rgn_in_163 in_data 0 16 } } }
	rgn_in_164 { ap_none {  { rgn_in_164 in_data 0 16 } } }
	rgn_in_165 { ap_none {  { rgn_in_165 in_data 0 16 } } }
	rgn_in_166 { ap_none {  { rgn_in_166 in_data 0 16 } } }
	rgn_in_167 { ap_none {  { rgn_in_167 in_data 0 16 } } }
	rgn_in_168 { ap_none {  { rgn_in_168 in_data 0 16 } } }
	rgn_in_169 { ap_none {  { rgn_in_169 in_data 0 16 } } }
	rgn_in_170 { ap_none {  { rgn_in_170 in_data 0 16 } } }
	rgn_in_171 { ap_none {  { rgn_in_171 in_data 0 16 } } }
	rgn_in_172 { ap_none {  { rgn_in_172 in_data 0 16 } } }
	rgn_in_173 { ap_none {  { rgn_in_173 in_data 0 16 } } }
	rgn_in_174 { ap_none {  { rgn_in_174 in_data 0 16 } } }
	rgn_in_175 { ap_none {  { rgn_in_175 in_data 0 16 } } }
	rgn_in_176 { ap_none {  { rgn_in_176 in_data 0 16 } } }
	rgn_in_177 { ap_none {  { rgn_in_177 in_data 0 16 } } }
	rgn_in_178 { ap_none {  { rgn_in_178 in_data 0 16 } } }
	rgn_in_179 { ap_none {  { rgn_in_179 in_data 0 16 } } }
	rgn_in_180 { ap_none {  { rgn_in_180 in_data 0 16 } } }
	rgn_in_181 { ap_none {  { rgn_in_181 in_data 0 16 } } }
	rgn_in_182 { ap_none {  { rgn_in_182 in_data 0 16 } } }
	rgn_in_183 { ap_none {  { rgn_in_183 in_data 0 16 } } }
	rgn_in_184 { ap_none {  { rgn_in_184 in_data 0 16 } } }
	rgn_in_185 { ap_none {  { rgn_in_185 in_data 0 16 } } }
	rgn_in_186 { ap_none {  { rgn_in_186 in_data 0 16 } } }
	rgn_in_187 { ap_none {  { rgn_in_187 in_data 0 16 } } }
	rgn_in_188 { ap_none {  { rgn_in_188 in_data 0 16 } } }
	rgn_in_189 { ap_none {  { rgn_in_189 in_data 0 16 } } }
	rgn_in_190 { ap_none {  { rgn_in_190 in_data 0 16 } } }
	rgn_in_191 { ap_none {  { rgn_in_191 in_data 0 16 } } }
	rgn_in_192 { ap_none {  { rgn_in_192 in_data 0 16 } } }
	rgn_in_193 { ap_none {  { rgn_in_193 in_data 0 16 } } }
	rgn_in_194 { ap_none {  { rgn_in_194 in_data 0 16 } } }
	rgn_in_195 { ap_none {  { rgn_in_195 in_data 0 16 } } }
	rgn_in_196 { ap_none {  { rgn_in_196 in_data 0 16 } } }
	rgn_in_197 { ap_none {  { rgn_in_197 in_data 0 16 } } }
	rgn_in_198 { ap_none {  { rgn_in_198 in_data 0 16 } } }
	rgn_in_199 { ap_none {  { rgn_in_199 in_data 0 16 } } }
	rgn_in_200 { ap_none {  { rgn_in_200 in_data 0 16 } } }
	rgn_in_201 { ap_none {  { rgn_in_201 in_data 0 16 } } }
	rgn_in_202 { ap_none {  { rgn_in_202 in_data 0 16 } } }
	rgn_in_203 { ap_none {  { rgn_in_203 in_data 0 16 } } }
	rgn_in_204 { ap_none {  { rgn_in_204 in_data 0 16 } } }
	rgn_in_205 { ap_none {  { rgn_in_205 in_data 0 16 } } }
	rgn_in_206 { ap_none {  { rgn_in_206 in_data 0 16 } } }
	rgn_in_207 { ap_none {  { rgn_in_207 in_data 0 16 } } }
	rgn_in_208 { ap_none {  { rgn_in_208 in_data 0 16 } } }
	rgn_in_209 { ap_none {  { rgn_in_209 in_data 0 16 } } }
	rgn_in_210 { ap_none {  { rgn_in_210 in_data 0 16 } } }
	rgn_in_211 { ap_none {  { rgn_in_211 in_data 0 16 } } }
	rgn_in_212 { ap_none {  { rgn_in_212 in_data 0 16 } } }
	rgn_in_213 { ap_none {  { rgn_in_213 in_data 0 16 } } }
	rgn_in_214 { ap_none {  { rgn_in_214 in_data 0 16 } } }
	rgn_in_215 { ap_none {  { rgn_in_215 in_data 0 16 } } }
	rgn_in_216 { ap_none {  { rgn_in_216 in_data 0 16 } } }
	rgn_in_217 { ap_none {  { rgn_in_217 in_data 0 16 } } }
	rgn_in_218 { ap_none {  { rgn_in_218 in_data 0 16 } } }
	rgn_in_219 { ap_none {  { rgn_in_219 in_data 0 16 } } }
	rgn_in_220 { ap_none {  { rgn_in_220 in_data 0 16 } } }
	rgn_in_221 { ap_none {  { rgn_in_221 in_data 0 16 } } }
	rgn_in_222 { ap_none {  { rgn_in_222 in_data 0 16 } } }
	rgn_in_223 { ap_none {  { rgn_in_223 in_data 0 16 } } }
	rgn_in_224 { ap_none {  { rgn_in_224 in_data 0 16 } } }
	rgn_in_225 { ap_none {  { rgn_in_225 in_data 0 16 } } }
	rgn_in_226 { ap_none {  { rgn_in_226 in_data 0 16 } } }
	rgn_in_227 { ap_none {  { rgn_in_227 in_data 0 16 } } }
	rgn_in_228 { ap_none {  { rgn_in_228 in_data 0 16 } } }
	rgn_in_229 { ap_none {  { rgn_in_229 in_data 0 16 } } }
	rgn_in_230 { ap_none {  { rgn_in_230 in_data 0 16 } } }
	rgn_in_231 { ap_none {  { rgn_in_231 in_data 0 16 } } }
	rgn_in_232 { ap_none {  { rgn_in_232 in_data 0 16 } } }
	rgn_in_233 { ap_none {  { rgn_in_233 in_data 0 16 } } }
	rgn_in_234 { ap_none {  { rgn_in_234 in_data 0 16 } } }
	rgn_in_235 { ap_none {  { rgn_in_235 in_data 0 16 } } }
	rgn_in_236 { ap_none {  { rgn_in_236 in_data 0 16 } } }
	rgn_in_237 { ap_none {  { rgn_in_237 in_data 0 16 } } }
	rgn_in_238 { ap_none {  { rgn_in_238 in_data 0 16 } } }
	rgn_in_239 { ap_none {  { rgn_in_239 in_data 0 16 } } }
	rgn_in_240 { ap_none {  { rgn_in_240 in_data 0 16 } } }
	rgn_in_241 { ap_none {  { rgn_in_241 in_data 0 16 } } }
	rgn_in_242 { ap_none {  { rgn_in_242 in_data 0 16 } } }
	rgn_in_243 { ap_none {  { rgn_in_243 in_data 0 16 } } }
	rgn_in_244 { ap_none {  { rgn_in_244 in_data 0 16 } } }
	rgn_in_245 { ap_none {  { rgn_in_245 in_data 0 16 } } }
	rgn_in_246 { ap_none {  { rgn_in_246 in_data 0 16 } } }
	rgn_in_247 { ap_none {  { rgn_in_247 in_data 0 16 } } }
	rgn_in_248 { ap_none {  { rgn_in_248 in_data 0 16 } } }
	rgn_in_249 { ap_none {  { rgn_in_249 in_data 0 16 } } }
	rgn_in_250 { ap_none {  { rgn_in_250 in_data 0 16 } } }
	rgn_in_251 { ap_none {  { rgn_in_251 in_data 0 16 } } }
	MET_0_V { ap_vld {  { MET_0_V out_data 1 20 }  { MET_0_V_ap_vld out_vld 1 1 } } }
	MET_1_V { ap_vld {  { MET_1_V out_data 1 20 }  { MET_1_V_ap_vld out_vld 1 1 } } }
	MET_2_V { ap_none {  { MET_2_V in_data 0 20 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
