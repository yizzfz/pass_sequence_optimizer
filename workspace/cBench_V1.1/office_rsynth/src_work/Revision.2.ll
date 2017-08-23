; ModuleID = 'tmp1.ll'
source_filename = "Revision.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [14 x i8] c"Revision: 2.0\00", align 1
@Revision = global i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
