; ModuleID = 'table.ll'
source_filename = "table.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gsm_A = local_unnamed_addr global [8 x i16] [i16 20480, i16 20480, i16 20480, i16 20480, i16 13964, i16 15360, i16 8534, i16 9036], align 16
@gsm_B = local_unnamed_addr global [8 x i16] [i16 0, i16 0, i16 2048, i16 -2560, i16 94, i16 -1792, i16 -341, i16 -1144], align 16
@gsm_MIC = local_unnamed_addr global [8 x i16] [i16 -32, i16 -32, i16 -16, i16 -16, i16 -8, i16 -8, i16 -4, i16 -4], align 16
@gsm_MAC = local_unnamed_addr global [8 x i16] [i16 31, i16 31, i16 15, i16 15, i16 7, i16 7, i16 3, i16 3], align 16
@gsm_INVA = local_unnamed_addr global [8 x i16] [i16 13107, i16 13107, i16 13107, i16 13107, i16 19223, i16 17476, i16 31454, i16 29708], align 16
@gsm_DLB = local_unnamed_addr global [4 x i16] [i16 6554, i16 16384, i16 26214, i16 32767], align 2
@gsm_QLB = local_unnamed_addr global [4 x i16] [i16 3277, i16 11469, i16 21299, i16 32767], align 2
@gsm_H = local_unnamed_addr global [11 x i16] [i16 -134, i16 -374, i16 0, i16 2054, i16 5741, i16 8192, i16 5741, i16 2054, i16 0, i16 -374, i16 -134], align 16
@gsm_NRFAC = local_unnamed_addr global [8 x i16] [i16 29128, i16 26215, i16 23832, i16 21846, i16 20165, i16 18725, i16 17476, i16 16384], align 16
@gsm_FAC = local_unnamed_addr global [8 x i16] [i16 18431, i16 20479, i16 22527, i16 24575, i16 26623, i16 28671, i16 30719, i16 32767], align 16

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
