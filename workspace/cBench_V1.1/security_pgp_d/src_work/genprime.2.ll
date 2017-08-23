; ModuleID = 'tmp1.ll'
source_filename = "genprime.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@global_precision = external global i16, align 2
@primetable = internal global [1029 x i16] [i16 2, i16 3, i16 5, i16 7, i16 11, i16 13, i16 17, i16 19, i16 23, i16 29, i16 31, i16 37, i16 41, i16 43, i16 47, i16 53, i16 59, i16 61, i16 67, i16 71, i16 73, i16 79, i16 83, i16 89, i16 97, i16 101, i16 103, i16 107, i16 109, i16 113, i16 127, i16 131, i16 137, i16 139, i16 149, i16 151, i16 157, i16 163, i16 167, i16 173, i16 179, i16 181, i16 191, i16 193, i16 197, i16 199, i16 211, i16 223, i16 227, i16 229, i16 233, i16 239, i16 241, i16 251, i16 257, i16 263, i16 269, i16 271, i16 277, i16 281, i16 283, i16 293, i16 307, i16 311, i16 313, i16 317, i16 331, i16 337, i16 347, i16 349, i16 353, i16 359, i16 367, i16 373, i16 379, i16 383, i16 389, i16 397, i16 401, i16 409, i16 419, i16 421, i16 431, i16 433, i16 439, i16 443, i16 449, i16 457, i16 461, i16 463, i16 467, i16 479, i16 487, i16 491, i16 499, i16 503, i16 509, i16 521, i16 523, i16 541, i16 547, i16 557, i16 563, i16 569, i16 571, i16 577, i16 587, i16 593, i16 599, i16 601, i16 607, i16 613, i16 617, i16 619, i16 631, i16 641, i16 643, i16 647, i16 653, i16 659, i16 661, i16 673, i16 677, i16 683, i16 691, i16 701, i16 709, i16 719, i16 727, i16 733, i16 739, i16 743, i16 751, i16 757, i16 761, i16 769, i16 773, i16 787, i16 797, i16 809, i16 811, i16 821, i16 823, i16 827, i16 829, i16 839, i16 853, i16 857, i16 859, i16 863, i16 877, i16 881, i16 883, i16 887, i16 907, i16 911, i16 919, i16 929, i16 937, i16 941, i16 947, i16 953, i16 967, i16 971, i16 977, i16 983, i16 991, i16 997, i16 1009, i16 1013, i16 1019, i16 1021, i16 1031, i16 1033, i16 1039, i16 1049, i16 1051, i16 1061, i16 1063, i16 1069, i16 1087, i16 1091, i16 1093, i16 1097, i16 1103, i16 1109, i16 1117, i16 1123, i16 1129, i16 1151, i16 1153, i16 1163, i16 1171, i16 1181, i16 1187, i16 1193, i16 1201, i16 1213, i16 1217, i16 1223, i16 1229, i16 1231, i16 1237, i16 1249, i16 1259, i16 1277, i16 1279, i16 1283, i16 1289, i16 1291, i16 1297, i16 1301, i16 1303, i16 1307, i16 1319, i16 1321, i16 1327, i16 1361, i16 1367, i16 1373, i16 1381, i16 1399, i16 1409, i16 1423, i16 1427, i16 1429, i16 1433, i16 1439, i16 1447, i16 1451, i16 1453, i16 1459, i16 1471, i16 1481, i16 1483, i16 1487, i16 1489, i16 1493, i16 1499, i16 1511, i16 1523, i16 1531, i16 1543, i16 1549, i16 1553, i16 1559, i16 1567, i16 1571, i16 1579, i16 1583, i16 1597, i16 1601, i16 1607, i16 1609, i16 1613, i16 1619, i16 1621, i16 1627, i16 1637, i16 1657, i16 1663, i16 1667, i16 1669, i16 1693, i16 1697, i16 1699, i16 1709, i16 1721, i16 1723, i16 1733, i16 1741, i16 1747, i16 1753, i16 1759, i16 1777, i16 1783, i16 1787, i16 1789, i16 1801, i16 1811, i16 1823, i16 1831, i16 1847, i16 1861, i16 1867, i16 1871, i16 1873, i16 1877, i16 1879, i16 1889, i16 1901, i16 1907, i16 1913, i16 1931, i16 1933, i16 1949, i16 1951, i16 1973, i16 1979, i16 1987, i16 1993, i16 1997, i16 1999, i16 2003, i16 2011, i16 2017, i16 2027, i16 2029, i16 2039, i16 2053, i16 2063, i16 2069, i16 2081, i16 2083, i16 2087, i16 2089, i16 2099, i16 2111, i16 2113, i16 2129, i16 2131, i16 2137, i16 2141, i16 2143, i16 2153, i16 2161, i16 2179, i16 2203, i16 2207, i16 2213, i16 2221, i16 2237, i16 2239, i16 2243, i16 2251, i16 2267, i16 2269, i16 2273, i16 2281, i16 2287, i16 2293, i16 2297, i16 2309, i16 2311, i16 2333, i16 2339, i16 2341, i16 2347, i16 2351, i16 2357, i16 2371, i16 2377, i16 2381, i16 2383, i16 2389, i16 2393, i16 2399, i16 2411, i16 2417, i16 2423, i16 2437, i16 2441, i16 2447, i16 2459, i16 2467, i16 2473, i16 2477, i16 2503, i16 2521, i16 2531, i16 2539, i16 2543, i16 2549, i16 2551, i16 2557, i16 2579, i16 2591, i16 2593, i16 2609, i16 2617, i16 2621, i16 2633, i16 2647, i16 2657, i16 2659, i16 2663, i16 2671, i16 2677, i16 2683, i16 2687, i16 2689, i16 2693, i16 2699, i16 2707, i16 2711, i16 2713, i16 2719, i16 2729, i16 2731, i16 2741, i16 2749, i16 2753, i16 2767, i16 2777, i16 2789, i16 2791, i16 2797, i16 2801, i16 2803, i16 2819, i16 2833, i16 2837, i16 2843, i16 2851, i16 2857, i16 2861, i16 2879, i16 2887, i16 2897, i16 2903, i16 2909, i16 2917, i16 2927, i16 2939, i16 2953, i16 2957, i16 2963, i16 2969, i16 2971, i16 2999, i16 3001, i16 3011, i16 3019, i16 3023, i16 3037, i16 3041, i16 3049, i16 3061, i16 3067, i16 3079, i16 3083, i16 3089, i16 3109, i16 3119, i16 3121, i16 3137, i16 3163, i16 3167, i16 3169, i16 3181, i16 3187, i16 3191, i16 3203, i16 3209, i16 3217, i16 3221, i16 3229, i16 3251, i16 3253, i16 3257, i16 3259, i16 3271, i16 3299, i16 3301, i16 3307, i16 3313, i16 3319, i16 3323, i16 3329, i16 3331, i16 3343, i16 3347, i16 3359, i16 3361, i16 3371, i16 3373, i16 3389, i16 3391, i16 3407, i16 3413, i16 3433, i16 3449, i16 3457, i16 3461, i16 3463, i16 3467, i16 3469, i16 3491, i16 3499, i16 3511, i16 3517, i16 3527, i16 3529, i16 3533, i16 3539, i16 3541, i16 3547, i16 3557, i16 3559, i16 3571, i16 3581, i16 3583, i16 3593, i16 3607, i16 3613, i16 3617, i16 3623, i16 3631, i16 3637, i16 3643, i16 3659, i16 3671, i16 3673, i16 3677, i16 3691, i16 3697, i16 3701, i16 3709, i16 3719, i16 3727, i16 3733, i16 3739, i16 3761, i16 3767, i16 3769, i16 3779, i16 3793, i16 3797, i16 3803, i16 3821, i16 3823, i16 3833, i16 3847, i16 3851, i16 3853, i16 3863, i16 3877, i16 3881, i16 3889, i16 3907, i16 3911, i16 3917, i16 3919, i16 3923, i16 3929, i16 3931, i16 3943, i16 3947, i16 3967, i16 3989, i16 4001, i16 4003, i16 4007, i16 4013, i16 4019, i16 4021, i16 4027, i16 4049, i16 4051, i16 4057, i16 4073, i16 4079, i16 4091, i16 4093, i16 4099, i16 4111, i16 4127, i16 4129, i16 4133, i16 4139, i16 4153, i16 4157, i16 4159, i16 4177, i16 4201, i16 4211, i16 4217, i16 4219, i16 4229, i16 4231, i16 4241, i16 4243, i16 4253, i16 4259, i16 4261, i16 4271, i16 4273, i16 4283, i16 4289, i16 4297, i16 4327, i16 4337, i16 4339, i16 4349, i16 4357, i16 4363, i16 4373, i16 4391, i16 4397, i16 4409, i16 4421, i16 4423, i16 4441, i16 4447, i16 4451, i16 4457, i16 4463, i16 4481, i16 4483, i16 4493, i16 4507, i16 4513, i16 4517, i16 4519, i16 4523, i16 4547, i16 4549, i16 4561, i16 4567, i16 4583, i16 4591, i16 4597, i16 4603, i16 4621, i16 4637, i16 4639, i16 4643, i16 4649, i16 4651, i16 4657, i16 4663, i16 4673, i16 4679, i16 4691, i16 4703, i16 4721, i16 4723, i16 4729, i16 4733, i16 4751, i16 4759, i16 4783, i16 4787, i16 4789, i16 4793, i16 4799, i16 4801, i16 4813, i16 4817, i16 4831, i16 4861, i16 4871, i16 4877, i16 4889, i16 4903, i16 4909, i16 4919, i16 4931, i16 4933, i16 4937, i16 4943, i16 4951, i16 4957, i16 4967, i16 4969, i16 4973, i16 4987, i16 4993, i16 4999, i16 5003, i16 5009, i16 5011, i16 5021, i16 5023, i16 5039, i16 5051, i16 5059, i16 5077, i16 5081, i16 5087, i16 5099, i16 5101, i16 5107, i16 5113, i16 5119, i16 5147, i16 5153, i16 5167, i16 5171, i16 5179, i16 5189, i16 5197, i16 5209, i16 5227, i16 5231, i16 5233, i16 5237, i16 5261, i16 5273, i16 5279, i16 5281, i16 5297, i16 5303, i16 5309, i16 5323, i16 5333, i16 5347, i16 5351, i16 5381, i16 5387, i16 5393, i16 5399, i16 5407, i16 5413, i16 5417, i16 5419, i16 5431, i16 5437, i16 5441, i16 5443, i16 5449, i16 5471, i16 5477, i16 5479, i16 5483, i16 5501, i16 5503, i16 5507, i16 5519, i16 5521, i16 5527, i16 5531, i16 5557, i16 5563, i16 5569, i16 5573, i16 5581, i16 5591, i16 5623, i16 5639, i16 5641, i16 5647, i16 5651, i16 5653, i16 5657, i16 5659, i16 5669, i16 5683, i16 5689, i16 5693, i16 5701, i16 5711, i16 5717, i16 5737, i16 5741, i16 5743, i16 5749, i16 5779, i16 5783, i16 5791, i16 5801, i16 5807, i16 5813, i16 5821, i16 5827, i16 5839, i16 5843, i16 5849, i16 5851, i16 5857, i16 5861, i16 5867, i16 5869, i16 5879, i16 5881, i16 5897, i16 5903, i16 5923, i16 5927, i16 5939, i16 5953, i16 5981, i16 5987, i16 6007, i16 6011, i16 6029, i16 6037, i16 6043, i16 6047, i16 6053, i16 6067, i16 6073, i16 6079, i16 6089, i16 6091, i16 6101, i16 6113, i16 6121, i16 6131, i16 6133, i16 6143, i16 6151, i16 6163, i16 6173, i16 6197, i16 6199, i16 6203, i16 6211, i16 6217, i16 6221, i16 6229, i16 6247, i16 6257, i16 6263, i16 6269, i16 6271, i16 6277, i16 6287, i16 6299, i16 6301, i16 6311, i16 6317, i16 6323, i16 6329, i16 6337, i16 6343, i16 6353, i16 6359, i16 6361, i16 6367, i16 6373, i16 6379, i16 6389, i16 6397, i16 6421, i16 6427, i16 6449, i16 6451, i16 6469, i16 6473, i16 6481, i16 6491, i16 6521, i16 6529, i16 6547, i16 6551, i16 6553, i16 6563, i16 6569, i16 6571, i16 6577, i16 6581, i16 6599, i16 6607, i16 6619, i16 6637, i16 6653, i16 6659, i16 6661, i16 6673, i16 6679, i16 6689, i16 6691, i16 6701, i16 6703, i16 6709, i16 6719, i16 6733, i16 6737, i16 6761, i16 6763, i16 6779, i16 6781, i16 6791, i16 6793, i16 6803, i16 6823, i16 6827, i16 6829, i16 6833, i16 6841, i16 6857, i16 6863, i16 6869, i16 6871, i16 6883, i16 6899, i16 6907, i16 6911, i16 6917, i16 6947, i16 6949, i16 6959, i16 6961, i16 6967, i16 6971, i16 6977, i16 6983, i16 6991, i16 6997, i16 7001, i16 7013, i16 7019, i16 7027, i16 7039, i16 7043, i16 7057, i16 7069, i16 7079, i16 7103, i16 7109, i16 7121, i16 7127, i16 7129, i16 7151, i16 7159, i16 7177, i16 7187, i16 7193, i16 7207, i16 7211, i16 7213, i16 7219, i16 7229, i16 7237, i16 7243, i16 7247, i16 7253, i16 7283, i16 7297, i16 7307, i16 7309, i16 7321, i16 7331, i16 7333, i16 7349, i16 7351, i16 7369, i16 7393, i16 7411, i16 7417, i16 7433, i16 7451, i16 7457, i16 7459, i16 7477, i16 7481, i16 7487, i16 7489, i16 7499, i16 7507, i16 7517, i16 7523, i16 7529, i16 7537, i16 7541, i16 7547, i16 7549, i16 7559, i16 7561, i16 7573, i16 7577, i16 7583, i16 7589, i16 7591, i16 7603, i16 7607, i16 7621, i16 7639, i16 7643, i16 7649, i16 7669, i16 7673, i16 7681, i16 7687, i16 7691, i16 7699, i16 7703, i16 7717, i16 7723, i16 7727, i16 7741, i16 7753, i16 7757, i16 7759, i16 7789, i16 7793, i16 7817, i16 7823, i16 7829, i16 7841, i16 7853, i16 7867, i16 7873, i16 7877, i16 7879, i16 7883, i16 7901, i16 7907, i16 7919, i16 7927, i16 7933, i16 7937, i16 7949, i16 7951, i16 7963, i16 7993, i16 8009, i16 8011, i16 8017, i16 8039, i16 8053, i16 8059, i16 8069, i16 8081, i16 8087, i16 8089, i16 8093, i16 8101, i16 8111, i16 8117, i16 8123, i16 8147, i16 8161, i16 8167, i16 8171, i16 8179, i16 8191, i16 0], align 16
@stdout = external global %struct._IO_FILE*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_randomprime = private constant [11 x i8] c"randomprime"
@__profn_tmp1.ll_randombits = private constant [18 x i8] c"tmp1.ll:randombits"
@__profn_tmp1.ll_nextprime = private constant [17 x i8] c"tmp1.ll:nextprime"
@__profn_mp_gcd = private constant [6 x i8] c"mp_gcd"
@__profn_mp_inv = private constant [6 x i8] c"mp_inv"
@__profn_tmp1.ll_randomunit = private constant [18 x i8] c"tmp1.ll:randomunit"
@__profn_tmp1.ll_buildsieve = private constant [18 x i8] c"tmp1.ll:buildsieve"
@__profn_tmp1.ll_fastsieve = private constant [17 x i8] c"tmp1.ll:fastsieve"
@__profn_tmp1.ll_slowtest = private constant [16 x i8] c"tmp1.ll:slowtest"
@__profc_randomprime = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_randomprime = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7058857834792116817, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_randomprime, i32 0, i32 0), i8* bitcast (i32 (i16*, i16)* @randomprime to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_randombits = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_randombits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 942648064842577079, i64 41172350069, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_nextprime = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_nextprime = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3115065666007659057, i64 168600347693, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_gcd = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_gcd = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2740553392672221966, i64 144943565113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i32 0, i32 0), i8* bitcast (void (i16*, i16*, i16*)* @mp_gcd to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_inv = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_inv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1793605789391696412, i64 209652612997, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i32 0, i32 0), i8* bitcast (void (i16*, i16*, i16*)* @mp_inv to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_randomunit = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_randomunit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2112071706157921081, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_randomunit, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_buildsieve = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_buildsieve = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8066008990732529536, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_buildsieve, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fastsieve = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fastsieve = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6390202762955091079, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_slowtest = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_slowtest = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7756777027359681298, i64 72632864626, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [89 x i8] c"\87\01Vx\DA+J\CCK\C9\CF-(\CA\CCMe,\C9-0\D4\CB\C9\B1*\02\8B%e\96\14\C3\85\F2R+J \8Ar\0B\E2\D3\93S@Tf^\19\9A\96\D2\BC\CC\12\B8PRifNJqfj\19\C2\E0\B4\C4\E2\12T\91\E2\9C\FC\F2\92\D4\E2\12\00B\FE1\F1", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_randomprime to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_randombits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_nextprime to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_gcd to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_inv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_randomunit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_buildsieve to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fastsieve to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_slowtest to i8*), i8* getelementptr inbounds ([89 x i8], [89 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @randomprime(i16*, i16 signext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_randomprime, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_randomprime, i64 0, i64 0)
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16 %1, i16* %5, align 2
  %6 = load i16*, i16** %4, align 8
  %7 = load i16, i16* %5, align 2
  %8 = sext i16 %7 to i32
  %9 = sub nsw i32 %8, 2
  %10 = trunc i32 %9 to i16
  call void @randombits(i16* %6, i16 signext %10)
  %11 = load i16, i16* %5, align 2
  %12 = sext i16 %11 to i32
  %13 = sub nsw i32 %12, 1
  %14 = and i32 %13, 15
  %15 = shl i32 1, %14
  %16 = load i16*, i16** %4, align 8
  %17 = load i16, i16* %5, align 2
  %18 = sext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = add nsw i32 %19, 1
  %21 = add nsw i32 %20, 15
  %22 = ashr i32 %21, 4
  %23 = sub nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16* %16, i64 %24
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  %28 = or i32 %27, %15
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %25, align 2
  %30 = load i16, i16* %5, align 2
  %31 = sext i16 %30 to i32
  %32 = sub nsw i32 %31, 2
  %33 = and i32 %32, 15
  %34 = shl i32 1, %33
  %35 = load i16*, i16** %4, align 8
  %36 = load i16, i16* %5, align 2
  %37 = sext i16 %36 to i32
  %38 = sub nsw i32 %37, 2
  %39 = add nsw i32 %38, 1
  %40 = add nsw i32 %39, 15
  %41 = ashr i32 %40, 4
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16* %35, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = or i32 %46, %34
  %48 = trunc i32 %47 to i16
  store i16 %48, i16* %44, align 2
  %49 = load i16*, i16** %4, align 8
  %50 = call i32 @nextprime(i16* %49)
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define internal void @randombits(i16*, i16 signext) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  store i16 %1, i16* %4, align 2
  %5 = load i16*, i16** %3, align 8
  call void @mp_init(i16* %5, i16 zeroext 0)
  br label %6

; <label>:6:                                      ; preds = %10, %2
  %7 = load i16, i16* %4, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp sge i32 %8, 16
  br i1 %9, label %10, label %19

; <label>:10:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 0)
  %12 = call zeroext i16 @randomunit()
  %13 = load i16*, i16** %3, align 8
  %14 = getelementptr inbounds i16, i16* %13, i32 1
  store i16* %14, i16** %3, align 8
  store i16 %12, i16* %13, align 2
  %15 = load i16, i16* %4, align 2
  %16 = sext i16 %15 to i32
  %17 = sub nsw i32 %16, 16
  %18 = trunc i32 %17 to i16
  store i16 %18, i16* %4, align 2
  br label %6

; <label>:19:                                     ; preds = %6
  %20 = load i16, i16* %4, align 2
  %21 = icmp ne i16 %20, 0
  br i1 %21, label %22, label %33

; <label>:22:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 2)
  %24 = call zeroext i16 @randomunit()
  %25 = zext i16 %24 to i32
  %26 = load i16, i16* %4, align 2
  %27 = sext i16 %26 to i32
  %28 = shl i32 1, %27
  %29 = sub nsw i32 %28, 1
  %30 = and i32 %25, %29
  %31 = trunc i32 %30 to i16
  %32 = load i16*, i16** %3, align 8
  store i16 %31, i16* %32, align 2
  br label %33

; <label>:33:                                     ; preds = %22, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 1)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_randombits, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @nextprime(i16*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  store i16* %0, i16** %3, align 8
  %10 = load i16*, i16** %3, align 8
  %11 = call zeroext i8 @mp_inc(i16* %10)
  %12 = load i16*, i16** %3, align 8
  %13 = call signext i16 @significance(i16* %12)
  %14 = sext i16 %13 to i32
  %15 = icmp sle i32 %14, 1
  br i1 %15, label %16, label %47

; <label>:16:                                     ; preds = %1
  store i16 0, i16* %7, align 2
  br label %17

; <label>:17:                                     ; preds = %42, %16
  %18 = load i16, i16* %7, align 2
  %19 = sext i16 %18 to i64
  %20 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %19
  %21 = load i16, i16* %20, align 2
  %22 = icmp ne i16 %21, 0
  br i1 %22, label %23, label %45

; <label>:23:                                     ; preds = %17
  %24 = load i16, i16* %7, align 2
  %25 = sext i16 %24 to i64
  %26 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %25
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  %29 = load i16*, i16** %3, align 8
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = icmp sge i32 %28, %31
  br i1 %32, label %33, label %40

; <label>:33:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 5)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 5)
  %35 = load i16*, i16** %3, align 8
  %36 = load i16, i16* %7, align 2
  %37 = sext i16 %36 to i64
  %38 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %37
  %39 = load i16, i16* %38, align 2
  call void @mp_init(i16* %35, i16 zeroext %39)
  store i32 0, i32* %2, align 4
  br label %158

; <label>:40:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 2)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 2)
  br label %42

; <label>:42:                                     ; preds = %40
  %43 = load i16, i16* %7, align 2
  %44 = add i16 %43, 1
  store i16 %44, i16* %7, align 2
  br label %17

; <label>:45:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 6)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 6)
  br label %47

; <label>:47:                                     ; preds = %45, %1
  %48 = load i16*, i16** %3, align 8
  %49 = load i16, i16* @global_precision, align 2
  %50 = sext i16 %49 to i32
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i16, i16* %48, i64 %51
  %53 = getelementptr inbounds i16, i16* %52, i64 -1
  %54 = load i16, i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = icmp slt i32 %55, 0
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 4)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 4)
  %59 = load i16*, i16** %3, align 8
  call void @mp_init(i16* %59, i16 zeroext 2)
  store i32 0, i32* %2, align 4
  br label %158

; <label>:60:                                     ; preds = %47
  %61 = load i16*, i16** %3, align 8
  %62 = load i16, i16* %61, align 2
  %63 = zext i16 %62 to i32
  %64 = or i32 %63, 3
  %65 = trunc i32 %64 to i16
  store i16 %65, i16* %61, align 2
  %66 = load i16, i16* @global_precision, align 2
  store i16 %66, i16* %6, align 2
  %67 = load i16*, i16** %3, align 8
  %68 = call i32 @countbits(i16* %67)
  %69 = add nsw i32 %68, 4
  %70 = add nsw i32 %69, 0
  %71 = add nsw i32 %70, 15
  %72 = ashr i32 %71, 4
  %73 = trunc i32 %72 to i16
  store i16 %73, i16* @global_precision, align 2
  %74 = call noalias i8* @malloc(i64 2058) #4
  %75 = bitcast i8* %74 to i16*
  store i16* %75, i16** %9, align 8
  %76 = load i16*, i16** %3, align 8
  %77 = load i16*, i16** %9, align 8
  call void @buildsieve(i16* %76, i16* %77)
  store i16 0, i16* %4, align 2
  %78 = load i16, i16* @global_precision, align 2
  %79 = sext i16 %78 to i32
  %80 = shl i32 %79, 4
  %81 = mul nsw i32 8, %80
  %82 = trunc i32 %81 to i16
  store i16 %82, i16* %5, align 2
  store i16 0, i16* %8, align 2
  br label %83

; <label>:83:                                     ; preds = %120, %60
  %84 = load i16, i16* %4, align 2
  %85 = load i16*, i16** %9, align 8
  %86 = call zeroext i8 @fastsieve(i16 zeroext %84, i16* %85)
  %87 = icmp ne i8 %86, 0
  br i1 %87, label %88, label %101

; <label>:88:                                     ; preds = %83
  %89 = load i16, i16* %8, align 2
  %90 = add i16 %89, 1
  store i16 %90, i16* %8, align 2
  %91 = call i32 @putchar(i32 46)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %93 = call i32 @fflush(%struct._IO_FILE* %92)
  %94 = load i16*, i16** %3, align 8
  %95 = call zeroext i8 @slowtest(i16* %94)
  %96 = icmp ne i8 %95, 0
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %88
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 8)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 8)
  br label %122

; <label>:99:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 3)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 3)
  br label %101

; <label>:101:                                    ; preds = %99, %83
  %102 = load i16, i16* %4, align 2
  %103 = zext i16 %102 to i32
  %104 = add nsw i32 %103, 4
  %105 = trunc i32 %104 to i16
  store i16 %105, i16* %4, align 2
  %106 = load i16*, i16** %3, align 8
  %107 = call zeroext i8 @mp_inc(i16* %106)
  %108 = load i16*, i16** %3, align 8
  %109 = call zeroext i8 @mp_inc(i16* %108)
  %110 = load i16*, i16** %3, align 8
  %111 = call zeroext i8 @mp_inc(i16* %110)
  %112 = load i16*, i16** %3, align 8
  %113 = call zeroext i8 @mp_inc(i16* %112)
  %114 = load i16, i16* %4, align 2
  %115 = zext i16 %114 to i32
  %116 = load i16, i16* %5, align 2
  %117 = zext i16 %116 to i32
  %118 = icmp sgt i32 %115, %117
  br i1 %118, label %119, label %120

; <label>:119:                                    ; preds = %101
  br label %122

; <label>:120:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 1)
  %121 = add i64 %pgocount6, 1
  store i64 %121, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 1)
  br label %83

; <label>:122:                                    ; preds = %119, %97
  %123 = call i32 @putchar(i32 32)
  store i16 0, i16* %7, align 2
  br label %124

; <label>:124:                                    ; preds = %135, %122
  %125 = load i16, i16* %7, align 2
  %126 = sext i16 %125 to i64
  %127 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %126
  %128 = load i16, i16* %127, align 2
  %129 = icmp ne i16 %128, 0
  br i1 %129, label %130, label %139

; <label>:130:                                    ; preds = %124
  %131 = load i16*, i16** %9, align 8
  %132 = load i16, i16* %7, align 2
  %133 = sext i16 %132 to i64
  %134 = getelementptr inbounds i16, i16* %131, i64 %133
  store i16 0, i16* %134, align 2
  br label %135

; <label>:135:                                    ; preds = %130
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 0)
  %136 = add i64 %pgocount7, 1
  store i64 %136, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 0)
  %137 = load i16, i16* %7, align 2
  %138 = add i16 %137, 1
  store i16 %138, i16* %7, align 2
  br label %124

; <label>:139:                                    ; preds = %124
  %140 = load i16*, i16** %9, align 8
  %141 = bitcast i16* %140 to i8*
  call void @free(i8* %141) #4
  %142 = load i16, i16* %6, align 2
  store i16 %142, i16* @global_precision, align 2
  %143 = load i16, i16* %4, align 2
  %144 = zext i16 %143 to i32
  %145 = load i16, i16* %5, align 2
  %146 = zext i16 %145 to i32
  %147 = icmp sgt i32 %144, %146
  br i1 %147, label %148, label %156

; <label>:148:                                    ; preds = %139
  %149 = load i16, i16* %8, align 2
  %150 = sext i16 %149 to i32
  %151 = icmp slt i32 %150, 1
  br i1 %151, label %152, label %154

; <label>:152:                                    ; preds = %148
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 10)
  %153 = add i64 %pgocount8, 1
  store i64 %153, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 10)
  store i32 -13, i32* %2, align 4
  br label %158

; <label>:154:                                    ; preds = %148
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 9)
  %155 = add i64 %pgocount9, 1
  store i64 %155, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 9)
  store i32 -14, i32* %2, align 4
  br label %158

; <label>:156:                                    ; preds = %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 7)
  %157 = add i64 %pgocount10, 1
  store i64 %157, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_nextprime, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %158

; <label>:158:                                    ; preds = %156, %154, %152, %57, %33
  %159 = load i32, i32* %2, align 4
  ret i32 %159
}

; Function Attrs: nounwind uwtable
define void @mp_gcd(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca [3 x [130 x i16]], align 16
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  %9 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 0
  %10 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i64 0, i64 0
  %11 = bitcast i16* %10 to i8*
  %12 = load i16*, i16** %6, align 8
  %13 = bitcast i16* %12 to i8*
  %14 = load i16, i16* @global_precision, align 2
  %15 = sext i16 %14 to i32
  %16 = shl i32 %15, 1
  %17 = sext i32 %16 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %13, i64 %17, i32 1, i1 false)
  %18 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 1
  %19 = getelementptr inbounds [130 x i16], [130 x i16]* %18, i64 0, i64 0
  %20 = bitcast i16* %19 to i8*
  %21 = load i16*, i16** %5, align 8
  %22 = bitcast i16* %21 to i8*
  %23 = load i16, i16* @global_precision, align 2
  %24 = sext i16 %23 to i32
  %25 = shl i32 %24, 1
  %26 = sext i32 %25 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %22, i64 %26, i32 1, i1 false)
  store i16 1, i16* %7, align 2
  br label %27

; <label>:27:                                     ; preds = %90, %3
  %28 = load i16, i16* %7, align 2
  %29 = sext i16 %28 to i64
  %30 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %29
  %31 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i64 0, i64 0
  %32 = load i16, i16* %31, align 4
  %33 = zext i16 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %44, label %35

; <label>:35:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 3)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 3)
  %37 = load i16, i16* %7, align 2
  %38 = sext i16 %37 to i64
  %39 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %38
  %40 = getelementptr inbounds [130 x i16], [130 x i16]* %39, i64 0, i64 0
  %41 = call signext i16 @significance(i16* %40)
  %42 = sext i16 %41 to i32
  %43 = icmp sgt i32 %42, 1
  br label %44

; <label>:44:                                     ; preds = %35, %27
  %45 = phi i1 [ true, %27 ], [ %43, %35 ]
  br i1 %45, label %46, label %93

; <label>:46:                                     ; preds = %44
  %47 = load i16, i16* %7, align 2
  %48 = sext i16 %47 to i32
  %49 = icmp eq i32 %48, 2
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %46
  br label %56

; <label>:51:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 0)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 0)
  %53 = load i16, i16* %7, align 2
  %54 = sext i16 %53 to i32
  %55 = add nsw i32 %54, 1
  br label %56

; <label>:56:                                     ; preds = %51, %50
  %57 = phi i32 [ 0, %50 ], [ %55, %51 ]
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %58
  %60 = getelementptr inbounds [130 x i16], [130 x i16]* %59, i64 0, i64 0
  %61 = load i16, i16* %7, align 2
  %62 = sext i16 %61 to i32
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 4)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 4)
  br label %70

; <label>:66:                                     ; preds = %56
  %67 = load i16, i16* %7, align 2
  %68 = sext i16 %67 to i32
  %69 = sub nsw i32 %68, 1
  br label %70

; <label>:70:                                     ; preds = %66, %64
  %71 = phi i32 [ 2, %64 ], [ %69, %66 ]
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %72
  %74 = getelementptr inbounds [130 x i16], [130 x i16]* %73, i64 0, i64 0
  %75 = load i16, i16* %7, align 2
  %76 = sext i16 %75 to i64
  %77 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %76
  %78 = getelementptr inbounds [130 x i16], [130 x i16]* %77, i64 0, i64 0
  %79 = call i32 @mp_mod(i16* %60, i16* %74, i16* %78)
  %80 = load i16, i16* %7, align 2
  %81 = sext i16 %80 to i32
  %82 = icmp eq i32 %81, 2
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 1)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 1)
  br label %90

; <label>:85:                                     ; preds = %70
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 2)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 2)
  %87 = load i16, i16* %7, align 2
  %88 = sext i16 %87 to i32
  %89 = add nsw i32 %88, 1
  br label %90

; <label>:90:                                     ; preds = %85, %83
  %91 = phi i32 [ 0, %83 ], [ %89, %85 ]
  %92 = trunc i32 %91 to i16
  store i16 %92, i16* %7, align 2
  br label %27

; <label>:93:                                     ; preds = %44
  %94 = load i16*, i16** %4, align 8
  %95 = bitcast i16* %94 to i8*
  %96 = load i16, i16* %7, align 2
  %97 = sext i16 %96 to i32
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %101

; <label>:99:                                     ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 7)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 7)
  br label %105

; <label>:101:                                    ; preds = %93
  %102 = load i16, i16* %7, align 2
  %103 = sext i16 %102 to i32
  %104 = sub nsw i32 %103, 1
  br label %105

; <label>:105:                                    ; preds = %101, %99
  %106 = phi i32 [ 2, %99 ], [ %104, %101 ]
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %107
  %109 = getelementptr inbounds [130 x i16], [130 x i16]* %108, i64 0, i64 0
  %110 = bitcast i16* %109 to i8*
  %111 = load i16, i16* @global_precision, align 2
  %112 = sext i16 %111 to i32
  %113 = shl i32 %112, 1
  %114 = sext i32 %113 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %110, i64 %114, i32 1, i1 false)
  %115 = load i16, i16* %7, align 2
  %116 = sext i16 %115 to i32
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %105
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 8)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 8)
  br label %124

; <label>:120:                                    ; preds = %105
  %121 = load i16, i16* %7, align 2
  %122 = sext i16 %121 to i32
  %123 = sub nsw i32 %122, 1
  br label %124

; <label>:124:                                    ; preds = %120, %118
  %125 = phi i32 [ 2, %118 ], [ %123, %120 ]
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %126
  %128 = getelementptr inbounds [130 x i16], [130 x i16]* %127, i64 0, i64 0
  call void @mp_init(i16* %128, i16 zeroext 0)
  %129 = load i16, i16* %7, align 2
  %130 = sext i16 %129 to i32
  %131 = icmp eq i32 %130, 2
  br i1 %131, label %132, label %134

; <label>:132:                                    ; preds = %124
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 5)
  %133 = add i64 %pgocount7, 1
  store i64 %133, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 5)
  br label %139

; <label>:134:                                    ; preds = %124
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 6)
  %135 = add i64 %pgocount8, 1
  store i64 %135, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_mp_gcd, i64 0, i64 6)
  %136 = load i16, i16* %7, align 2
  %137 = sext i16 %136 to i32
  %138 = add nsw i32 %137, 1
  br label %139

; <label>:139:                                    ; preds = %134, %132
  %140 = phi i32 [ 0, %132 ], [ %138, %134 ]
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %8, i64 0, i64 %141
  %143 = getelementptr inbounds [130 x i16], [130 x i16]* %142, i64 0, i64 0
  call void @mp_init(i16* %143, i16 zeroext 0)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare signext i16 @significance(i16*) #2

declare i32 @mp_mod(i16*, i16*, i16*) #2

declare void @mp_init(i16*, i16 zeroext) #2

; Function Attrs: nounwind uwtable
define void @mp_inv(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca [130 x i16], align 16
  %9 = alloca [130 x i16], align 16
  %10 = alloca [3 x [130 x i16]], align 16
  %11 = alloca [3 x [130 x i16]], align 16
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  %12 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 0
  %13 = getelementptr inbounds [130 x i16], [130 x i16]* %12, i64 0, i64 0
  %14 = bitcast i16* %13 to i8*
  %15 = load i16*, i16** %6, align 8
  %16 = bitcast i16* %15 to i8*
  %17 = load i16, i16* @global_precision, align 2
  %18 = sext i16 %17 to i32
  %19 = shl i32 %18, 1
  %20 = sext i32 %19 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %16, i64 %20, i32 1, i1 false)
  %21 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 1
  %22 = getelementptr inbounds [130 x i16], [130 x i16]* %21, i64 0, i64 0
  %23 = bitcast i16* %22 to i8*
  %24 = load i16*, i16** %5, align 8
  %25 = bitcast i16* %24 to i8*
  %26 = load i16, i16* @global_precision, align 2
  %27 = sext i16 %26 to i32
  %28 = shl i32 %27, 1
  %29 = sext i32 %28 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %25, i64 %29, i32 1, i1 false)
  %30 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 0
  %31 = getelementptr inbounds [130 x i16], [130 x i16]* %30, i64 0, i64 0
  call void @mp_init(i16* %31, i16 zeroext 0)
  %32 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 1
  %33 = getelementptr inbounds [130 x i16], [130 x i16]* %32, i64 0, i64 0
  call void @mp_init(i16* %33, i16 zeroext 1)
  store i16 1, i16* %7, align 2
  br label %34

; <label>:34:                                     ; preds = %155, %3
  %35 = load i16, i16* %7, align 2
  %36 = sext i16 %35 to i64
  %37 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %36
  %38 = getelementptr inbounds [130 x i16], [130 x i16]* %37, i64 0, i64 0
  %39 = load i16, i16* %38, align 4
  %40 = zext i16 %39 to i32
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %51, label %42

; <label>:42:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 5)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 5)
  %44 = load i16, i16* %7, align 2
  %45 = sext i16 %44 to i64
  %46 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %45
  %47 = getelementptr inbounds [130 x i16], [130 x i16]* %46, i64 0, i64 0
  %48 = call signext i16 @significance(i16* %47)
  %49 = sext i16 %48 to i32
  %50 = icmp sgt i32 %49, 1
  br label %51

; <label>:51:                                     ; preds = %42, %34
  %52 = phi i1 [ true, %34 ], [ %50, %42 ]
  br i1 %52, label %53, label %158

; <label>:53:                                     ; preds = %51
  %54 = load i16, i16* %7, align 2
  %55 = sext i16 %54 to i32
  %56 = icmp eq i32 %55, 2
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %53
  br label %63

; <label>:58:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 0)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 0)
  %60 = load i16, i16* %7, align 2
  %61 = sext i16 %60 to i32
  %62 = add nsw i32 %61, 1
  br label %63

; <label>:63:                                     ; preds = %58, %57
  %64 = phi i32 [ 0, %57 ], [ %62, %58 ]
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %65
  %67 = getelementptr inbounds [130 x i16], [130 x i16]* %66, i64 0, i64 0
  %68 = getelementptr inbounds [130 x i16], [130 x i16]* %8, i32 0, i32 0
  %69 = load i16, i16* %7, align 2
  %70 = sext i16 %69 to i32
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 6)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 6)
  br label %78

; <label>:74:                                     ; preds = %63
  %75 = load i16, i16* %7, align 2
  %76 = sext i16 %75 to i32
  %77 = sub nsw i32 %76, 1
  br label %78

; <label>:78:                                     ; preds = %74, %72
  %79 = phi i32 [ 2, %72 ], [ %77, %74 ]
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %80
  %82 = getelementptr inbounds [130 x i16], [130 x i16]* %81, i64 0, i64 0
  %83 = load i16, i16* %7, align 2
  %84 = sext i16 %83 to i64
  %85 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %84
  %86 = getelementptr inbounds [130 x i16], [130 x i16]* %85, i64 0, i64 0
  %87 = call i32 @mp_udiv(i16* %67, i16* %68, i16* %82, i16* %86)
  %88 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  %89 = getelementptr inbounds [130 x i16], [130 x i16]* %8, i32 0, i32 0
  %90 = load i16, i16* %7, align 2
  %91 = sext i16 %90 to i64
  %92 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 %91
  %93 = getelementptr inbounds [130 x i16], [130 x i16]* %92, i64 0, i64 0
  %94 = call i32 @mp_mult(i16* %88, i16* %89, i16* %93)
  %95 = load i16, i16* %7, align 2
  %96 = sext i16 %95 to i32
  %97 = icmp eq i32 %96, 2
  br i1 %97, label %98, label %99

; <label>:98:                                     ; preds = %78
  br label %104

; <label>:99:                                     ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 1)
  %100 = add i64 %pgocount3, 1
  store i64 %100, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 1)
  %101 = load i16, i16* %7, align 2
  %102 = sext i16 %101 to i32
  %103 = add nsw i32 %102, 1
  br label %104

; <label>:104:                                    ; preds = %99, %98
  %105 = phi i32 [ 0, %98 ], [ %103, %99 ]
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 %106
  %108 = getelementptr inbounds [130 x i16], [130 x i16]* %107, i64 0, i64 0
  %109 = bitcast i16* %108 to i8*
  %110 = load i16, i16* %7, align 2
  %111 = sext i16 %110 to i32
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %115

; <label>:113:                                    ; preds = %104
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 7)
  %114 = add i64 %pgocount4, 1
  store i64 %114, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 7)
  br label %119

; <label>:115:                                    ; preds = %104
  %116 = load i16, i16* %7, align 2
  %117 = sext i16 %116 to i32
  %118 = sub nsw i32 %117, 1
  br label %119

; <label>:119:                                    ; preds = %115, %113
  %120 = phi i32 [ 2, %113 ], [ %118, %115 ]
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 %121
  %123 = getelementptr inbounds [130 x i16], [130 x i16]* %122, i64 0, i64 0
  %124 = bitcast i16* %123 to i8*
  %125 = load i16, i16* @global_precision, align 2
  %126 = sext i16 %125 to i32
  %127 = shl i32 %126, 1
  %128 = sext i32 %127 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %124, i64 %128, i32 1, i1 false)
  %129 = load i16, i16* %7, align 2
  %130 = sext i16 %129 to i32
  %131 = icmp eq i32 %130, 2
  br i1 %131, label %132, label %133

; <label>:132:                                    ; preds = %119
  br label %138

; <label>:133:                                    ; preds = %119
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 2)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 2)
  %135 = load i16, i16* %7, align 2
  %136 = sext i16 %135 to i32
  %137 = add nsw i32 %136, 1
  br label %138

; <label>:138:                                    ; preds = %133, %132
  %139 = phi i32 [ 0, %132 ], [ %137, %133 ]
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 %140
  %142 = getelementptr inbounds [130 x i16], [130 x i16]* %141, i64 0, i64 0
  %143 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  %144 = call zeroext i8 @mp_subb(i16* %142, i16* %143, i8 zeroext 0)
  %145 = load i16, i16* %7, align 2
  %146 = sext i16 %145 to i32
  %147 = icmp eq i32 %146, 2
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %138
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 3)
  %149 = add i64 %pgocount6, 1
  store i64 %149, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 3)
  br label %155

; <label>:150:                                    ; preds = %138
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 4)
  %151 = add i64 %pgocount7, 1
  store i64 %151, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 4)
  %152 = load i16, i16* %7, align 2
  %153 = sext i16 %152 to i32
  %154 = add nsw i32 %153, 1
  br label %155

; <label>:155:                                    ; preds = %150, %148
  %156 = phi i32 [ 0, %148 ], [ %154, %150 ]
  %157 = trunc i32 %156 to i16
  store i16 %157, i16* %7, align 2
  br label %34

; <label>:158:                                    ; preds = %51
  %159 = load i16*, i16** %4, align 8
  %160 = bitcast i16* %159 to i8*
  %161 = load i16, i16* %7, align 2
  %162 = sext i16 %161 to i32
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %164, label %166

; <label>:164:                                    ; preds = %158
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 10)
  %165 = add i64 %pgocount8, 1
  store i64 %165, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 10)
  br label %170

; <label>:166:                                    ; preds = %158
  %167 = load i16, i16* %7, align 2
  %168 = sext i16 %167 to i32
  %169 = sub nsw i32 %168, 1
  br label %170

; <label>:170:                                    ; preds = %166, %164
  %171 = phi i32 [ 2, %164 ], [ %169, %166 ]
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 %172
  %174 = getelementptr inbounds [130 x i16], [130 x i16]* %173, i64 0, i64 0
  %175 = bitcast i16* %174 to i8*
  %176 = load i16, i16* @global_precision, align 2
  %177 = sext i16 %176 to i32
  %178 = shl i32 %177, 1
  %179 = sext i32 %178 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %175, i64 %179, i32 1, i1 false)
  %180 = load i16*, i16** %4, align 8
  %181 = load i16, i16* @global_precision, align 2
  %182 = sext i16 %181 to i32
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i16, i16* %180, i64 %183
  %185 = getelementptr inbounds i16, i16* %184, i64 -1
  %186 = load i16, i16* %185, align 2
  %187 = sext i16 %186 to i32
  %188 = icmp slt i32 %187, 0
  br i1 %188, label %189, label %194

; <label>:189:                                    ; preds = %170
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 11)
  %190 = add i64 %pgocount9, 1
  store i64 %190, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 11)
  %191 = load i16*, i16** %4, align 8
  %192 = load i16*, i16** %6, align 8
  %193 = call zeroext i8 @mp_addc(i16* %191, i16* %192, i8 zeroext 0)
  br label %194

; <label>:194:                                    ; preds = %189, %170
  %195 = load i16, i16* %7, align 2
  %196 = sext i16 %195 to i32
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %200

; <label>:198:                                    ; preds = %194
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 12)
  %199 = add i64 %pgocount10, 1
  store i64 %199, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 12)
  br label %204

; <label>:200:                                    ; preds = %194
  %201 = load i16, i16* %7, align 2
  %202 = sext i16 %201 to i32
  %203 = sub nsw i32 %202, 1
  br label %204

; <label>:204:                                    ; preds = %200, %198
  %205 = phi i32 [ 2, %198 ], [ %203, %200 ]
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %206
  %208 = getelementptr inbounds [130 x i16], [130 x i16]* %207, i64 0, i64 0
  call void @mp_init(i16* %208, i16 zeroext 0)
  %209 = load i16, i16* %7, align 2
  %210 = sext i16 %209 to i32
  %211 = icmp eq i32 %210, 2
  br i1 %211, label %212, label %214

; <label>:212:                                    ; preds = %204
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 8)
  %213 = add i64 %pgocount11, 1
  store i64 %213, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 8)
  br label %219

; <label>:214:                                    ; preds = %204
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 9)
  %215 = add i64 %pgocount12, 1
  store i64 %215, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_mp_inv, i64 0, i64 9)
  %216 = load i16, i16* %7, align 2
  %217 = sext i16 %216 to i32
  %218 = add nsw i32 %217, 1
  br label %219

; <label>:219:                                    ; preds = %214, %212
  %220 = phi i32 [ 0, %212 ], [ %218, %214 ]
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %10, i64 0, i64 %221
  %223 = getelementptr inbounds [130 x i16], [130 x i16]* %222, i64 0, i64 0
  call void @mp_init(i16* %223, i16 zeroext 0)
  %224 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 0
  %225 = getelementptr inbounds [130 x i16], [130 x i16]* %224, i64 0, i64 0
  call void @mp_init(i16* %225, i16 zeroext 0)
  %226 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 1
  %227 = getelementptr inbounds [130 x i16], [130 x i16]* %226, i64 0, i64 0
  call void @mp_init(i16* %227, i16 zeroext 0)
  %228 = getelementptr inbounds [3 x [130 x i16]], [3 x [130 x i16]]* %11, i64 0, i64 2
  %229 = getelementptr inbounds [130 x i16], [130 x i16]* %228, i64 0, i64 0
  call void @mp_init(i16* %229, i16 zeroext 0)
  %230 = getelementptr inbounds [130 x i16], [130 x i16]* %8, i32 0, i32 0
  call void @mp_init(i16* %230, i16 zeroext 0)
  %231 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  call void @mp_init(i16* %231, i16 zeroext 0)
  ret void
}

declare i32 @mp_udiv(i16*, i16*, i16*, i16*) #2

declare i32 @mp_mult(i16*, i16*, i16*) #2

declare zeroext i8 @mp_subb(i16*, i16*, i8 zeroext) #2

declare zeroext i8 @mp_addc(i16*, i16*, i8 zeroext) #2

; Function Attrs: nounwind uwtable
define internal zeroext i16 @randomunit() #0 {
  %1 = alloca i16, align 2
  %2 = alloca i8, align 1
  store i16 0, i16* %1, align 2
  store i8 2, i8* %2, align 1
  br label %3

; <label>:3:                                      ; preds = %11, %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_randomunit, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_randomunit, i64 0, i64 0)
  %5 = load i16, i16* %1, align 2
  %6 = zext i16 %5 to i32
  %7 = shl i32 %6, 8
  %8 = call i32 @trueRandByte()
  %9 = add nsw i32 %7, %8
  %10 = trunc i32 %9 to i16
  store i16 %10, i16* %1, align 2
  br label %11

; <label>:11:                                     ; preds = %3
  %12 = load i8, i8* %2, align 1
  %13 = add i8 %12, -1
  store i8 %13, i8* %2, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %3, label %16

; <label>:16:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_randomunit, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_randomunit, i64 0, i64 1)
  %18 = load i16, i16* %1, align 2
  ret i16 %18
}

declare i32 @trueRandByte() #2

declare zeroext i8 @mp_inc(i16*) #2

declare i32 @countbits(i16*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define internal void @buildsieve(i16*, i16*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  store i16* %1, i16** %4, align 8
  store i16 1, i16* %5, align 2
  br label %6

; <label>:6:                                      ; preds = %23, %2
  %7 = load i16, i16* %5, align 2
  %8 = sext i16 %7 to i64
  %9 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %8
  %10 = load i16, i16* %9, align 2
  %11 = icmp ne i16 %10, 0
  br i1 %11, label %12, label %27

; <label>:12:                                     ; preds = %6
  %13 = load i16*, i16** %3, align 8
  %14 = load i16, i16* %5, align 2
  %15 = sext i16 %14 to i64
  %16 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = call zeroext i16 @mp_shortmod(i16* %13, i16 zeroext %17)
  %19 = load i16*, i16** %4, align 8
  %20 = load i16, i16* %5, align 2
  %21 = sext i16 %20 to i64
  %22 = getelementptr inbounds i16, i16* %19, i64 %21
  store i16 %18, i16* %22, align 2
  br label %23

; <label>:23:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_buildsieve, i64 0, i64 0)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_buildsieve, i64 0, i64 0)
  %25 = load i16, i16* %5, align 2
  %26 = add i16 %25, 1
  store i16 %26, i16* %5, align 2
  br label %6

; <label>:27:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_buildsieve, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_buildsieve, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @fastsieve(i16 zeroext, i16*) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i16, align 2
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  store i16 %0, i16* %4, align 2
  store i16* %1, i16** %5, align 8
  store i16 1, i16* %6, align 2
  br label %7

; <label>:7:                                      ; preds = %33, %2
  %8 = load i16, i16* %6, align 2
  %9 = sext i16 %8 to i64
  %10 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %9
  %11 = load i16, i16* %10, align 2
  %12 = icmp ne i16 %11, 0
  br i1 %12, label %13, label %37

; <label>:13:                                     ; preds = %7
  %14 = load i16, i16* %4, align 2
  %15 = zext i16 %14 to i32
  %16 = load i16*, i16** %5, align 8
  %17 = load i16, i16* %6, align 2
  %18 = sext i16 %17 to i64
  %19 = getelementptr inbounds i16, i16* %16, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %15, %21
  %23 = load i16, i16* %6, align 2
  %24 = sext i16 %23 to i64
  %25 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %24
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  %28 = srem i32 %22, %27
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 2)
  store i8 0, i8* %3, align 1
  br label %39

; <label>:32:                                     ; preds = %13
  br label %33

; <label>:33:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 0)
  %35 = load i16, i16* %6, align 2
  %36 = add i16 %35, 1
  store i16 %36, i16* %6, align 2
  br label %7

; <label>:37:                                     ; preds = %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 1)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fastsieve, i64 0, i64 1)
  store i8 1, i8* %3, align 1
  br label %39

; <label>:39:                                     ; preds = %37, %30
  %40 = load i8, i8* %3, align 1
  ret i8 %40
}

declare i32 @putchar(i32) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal zeroext i8 @slowtest(i16*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i16*, align 8
  %4 = alloca [130 x i16], align 16
  %5 = alloca [130 x i16], align 16
  %6 = alloca [130 x i16], align 16
  %7 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  %8 = getelementptr inbounds [130 x i16], [130 x i16]* %6, i32 0, i32 0
  %9 = bitcast i16* %8 to i8*
  %10 = load i16*, i16** %3, align 8
  %11 = bitcast i16* %10 to i8*
  %12 = load i16, i16* @global_precision, align 2
  %13 = sext i16 %12 to i32
  %14 = shl i32 %13, 1
  %15 = sext i32 %14 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %11, i64 %15, i32 1, i1 false)
  %16 = getelementptr inbounds [130 x i16], [130 x i16]* %6, i32 0, i32 0
  %17 = call zeroext i8 @mp_dec(i16* %16)
  store i16 0, i16* %7, align 2
  br label %18

; <label>:18:                                     ; preds = %53, %1
  %19 = load i16, i16* %7, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp slt i32 %20, 4
  br i1 %21, label %22, label %57

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds [130 x i16], [130 x i16]* %4, i32 0, i32 0
  %24 = load i16, i16* %7, align 2
  %25 = sext i16 %24 to i64
  %26 = getelementptr inbounds [1029 x i16], [1029 x i16]* @primetable, i64 0, i64 %25
  %27 = load i16, i16* %26, align 2
  call void @mp_init(i16* %23, i16 zeroext %27)
  %28 = getelementptr inbounds [130 x i16], [130 x i16]* %5, i32 0, i32 0
  %29 = getelementptr inbounds [130 x i16], [130 x i16]* %4, i32 0, i32 0
  %30 = getelementptr inbounds [130 x i16], [130 x i16]* %6, i32 0, i32 0
  %31 = load i16*, i16** %3, align 8
  %32 = call i32 @mp_modexp(i16* %28, i16* %29, i16* %30, i16* %31)
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 3)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 3)
  store i8 0, i8* %2, align 1
  br label %62

; <label>:36:                                     ; preds = %22
  %37 = getelementptr inbounds [130 x i16], [130 x i16]* %5, i32 0, i32 0
  %38 = load i16, i16* %37, align 16
  %39 = zext i16 %38 to i32
  %40 = icmp ne i32 %39, 1
  br i1 %40, label %47, label %41

; <label>:41:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 0)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 0)
  %43 = getelementptr inbounds [130 x i16], [130 x i16]* %5, i32 0, i32 0
  %44 = call signext i16 @significance(i16* %43)
  %45 = sext i16 %44 to i32
  %46 = icmp sgt i32 %45, 1
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %41, %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 2)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 2)
  store i8 0, i8* %2, align 1
  br label %62

; <label>:49:                                     ; preds = %41
  %50 = call i32 @putchar(i32 42)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %52 = call i32 @fflush(%struct._IO_FILE* %51)
  br label %53

; <label>:53:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 1)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 1)
  %55 = load i16, i16* %7, align 2
  %56 = add i16 %55, 1
  store i16 %56, i16* %7, align 2
  br label %18

; <label>:57:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 4)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_slowtest, i64 0, i64 4)
  %59 = getelementptr inbounds [130 x i16], [130 x i16]* %4, i32 0, i32 0
  call void @mp_init(i16* %59, i16 zeroext 0)
  %60 = getelementptr inbounds [130 x i16], [130 x i16]* %5, i32 0, i32 0
  call void @mp_init(i16* %60, i16 zeroext 0)
  %61 = getelementptr inbounds [130 x i16], [130 x i16]* %6, i32 0, i32 0
  call void @mp_init(i16* %61, i16 zeroext 0)
  store i8 1, i8* %2, align 1
  br label %62

; <label>:62:                                     ; preds = %57, %47, %34
  %63 = load i8, i8* %2, align 1
  ret i8 %63
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare zeroext i16 @mp_shortmod(i16*, i16 zeroext) #2

declare zeroext i8 @mp_dec(i16*) #2

declare i32 @mp_modexp(i16*, i16*, i16*, i16*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
