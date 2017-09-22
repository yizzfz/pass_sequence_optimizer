; ModuleID = 'version3.ll'
source_filename = "version3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mad_version = constant [33 x i8] c"MPEG Audio Decoder 0.14.2 (beta)\00", align 16
@mad_copyright = constant [38 x i8] c"Copyright (C) 2000-2001 Robert Leslie\00", align 16
@mad_author = constant [29 x i8] c"Robert Leslie <rob@mars.org>\00", align 16
@mad_build = constant [13 x i8] c"FPM_DEFAULT \00", align 1

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
