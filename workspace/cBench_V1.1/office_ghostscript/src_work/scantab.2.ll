; ModuleID = 'tmp1.ll'
source_filename = "scantab.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@scan_char_array = constant [260 x i8] c"hhhhfdddgddddfffffddddddddddddgdddddfddddgddggdddddg\00\01\02\03\04\05\06\07\08\09ddgdgdd\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#gdgddd\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#gdgddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
