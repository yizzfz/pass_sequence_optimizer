; ModuleID = 'bzlib.ll'
source_filename = "bzlib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.DState = type { %struct.bz_stream*, i32, i8, i32, i8, i32, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, [256 x i32], i32, [257 x i32], [257 x i32], i32*, i16*, i8*, i32, i32, i32, i32, i32, [256 x i8], [16 x i8], [256 x i8], [4096 x i8], [16 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32* }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [443 x i8] c"\0A\0Abzip2/libbzip2: internal error number %d.\0AThis is a bug in bzip2/libbzip2, %s.\0APlease report it to me at: jseward@bzip.org.  If this happened\0Awhen you were using some program which uses libbzip2 as a\0Acomponent, you should also report this bug to the author(s)\0Aof that program.  Please make an effort to report this bug;\0Atimely and accurate bug reports eventually lead to higher\0Aquality software.  Thanks.  Julian Seward, 15 February 2005.\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [1057 x i8] c"\0A*** A special note about internal error number 1007 ***\0A\0AExperience suggests that a common cause of i.e. 1007\0Ais unreliable memory or other hardware.  The 1007 assertion\0Ajust happens to cross-check the results of huge numbers of\0Amemory reads/writes, and so acts (unintendedly) as a stress\0Atest of your memory system.\0A\0AI suggest the following: try compressing the file again,\0Apossibly monitoring progress in detail with the -vv flag.\0A\0A* If the error cannot be reproduced, and/or happens at different\0A  points in compression, you may have a flaky memory system.\0A  Try a memory-test program.  I have used Memtest86\0A  (www.memtest86.com).  At the time of writing it is free (GPLd).\0A  Memtest86 tests memory much more thorougly than your BIOSs\0A  power-on test, and may find failures that the BIOS doesn't.\0A\0A* If the error can be repeatably reproduced, this is a bug in\0A  bzip2, and I would very much like to hear about it.  Please\0A  let me know, and, ideally, save a copy of the file causing the\0A  problem -- without which I will be unable to investigate it.\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c" {0x%08x, 0x%08x}\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.4 = private unnamed_addr constant [55 x i8] c"\0A    combined CRCs: stored = 0x%08x, computed = 0x%08x\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"1.0.4, 20-Dec-2006\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@bzerrorstrings = internal unnamed_addr constant [16 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0)], align 16
@BZ2_crc32Table = external local_unnamed_addr global [256 x i32], align 16
@BZ2_rNums = external local_unnamed_addr global [512 x i32], align 16
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"SEQUENCE_ERROR\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"PARAM_ERROR\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"MEM_ERROR\00", align 1
@.str.14 = private unnamed_addr constant [11 x i8] c"DATA_ERROR\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"DATA_ERROR_MAGIC\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"IO_ERROR\00", align 1
@.str.17 = private unnamed_addr constant [15 x i8] c"UNEXPECTED_EOF\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"OUTBUFF_FULL\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"CONFIG_ERROR\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"???\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define void @BZ2_bz__AssertH__fail(i32) local_unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([443 x i8], [443 x i8]* @.str, i64 0, i64 0), i32 %0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0)) #13
  %4 = icmp eq i32 %0, 1007
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([1057 x i8], [1057 x i8]* @.str.1, i64 0, i64 0), i64 1056, i64 1, %struct._IO_FILE* %6) #13
  br label %8

; <label>:8:                                      ; preds = %5, %1
  tail call void @exit(i32 3) #14
  unreachable
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i8* @BZ2_bzlibVersion() local_unnamed_addr #2 {
  ret i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0)
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzCompressInit(%struct.bz_stream*, i32, i32, i32) local_unnamed_addr #4 {
  %5 = icmp eq %struct.bz_stream* %0, null
  %.off = add i32 %1, -1
  %6 = icmp ugt i32 %.off, 8
  %7 = or i1 %5, %6
  %8 = icmp ugt i32 %3, 250
  %9 = or i1 %8, %7
  br i1 %9, label %117, label %10

; <label>:10:                                     ; preds = %4
  %11 = icmp eq i32 %3, 0
  %. = select i1 %11, i32 30, i32 %3
  %12 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 9
  %13 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %12, align 8
  %14 = icmp eq i8* (i8*, i32, i32)* %13, null
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %10
  store i8* (i8*, i32, i32)* @default_bzalloc, i8* (i8*, i32, i32)** %12, align 8
  br label %16

; <label>:16:                                     ; preds = %15, %10
  %17 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %18 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %19 = icmp eq void (i8*, i8*)* %18, null
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %16
  store void (i8*, i8*)* @default_bzfree, void (i8*, i8*)** %17, align 8
  br label %21

; <label>:21:                                     ; preds = %20, %16
  %22 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %12, align 8
  %23 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %24 = load i8*, i8** %23, align 8
  %25 = tail call i8* %22(i8* %24, i32 55768, i32 1) #11
  %26 = bitcast i8* %25 to %struct.EState*
  %27 = icmp eq i8* %25, null
  br i1 %27, label %117, label %28

; <label>:28:                                     ; preds = %21
  %29 = bitcast i8* %25 to %struct.bz_stream**
  store %struct.bz_stream* %0, %struct.bz_stream** %29, align 8
  %30 = getelementptr inbounds i8, i8* %25, i64 24
  %31 = bitcast i8* %30 to i32**
  %32 = getelementptr inbounds i8, i8* %25, i64 32
  %33 = bitcast i8* %32 to i32**
  %34 = getelementptr inbounds i8, i8* %25, i64 40
  %35 = bitcast i8* %34 to i32**
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 24, i32 8, i1 false)
  %36 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %12, align 8
  %37 = load i8*, i8** %23, align 8
  %38 = mul i32 %1, 400000
  %39 = tail call i8* %36(i8* %37, i32 %38, i32 1) #11
  %40 = bitcast i8* %30 to i8**
  store i8* %39, i8** %40, align 8
  %41 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %12, align 8
  %42 = load i8*, i8** %23, align 8
  %43 = add i32 %38, 136
  %44 = tail call i8* %41(i8* %42, i32 %43, i32 1) #11
  %45 = bitcast i8* %32 to i8**
  store i8* %44, i8** %45, align 8
  %46 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %12, align 8
  %47 = load i8*, i8** %23, align 8
  %48 = tail call i8* %46(i8* %47, i32 262148, i32 1) #11
  %49 = bitcast i8* %34 to i8**
  store i8* %48, i8** %49, align 8
  %50 = load i32*, i32** %31, align 8
  %51 = icmp eq i32* %50, null
  br i1 %51, label %.thread, label %52

; <label>:52:                                     ; preds = %28
  %53 = load i32*, i32** %33, align 8
  %54 = icmp eq i32* %53, null
  br i1 %54, label %58, label %55

; <label>:55:                                     ; preds = %52
  %56 = load i32*, i32** %35, align 8
  %57 = icmp eq i32* %56, null
  br i1 %57, label %58, label %80

; <label>:58:                                     ; preds = %55, %52
  %.pr = load i32*, i32** %31, align 8
  %59 = icmp eq i32* %.pr, null
  br i1 %59, label %.thread, label %60

; <label>:60:                                     ; preds = %58
  %61 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %62 = load i8*, i8** %23, align 8
  %63 = load i8*, i8** %40, align 8
  tail call void %61(i8* %62, i8* %63) #11
  br label %.thread

.thread:                                          ; preds = %28, %58, %60
  %64 = load i32*, i32** %33, align 8
  %65 = icmp eq i32* %64, null
  br i1 %65, label %70, label %66

; <label>:66:                                     ; preds = %.thread
  %67 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %68 = load i8*, i8** %23, align 8
  %69 = load i8*, i8** %45, align 8
  tail call void %67(i8* %68, i8* %69) #11
  br label %70

; <label>:70:                                     ; preds = %.thread, %66
  %71 = load i32*, i32** %35, align 8
  %72 = icmp eq i32* %71, null
  br i1 %72, label %77, label %73

; <label>:73:                                     ; preds = %70
  %74 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %75 = load i8*, i8** %23, align 8
  %76 = load i8*, i8** %49, align 8
  tail call void %74(i8* %75, i8* %76) #11
  br label %77

; <label>:77:                                     ; preds = %73, %70
  %78 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %79 = load i8*, i8** %23, align 8
  tail call void %78(i8* %79, i8* nonnull %25) #11
  br label %117

; <label>:80:                                     ; preds = %55
  %81 = getelementptr inbounds i8, i8* %25, i64 660
  %82 = bitcast i8* %81 to i32*
  store i32 0, i32* %82, align 4
  %83 = getelementptr inbounds i8, i8* %25, i64 12
  %84 = bitcast i8* %83 to i32*
  store i32 2, i32* %84, align 4
  %85 = getelementptr inbounds i8, i8* %25, i64 8
  %86 = bitcast i8* %85 to i32*
  store i32 2, i32* %86, align 8
  %87 = getelementptr inbounds i8, i8* %25, i64 652
  %88 = bitcast i8* %87 to i32*
  store i32 0, i32* %88, align 4
  %89 = getelementptr inbounds i8, i8* %25, i64 664
  %90 = bitcast i8* %89 to i32*
  store i32 %1, i32* %90, align 8
  %91 = mul nsw i32 %1, 100000
  %92 = add nsw i32 %91, -19
  %93 = getelementptr inbounds i8, i8* %25, i64 112
  %94 = bitcast i8* %93 to i32*
  store i32 %92, i32* %94, align 8
  %95 = getelementptr inbounds i8, i8* %25, i64 656
  %96 = bitcast i8* %95 to i32*
  store i32 %2, i32* %96, align 8
  %97 = getelementptr inbounds i8, i8* %25, i64 88
  %98 = bitcast i8* %97 to i32*
  store i32 %., i32* %98, align 8
  %99 = bitcast i8* %32 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds i8, i8* %25, i64 64
  %102 = bitcast i8* %101 to i64*
  store i64 %100, i64* %102, align 8
  %103 = bitcast i8* %30 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds i8, i8* %25, i64 72
  %106 = bitcast i8* %105 to i64*
  store i64 %104, i64* %106, align 8
  %107 = getelementptr inbounds i8, i8* %25, i64 80
  %108 = bitcast i8* %107 to i8**
  store i8* null, i8** %108, align 8
  %109 = load i64, i64* %103, align 8
  %110 = getelementptr inbounds i8, i8* %25, i64 56
  %111 = bitcast i8* %110 to i64*
  store i64 %109, i64* %111, align 8
  %112 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  store i8* %25, i8** %112, align 8
  %113 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 2
  store i32 0, i32* %113, align 4
  %114 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 3
  store i32 0, i32* %114, align 8
  %115 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 6
  store i32 0, i32* %115, align 4
  %116 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 7
  store i32 0, i32* %116, align 8
  tail call fastcc void @init_RL(%struct.EState* nonnull %26)
  tail call fastcc void @prepare_new_block(%struct.EState* nonnull %26)
  br label %117

; <label>:117:                                    ; preds = %77, %21, %4, %80
  %.0 = phi i32 [ 0, %80 ], [ -2, %4 ], [ -3, %21 ], [ -3, %77 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal noalias i8* @default_bzalloc(i8* nocapture readnone, i32, i32) #4 {
  %4 = mul nsw i32 %2, %1
  %5 = sext i32 %4 to i64
  %6 = tail call noalias i8* @malloc(i64 %5) #11
  ret i8* %6
}

; Function Attrs: noinline nounwind uwtable
define internal void @default_bzfree(i8* nocapture readnone, i8*) #4 {
  %3 = icmp eq i8* %1, null
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %2
  tail call void @free(i8* nonnull %1) #11
  br label %5

; <label>:5:                                      ; preds = %2, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_RL(%struct.EState* nocapture) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  store i32 256, i32* %2, align 4
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  store i32 0, i32* %3, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @prepare_new_block(%struct.EState* nocapture) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 20
  store i32 0, i32* %4, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  store i32 -1, i32* %5, align 8
  %scevgep = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 256, i32 1, i1 false)
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 29
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %6, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzCompress(%struct.bz_stream* readonly, i32) local_unnamed_addr #4 {
  %3 = icmp eq %struct.bz_stream* %0, null
  br i1 %3, label %.us-lcssa.us, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  %6 = bitcast i8** %5 to %struct.EState**
  %7 = load %struct.EState*, %struct.EState** %6, align 8
  %8 = icmp eq %struct.EState* %7, null
  br i1 %8, label %.us-lcssa.us, label %9

; <label>:9:                                      ; preds = %4
  %10 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 0
  %11 = load %struct.bz_stream*, %struct.bz_stream** %10, align 8
  %12 = icmp eq %struct.bz_stream* %11, %0
  br i1 %12, label %.preheader, label %.us-lcssa.us

.preheader:                                       ; preds = %9
  %13 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 1
  %14 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 1
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 3
  switch i32 %1, label %.preheader.split.split.splitthread-pre-split [
    i32 0, label %.preheader.split.us
    i32 1, label %.preheader.split.split.usthread-pre-split
    i32 2, label %.preheader.split.split.split.usthread-pre-split
  ]

.preheader.split.us:                              ; preds = %.preheader
  %16 = load i32, i32* %13, align 8
  switch i32 %16, label %.us-lcssa.us [
    i32 1, label %.loopexit
    i32 2, label %.us-lcssa11.us
    i32 3, label %.us-lcssa9.us.thread
    i32 4, label %.us-lcssa10.us.thread
  ]

.us-lcssa10.us.thread:                            ; preds = %.preheader.split.us
  br label %.us-lcssa.us

.preheader.split.split.usthread-pre-split:        ; preds = %.preheader
  %.pr = load i32, i32* %13, align 8
  br label %.preheader.split.split.us

.preheader.split.split.us:                        ; preds = %.preheader.split.split.usthread-pre-split, %.sink.split.us12
  %17 = phi i32 [ %.pr, %.preheader.split.split.usthread-pre-split ], [ 3, %.sink.split.us12 ]
  switch i32 %17, label %.us-lcssa.us.loopexit41 [
    i32 1, label %.loopexit.loopexit42
    i32 2, label %.sink.split.us12
    i32 3, label %.us-lcssa9.us.loopexit
    i32 4, label %.us-lcssa10.us.loopexit43
  ]

.sink.split.us12:                                 ; preds = %.preheader.split.split.us
  %18 = load i32, i32* %14, align 8
  store i32 %18, i32* %15, align 8
  store i32 3, i32* %13, align 8
  br label %.preheader.split.split.us

.preheader.split.split.split.usthread-pre-split:  ; preds = %.preheader
  %.pr25 = load i32, i32* %13, align 8
  br label %.preheader.split.split.split.us

.preheader.split.split.split.us:                  ; preds = %.preheader.split.split.split.usthread-pre-split, %.sink.split.us15
  %19 = phi i32 [ %.pr25, %.preheader.split.split.split.usthread-pre-split ], [ 4, %.sink.split.us15 ]
  switch i32 %19, label %.us-lcssa.us.loopexit44 [
    i32 1, label %.loopexit.loopexit45
    i32 2, label %.sink.split.us15
    i32 3, label %.us-lcssa9.us.loopexit46
    i32 4, label %.us-lcssa10.us.loopexit47
  ]

.sink.split.us15:                                 ; preds = %.preheader.split.split.split.us
  %20 = load i32, i32* %14, align 8
  store i32 %20, i32* %15, align 8
  store i32 4, i32* %13, align 8
  br label %.preheader.split.split.split.us

.sink.split:                                      ; preds = %23
  %21 = load i32, i32* %14, align 8
  store i32 %21, i32* %15, align 8
  store i32 4, i32* %13, align 8
  br label %.preheader.split.split.split

.preheader.split.split.splitthread-pre-split:     ; preds = %.preheader
  %.pr26 = load i32, i32* %13, align 8
  %cond = icmp eq i32 %1, 2
  br label %.preheader.split.split.split

.preheader.split.split.split:                     ; preds = %.preheader.split.split.splitthread-pre-split, %.sink.split
  %22 = phi i32 [ %.pr26, %.preheader.split.split.splitthread-pre-split ], [ 4, %.sink.split ]
  switch i32 %22, label %.us-lcssa.us.loopexit [
    i32 1, label %.loopexit.loopexit
    i32 2, label %23
    i32 3, label %.us-lcssa9.us.thread.loopexit
    i32 4, label %.us-lcssa10.us.loopexit
  ]

; <label>:23:                                     ; preds = %.preheader.split.split.split
  br i1 %cond, label %.sink.split, label %.loopexit.loopexit

.us-lcssa11.us:                                   ; preds = %.preheader.split.us
  %24 = tail call fastcc zeroext i8 @handle_compress(%struct.bz_stream* nonnull %0)
  %25 = icmp ne i8 %24, 0
  %26 = select i1 %25, i32 1, i32 -2
  br label %.us-lcssa.us

.us-lcssa9.us.thread.loopexit:                    ; preds = %.preheader.split.split.split
  br label %.us-lcssa9.us.thread

.us-lcssa9.us.thread:                             ; preds = %.us-lcssa9.us.thread.loopexit, %.preheader.split.us
  br label %.us-lcssa.us

.us-lcssa9.us.loopexit:                           ; preds = %.preheader.split.split.us
  br label %.us-lcssa9.us

.us-lcssa9.us.loopexit46:                         ; preds = %.preheader.split.split.split.us
  br label %.us-lcssa9.us

.us-lcssa9.us:                                    ; preds = %.us-lcssa9.us.loopexit46, %.us-lcssa9.us.loopexit
  %27 = icmp eq i32 %1, 1
  br i1 %27, label %28, label %.us-lcssa.us

; <label>:28:                                     ; preds = %.us-lcssa9.us
  %29 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 3
  %30 = load i32, i32* %29, align 8
  %31 = load %struct.bz_stream*, %struct.bz_stream** %10, align 8
  %32 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %31, i64 0, i32 1
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %30, %33
  br i1 %34, label %35, label %.us-lcssa.us

; <label>:35:                                     ; preds = %28
  %36 = tail call fastcc zeroext i8 @handle_compress(%struct.bz_stream* nonnull %0)
  %37 = load i32, i32* %29, align 8
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %.us-lcssa.us

; <label>:39:                                     ; preds = %35
  %40 = tail call fastcc zeroext i8 @isempty_RL(%struct.EState* nonnull %7)
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %.us-lcssa.us, label %42

; <label>:42:                                     ; preds = %39
  %43 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 20
  %44 = load i32, i32* %43, align 8
  %45 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 19
  %46 = load i32, i32* %45, align 4
  %47 = icmp slt i32 %44, %46
  br i1 %47, label %.us-lcssa.us, label %48

; <label>:48:                                     ; preds = %42
  store i32 2, i32* %13, align 8
  br label %.us-lcssa.us

.us-lcssa10.us.loopexit:                          ; preds = %.preheader.split.split.split
  br label %.us-lcssa10.us

.us-lcssa10.us.loopexit43:                        ; preds = %.preheader.split.split.us
  br label %.us-lcssa10.us

.us-lcssa10.us.loopexit47:                        ; preds = %.preheader.split.split.split.us
  br label %.us-lcssa10.us

.us-lcssa10.us:                                   ; preds = %.us-lcssa10.us.loopexit47, %.us-lcssa10.us.loopexit43, %.us-lcssa10.us.loopexit
  %49 = icmp eq i32 %1, 2
  br i1 %49, label %50, label %.us-lcssa.us

; <label>:50:                                     ; preds = %.us-lcssa10.us
  %51 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 3
  %52 = load i32, i32* %51, align 8
  %53 = load %struct.bz_stream*, %struct.bz_stream** %10, align 8
  %54 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %53, i64 0, i32 1
  %55 = load i32, i32* %54, align 8
  %56 = icmp eq i32 %52, %55
  br i1 %56, label %57, label %.us-lcssa.us

; <label>:57:                                     ; preds = %50
  %58 = tail call fastcc zeroext i8 @handle_compress(%struct.bz_stream* nonnull %0)
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %.us-lcssa.us, label %60

; <label>:60:                                     ; preds = %57
  %61 = load i32, i32* %51, align 8
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %.us-lcssa.us

; <label>:63:                                     ; preds = %60
  %64 = tail call fastcc zeroext i8 @isempty_RL(%struct.EState* nonnull %7)
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %.us-lcssa.us, label %66

; <label>:66:                                     ; preds = %63
  %67 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 20
  %68 = load i32, i32* %67, align 8
  %69 = getelementptr inbounds %struct.EState, %struct.EState* %7, i64 0, i32 19
  %70 = load i32, i32* %69, align 4
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %.us-lcssa.us, label %72

; <label>:72:                                     ; preds = %66
  store i32 1, i32* %13, align 8
  br label %.us-lcssa.us

.loopexit.loopexit:                               ; preds = %.preheader.split.split.split, %23
  %.0.ph.ph = phi i32 [ -1, %.preheader.split.split.split ], [ -2, %23 ]
  br label %.loopexit

.loopexit.loopexit42:                             ; preds = %.preheader.split.split.us
  br label %.loopexit

.loopexit.loopexit45:                             ; preds = %.preheader.split.split.split.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit45, %.loopexit.loopexit42, %.loopexit.loopexit, %.preheader.split.us
  %.0.ph = phi i32 [ -1, %.preheader.split.us ], [ %.0.ph.ph, %.loopexit.loopexit ], [ -1, %.loopexit.loopexit42 ], [ -1, %.loopexit.loopexit45 ]
  br label %.us-lcssa.us

.us-lcssa.us.loopexit:                            ; preds = %.preheader.split.split.split
  br label %.us-lcssa.us

.us-lcssa.us.loopexit41:                          ; preds = %.preheader.split.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit44:                          ; preds = %.preheader.split.split.split.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit44, %.us-lcssa.us.loopexit41, %.us-lcssa.us.loopexit, %.us-lcssa10.us.thread, %.us-lcssa9.us.thread, %.preheader.split.us, %.loopexit, %66, %60, %63, %57, %50, %.us-lcssa10.us, %42, %35, %39, %28, %.us-lcssa9.us, %9, %4, %2, %72, %48, %.us-lcssa11.us
  %.0 = phi i32 [ 4, %72 ], [ 1, %48 ], [ %26, %.us-lcssa11.us ], [ -2, %2 ], [ -2, %4 ], [ -2, %9 ], [ -1, %.us-lcssa9.us ], [ -1, %28 ], [ 2, %39 ], [ 2, %35 ], [ 2, %42 ], [ -1, %.us-lcssa10.us ], [ -1, %50 ], [ -1, %57 ], [ 3, %63 ], [ 3, %60 ], [ 3, %66 ], [ %.0.ph, %.loopexit ], [ 0, %.preheader.split.us ], [ -1, %.us-lcssa9.us.thread ], [ -1, %.us-lcssa10.us.thread ], [ 0, %.us-lcssa.us.loopexit ], [ 0, %.us-lcssa.us.loopexit41 ], [ 0, %.us-lcssa.us.loopexit44 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @handle_compress(%struct.bz_stream* nocapture readonly) unnamed_addr #4 {
  %2 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  %3 = bitcast i8** %2 to %struct.EState**
  %4 = load %struct.EState*, %struct.EState** %3, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 2
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 20
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 19
  %8 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 1
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 3
  %10 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 3
  %11 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 1
  %12 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 17
  %13 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 18
  %14 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 0
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %4, i64 0, i32 3
  br label %.outer

.outer:                                           ; preds = %.outer.backedge, %1
  %.01.ph = phi i8 [ 0, %1 ], [ %47, %.outer.backedge ]
  %.0.ph = phi i8 [ 0, %1 ], [ %.14, %.outer.backedge ]
  br label %16

; <label>:16:                                     ; preds = %.outer, %43
  %.0 = phi i8 [ %.1, %43 ], [ %.0.ph, %.outer ]
  %17 = load i32, i32* %5, align 4
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %43

; <label>:19:                                     ; preds = %16
  %20 = tail call fastcc zeroext i8 @copy_output_until_stop(%struct.EState* nonnull %4)
  %21 = or i8 %20, %.0
  %22 = load i32, i32* %6, align 8
  %23 = load i32, i32* %7, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %.loopexit.loopexit, label %25

; <label>:25:                                     ; preds = %19
  %26 = load i32, i32* %8, align 8
  %27 = icmp eq i32 %26, 4
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %25
  %29 = load i32, i32* %9, align 8
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %32 = tail call fastcc zeroext i8 @isempty_RL(%struct.EState* nonnull %4)
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %34, label %.loopexit.loopexit

; <label>:34:                                     ; preds = %31, %28, %25
  tail call fastcc void @prepare_new_block(%struct.EState* nonnull %4)
  store i32 2, i32* %5, align 4
  %35 = load i32, i32* %8, align 8
  %36 = icmp eq i32 %35, 3
  br i1 %36, label %37, label %.thread

; <label>:37:                                     ; preds = %34
  %38 = load i32, i32* %10, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %thread-pre-split

; <label>:40:                                     ; preds = %37
  %41 = tail call fastcc zeroext i8 @isempty_RL(%struct.EState* nonnull %4)
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %thread-pre-split, label %.loopexit.loopexit

thread-pre-split:                                 ; preds = %40, %37
  %.pr = load i32, i32* %5, align 4
  br label %43

; <label>:43:                                     ; preds = %thread-pre-split, %16
  %44 = phi i32 [ %.pr, %thread-pre-split ], [ %17, %16 ]
  %.1 = phi i8 [ %21, %thread-pre-split ], [ %.0, %16 ]
  %45 = icmp eq i32 %44, 2
  br i1 %45, label %.thread, label %16

.thread:                                          ; preds = %34, %43
  %.14 = phi i8 [ %.1, %43 ], [ %21, %34 ]
  %46 = tail call fastcc zeroext i8 @copy_input_until_stop(%struct.EState* %4)
  %47 = or i8 %46, %.01.ph
  %48 = load i32, i32* %11, align 8
  %49 = icmp eq i32 %48, 2
  br i1 %49, label %57, label %50

; <label>:50:                                     ; preds = %.thread
  %51 = load i32, i32* %15, align 8
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %57

; <label>:53:                                     ; preds = %50
  tail call fastcc void @flush_RL(%struct.EState* nonnull %4)
  %54 = load i32, i32* %11, align 8
  %55 = icmp eq i32 %54, 4
  %56 = zext i1 %55 to i8
  tail call void @BZ2_compressBlock(%struct.EState* nonnull %4, i8 zeroext %56) #11
  br label %.outer.backedge.sink.split

; <label>:57:                                     ; preds = %.thread, %50
  %58 = load i32, i32* %12, align 4
  %59 = load i32, i32* %13, align 8
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %62, label %61

; <label>:61:                                     ; preds = %57
  tail call void @BZ2_compressBlock(%struct.EState* nonnull %4, i8 zeroext 0) #11
  br label %.outer.backedge.sink.split

.outer.backedge.sink.split:                       ; preds = %53, %61
  store i32 1, i32* %5, align 4
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %.outer.backedge.sink.split, %62
  br label %.outer

; <label>:62:                                     ; preds = %57
  %63 = load %struct.bz_stream*, %struct.bz_stream** %14, align 8
  %64 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %63, i64 0, i32 1
  %65 = load i32, i32* %64, align 8
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %.loopexit.loopexit19, label %.outer.backedge

.loopexit.loopexit:                               ; preds = %19, %31, %40
  br label %.loopexit

.loopexit.loopexit19:                             ; preds = %62
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit19, %.loopexit.loopexit
  %.23 = phi i8 [ %.01.ph, %.loopexit.loopexit ], [ %47, %.loopexit.loopexit19 ]
  %.2 = phi i8 [ %21, %.loopexit.loopexit ], [ %.14, %.loopexit.loopexit19 ]
  %67 = or i8 %.2, %.23
  %68 = icmp ne i8 %67, 0
  %69 = zext i1 %68 to i8
  ret i8 %69
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc zeroext i8 @isempty_RL(%struct.EState* nocapture readonly) unnamed_addr #6 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 4
  %4 = icmp ult i32 %3, 256
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %10, label %9

; <label>:9:                                      ; preds = %5, %1
  br label %10

; <label>:10:                                     ; preds = %5, %9
  %.0 = phi i8 [ 1, %9 ], [ 0, %5 ]
  ret i8 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzCompressEnd(%struct.bz_stream*) local_unnamed_addr #4 {
  %2 = icmp eq %struct.bz_stream* %0, null
  br i1 %2, label %51, label %3

; <label>:3:                                      ; preds = %1
  %4 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  %5 = bitcast i8** %4 to %struct.EState**
  %6 = load %struct.EState*, %struct.EState** %5, align 8
  %7 = icmp eq %struct.EState* %6, null
  br i1 %7, label %51, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %6, i64 0, i32 0
  %10 = load %struct.bz_stream*, %struct.bz_stream** %9, align 8
  %11 = icmp eq %struct.bz_stream* %10, %0
  br i1 %11, label %12, label %51

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct.EState, %struct.EState* %6, i64 0, i32 4
  %14 = load i32*, i32** %13, align 8
  %15 = icmp eq i32* %14, null
  br i1 %15, label %23, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %18 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %19 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %20 = load i8*, i8** %19, align 8
  %21 = bitcast i32** %13 to i8**
  %22 = load i8*, i8** %21, align 8
  tail call void %18(i8* %20, i8* %22) #11
  br label %23

; <label>:23:                                     ; preds = %12, %16
  %24 = getelementptr inbounds %struct.EState, %struct.EState* %6, i64 0, i32 5
  %25 = load i32*, i32** %24, align 8
  %26 = icmp eq i32* %25, null
  br i1 %26, label %34, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %29 = load void (i8*, i8*)*, void (i8*, i8*)** %28, align 8
  %30 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %31 = load i8*, i8** %30, align 8
  %32 = bitcast i32** %24 to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void %29(i8* %31, i8* %33) #11
  br label %34

; <label>:34:                                     ; preds = %23, %27
  %35 = getelementptr inbounds %struct.EState, %struct.EState* %6, i64 0, i32 6
  %36 = load i32*, i32** %35, align 8
  %37 = icmp eq i32* %36, null
  br i1 %37, label %45, label %38

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %40 = load void (i8*, i8*)*, void (i8*, i8*)** %39, align 8
  %41 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %42 = load i8*, i8** %41, align 8
  %43 = bitcast i32** %35 to i8**
  %44 = load i8*, i8** %43, align 8
  tail call void %40(i8* %42, i8* %44) #11
  br label %45

; <label>:45:                                     ; preds = %34, %38
  %46 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %47 = load void (i8*, i8*)*, void (i8*, i8*)** %46, align 8
  %48 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %49 = load i8*, i8** %48, align 8
  %50 = load i8*, i8** %4, align 8
  tail call void %47(i8* %49, i8* %50) #11
  store i8* null, i8** %4, align 8
  br label %51

; <label>:51:                                     ; preds = %8, %3, %1, %45
  %.0 = phi i32 [ 0, %45 ], [ -2, %1 ], [ -2, %3 ], [ -2, %8 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzDecompressInit(%struct.bz_stream*, i32, i32) local_unnamed_addr #4 {
  %notlhs = icmp eq %struct.bz_stream* %0, null
  %notrhs = icmp ugt i32 %2, 1
  %or.cond1.not = or i1 %notrhs, %notlhs
  %4 = icmp ugt i32 %1, 4
  %or.cond = or i1 %4, %or.cond1.not
  br i1 %or.cond, label %43, label %5

; <label>:5:                                      ; preds = %3
  %6 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 9
  %7 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %6, align 8
  %8 = icmp eq i8* (i8*, i32, i32)* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %5
  store i8* (i8*, i32, i32)* @default_bzalloc, i8* (i8*, i32, i32)** %6, align 8
  br label %10

; <label>:10:                                     ; preds = %9, %5
  %11 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %12 = load void (i8*, i8*)*, void (i8*, i8*)** %11, align 8
  %13 = icmp eq void (i8*, i8*)* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %10
  store void (i8*, i8*)* @default_bzfree, void (i8*, i8*)** %11, align 8
  br label %15

; <label>:15:                                     ; preds = %14, %10
  %16 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %6, align 8
  %17 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %18 = load i8*, i8** %17, align 8
  %19 = tail call i8* %16(i8* %18, i32 64144, i32 1) #11
  %20 = icmp eq i8* %19, null
  br i1 %20, label %43, label %21

; <label>:21:                                     ; preds = %15
  %22 = bitcast i8* %19 to %struct.bz_stream**
  store %struct.bz_stream* %0, %struct.bz_stream** %22, align 8
  %23 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  store i8* %19, i8** %23, align 8
  %24 = getelementptr inbounds i8, i8* %19, i64 8
  %25 = bitcast i8* %24 to i32*
  store i32 10, i32* %25, align 8
  %26 = getelementptr inbounds i8, i8* %19, i64 36
  %27 = bitcast i8* %26 to i32*
  store i32 0, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %19, i64 32
  %29 = bitcast i8* %28 to i32*
  store i32 0, i32* %29, align 8
  %30 = getelementptr inbounds i8, i8* %19, i64 3188
  %31 = bitcast i8* %30 to i32*
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 2
  store i32 0, i32* %32, align 4
  %33 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 3
  store i32 0, i32* %33, align 8
  %34 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 6
  store i32 0, i32* %34, align 4
  %35 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 7
  store i32 0, i32* %35, align 8
  %36 = trunc i32 %2 to i8
  %37 = getelementptr inbounds i8, i8* %19, i64 44
  store i8 %36, i8* %37, align 4
  %38 = getelementptr inbounds i8, i8* %19, i64 3152
  %39 = getelementptr inbounds i8, i8* %19, i64 48
  %40 = bitcast i8* %39 to i32*
  store i32 0, i32* %40, align 8
  %41 = getelementptr inbounds i8, i8* %19, i64 52
  %42 = bitcast i8* %41 to i32*
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 24, i32 8, i1 false)
  store i32 %1, i32* %42, align 4
  br label %43

; <label>:43:                                     ; preds = %3, %15, %21
  %.0 = phi i32 [ 0, %21 ], [ -2, %3 ], [ -3, %15 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @BZ2_indexIntoF(i32, i32* nocapture readonly) local_unnamed_addr #6 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %.01 = phi i32 [ 0, %2 ], [ %.01., %3 ]
  %.0 = phi i32 [ 256, %2 ], [ %..0, %3 ]
  %4 = add nsw i32 %.0, %.01
  %5 = ashr i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32* %1, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = icmp sgt i32 %8, %0
  %.01. = select i1 %9, i32 %.01, i32 %5
  %..0 = select i1 %9, i32 %5, i32 %.0
  %10 = sub nsw i32 %..0, %.01.
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %3

; <label>:12:                                     ; preds = %3
  ret i32 %.01.
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzDecompress(%struct.bz_stream* readonly) local_unnamed_addr #4 {
  %2 = icmp eq %struct.bz_stream* %0, null
  br i1 %2, label %.loopexit, label %3

; <label>:3:                                      ; preds = %1
  %4 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  %5 = bitcast i8** %4 to %struct.DState**
  %6 = load %struct.DState*, %struct.DState** %5, align 8
  %7 = icmp eq %struct.DState* %6, null
  br i1 %7, label %.loopexit, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 0
  %10 = load %struct.bz_stream*, %struct.bz_stream** %9, align 8
  %11 = icmp eq %struct.bz_stream* %10, %0
  br i1 %11, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %8
  %12 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 1
  %13 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 10
  %14 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 17
  %15 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 51
  %16 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 3
  %17 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 25
  %18 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 12
  %19 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 23
  %20 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 23
  %21 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 26
  %.pr3 = load i32, i32* %12, align 8
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.preheader
  %22 = phi i32 [ %.pr3, %.preheader ], [ %.be, %.backedge.backedge ]
  switch i32 %22, label %64 [
    i32 1, label %.loopexit.loopexit
    i32 2, label %23
  ]

; <label>:23:                                     ; preds = %.backedge
  %24 = load i8, i8* %13, align 4
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %23
  %27 = tail call fastcc zeroext i8 @unRLE_obuf_to_output_SMALL(%struct.DState* nonnull %6)
  br label %30

; <label>:28:                                     ; preds = %23
  %29 = tail call fastcc zeroext i8 @unRLE_obuf_to_output_FAST(%struct.DState* nonnull %6)
  br label %30

; <label>:30:                                     ; preds = %28, %26
  %.01 = phi i8 [ %27, %26 ], [ %29, %28 ]
  %31 = icmp eq i8 %.01, 0
  br i1 %31, label %32, label %.loopexit.loopexit

; <label>:32:                                     ; preds = %30
  %33 = load i32, i32* %14, align 4
  %34 = load i32, i32* %15, align 8
  %35 = add nsw i32 %34, 1
  %36 = icmp eq i32 %33, %35
  br i1 %36, label %37, label %.loopexit.loopexit

; <label>:37:                                     ; preds = %32
  %38 = load i32, i32* %16, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %.loopexit.loopexit

; <label>:40:                                     ; preds = %37
  %41 = load i32, i32* %17, align 8
  %42 = xor i32 %41, -1
  store i32 %42, i32* %17, align 8
  %43 = load i32, i32* %18, align 4
  %44 = icmp sgt i32 %43, 2
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %40
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = load i32, i32* %19, align 8
  %48 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 %47, i32 %42) #13
  %.pr = load i32, i32* %18, align 4
  br label %49

; <label>:49:                                     ; preds = %45, %40
  %50 = phi i32 [ %.pr, %45 ], [ %43, %40 ]
  %51 = icmp sgt i32 %50, 1
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %49
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 93, %struct._IO_FILE* %53) #13
  br label %54

; <label>:54:                                     ; preds = %52, %49
  %55 = load i32, i32* %17, align 8
  %56 = load i32, i32* %20, align 8
  %57 = icmp eq i32 %55, %56
  br i1 %57, label %.thread, label %.loopexit.loopexit

.thread:                                          ; preds = %54
  %58 = load i32, i32* %21, align 4
  %59 = shl i32 %58, 1
  %60 = lshr i32 %58, 31
  %61 = or i32 %59, %60
  %62 = load i32, i32* %17, align 8
  %63 = xor i32 %61, %62
  store i32 %63, i32* %21, align 4
  store i32 14, i32* %12, align 8
  br label %66

; <label>:64:                                     ; preds = %.backedge
  %.pr2 = load i32, i32* %12, align 8
  %65 = icmp sgt i32 %.pr2, 9
  br i1 %65, label %66, label %.backedge.backedge

; <label>:66:                                     ; preds = %.thread, %64
  %67 = tail call i32 @BZ2_decompress(%struct.DState* nonnull %6) #11
  %68 = icmp eq i32 %67, 4
  br i1 %68, label %69, label %86

; <label>:69:                                     ; preds = %66
  %70 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 12
  %71 = load i32, i32* %70, align 4
  %72 = icmp sgt i32 %71, 2
  br i1 %72, label %73, label %80

; <label>:73:                                     ; preds = %69
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 24
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 26
  %78 = load i32, i32* %77, align 4
  %79 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.4, i64 0, i64 0), i32 %76, i32 %78) #13
  br label %80

; <label>:80:                                     ; preds = %73, %69
  %81 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 26
  %82 = load i32, i32* %81, align 4
  %83 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 24
  %84 = load i32, i32* %83, align 4
  %85 = icmp eq i32 %82, %84
  %. = select i1 %85, i32 %67, i32 -4
  br label %.loopexit

; <label>:86:                                     ; preds = %66
  %87 = load i32, i32* %12, align 8
  %88 = icmp eq i32 %87, 2
  br i1 %88, label %.backedge.backedge, label %.loopexit.loopexit

.backedge.backedge:                               ; preds = %86, %64
  %.be = phi i32 [ %.pr2, %64 ], [ 2, %86 ]
  br label %.backedge

.loopexit.loopexit:                               ; preds = %30, %54, %37, %32, %86, %.backedge
  %.0.ph = phi i32 [ %67, %86 ], [ 0, %32 ], [ 0, %37 ], [ -4, %54 ], [ -4, %30 ], [ -1, %.backedge ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %80, %8, %3, %1
  %.0 = phi i32 [ -2, %1 ], [ -2, %3 ], [ -2, %8 ], [ %., %80 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc zeroext i8 @unRLE_obuf_to_output_SMALL(%struct.DState*) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 4
  %3 = load i8, i8* %2, align 4
  %4 = icmp eq i8 %3, 0
  %5 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 0
  %6 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %7 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %6, i64 0, i32 5
  %8 = load i32, i32* %7, align 8
  %9 = icmp eq i32 %8, 0
  br i1 %4, label %.preheader, label %.preheader12

.preheader12:                                     ; preds = %1
  br i1 %9, label %.loopexit, label %.lr.ph18.lr.ph

.lr.ph18.lr.ph:                                   ; preds = %.preheader12
  %10 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 3
  %11 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %12 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 25
  %13 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  %14 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 51
  %15 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  %16 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %17 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  %18 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 0
  %19 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %20 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 22
  %21 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 5
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %23 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %25 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %26 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  br label %.lr.ph18

.preheader:                                       ; preds = %1
  br i1 %9, label %.loopexit, label %.lr.ph.lr.ph

.lr.ph.lr.ph:                                     ; preds = %.preheader
  %27 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 3
  %28 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %29 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 25
  %30 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  %31 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 51
  %32 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  %33 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %34 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  %35 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 18, i64 0
  %36 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 21
  %37 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 22
  br label %.lr.ph

.lr.ph18:                                         ; preds = %.lr.ph18.lr.ph, %.backedge15
  %38 = phi %struct.bz_stream* [ %6, %.lr.ph18.lr.ph ], [ %135, %.backedge15 ]
  br label %39

; <label>:39:                                     ; preds = %.lr.ph18, %.backedge11
  %40 = phi %struct.bz_stream* [ %38, %.lr.ph18 ], [ %79, %.backedge11 ]
  %41 = load i32, i32* %10, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %83, label %43

; <label>:43:                                     ; preds = %39
  %44 = load i8, i8* %11, align 4
  %45 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %40, i64 0, i32 4
  %46 = load i8*, i8** %45, align 8
  store i8 %44, i8* %46, align 1
  %47 = load i32, i32* %12, align 8
  %48 = shl i32 %47, 8
  %49 = lshr i32 %47, 24
  %50 = load i8, i8* %11, align 4
  %51 = zext i8 %50 to i32
  %52 = xor i32 %51, %49
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %53
  %55 = load i32, i32* %54, align 4
  %56 = xor i32 %55, %48
  store i32 %56, i32* %12, align 8
  %57 = load i32, i32* %10, align 8
  %58 = add nsw i32 %57, -1
  store i32 %58, i32* %10, align 8
  %59 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %60 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %59, i64 0, i32 4
  %61 = load i8*, i8** %60, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 1
  store i8* %62, i8** %60, align 8
  %63 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %64 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %63, i64 0, i32 5
  %65 = load i32, i32* %64, align 8
  %66 = add i32 %65, -1
  store i32 %66, i32* %64, align 8
  %67 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %68 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %67, i64 0, i32 6
  %69 = load i32, i32* %68, align 4
  %70 = add i32 %69, 1
  store i32 %70, i32* %68, align 4
  %71 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %72 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %71, i64 0, i32 6
  %73 = load i32, i32* %72, align 4
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %.backedge11

; <label>:75:                                     ; preds = %43
  %76 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %71, i64 0, i32 7
  %77 = load i32, i32* %76, align 8
  %78 = add i32 %77, 1
  store i32 %78, i32* %76, align 8
  br label %.backedge11

.backedge11:                                      ; preds = %75, %43
  %79 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %80 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %79, i64 0, i32 5
  %81 = load i32, i32* %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %.loopexit.loopexit33, label %39

; <label>:83:                                     ; preds = %39
  %84 = load i32, i32* %13, align 4
  %85 = load i32, i32* %14, align 8
  %86 = add nsw i32 %85, 1
  %87 = icmp eq i32 %84, %86
  br i1 %87, label %.loopexit.loopexit34, label %88

; <label>:88:                                     ; preds = %83
  %89 = icmp sgt i32 %84, %86
  br i1 %89, label %.loopexit.loopexit34, label %90

; <label>:90:                                     ; preds = %88
  store i32 1, i32* %10, align 8
  %91 = load i32, i32* %15, align 8
  %92 = trunc i32 %91 to i8
  store i8 %92, i8* %16, align 4
  %93 = load i32, i32* %17, align 4
  %94 = tail call i32 @BZ2_indexIntoF(i32 %93, i32* nonnull %18)
  %95 = load i16*, i16** %19, align 8
  %96 = zext i32 %93 to i64
  %97 = getelementptr inbounds i16, i16* %95, i64 %96
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = load i8*, i8** %20, align 8
  %101 = lshr i32 %93, 1
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8* %100, i64 %102
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = shl i32 %93, 2
  %107 = and i32 %106, 4
  %108 = lshr i32 %105, %107
  %109 = shl nuw nsw i32 %108, 16
  %110 = and i32 %109, 983040
  %111 = or i32 %110, %99
  store i32 %111, i32* %17, align 4
  %112 = load i32, i32* %21, align 8
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %121

; <label>:114:                                    ; preds = %90
  %115 = load i32, i32* %22, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %116
  %118 = load i32, i32* %117, align 4
  store i32 %118, i32* %21, align 8
  %119 = add nsw i32 %115, 1
  %120 = icmp eq i32 %119, 512
  %. = select i1 %120, i32 0, i32 %119
  store i32 %., i32* %22, align 4
  br label %121

; <label>:121:                                    ; preds = %114, %90
  %122 = load i32, i32* %21, align 8
  %123 = add nsw i32 %122, -1
  store i32 %123, i32* %21, align 8
  %124 = load i32, i32* %13, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %13, align 4
  %126 = load i32, i32* %14, align 8
  %127 = icmp eq i32 %124, %126
  br i1 %127, label %.backedge15, label %128

; <label>:128:                                    ; preds = %121
  %129 = icmp eq i32 %123, 1
  %130 = zext i1 %129 to i32
  %.masked5 = and i32 %94, 255
  %131 = xor i32 %130, %.masked5
  %132 = load i32, i32* %15, align 8
  %133 = icmp eq i32 %131, %132
  br i1 %133, label %139, label %134

; <label>:134:                                    ; preds = %128
  store i32 %131, i32* %15, align 8
  br label %.backedge15

.backedge15:                                      ; preds = %134, %181, %224, %291, %121, %168, %211
  %135 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %136 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %135, i64 0, i32 5
  %137 = load i32, i32* %136, align 8
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %.loopexit.loopexit34, label %.lr.ph18

; <label>:139:                                    ; preds = %128
  store i32 2, i32* %10, align 8
  %140 = load i32, i32* %17, align 4
  %141 = tail call i32 @BZ2_indexIntoF(i32 %140, i32* nonnull %18)
  %142 = load i16*, i16** %19, align 8
  %143 = zext i32 %140 to i64
  %144 = getelementptr inbounds i16, i16* %142, i64 %143
  %145 = load i16, i16* %144, align 2
  %146 = zext i16 %145 to i32
  %147 = load i8*, i8** %20, align 8
  %148 = lshr i32 %140, 1
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %147, i64 %149
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = shl i32 %140, 2
  %154 = and i32 %153, 4
  %155 = lshr i32 %152, %154
  %156 = shl nuw nsw i32 %155, 16
  %157 = and i32 %156, 983040
  %158 = or i32 %157, %146
  store i32 %158, i32* %17, align 4
  %159 = load i32, i32* %21, align 8
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %168

; <label>:161:                                    ; preds = %139
  %162 = load i32, i32* %23, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %163
  %165 = load i32, i32* %164, align 4
  store i32 %165, i32* %21, align 8
  %166 = add nsw i32 %162, 1
  %167 = icmp eq i32 %166, 512
  %.1 = select i1 %167, i32 0, i32 %166
  store i32 %.1, i32* %23, align 4
  br label %168

; <label>:168:                                    ; preds = %161, %139
  %169 = load i32, i32* %21, align 8
  %170 = add nsw i32 %169, -1
  store i32 %170, i32* %21, align 8
  %171 = load i32, i32* %13, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %13, align 4
  %173 = load i32, i32* %14, align 8
  %174 = icmp eq i32 %171, %173
  br i1 %174, label %.backedge15, label %175

; <label>:175:                                    ; preds = %168
  %176 = icmp eq i32 %170, 1
  %177 = zext i1 %176 to i32
  %.masked6 = and i32 %141, 255
  %178 = xor i32 %177, %.masked6
  %179 = load i32, i32* %15, align 8
  %180 = icmp eq i32 %178, %179
  br i1 %180, label %182, label %181

; <label>:181:                                    ; preds = %175
  store i32 %178, i32* %15, align 8
  br label %.backedge15

; <label>:182:                                    ; preds = %175
  store i32 3, i32* %10, align 8
  %183 = load i32, i32* %17, align 4
  %184 = tail call i32 @BZ2_indexIntoF(i32 %183, i32* nonnull %18)
  %185 = load i16*, i16** %19, align 8
  %186 = zext i32 %183 to i64
  %187 = getelementptr inbounds i16, i16* %185, i64 %186
  %188 = load i16, i16* %187, align 2
  %189 = zext i16 %188 to i32
  %190 = load i8*, i8** %20, align 8
  %191 = lshr i32 %183, 1
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds i8, i8* %190, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = shl i32 %183, 2
  %197 = and i32 %196, 4
  %198 = lshr i32 %195, %197
  %199 = shl nuw nsw i32 %198, 16
  %200 = and i32 %199, 983040
  %201 = or i32 %200, %189
  store i32 %201, i32* %17, align 4
  %202 = load i32, i32* %21, align 8
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %211

; <label>:204:                                    ; preds = %182
  %205 = load i32, i32* %24, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %206
  %208 = load i32, i32* %207, align 4
  store i32 %208, i32* %21, align 8
  %209 = add nsw i32 %205, 1
  %210 = icmp eq i32 %209, 512
  %.2 = select i1 %210, i32 0, i32 %209
  store i32 %.2, i32* %24, align 4
  br label %211

; <label>:211:                                    ; preds = %204, %182
  %212 = load i32, i32* %21, align 8
  %213 = add nsw i32 %212, -1
  store i32 %213, i32* %21, align 8
  %214 = load i32, i32* %13, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %13, align 4
  %216 = load i32, i32* %14, align 8
  %217 = icmp eq i32 %214, %216
  br i1 %217, label %.backedge15, label %218

; <label>:218:                                    ; preds = %211
  %219 = icmp eq i32 %213, 1
  %220 = zext i1 %219 to i32
  %.masked7 = and i32 %184, 255
  %221 = xor i32 %220, %.masked7
  %222 = load i32, i32* %15, align 8
  %223 = icmp eq i32 %221, %222
  br i1 %223, label %225, label %224

; <label>:224:                                    ; preds = %218
  store i32 %221, i32* %15, align 8
  br label %.backedge15

; <label>:225:                                    ; preds = %218
  %226 = load i32, i32* %17, align 4
  %227 = tail call i32 @BZ2_indexIntoF(i32 %226, i32* nonnull %18)
  %228 = load i16*, i16** %19, align 8
  %229 = zext i32 %226 to i64
  %230 = getelementptr inbounds i16, i16* %228, i64 %229
  %231 = load i16, i16* %230, align 2
  %232 = zext i16 %231 to i32
  %233 = load i8*, i8** %20, align 8
  %234 = lshr i32 %226, 1
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds i8, i8* %233, i64 %235
  %237 = load i8, i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = shl i32 %226, 2
  %240 = and i32 %239, 4
  %241 = lshr i32 %238, %240
  %242 = shl nuw nsw i32 %241, 16
  %243 = and i32 %242, 983040
  %244 = or i32 %243, %232
  store i32 %244, i32* %17, align 4
  %245 = load i32, i32* %21, align 8
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %247, label %254

; <label>:247:                                    ; preds = %225
  %248 = load i32, i32* %25, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %249
  %251 = load i32, i32* %250, align 4
  store i32 %251, i32* %21, align 8
  %252 = add nsw i32 %248, 1
  %253 = icmp eq i32 %252, 512
  %.3 = select i1 %253, i32 0, i32 %252
  store i32 %.3, i32* %25, align 4
  br label %254

; <label>:254:                                    ; preds = %247, %225
  %255 = load i32, i32* %21, align 8
  %256 = add nsw i32 %255, -1
  store i32 %256, i32* %21, align 8
  %257 = icmp eq i32 %256, 1
  %258 = zext i1 %257 to i32
  %259 = load i32, i32* %13, align 4
  %260 = add nsw i32 %259, 1
  store i32 %260, i32* %13, align 4
  %.masked = and i32 %227, 255
  %261 = xor i32 %258, %.masked
  %262 = add nuw nsw i32 %261, 4
  store i32 %262, i32* %10, align 8
  %263 = load i32, i32* %17, align 4
  %264 = tail call i32 @BZ2_indexIntoF(i32 %263, i32* nonnull %18)
  store i32 %264, i32* %15, align 8
  %265 = load i16*, i16** %19, align 8
  %266 = zext i32 %263 to i64
  %267 = getelementptr inbounds i16, i16* %265, i64 %266
  %268 = load i16, i16* %267, align 2
  %269 = zext i16 %268 to i32
  %270 = load i8*, i8** %20, align 8
  %271 = lshr i32 %263, 1
  %272 = zext i32 %271 to i64
  %273 = getelementptr inbounds i8, i8* %270, i64 %272
  %274 = load i8, i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = shl i32 %263, 2
  %277 = and i32 %276, 4
  %278 = lshr i32 %275, %277
  %279 = shl nuw nsw i32 %278, 16
  %280 = and i32 %279, 983040
  %281 = or i32 %280, %269
  store i32 %281, i32* %17, align 4
  %282 = load i32, i32* %21, align 8
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %291

; <label>:284:                                    ; preds = %254
  %285 = load i32, i32* %26, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %286
  %288 = load i32, i32* %287, align 4
  store i32 %288, i32* %21, align 8
  %289 = add nsw i32 %285, 1
  %290 = icmp eq i32 %289, 512
  %.4 = select i1 %290, i32 0, i32 %289
  store i32 %.4, i32* %26, align 4
  br label %291

; <label>:291:                                    ; preds = %284, %254
  %292 = load i32, i32* %21, align 8
  %293 = add nsw i32 %292, -1
  store i32 %293, i32* %21, align 8
  %294 = icmp eq i32 %293, 1
  %295 = zext i1 %294 to i32
  %296 = load i32, i32* %15, align 8
  %297 = xor i32 %295, %296
  store i32 %297, i32* %15, align 8
  %298 = load i32, i32* %13, align 4
  %299 = add nsw i32 %298, 1
  store i32 %299, i32* %13, align 4
  br label %.backedge15

.lr.ph:                                           ; preds = %.lr.ph.lr.ph, %.backedge9
  %300 = phi %struct.bz_stream* [ %6, %.lr.ph.lr.ph ], [ %383, %.backedge9 ]
  br label %301

; <label>:301:                                    ; preds = %.lr.ph, %.backedge
  %302 = phi %struct.bz_stream* [ %300, %.lr.ph ], [ %341, %.backedge ]
  %303 = load i32, i32* %27, align 8
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %345, label %305

; <label>:305:                                    ; preds = %301
  %306 = load i8, i8* %28, align 4
  %307 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %302, i64 0, i32 4
  %308 = load i8*, i8** %307, align 8
  store i8 %306, i8* %308, align 1
  %309 = load i32, i32* %29, align 8
  %310 = shl i32 %309, 8
  %311 = lshr i32 %309, 24
  %312 = load i8, i8* %28, align 4
  %313 = zext i8 %312 to i32
  %314 = xor i32 %313, %311
  %315 = zext i32 %314 to i64
  %316 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %315
  %317 = load i32, i32* %316, align 4
  %318 = xor i32 %317, %310
  store i32 %318, i32* %29, align 8
  %319 = load i32, i32* %27, align 8
  %320 = add nsw i32 %319, -1
  store i32 %320, i32* %27, align 8
  %321 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %322 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %321, i64 0, i32 4
  %323 = load i8*, i8** %322, align 8
  %324 = getelementptr inbounds i8, i8* %323, i64 1
  store i8* %324, i8** %322, align 8
  %325 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %326 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %325, i64 0, i32 5
  %327 = load i32, i32* %326, align 8
  %328 = add i32 %327, -1
  store i32 %328, i32* %326, align 8
  %329 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %330 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %329, i64 0, i32 6
  %331 = load i32, i32* %330, align 4
  %332 = add i32 %331, 1
  store i32 %332, i32* %330, align 4
  %333 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %334 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %333, i64 0, i32 6
  %335 = load i32, i32* %334, align 4
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %337, label %.backedge

; <label>:337:                                    ; preds = %305
  %338 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %333, i64 0, i32 7
  %339 = load i32, i32* %338, align 8
  %340 = add i32 %339, 1
  store i32 %340, i32* %338, align 8
  br label %.backedge

.backedge:                                        ; preds = %337, %305
  %341 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %342 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %341, i64 0, i32 5
  %343 = load i32, i32* %342, align 8
  %344 = icmp eq i32 %343, 0
  br i1 %344, label %.loopexit.loopexit, label %301

; <label>:345:                                    ; preds = %301
  %346 = load i32, i32* %30, align 4
  %347 = load i32, i32* %31, align 8
  %348 = add nsw i32 %347, 1
  %349 = icmp eq i32 %346, %348
  br i1 %349, label %.loopexit.loopexit32, label %350

; <label>:350:                                    ; preds = %345
  %351 = icmp sgt i32 %346, %348
  br i1 %351, label %.loopexit.loopexit32, label %352

; <label>:352:                                    ; preds = %350
  store i32 1, i32* %27, align 8
  %353 = load i32, i32* %32, align 8
  %354 = trunc i32 %353 to i8
  store i8 %354, i8* %33, align 4
  %355 = load i32, i32* %34, align 4
  %356 = tail call i32 @BZ2_indexIntoF(i32 %355, i32* nonnull %35)
  %357 = load i16*, i16** %36, align 8
  %358 = zext i32 %355 to i64
  %359 = getelementptr inbounds i16, i16* %357, i64 %358
  %360 = load i16, i16* %359, align 2
  %361 = zext i16 %360 to i32
  %362 = load i8*, i8** %37, align 8
  %363 = lshr i32 %355, 1
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds i8, i8* %362, i64 %364
  %366 = load i8, i8* %365, align 1
  %367 = zext i8 %366 to i32
  %368 = shl i32 %355, 2
  %369 = and i32 %368, 4
  %370 = lshr i32 %367, %369
  %371 = shl nuw nsw i32 %370, 16
  %372 = and i32 %371, 983040
  %373 = or i32 %372, %361
  store i32 %373, i32* %34, align 4
  %374 = load i32, i32* %30, align 4
  %375 = add nsw i32 %374, 1
  store i32 %375, i32* %30, align 4
  %376 = load i32, i32* %31, align 8
  %377 = icmp eq i32 %374, %376
  br i1 %377, label %.backedge9, label %378

; <label>:378:                                    ; preds = %352
  %379 = and i32 %356, 255
  %380 = load i32, i32* %32, align 8
  %381 = icmp eq i32 %379, %380
  br i1 %381, label %387, label %382

; <label>:382:                                    ; preds = %378
  store i32 %379, i32* %32, align 8
  br label %.backedge9

.backedge9:                                       ; preds = %382, %415, %444, %445, %352, %387, %416
  %383 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %384 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %383, i64 0, i32 5
  %385 = load i32, i32* %384, align 8
  %386 = icmp eq i32 %385, 0
  br i1 %386, label %.loopexit.loopexit32, label %.lr.ph

; <label>:387:                                    ; preds = %378
  store i32 2, i32* %27, align 8
  %388 = load i32, i32* %34, align 4
  %389 = tail call i32 @BZ2_indexIntoF(i32 %388, i32* nonnull %35)
  %390 = load i16*, i16** %36, align 8
  %391 = zext i32 %388 to i64
  %392 = getelementptr inbounds i16, i16* %390, i64 %391
  %393 = load i16, i16* %392, align 2
  %394 = zext i16 %393 to i32
  %395 = load i8*, i8** %37, align 8
  %396 = lshr i32 %388, 1
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds i8, i8* %395, i64 %397
  %399 = load i8, i8* %398, align 1
  %400 = zext i8 %399 to i32
  %401 = shl i32 %388, 2
  %402 = and i32 %401, 4
  %403 = lshr i32 %400, %402
  %404 = shl nuw nsw i32 %403, 16
  %405 = and i32 %404, 983040
  %406 = or i32 %405, %394
  store i32 %406, i32* %34, align 4
  %407 = load i32, i32* %30, align 4
  %408 = add nsw i32 %407, 1
  store i32 %408, i32* %30, align 4
  %409 = load i32, i32* %31, align 8
  %410 = icmp eq i32 %407, %409
  br i1 %410, label %.backedge9, label %411

; <label>:411:                                    ; preds = %387
  %412 = and i32 %389, 255
  %413 = load i32, i32* %32, align 8
  %414 = icmp eq i32 %412, %413
  br i1 %414, label %416, label %415

; <label>:415:                                    ; preds = %411
  store i32 %412, i32* %32, align 8
  br label %.backedge9

; <label>:416:                                    ; preds = %411
  store i32 3, i32* %27, align 8
  %417 = load i32, i32* %34, align 4
  %418 = tail call i32 @BZ2_indexIntoF(i32 %417, i32* nonnull %35)
  %419 = load i16*, i16** %36, align 8
  %420 = zext i32 %417 to i64
  %421 = getelementptr inbounds i16, i16* %419, i64 %420
  %422 = load i16, i16* %421, align 2
  %423 = zext i16 %422 to i32
  %424 = load i8*, i8** %37, align 8
  %425 = lshr i32 %417, 1
  %426 = zext i32 %425 to i64
  %427 = getelementptr inbounds i8, i8* %424, i64 %426
  %428 = load i8, i8* %427, align 1
  %429 = zext i8 %428 to i32
  %430 = shl i32 %417, 2
  %431 = and i32 %430, 4
  %432 = lshr i32 %429, %431
  %433 = shl nuw nsw i32 %432, 16
  %434 = and i32 %433, 983040
  %435 = or i32 %434, %423
  store i32 %435, i32* %34, align 4
  %436 = load i32, i32* %30, align 4
  %437 = add nsw i32 %436, 1
  store i32 %437, i32* %30, align 4
  %438 = load i32, i32* %31, align 8
  %439 = icmp eq i32 %436, %438
  br i1 %439, label %.backedge9, label %440

; <label>:440:                                    ; preds = %416
  %441 = and i32 %418, 255
  %442 = load i32, i32* %32, align 8
  %443 = icmp eq i32 %441, %442
  br i1 %443, label %445, label %444

; <label>:444:                                    ; preds = %440
  store i32 %441, i32* %32, align 8
  br label %.backedge9

; <label>:445:                                    ; preds = %440
  %446 = load i32, i32* %34, align 4
  %447 = tail call i32 @BZ2_indexIntoF(i32 %446, i32* nonnull %35)
  %448 = load i16*, i16** %36, align 8
  %449 = zext i32 %446 to i64
  %450 = getelementptr inbounds i16, i16* %448, i64 %449
  %451 = load i16, i16* %450, align 2
  %452 = zext i16 %451 to i32
  %453 = load i8*, i8** %37, align 8
  %454 = lshr i32 %446, 1
  %455 = zext i32 %454 to i64
  %456 = getelementptr inbounds i8, i8* %453, i64 %455
  %457 = load i8, i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = shl i32 %446, 2
  %460 = and i32 %459, 4
  %461 = lshr i32 %458, %460
  %462 = shl nuw nsw i32 %461, 16
  %463 = and i32 %462, 983040
  %464 = or i32 %463, %452
  store i32 %464, i32* %34, align 4
  %465 = load i32, i32* %30, align 4
  %466 = add nsw i32 %465, 1
  store i32 %466, i32* %30, align 4
  %467 = and i32 %447, 255
  %468 = add nuw nsw i32 %467, 4
  store i32 %468, i32* %27, align 8
  %469 = load i32, i32* %34, align 4
  %470 = tail call i32 @BZ2_indexIntoF(i32 %469, i32* nonnull %35)
  store i32 %470, i32* %32, align 8
  %471 = load i16*, i16** %36, align 8
  %472 = zext i32 %469 to i64
  %473 = getelementptr inbounds i16, i16* %471, i64 %472
  %474 = load i16, i16* %473, align 2
  %475 = zext i16 %474 to i32
  %476 = load i8*, i8** %37, align 8
  %477 = lshr i32 %469, 1
  %478 = zext i32 %477 to i64
  %479 = getelementptr inbounds i8, i8* %476, i64 %478
  %480 = load i8, i8* %479, align 1
  %481 = zext i8 %480 to i32
  %482 = shl i32 %469, 2
  %483 = and i32 %482, 4
  %484 = lshr i32 %481, %483
  %485 = shl nuw nsw i32 %484, 16
  %486 = and i32 %485, 983040
  %487 = or i32 %486, %475
  store i32 %487, i32* %34, align 4
  %488 = load i32, i32* %30, align 4
  %489 = add nsw i32 %488, 1
  store i32 %489, i32* %30, align 4
  br label %.backedge9

.loopexit.loopexit:                               ; preds = %.backedge
  br label %.loopexit

.loopexit.loopexit32:                             ; preds = %.backedge9, %345, %350
  %.0.ph = phi i8 [ 0, %.backedge9 ], [ 1, %350 ], [ 0, %345 ]
  br label %.loopexit

.loopexit.loopexit33:                             ; preds = %.backedge11
  br label %.loopexit

.loopexit.loopexit34:                             ; preds = %.backedge15, %83, %88
  %.0.ph35 = phi i8 [ 0, %.backedge15 ], [ 1, %88 ], [ 0, %83 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit34, %.loopexit.loopexit33, %.loopexit.loopexit32, %.loopexit.loopexit, %.preheader12, %.preheader
  %.0 = phi i8 [ 0, %.preheader ], [ 0, %.preheader12 ], [ 0, %.loopexit.loopexit ], [ %.0.ph, %.loopexit.loopexit32 ], [ 0, %.loopexit.loopexit33 ], [ %.0.ph35, %.loopexit.loopexit34 ]
  ret i8 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc zeroext i8 @unRLE_obuf_to_output_FAST(%struct.DState*) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 4
  %3 = load i8, i8* %2, align 4
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %223, label %.preheader43

.preheader43:                                     ; preds = %1
  %5 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 0
  %6 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %7 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %6, i64 0, i32 5
  %8 = load i32, i32* %7, align 8
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit40, label %.lr.ph75.lr.ph

.lr.ph75.lr.ph:                                   ; preds = %.preheader43
  %10 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 3
  %11 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %12 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 25
  %13 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  %14 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 51
  %15 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  %16 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %17 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %18 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  %19 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 5
  %20 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %21 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %23 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 6
  br label %.lr.ph75

.lr.ph75:                                         ; preds = %.lr.ph75.lr.ph, %.backedge45
  %25 = phi %struct.bz_stream* [ %6, %.lr.ph75.lr.ph ], [ %109, %.backedge45 ]
  br label %26

; <label>:26:                                     ; preds = %.lr.ph75, %.backedge42
  %27 = phi %struct.bz_stream* [ %25, %.lr.ph75 ], [ %66, %.backedge42 ]
  %28 = load i32, i32* %10, align 8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %70, label %30

; <label>:30:                                     ; preds = %26
  %31 = load i8, i8* %11, align 4
  %32 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %27, i64 0, i32 4
  %33 = load i8*, i8** %32, align 8
  store i8 %31, i8* %33, align 1
  %34 = load i32, i32* %12, align 8
  %35 = shl i32 %34, 8
  %36 = lshr i32 %34, 24
  %37 = load i8, i8* %11, align 4
  %38 = zext i8 %37 to i32
  %39 = xor i32 %38, %36
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = xor i32 %42, %35
  store i32 %43, i32* %12, align 8
  %44 = load i32, i32* %10, align 8
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %10, align 8
  %46 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %47 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %46, i64 0, i32 4
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  store i8* %49, i8** %47, align 8
  %50 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %51 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %50, i64 0, i32 5
  %52 = load i32, i32* %51, align 8
  %53 = add i32 %52, -1
  store i32 %53, i32* %51, align 8
  %54 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %55 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %54, i64 0, i32 6
  %56 = load i32, i32* %55, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %55, align 4
  %58 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %59 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %58, i64 0, i32 6
  %60 = load i32, i32* %59, align 4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %.backedge42

; <label>:62:                                     ; preds = %30
  %63 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %58, i64 0, i32 7
  %64 = load i32, i32* %63, align 8
  %65 = add i32 %64, 1
  store i32 %65, i32* %63, align 8
  br label %.backedge42

.backedge42:                                      ; preds = %62, %30
  %66 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %67 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %66, i64 0, i32 5
  %68 = load i32, i32* %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %.loopexit40.loopexit126, label %26

; <label>:70:                                     ; preds = %26
  %71 = load i32, i32* %13, align 4
  %72 = load i32, i32* %14, align 8
  %73 = add nsw i32 %72, 1
  %74 = icmp eq i32 %71, %73
  br i1 %74, label %.loopexit40.loopexit127, label %75

; <label>:75:                                     ; preds = %70
  %76 = icmp sgt i32 %71, %73
  br i1 %76, label %.loopexit40.loopexit127, label %77

; <label>:77:                                     ; preds = %75
  store i32 1, i32* %10, align 8
  %78 = load i32, i32* %15, align 8
  %79 = trunc i32 %78 to i8
  store i8 %79, i8* %16, align 4
  %80 = load i32*, i32** %17, align 8
  %81 = load i32, i32* %18, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %80, i64 %82
  %84 = load i32, i32* %83, align 4
  %85 = lshr i32 %84, 8
  store i32 %85, i32* %18, align 4
  %86 = load i32, i32* %19, align 8
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %95

; <label>:88:                                     ; preds = %77
  %89 = load i32, i32* %20, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %90
  %92 = load i32, i32* %91, align 4
  store i32 %92, i32* %19, align 8
  %93 = add nsw i32 %89, 1
  %94 = icmp eq i32 %93, 512
  %. = select i1 %94, i32 0, i32 %93
  store i32 %., i32* %20, align 4
  br label %95

; <label>:95:                                     ; preds = %88, %77
  %96 = load i32, i32* %19, align 8
  %97 = add nsw i32 %96, -1
  store i32 %97, i32* %19, align 8
  %98 = load i32, i32* %13, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %13, align 4
  %100 = load i32, i32* %14, align 8
  %101 = icmp eq i32 %98, %100
  br i1 %101, label %.backedge45, label %102

; <label>:102:                                    ; preds = %95
  %103 = icmp eq i32 %97, 1
  %104 = zext i1 %103 to i32
  %.masked35 = and i32 %84, 255
  %105 = xor i32 %104, %.masked35
  %106 = load i32, i32* %15, align 8
  %107 = icmp eq i32 %105, %106
  br i1 %107, label %113, label %108

; <label>:108:                                    ; preds = %102
  store i32 %105, i32* %15, align 8
  br label %.backedge45

.backedge45:                                      ; preds = %108, %142, %172, %214, %95, %129, %159
  %109 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %110 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %109, i64 0, i32 5
  %111 = load i32, i32* %110, align 8
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %.loopexit40.loopexit127, label %.lr.ph75

; <label>:113:                                    ; preds = %102
  store i32 2, i32* %10, align 8
  %114 = load i32*, i32** %17, align 8
  %115 = load i32, i32* %18, align 4
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32* %114, i64 %116
  %118 = load i32, i32* %117, align 4
  %119 = lshr i32 %118, 8
  store i32 %119, i32* %18, align 4
  %120 = load i32, i32* %19, align 8
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %129

; <label>:122:                                    ; preds = %113
  %123 = load i32, i32* %21, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %124
  %126 = load i32, i32* %125, align 4
  store i32 %126, i32* %19, align 8
  %127 = add nsw i32 %123, 1
  %128 = icmp eq i32 %127, 512
  %.31 = select i1 %128, i32 0, i32 %127
  store i32 %.31, i32* %21, align 4
  br label %129

; <label>:129:                                    ; preds = %122, %113
  %130 = load i32, i32* %19, align 8
  %131 = add nsw i32 %130, -1
  store i32 %131, i32* %19, align 8
  %132 = load i32, i32* %13, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %13, align 4
  %134 = load i32, i32* %14, align 8
  %135 = icmp eq i32 %132, %134
  br i1 %135, label %.backedge45, label %136

; <label>:136:                                    ; preds = %129
  %137 = icmp eq i32 %131, 1
  %138 = zext i1 %137 to i32
  %.masked36 = and i32 %118, 255
  %139 = xor i32 %138, %.masked36
  %140 = load i32, i32* %15, align 8
  %141 = icmp eq i32 %139, %140
  br i1 %141, label %143, label %142

; <label>:142:                                    ; preds = %136
  store i32 %139, i32* %15, align 8
  br label %.backedge45

; <label>:143:                                    ; preds = %136
  store i32 3, i32* %10, align 8
  %144 = load i32*, i32** %17, align 8
  %145 = load i32, i32* %18, align 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32* %144, i64 %146
  %148 = load i32, i32* %147, align 4
  %149 = lshr i32 %148, 8
  store i32 %149, i32* %18, align 4
  %150 = load i32, i32* %19, align 8
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %159

; <label>:152:                                    ; preds = %143
  %153 = load i32, i32* %22, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %154
  %156 = load i32, i32* %155, align 4
  store i32 %156, i32* %19, align 8
  %157 = add nsw i32 %153, 1
  %158 = icmp eq i32 %157, 512
  %.32 = select i1 %158, i32 0, i32 %157
  store i32 %.32, i32* %22, align 4
  br label %159

; <label>:159:                                    ; preds = %152, %143
  %160 = load i32, i32* %19, align 8
  %161 = add nsw i32 %160, -1
  store i32 %161, i32* %19, align 8
  %162 = load i32, i32* %13, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %13, align 4
  %164 = load i32, i32* %14, align 8
  %165 = icmp eq i32 %162, %164
  br i1 %165, label %.backedge45, label %166

; <label>:166:                                    ; preds = %159
  %167 = icmp eq i32 %161, 1
  %168 = zext i1 %167 to i32
  %.masked37 = and i32 %148, 255
  %169 = xor i32 %168, %.masked37
  %170 = load i32, i32* %15, align 8
  %171 = icmp eq i32 %169, %170
  br i1 %171, label %173, label %172

; <label>:172:                                    ; preds = %166
  store i32 %169, i32* %15, align 8
  br label %.backedge45

; <label>:173:                                    ; preds = %166
  %174 = load i32*, i32** %17, align 8
  %175 = load i32, i32* %18, align 4
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32* %174, i64 %176
  %178 = load i32, i32* %177, align 4
  %179 = lshr i32 %178, 8
  store i32 %179, i32* %18, align 4
  %180 = load i32, i32* %19, align 8
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %182, label %189

; <label>:182:                                    ; preds = %173
  %183 = load i32, i32* %23, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %184
  %186 = load i32, i32* %185, align 4
  store i32 %186, i32* %19, align 8
  %187 = add nsw i32 %183, 1
  %188 = icmp eq i32 %187, 512
  %.33 = select i1 %188, i32 0, i32 %187
  store i32 %.33, i32* %23, align 4
  br label %189

; <label>:189:                                    ; preds = %182, %173
  %190 = load i32, i32* %19, align 8
  %191 = add nsw i32 %190, -1
  store i32 %191, i32* %19, align 8
  %192 = icmp eq i32 %191, 1
  %193 = zext i1 %192 to i32
  %194 = load i32, i32* %13, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* %13, align 4
  %.masked = and i32 %178, 255
  %196 = xor i32 %193, %.masked
  %197 = add nuw nsw i32 %196, 4
  store i32 %197, i32* %10, align 8
  %198 = load i32*, i32** %17, align 8
  %199 = load i32, i32* %18, align 4
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32* %198, i64 %200
  %202 = load i32, i32* %201, align 4
  %203 = and i32 %202, 255
  store i32 %203, i32* %15, align 8
  %204 = lshr i32 %202, 8
  store i32 %204, i32* %18, align 4
  %205 = load i32, i32* %19, align 8
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %207, label %214

; <label>:207:                                    ; preds = %189
  %208 = load i32, i32* %24, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %209
  %211 = load i32, i32* %210, align 4
  store i32 %211, i32* %19, align 8
  %212 = add nsw i32 %208, 1
  %213 = icmp eq i32 %212, 512
  %.34 = select i1 %213, i32 0, i32 %212
  store i32 %.34, i32* %24, align 4
  br label %214

; <label>:214:                                    ; preds = %207, %189
  %215 = load i32, i32* %19, align 8
  %216 = add nsw i32 %215, -1
  store i32 %216, i32* %19, align 8
  %217 = icmp eq i32 %216, 1
  %218 = zext i1 %217 to i32
  %219 = load i32, i32* %15, align 8
  %220 = xor i32 %218, %219
  store i32 %220, i32* %15, align 8
  %221 = load i32, i32* %13, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %13, align 4
  br label %.backedge45

; <label>:223:                                    ; preds = %1
  %224 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 25
  %225 = load i32, i32* %224, align 8
  %226 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 2
  %227 = load i8, i8* %226, align 4
  %228 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 3
  %229 = load i32, i32* %228, align 8
  %230 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 17
  %231 = load i32, i32* %230, align 4
  %232 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 15
  %233 = load i32, i32* %232, align 8
  %234 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 20
  %235 = load i32*, i32** %234, align 8
  %236 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 14
  %237 = load i32, i32* %236, align 4
  %238 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 0
  %239 = load %struct.bz_stream*, %struct.bz_stream** %238, align 8
  %240 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %239, i64 0, i32 4
  %241 = load i8*, i8** %240, align 8
  %242 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %239, i64 0, i32 5
  %243 = load i32, i32* %242, align 8
  %244 = getelementptr inbounds %struct.DState, %struct.DState* %0, i64 0, i32 51
  %245 = load i32, i32* %244, align 8
  %246 = add nsw i32 %245, 1
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %223
  %.027 = phi i32 [ %237, %223 ], [ %.027.be, %.backedge.backedge ]
  %.022 = phi i8* [ %241, %223 ], [ %.325, %.backedge.backedge ]
  %.018 = phi i32 [ %233, %223 ], [ %.018.be, %.backedge.backedge ]
  %.014 = phi i32 [ %231, %223 ], [ %.014.be, %.backedge.backedge ]
  %.011 = phi i32 [ %229, %223 ], [ %.011.be, %.backedge.backedge ]
  %.07 = phi i8 [ %227, %223 ], [ %281, %.backedge.backedge ]
  %.02 = phi i32 [ %225, %223 ], [ %.35, %.backedge.backedge ]
  %.01 = phi i32 [ %243, %223 ], [ %.3, %.backedge.backedge ]
  %247 = icmp sgt i32 %.011, 0
  br i1 %247, label %.preheader, label %276

.preheader:                                       ; preds = %.backedge
  %248 = icmp eq i32 %.01, 0
  br i1 %248, label %.loopexit.loopexit125, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %249 = zext i8 %.07 to i32
  br label %250

; <label>:250:                                    ; preds = %.lr.ph, %252
  %.161 = phi i32 [ %.01, %.lr.ph ], [ %262, %252 ]
  %.1360 = phi i32 [ %.02, %.lr.ph ], [ %259, %252 ]
  %.11259 = phi i32 [ %.011, %.lr.ph ], [ %260, %252 ]
  %.12358 = phi i8* [ %.022, %.lr.ph ], [ %261, %252 ]
  %251 = icmp eq i32 %.11259, 1
  br i1 %251, label %.loopexit38.loopexit, label %252

; <label>:252:                                    ; preds = %250
  store i8 %.07, i8* %.12358, align 1
  %253 = shl i32 %.1360, 8
  %254 = lshr i32 %.1360, 24
  %255 = xor i32 %254, %249
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %256
  %258 = load i32, i32* %257, align 4
  %259 = xor i32 %258, %253
  %260 = add nsw i32 %.11259, -1
  %261 = getelementptr inbounds i8, i8* %.12358, i64 1
  %262 = add i32 %.161, -1
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %.loopexit.loopexit, label %250

.loopexit38.loopexit:                             ; preds = %250
  br label %.loopexit38

.loopexit38:                                      ; preds = %.loopexit38.loopexit, %280, %289
  %.128 = phi i32 [ %285, %289 ], [ %285, %280 ], [ %.027, %.loopexit38.loopexit ]
  %.224 = phi i8* [ %.325, %289 ], [ %.325, %280 ], [ %.12358, %.loopexit38.loopexit ]
  %.119 = phi i32 [ %.220, %289 ], [ %287, %280 ], [ %.018, %.loopexit38.loopexit ]
  %.115 = phi i32 [ %286, %289 ], [ %286, %280 ], [ %.014, %.loopexit38.loopexit ]
  %.18 = phi i8 [ %281, %289 ], [ %281, %280 ], [ %.07, %.loopexit38.loopexit ]
  %.24 = phi i32 [ %.35, %289 ], [ %.35, %280 ], [ %.1360, %.loopexit38.loopexit ]
  %.2 = phi i32 [ %.3, %289 ], [ %.3, %280 ], [ %.161, %.loopexit38.loopexit ]
  %264 = icmp eq i32 %.2, 0
  br i1 %264, label %.loopexit.loopexit125, label %265

; <label>:265:                                    ; preds = %.loopexit38
  store i8 %.18, i8* %.224, align 1
  %266 = shl i32 %.24, 8
  %267 = lshr i32 %.24, 24
  %268 = zext i8 %.18 to i32
  %269 = xor i32 %267, %268
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %270
  %272 = load i32, i32* %271, align 4
  %273 = xor i32 %272, %266
  %274 = getelementptr inbounds i8, i8* %.224, i64 1
  %275 = add i32 %.2, -1
  br label %276

; <label>:276:                                    ; preds = %265, %.backedge
  %.229 = phi i32 [ %.128, %265 ], [ %.027, %.backedge ]
  %.325 = phi i8* [ %274, %265 ], [ %.022, %.backedge ]
  %.220 = phi i32 [ %.119, %265 ], [ %.018, %.backedge ]
  %.216 = phi i32 [ %.115, %265 ], [ %.014, %.backedge ]
  %.29 = phi i8 [ %.18, %265 ], [ %.07, %.backedge ]
  %.35 = phi i32 [ %273, %265 ], [ %.02, %.backedge ]
  %.3 = phi i32 [ %275, %265 ], [ %.01, %.backedge ]
  %277 = icmp sgt i32 %.216, %246
  br i1 %277, label %.loopexit40.loopexit, label %278

; <label>:278:                                    ; preds = %276
  %279 = icmp eq i32 %.216, %246
  br i1 %279, label %.loopexit.loopexit125, label %280

; <label>:280:                                    ; preds = %278
  %281 = trunc i32 %.220 to i8
  %282 = zext i32 %.229 to i64
  %283 = getelementptr inbounds i32, i32* %235, i64 %282
  %284 = load i32, i32* %283, align 4
  %285 = lshr i32 %284, 8
  %286 = add nsw i32 %.216, 1
  %287 = and i32 %284, 255
  %288 = icmp eq i32 %287, %.220
  br i1 %288, label %289, label %.loopexit38

; <label>:289:                                    ; preds = %280
  %290 = icmp eq i32 %286, %246
  br i1 %290, label %.loopexit38, label %291

; <label>:291:                                    ; preds = %289
  %292 = zext i32 %285 to i64
  %293 = getelementptr inbounds i32, i32* %235, i64 %292
  %294 = load i32, i32* %293, align 4
  %295 = lshr i32 %294, 8
  %296 = add nsw i32 %.216, 2
  %297 = icmp eq i32 %296, %246
  br i1 %297, label %.backedge.backedge, label %298

; <label>:298:                                    ; preds = %291
  %299 = and i32 %294, 255
  %300 = icmp eq i32 %299, %.220
  br i1 %300, label %301, label %.backedge.backedge

; <label>:301:                                    ; preds = %298
  %302 = zext i32 %295 to i64
  %303 = getelementptr inbounds i32, i32* %235, i64 %302
  %304 = load i32, i32* %303, align 4
  %305 = lshr i32 %304, 8
  %306 = add nsw i32 %.216, 3
  %307 = icmp eq i32 %306, %246
  br i1 %307, label %.backedge.backedge, label %308

; <label>:308:                                    ; preds = %301
  %309 = and i32 %304, 255
  %310 = icmp eq i32 %309, %.220
  br i1 %310, label %311, label %.backedge.backedge

; <label>:311:                                    ; preds = %308
  %312 = zext i32 %305 to i64
  %313 = getelementptr inbounds i32, i32* %235, i64 %312
  %314 = load i32, i32* %313, align 4
  %315 = lshr i32 %314, 8
  %316 = and i32 %314, 255
  %317 = add nuw nsw i32 %316, 4
  %318 = zext i32 %315 to i64
  %319 = getelementptr inbounds i32, i32* %235, i64 %318
  %320 = load i32, i32* %319, align 4
  %321 = and i32 %320, 255
  %322 = lshr i32 %320, 8
  %323 = add nsw i32 %.216, 5
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %311, %291, %301, %298, %308
  %.027.be = phi i32 [ %322, %311 ], [ %295, %291 ], [ %305, %301 ], [ %295, %298 ], [ %305, %308 ]
  %.018.be = phi i32 [ %321, %311 ], [ %.220, %291 ], [ %.220, %301 ], [ %299, %298 ], [ %309, %308 ]
  %.014.be = phi i32 [ %323, %311 ], [ %296, %291 ], [ %306, %301 ], [ %296, %298 ], [ %306, %308 ]
  %.011.be = phi i32 [ %317, %311 ], [ 2, %291 ], [ 3, %301 ], [ 2, %298 ], [ 3, %308 ]
  br label %.backedge

.loopexit.loopexit:                               ; preds = %252
  br label %.loopexit

.loopexit.loopexit125:                            ; preds = %.preheader, %.loopexit38, %278
  %.330.ph = phi i32 [ %.027, %.preheader ], [ %.229, %278 ], [ %.128, %.loopexit38 ]
  %.426.ph = phi i8* [ %.022, %.preheader ], [ %.325, %278 ], [ %.224, %.loopexit38 ]
  %.321.ph = phi i32 [ %.018, %.preheader ], [ %.220, %278 ], [ %.119, %.loopexit38 ]
  %.317.ph = phi i32 [ %.014, %.preheader ], [ %.216, %278 ], [ %.115, %.loopexit38 ]
  %.213.ph = phi i32 [ %.011, %.preheader ], [ 0, %278 ], [ 1, %.loopexit38 ]
  %.310.ph = phi i8 [ %.07, %.preheader ], [ %.29, %278 ], [ %.18, %.loopexit38 ]
  %.46.ph = phi i32 [ %.02, %.preheader ], [ %.35, %278 ], [ %.24, %.loopexit38 ]
  %.4.ph = phi i32 [ 0, %.preheader ], [ %.3, %278 ], [ 0, %.loopexit38 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit125, %.loopexit.loopexit
  %.330 = phi i32 [ %.027, %.loopexit.loopexit ], [ %.330.ph, %.loopexit.loopexit125 ]
  %.426 = phi i8* [ %261, %.loopexit.loopexit ], [ %.426.ph, %.loopexit.loopexit125 ]
  %.321 = phi i32 [ %.018, %.loopexit.loopexit ], [ %.321.ph, %.loopexit.loopexit125 ]
  %.317 = phi i32 [ %.014, %.loopexit.loopexit ], [ %.317.ph, %.loopexit.loopexit125 ]
  %.213 = phi i32 [ %260, %.loopexit.loopexit ], [ %.213.ph, %.loopexit.loopexit125 ]
  %.310 = phi i8 [ %.07, %.loopexit.loopexit ], [ %.310.ph, %.loopexit.loopexit125 ]
  %.46 = phi i32 [ %259, %.loopexit.loopexit ], [ %.46.ph, %.loopexit.loopexit125 ]
  %.4 = phi i32 [ 0, %.loopexit.loopexit ], [ %.4.ph, %.loopexit.loopexit125 ]
  %324 = load %struct.bz_stream*, %struct.bz_stream** %238, align 8
  %325 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %324, i64 0, i32 6
  %326 = load i32, i32* %325, align 4
  %327 = sub i32 %243, %.4
  %328 = add i32 %327, %326
  store i32 %328, i32* %325, align 4
  %329 = load %struct.bz_stream*, %struct.bz_stream** %238, align 8
  %330 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %329, i64 0, i32 6
  %331 = load i32, i32* %330, align 4
  %332 = icmp ult i32 %331, %326
  br i1 %332, label %333, label %337

; <label>:333:                                    ; preds = %.loopexit
  %334 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %329, i64 0, i32 7
  %335 = load i32, i32* %334, align 8
  %336 = add i32 %335, 1
  store i32 %336, i32* %334, align 8
  br label %337

; <label>:337:                                    ; preds = %333, %.loopexit
  store i32 %.46, i32* %224, align 8
  store i8 %.310, i8* %226, align 4
  store i32 %.213, i32* %228, align 8
  store i32 %.317, i32* %230, align 4
  store i32 %.321, i32* %232, align 8
  store i32* %235, i32** %234, align 8
  store i32 %.330, i32* %236, align 4
  %338 = load %struct.bz_stream*, %struct.bz_stream** %238, align 8
  %339 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %338, i64 0, i32 4
  store i8* %.426, i8** %339, align 8
  %340 = load %struct.bz_stream*, %struct.bz_stream** %238, align 8
  %341 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %340, i64 0, i32 5
  store i32 %.4, i32* %341, align 8
  br label %.loopexit40

.loopexit40.loopexit:                             ; preds = %276
  br label %.loopexit40

.loopexit40.loopexit126:                          ; preds = %.backedge42
  br label %.loopexit40

.loopexit40.loopexit127:                          ; preds = %.backedge45, %70, %75
  %.0.ph = phi i8 [ 0, %.backedge45 ], [ 1, %75 ], [ 0, %70 ]
  br label %.loopexit40

.loopexit40:                                      ; preds = %.loopexit40.loopexit127, %.loopexit40.loopexit126, %.loopexit40.loopexit, %.preheader43, %337
  %.0 = phi i8 [ 0, %337 ], [ 0, %.preheader43 ], [ 1, %.loopexit40.loopexit ], [ 0, %.loopexit40.loopexit126 ], [ %.0.ph, %.loopexit40.loopexit127 ]
  ret i8 %.0
}

declare i32 @BZ2_decompress(%struct.DState*) local_unnamed_addr #7

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzDecompressEnd(%struct.bz_stream*) local_unnamed_addr #4 {
  %2 = icmp eq %struct.bz_stream* %0, null
  br i1 %2, label %49, label %3

; <label>:3:                                      ; preds = %1
  %4 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 8
  %5 = bitcast i8** %4 to %struct.DState**
  %6 = load %struct.DState*, %struct.DState** %5, align 8
  %7 = icmp eq %struct.DState* %6, null
  br i1 %7, label %49, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 0
  %10 = load %struct.bz_stream*, %struct.bz_stream** %9, align 8
  %11 = icmp eq %struct.bz_stream* %10, %0
  br i1 %11, label %12, label %49

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 20
  %14 = load i32*, i32** %13, align 8
  %15 = icmp eq i32* %14, null
  br i1 %15, label %23, label %16

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %18 = load void (i8*, i8*)*, void (i8*, i8*)** %17, align 8
  %19 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %20 = load i8*, i8** %19, align 8
  %21 = bitcast i32** %13 to i8**
  %22 = load i8*, i8** %21, align 8
  tail call void %18(i8* %20, i8* %22) #11
  br label %23

; <label>:23:                                     ; preds = %12, %16
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 21
  %25 = load i16*, i16** %24, align 8
  %26 = icmp eq i16* %25, null
  br i1 %26, label %34, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %29 = load void (i8*, i8*)*, void (i8*, i8*)** %28, align 8
  %30 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %31 = load i8*, i8** %30, align 8
  %32 = bitcast i16** %24 to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void %29(i8* %31, i8* %33) #11
  br label %34

; <label>:34:                                     ; preds = %23, %27
  %35 = getelementptr inbounds %struct.DState, %struct.DState* %6, i64 0, i32 22
  %36 = load i8*, i8** %35, align 8
  %37 = icmp eq i8* %36, null
  br i1 %37, label %43, label %38

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %40 = load void (i8*, i8*)*, void (i8*, i8*)** %39, align 8
  %41 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %42 = load i8*, i8** %41, align 8
  tail call void %40(i8* %42, i8* nonnull %36) #11
  br label %43

; <label>:43:                                     ; preds = %34, %38
  %44 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 10
  %45 = load void (i8*, i8*)*, void (i8*, i8*)** %44, align 8
  %46 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %0, i64 0, i32 11
  %47 = load i8*, i8** %46, align 8
  %48 = load i8*, i8** %4, align 8
  tail call void %45(i8* %47, i8* %48) #11
  store i8* null, i8** %4, align 8
  br label %49

; <label>:49:                                     ; preds = %8, %3, %1, %43
  %.0 = phi i32 [ 0, %43 ], [ -2, %1 ], [ -2, %3 ], [ -2, %8 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i8* @BZ2_bzWriteOpen(i32*, %struct._IO_FILE*, i32, i32, i32) local_unnamed_addr #4 {
  %6 = icmp eq i32* %0, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %5
  store i32 0, i32* %0, align 4
  br label %8

; <label>:8:                                      ; preds = %7, %5
  %9 = icmp eq %struct._IO_FILE* %1, null
  %.off = add i32 %2, -1
  %10 = icmp ugt i32 %.off, 8
  %11 = or i1 %9, %10
  %12 = icmp ugt i32 %4, 250
  %13 = or i1 %12, %11
  %14 = icmp ugt i32 %3, 4
  %15 = or i1 %14, %13
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %8
  br i1 %6, label %50, label %17

; <label>:17:                                     ; preds = %16
  store i32 -2, i32* %0, align 4
  br label %50

; <label>:18:                                     ; preds = %8
  %19 = tail call i32 @ferror(%struct._IO_FILE* nonnull %1) #11
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %23, label %21

; <label>:21:                                     ; preds = %18
  br i1 %6, label %50, label %22

; <label>:22:                                     ; preds = %21
  store i32 -6, i32* %0, align 4
  br label %50

; <label>:23:                                     ; preds = %18
  %24 = tail call noalias i8* @malloc(i64 5104) #11
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %23
  br i1 %6, label %50, label %27

; <label>:27:                                     ; preds = %26
  store i32 -3, i32* %0, align 4
  br label %50

; <label>:28:                                     ; preds = %23
  br i1 %6, label %30, label %29

; <label>:29:                                     ; preds = %28
  store i32 0, i32* %0, align 4
  br label %30

; <label>:30:                                     ; preds = %28, %29
  %31 = getelementptr inbounds i8, i8* %24, i64 5096
  %32 = bitcast i8* %31 to i32*
  store i32 0, i32* %32, align 8
  %33 = getelementptr inbounds i8, i8* %24, i64 5100
  store i8 0, i8* %33, align 4
  %34 = getelementptr inbounds i8, i8* %24, i64 5008
  %35 = bitcast i8* %34 to i32*
  store i32 0, i32* %35, align 8
  %36 = bitcast i8* %24 to %struct._IO_FILE**
  store %struct._IO_FILE* %1, %struct._IO_FILE** %36, align 8
  %37 = getelementptr inbounds i8, i8* %24, i64 5012
  store i8 1, i8* %37, align 4
  %38 = getelementptr inbounds i8, i8* %24, i64 5072
  %39 = icmp eq i32 %4, 0
  %. = select i1 %39, i32 30, i32 %4
  %40 = getelementptr inbounds i8, i8* %24, i64 5016
  %41 = bitcast i8* %40 to %struct.bz_stream*
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 24, i32 8, i1 false)
  %42 = tail call i32 @BZ2_bzCompressInit(%struct.bz_stream* %41, i32 %2, i32 %3, i32 %.)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %47, label %44

; <label>:44:                                     ; preds = %30
  br i1 %6, label %46, label %45

; <label>:45:                                     ; preds = %44
  store i32 %42, i32* %0, align 4
  br label %46

; <label>:46:                                     ; preds = %44, %45
  tail call void @free(i8* nonnull %24) #11
  br label %50

; <label>:47:                                     ; preds = %30
  %48 = getelementptr inbounds i8, i8* %24, i64 5024
  %49 = bitcast i8* %48 to i32*
  store i32 0, i32* %49, align 8
  store i8 1, i8* %33, align 4
  br label %50

; <label>:50:                                     ; preds = %27, %26, %21, %22, %16, %17, %47, %46
  %.0 = phi i8* [ null, %46 ], [ %24, %47 ], [ null, %17 ], [ null, %16 ], [ null, %22 ], [ null, %21 ], [ null, %26 ], [ null, %27 ]
  ret i8* %.0
}

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) local_unnamed_addr #8

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @BZ2_bzWrite(i32*, i8*, i8*, i32) local_unnamed_addr #4 {
  %5 = icmp eq i32* %0, null
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %4
  store i32 0, i32* %0, align 4
  br label %7

; <label>:7:                                      ; preds = %4, %6
  %cond = icmp eq i8* %1, null
  br i1 %cond, label %13, label %8

; <label>:8:                                      ; preds = %7
  %9 = getelementptr inbounds i8, i8* %1, i64 5096
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10, align 8
  %11 = icmp eq i8* %2, null
  %12 = icmp slt i32 %3, 0
  %or.cond1 = or i1 %11, %12
  br i1 %or.cond1, label %13, label %20

; <label>:13:                                     ; preds = %7, %8
  br i1 %5, label %15, label %14

; <label>:14:                                     ; preds = %13
  store i32 -2, i32* %0, align 4
  br label %15

; <label>:15:                                     ; preds = %13, %14
  %16 = icmp eq i8* %1, null
  br i1 %16, label %80, label %17

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds i8, i8* %1, i64 5096
  %19 = bitcast i8* %18 to i32*
  store i32 -2, i32* %19, align 8
  br label %80

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds i8, i8* %1, i64 5012
  %22 = load i8, i8* %21, align 4
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %20
  br i1 %5, label %26, label %25

; <label>:25:                                     ; preds = %24
  store i32 -1, i32* %0, align 4
  br label %26

; <label>:26:                                     ; preds = %25, %24
  store i32 -1, i32* %10, align 8
  br label %80

; <label>:27:                                     ; preds = %20
  %28 = bitcast i8* %1 to %struct._IO_FILE**
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8
  %30 = tail call i32 @ferror(%struct._IO_FILE* %29) #11
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %35, label %32

; <label>:32:                                     ; preds = %27
  br i1 %5, label %34, label %33

; <label>:33:                                     ; preds = %32
  store i32 -6, i32* %0, align 4
  br label %34

; <label>:34:                                     ; preds = %33, %32
  store i32 -6, i32* %10, align 8
  br label %80

; <label>:35:                                     ; preds = %27
  %36 = icmp eq i32 %3, 0
  br i1 %36, label %37, label %40

; <label>:37:                                     ; preds = %35
  br i1 %5, label %39, label %38

; <label>:38:                                     ; preds = %37
  store i32 0, i32* %0, align 4
  br label %39

; <label>:39:                                     ; preds = %38, %37
  store i32 0, i32* %10, align 8
  br label %80

; <label>:40:                                     ; preds = %35
  %41 = getelementptr inbounds i8, i8* %1, i64 5024
  %42 = bitcast i8* %41 to i32*
  store i32 %3, i32* %42, align 8
  %43 = getelementptr inbounds i8, i8* %1, i64 5016
  %44 = bitcast i8* %43 to i8**
  store i8* %2, i8** %44, align 8
  %45 = getelementptr inbounds i8, i8* %1, i64 5048
  %46 = bitcast i8* %45 to i32*
  %47 = getelementptr inbounds i8, i8* %1, i64 8
  %48 = getelementptr inbounds i8, i8* %1, i64 5040
  %49 = bitcast i8* %48 to i8**
  %50 = bitcast i8* %43 to %struct.bz_stream*
  br label %51

; <label>:51:                                     ; preds = %74, %40
  store i32 5000, i32* %46, align 8
  store i8* %47, i8** %49, align 8
  %52 = tail call i32 @BZ2_bzCompress(%struct.bz_stream* %50, i32 0)
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %57, label %54

; <label>:54:                                     ; preds = %51
  br i1 %5, label %56, label %55

; <label>:55:                                     ; preds = %54
  store i32 %52, i32* %0, align 4
  br label %56

; <label>:56:                                     ; preds = %55, %54
  store i32 %52, i32* %10, align 8
  br label %80

; <label>:57:                                     ; preds = %51
  %58 = load i32, i32* %46, align 8
  %59 = icmp ult i32 %58, 5000
  br i1 %59, label %60, label %74

; <label>:60:                                     ; preds = %57
  %61 = sub i32 5000, %58
  %62 = sext i32 %61 to i64
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8
  %64 = tail call i64 @fwrite(i8* nonnull %47, i64 1, i64 %62, %struct._IO_FILE* %63)
  %65 = trunc i64 %64 to i32
  %66 = icmp eq i32 %61, %65
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %60
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8
  %69 = tail call i32 @ferror(%struct._IO_FILE* %68) #11
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %74, label %71

; <label>:71:                                     ; preds = %67, %60
  br i1 %5, label %73, label %72

; <label>:72:                                     ; preds = %71
  store i32 -6, i32* %0, align 4
  br label %73

; <label>:73:                                     ; preds = %72, %71
  store i32 -6, i32* %10, align 8
  br label %80

; <label>:74:                                     ; preds = %67, %57
  %75 = load i32, i32* %42, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %51

; <label>:77:                                     ; preds = %74
  br i1 %5, label %79, label %78

; <label>:78:                                     ; preds = %77
  store i32 0, i32* %0, align 4
  br label %79

; <label>:79:                                     ; preds = %78, %77
  store i32 0, i32* %10, align 8
  br label %80

; <label>:80:                                     ; preds = %79, %73, %56, %39, %34, %26, %17, %15
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @BZ2_bzWriteClose(i32*, i8*, i32, i32*, i32*) local_unnamed_addr #4 {
  tail call void @BZ2_bzWriteClose64(i32* %0, i8* %1, i32 %2, i32* %3, i32* null, i32* %4, i32* null)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @BZ2_bzWriteClose64(i32*, i8*, i32, i32*, i32*, i32*, i32*) local_unnamed_addr #4 {
  %8 = icmp eq i8* %1, null
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %7
  %10 = icmp eq i32* %0, null
  br i1 %10, label %125, label %11

; <label>:11:                                     ; preds = %9
  store i32 0, i32* %0, align 4
  br label %125

; <label>:12:                                     ; preds = %7
  %13 = getelementptr inbounds i8, i8* %1, i64 5012
  %14 = load i8, i8* %13, align 4
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %12
  %17 = icmp eq i32* %0, null
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %16
  store i32 -1, i32* %0, align 4
  br label %19

; <label>:19:                                     ; preds = %18, %16
  %20 = getelementptr inbounds i8, i8* %1, i64 5096
  %21 = bitcast i8* %20 to i32*
  store i32 -1, i32* %21, align 8
  br label %125

; <label>:22:                                     ; preds = %12
  %23 = bitcast i8* %1 to %struct._IO_FILE**
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %25 = tail call i32 @ferror(%struct._IO_FILE* %24) #11
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %33, label %27

; <label>:27:                                     ; preds = %22
  %28 = icmp eq i32* %0, null
  br i1 %28, label %30, label %29

; <label>:29:                                     ; preds = %27
  store i32 -6, i32* %0, align 4
  br label %30

; <label>:30:                                     ; preds = %29, %27
  %31 = getelementptr inbounds i8, i8* %1, i64 5096
  %32 = bitcast i8* %31 to i32*
  store i32 -6, i32* %32, align 8
  br label %125

; <label>:33:                                     ; preds = %22
  %34 = icmp eq i32* %3, null
  br i1 %34, label %36, label %35

; <label>:35:                                     ; preds = %33
  store i32 0, i32* %3, align 4
  br label %36

; <label>:36:                                     ; preds = %33, %35
  %37 = icmp eq i32* %4, null
  br i1 %37, label %39, label %38

; <label>:38:                                     ; preds = %36
  store i32 0, i32* %4, align 4
  br label %39

; <label>:39:                                     ; preds = %36, %38
  %40 = icmp eq i32* %5, null
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %39
  store i32 0, i32* %5, align 4
  br label %42

; <label>:42:                                     ; preds = %39, %41
  %43 = icmp eq i32* %6, null
  br i1 %43, label %45, label %44

; <label>:44:                                     ; preds = %42
  store i32 0, i32* %6, align 4
  br label %45

; <label>:45:                                     ; preds = %42, %44
  %cond = icmp eq i32 %2, 0
  br i1 %cond, label %46, label %96

; <label>:46:                                     ; preds = %45
  %47 = getelementptr inbounds i8, i8* %1, i64 5096
  %48 = bitcast i8* %47 to i32*
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %46
  %51 = getelementptr inbounds i8, i8* %1, i64 5048
  %52 = bitcast i8* %51 to i32*
  %53 = getelementptr inbounds i8, i8* %1, i64 8
  %54 = getelementptr inbounds i8, i8* %1, i64 5040
  %55 = bitcast i8* %54 to i8**
  %56 = getelementptr inbounds i8, i8* %1, i64 5016
  %57 = bitcast i8* %56 to %struct.bz_stream*
  br label %58

; <label>:58:                                     ; preds = %.preheader, %82
  store i32 5000, i32* %52, align 8
  store i8* %53, i8** %55, align 8
  %59 = tail call i32 @BZ2_bzCompress(%struct.bz_stream* %57, i32 2)
  %.off = add i32 %59, -3
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %64, label %60

; <label>:60:                                     ; preds = %58
  %61 = icmp eq i32* %0, null
  br i1 %61, label %63, label %62

; <label>:62:                                     ; preds = %60
  store i32 %59, i32* %0, align 4
  br label %63

; <label>:63:                                     ; preds = %62, %60
  store i32 %59, i32* %48, align 8
  br label %125

; <label>:64:                                     ; preds = %58
  %65 = load i32, i32* %52, align 8
  %66 = icmp ult i32 %65, 5000
  br i1 %66, label %67, label %82

; <label>:67:                                     ; preds = %64
  %68 = sub i32 5000, %65
  %69 = sext i32 %68 to i64
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %71 = tail call i64 @fwrite(i8* nonnull %53, i64 1, i64 %69, %struct._IO_FILE* %70)
  %72 = trunc i64 %71 to i32
  %73 = icmp eq i32 %68, %72
  br i1 %73, label %74, label %78

; <label>:74:                                     ; preds = %67
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %76 = tail call i32 @ferror(%struct._IO_FILE* %75) #11
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %82, label %78

; <label>:78:                                     ; preds = %74, %67
  %79 = icmp eq i32* %0, null
  br i1 %79, label %81, label %80

; <label>:80:                                     ; preds = %78
  store i32 -6, i32* %0, align 4
  br label %81

; <label>:81:                                     ; preds = %80, %78
  store i32 -6, i32* %48, align 8
  br label %125

; <label>:82:                                     ; preds = %74, %64
  %83 = icmp eq i32 %59, 4
  br i1 %83, label %.loopexit.loopexit, label %58

.loopexit.loopexit:                               ; preds = %82
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %46
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %85 = tail call i32 @ferror(%struct._IO_FILE* %84) #11
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %96

; <label>:87:                                     ; preds = %.loopexit
  %88 = tail call i32 @fflush(%struct._IO_FILE* %84)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %90 = tail call i32 @ferror(%struct._IO_FILE* %89) #11
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %96, label %92

; <label>:92:                                     ; preds = %87
  %93 = icmp eq i32* %0, null
  br i1 %93, label %95, label %94

; <label>:94:                                     ; preds = %92
  store i32 -6, i32* %0, align 4
  br label %95

; <label>:95:                                     ; preds = %94, %92
  store i32 -6, i32* %48, align 8
  br label %125

; <label>:96:                                     ; preds = %45, %87, %.loopexit
  br i1 %34, label %101, label %97

; <label>:97:                                     ; preds = %96
  %98 = getelementptr inbounds i8, i8* %1, i64 5028
  %99 = bitcast i8* %98 to i32*
  %100 = load i32, i32* %99, align 4
  store i32 %100, i32* %3, align 4
  br label %101

; <label>:101:                                    ; preds = %96, %97
  br i1 %37, label %106, label %102

; <label>:102:                                    ; preds = %101
  %103 = getelementptr inbounds i8, i8* %1, i64 5032
  %104 = bitcast i8* %103 to i32*
  %105 = load i32, i32* %104, align 8
  store i32 %105, i32* %4, align 4
  br label %106

; <label>:106:                                    ; preds = %101, %102
  br i1 %40, label %111, label %107

; <label>:107:                                    ; preds = %106
  %108 = getelementptr inbounds i8, i8* %1, i64 5052
  %109 = bitcast i8* %108 to i32*
  %110 = load i32, i32* %109, align 4
  store i32 %110, i32* %5, align 4
  br label %111

; <label>:111:                                    ; preds = %106, %107
  br i1 %43, label %116, label %112

; <label>:112:                                    ; preds = %111
  %113 = getelementptr inbounds i8, i8* %1, i64 5056
  %114 = bitcast i8* %113 to i32*
  %115 = load i32, i32* %114, align 8
  store i32 %115, i32* %6, align 4
  br label %116

; <label>:116:                                    ; preds = %111, %112
  %117 = icmp eq i32* %0, null
  br i1 %117, label %119, label %118

; <label>:118:                                    ; preds = %116
  store i32 0, i32* %0, align 4
  br label %119

; <label>:119:                                    ; preds = %116, %118
  %120 = getelementptr inbounds i8, i8* %1, i64 5096
  %121 = bitcast i8* %120 to i32*
  store i32 0, i32* %121, align 8
  %122 = getelementptr inbounds i8, i8* %1, i64 5016
  %123 = bitcast i8* %122 to %struct.bz_stream*
  %124 = tail call i32 @BZ2_bzCompressEnd(%struct.bz_stream* %123)
  tail call void @free(i8* %1) #11
  br label %125

; <label>:125:                                    ; preds = %11, %9, %95, %81, %63, %30, %19, %119
  ret void
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i8* @BZ2_bzReadOpen(i32*, %struct._IO_FILE*, i32, i32, i8* readonly, i32) local_unnamed_addr #4 {
  %7 = icmp eq i32* %0, null
  br i1 %7, label %9, label %8

; <label>:8:                                      ; preds = %6
  store i32 0, i32* %0, align 4
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %notlhs = icmp eq %struct._IO_FILE* %1, null
  %notrhs = icmp ugt i32 %3, 1
  %or.cond5.not = or i1 %notrhs, %notlhs
  %10 = icmp ugt i32 %2, 4
  %or.cond = or i1 %10, %or.cond5.not
  br i1 %or.cond, label %17, label %11

; <label>:11:                                     ; preds = %9
  %12 = icmp ne i8* %4, null
  %13 = icmp eq i32 %5, 0
  %or.cond3 = or i1 %12, %13
  br i1 %or.cond3, label %14, label %17

; <label>:14:                                     ; preds = %11
  %15 = icmp ne i8* %4, null
  %16 = icmp ugt i32 %5, 5000
  %or.cond6 = and i1 %15, %16
  br i1 %or.cond6, label %17, label %19

; <label>:17:                                     ; preds = %14, %9, %11
  br i1 %7, label %65, label %18

; <label>:18:                                     ; preds = %17
  store i32 -2, i32* %0, align 4
  br label %65

; <label>:19:                                     ; preds = %14
  %20 = tail call i32 @ferror(%struct._IO_FILE* nonnull %1) #11
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %19
  br i1 %7, label %65, label %23

; <label>:23:                                     ; preds = %22
  store i32 -6, i32* %0, align 4
  br label %65

; <label>:24:                                     ; preds = %19
  %25 = tail call noalias i8* @malloc(i64 5104) #11
  %26 = icmp eq i8* %25, null
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %24
  br i1 %7, label %65, label %28

; <label>:28:                                     ; preds = %27
  store i32 -3, i32* %0, align 4
  br label %65

; <label>:29:                                     ; preds = %24
  br i1 %7, label %31, label %30

; <label>:30:                                     ; preds = %29
  store i32 0, i32* %0, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %30
  %32 = getelementptr inbounds i8, i8* %25, i64 5096
  %33 = bitcast i8* %32 to i32*
  store i32 0, i32* %33, align 8
  %34 = getelementptr inbounds i8, i8* %25, i64 5100
  store i8 0, i8* %34, align 4
  %35 = bitcast i8* %25 to %struct._IO_FILE**
  store %struct._IO_FILE* %1, %struct._IO_FILE** %35, align 8
  %36 = getelementptr inbounds i8, i8* %25, i64 5008
  %37 = bitcast i8* %36 to i32*
  store i32 0, i32* %37, align 8
  %38 = getelementptr inbounds i8, i8* %25, i64 5012
  store i8 0, i8* %38, align 4
  %39 = getelementptr inbounds i8, i8* %25, i64 5072
  %40 = icmp sgt i32 %5, 0
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 24, i32 8, i1 false)
  br i1 %40, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %31
  %41 = getelementptr inbounds i8, i8* %25, i64 8
  br label %42

; <label>:42:                                     ; preds = %.lr.ph, %42
  %.018 = phi i32 [ %5, %.lr.ph ], [ %50, %42 ]
  %.027 = phi i8* [ %4, %.lr.ph ], [ %49, %42 ]
  %43 = load i8, i8* %.027, align 1
  %44 = load i32, i32* %37, align 8
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %41, i64 %45
  store i8 %43, i8* %46, align 1
  %47 = load i32, i32* %37, align 8
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %37, align 8
  %49 = getelementptr inbounds i8, i8* %.027, i64 1
  %50 = add nsw i32 %.018, -1
  %51 = icmp sgt i32 %.018, 1
  br i1 %51, label %42, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %42
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %31
  %52 = getelementptr inbounds i8, i8* %25, i64 5016
  %53 = bitcast i8* %52 to %struct.bz_stream*
  %54 = tail call i32 @BZ2_bzDecompressInit(%struct.bz_stream* %53, i32 %2, i32 %3)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %59, label %56

; <label>:56:                                     ; preds = %._crit_edge
  br i1 %7, label %58, label %57

; <label>:57:                                     ; preds = %56
  store i32 %54, i32* %0, align 4
  br label %58

; <label>:58:                                     ; preds = %56, %57
  tail call void @free(i8* nonnull %25) #11
  br label %65

; <label>:59:                                     ; preds = %._crit_edge
  %60 = load i32, i32* %37, align 8
  %61 = getelementptr inbounds i8, i8* %25, i64 5024
  %62 = bitcast i8* %61 to i32*
  store i32 %60, i32* %62, align 8
  %63 = getelementptr inbounds i8, i8* %25, i64 8
  %64 = bitcast i8* %52 to i8**
  store i8* %63, i8** %64, align 8
  store i8 1, i8* %34, align 4
  br label %65

; <label>:65:                                     ; preds = %28, %27, %22, %23, %17, %18, %59, %58
  %.0 = phi i8* [ null, %58 ], [ %25, %59 ], [ null, %18 ], [ null, %17 ], [ null, %23 ], [ null, %22 ], [ null, %27 ], [ null, %28 ]
  ret i8* %.0
}

; Function Attrs: noinline nounwind uwtable
define void @BZ2_bzReadClose(i32*, i8*) local_unnamed_addr #4 {
  %3 = icmp eq i32* %0, null
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %2
  store i32 0, i32* %0, align 4
  br label %5

; <label>:5:                                      ; preds = %2, %4
  %cond = icmp eq i8* %1, null
  br i1 %cond, label %12, label %6

; <label>:6:                                      ; preds = %5
  %7 = getelementptr inbounds i8, i8* %1, i64 5096
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8, align 8
  %9 = getelementptr inbounds i8, i8* %1, i64 5012
  %10 = load i8, i8* %9, align 4
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %17, label %14

; <label>:12:                                     ; preds = %5
  br i1 %3, label %26, label %13

; <label>:13:                                     ; preds = %12
  store i32 0, i32* %0, align 4
  br label %26

; <label>:14:                                     ; preds = %6
  br i1 %3, label %16, label %15

; <label>:15:                                     ; preds = %14
  store i32 -1, i32* %0, align 4
  br label %16

; <label>:16:                                     ; preds = %15, %14
  store i32 -1, i32* %8, align 8
  br label %26

; <label>:17:                                     ; preds = %6
  %18 = getelementptr inbounds i8, i8* %1, i64 5100
  %19 = load i8, i8* %18, align 4
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %25, label %21

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds i8, i8* %1, i64 5016
  %23 = bitcast i8* %22 to %struct.bz_stream*
  %24 = tail call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* %23)
  br label %25

; <label>:25:                                     ; preds = %17, %21
  tail call void @free(i8* nonnull %1) #11
  br label %26

; <label>:26:                                     ; preds = %13, %12, %16, %25
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzRead(i32*, i8*, i8*, i32) local_unnamed_addr #4 {
  %5 = icmp eq i32* %0, null
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %4
  store i32 0, i32* %0, align 4
  br label %7

; <label>:7:                                      ; preds = %4, %6
  %cond = icmp eq i8* %1, null
  br i1 %cond, label %13, label %8

; <label>:8:                                      ; preds = %7
  %9 = getelementptr inbounds i8, i8* %1, i64 5096
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10, align 8
  %11 = icmp eq i8* %2, null
  %12 = icmp slt i32 %3, 0
  %or.cond1 = or i1 %11, %12
  br i1 %or.cond1, label %13, label %20

; <label>:13:                                     ; preds = %7, %8
  br i1 %5, label %15, label %14

; <label>:14:                                     ; preds = %13
  store i32 -2, i32* %0, align 4
  br label %15

; <label>:15:                                     ; preds = %13, %14
  %16 = icmp eq i8* %1, null
  br i1 %16, label %98, label %17

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds i8, i8* %1, i64 5096
  %19 = bitcast i8* %18 to i32*
  store i32 -2, i32* %19, align 8
  br label %98

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds i8, i8* %1, i64 5012
  %22 = load i8, i8* %21, align 4
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %27, label %24

; <label>:24:                                     ; preds = %20
  br i1 %5, label %26, label %25

; <label>:25:                                     ; preds = %24
  store i32 -1, i32* %0, align 4
  br label %26

; <label>:26:                                     ; preds = %25, %24
  store i32 -1, i32* %10, align 8
  br label %98

; <label>:27:                                     ; preds = %20
  %28 = icmp eq i32 %3, 0
  br i1 %28, label %29, label %32

; <label>:29:                                     ; preds = %27
  br i1 %5, label %31, label %30

; <label>:30:                                     ; preds = %29
  store i32 0, i32* %0, align 4
  br label %31

; <label>:31:                                     ; preds = %30, %29
  store i32 0, i32* %10, align 8
  br label %98

; <label>:32:                                     ; preds = %27
  %33 = getelementptr inbounds i8, i8* %1, i64 5048
  %34 = bitcast i8* %33 to i32*
  store i32 %3, i32* %34, align 8
  %35 = getelementptr inbounds i8, i8* %1, i64 5040
  %36 = bitcast i8* %35 to i8**
  store i8* %2, i8** %36, align 8
  %37 = bitcast i8* %1 to %struct._IO_FILE**
  %38 = getelementptr inbounds i8, i8* %1, i64 5024
  %39 = bitcast i8* %38 to i32*
  %40 = getelementptr inbounds i8, i8* %1, i64 8
  %41 = getelementptr inbounds i8, i8* %1, i64 5008
  %42 = bitcast i8* %41 to i32*
  %43 = getelementptr inbounds i8, i8* %1, i64 5016
  %44 = bitcast i8* %43 to i8**
  %45 = getelementptr inbounds i8, i8* %1, i64 5016
  %46 = bitcast i8* %45 to %struct.bz_stream*
  br label %47

; <label>:47:                                     ; preds = %94, %32
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8
  %49 = tail call i32 @ferror(%struct._IO_FILE* %48) #11
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %47
  br i1 %5, label %53, label %52

; <label>:52:                                     ; preds = %51
  store i32 -6, i32* %0, align 4
  br label %53

; <label>:53:                                     ; preds = %52, %51
  store i32 -6, i32* %10, align 8
  br label %98

; <label>:54:                                     ; preds = %47
  %55 = load i32, i32* %39, align 8
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %71

; <label>:57:                                     ; preds = %54
  %58 = tail call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %48)
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %60, label %71

; <label>:60:                                     ; preds = %57
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8
  %62 = tail call i64 @fread(i8* nonnull %40, i64 1, i64 5000, %struct._IO_FILE* %61)
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8
  %64 = tail call i32 @ferror(%struct._IO_FILE* %63) #11
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %69, label %66

; <label>:66:                                     ; preds = %60
  br i1 %5, label %68, label %67

; <label>:67:                                     ; preds = %66
  store i32 -6, i32* %0, align 4
  br label %68

; <label>:68:                                     ; preds = %67, %66
  store i32 -6, i32* %10, align 8
  br label %98

; <label>:69:                                     ; preds = %60
  %70 = trunc i64 %62 to i32
  store i32 %70, i32* %42, align 8
  store i32 %70, i32* %39, align 8
  store i8* %40, i8** %44, align 8
  br label %71

; <label>:71:                                     ; preds = %57, %69, %54
  %72 = tail call i32 @BZ2_bzDecompress(%struct.bz_stream* nonnull %46)
  switch i32 %72, label %73 [
    i32 0, label %76
    i32 4, label %89
  ]

; <label>:73:                                     ; preds = %71
  br i1 %5, label %75, label %74

; <label>:74:                                     ; preds = %73
  store i32 %72, i32* %0, align 4
  br label %75

; <label>:75:                                     ; preds = %74, %73
  store i32 %72, i32* %10, align 8
  br label %98

; <label>:76:                                     ; preds = %71
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8
  %78 = tail call fastcc zeroext i8 @myfeof(%struct._IO_FILE* %77)
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %94, label %80

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %39, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %94

; <label>:83:                                     ; preds = %80
  %84 = load i32, i32* %34, align 8
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %.thread, label %86

; <label>:86:                                     ; preds = %83
  br i1 %5, label %88, label %87

; <label>:87:                                     ; preds = %86
  store i32 -7, i32* %0, align 4
  br label %88

; <label>:88:                                     ; preds = %87, %86
  store i32 -7, i32* %10, align 8
  br label %98

; <label>:89:                                     ; preds = %71
  br i1 %5, label %91, label %90

; <label>:90:                                     ; preds = %89
  store i32 4, i32* %0, align 4
  br label %91

; <label>:91:                                     ; preds = %89, %90
  store i32 4, i32* %10, align 8
  %92 = load i32, i32* %34, align 8
  %93 = sub i32 %3, %92
  br label %98

; <label>:94:                                     ; preds = %80, %76
  %.pr = load i32, i32* %34, align 8
  %95 = icmp eq i32 %.pr, 0
  br i1 %95, label %.thread.loopexit, label %47

.thread.loopexit:                                 ; preds = %94
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %83
  br i1 %5, label %97, label %96

; <label>:96:                                     ; preds = %.thread
  store i32 0, i32* %0, align 4
  br label %97

; <label>:97:                                     ; preds = %96, %.thread
  store i32 0, i32* %10, align 8
  br label %98

; <label>:98:                                     ; preds = %97, %88, %75, %68, %53, %31, %26, %17, %15, %91
  %.0 = phi i32 [ %93, %91 ], [ 0, %15 ], [ 0, %17 ], [ 0, %26 ], [ 0, %31 ], [ 0, %53 ], [ 0, %68 ], [ 0, %75 ], [ 0, %88 ], [ %3, %97 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc zeroext i8 @myfeof(%struct._IO_FILE* nocapture) unnamed_addr #4 {
  %2 = tail call i32 @fgetc(%struct._IO_FILE* %0)
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %6, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 @ungetc(i32 %2, %struct._IO_FILE* %0)
  br label %6

; <label>:6:                                      ; preds = %1, %4
  %.0 = phi i8 [ 0, %4 ], [ 1, %1 ]
  ret i8 %.0
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @BZ2_bzReadGetUnused(i32*, i8*, i8**, i32*) local_unnamed_addr #5 {
  %5 = icmp eq i8* %1, null
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %4
  %7 = icmp eq i32* %0, null
  br i1 %7, label %35, label %8

; <label>:8:                                      ; preds = %6
  store i32 -2, i32* %0, align 4
  br label %35

; <label>:9:                                      ; preds = %4
  %10 = getelementptr inbounds i8, i8* %1, i64 5096
  %11 = bitcast i8* %10 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %9
  %15 = icmp eq i32* %0, null
  br i1 %15, label %17, label %16

; <label>:16:                                     ; preds = %14
  store i32 -1, i32* %0, align 4
  br label %17

; <label>:17:                                     ; preds = %16, %14
  store i32 -1, i32* %11, align 8
  br label %35

; <label>:18:                                     ; preds = %9
  %19 = icmp eq i8** %2, null
  %20 = icmp eq i32* %3, null
  %or.cond = or i1 %19, %20
  %21 = icmp eq i32* %0, null
  br i1 %or.cond, label %22, label %25

; <label>:22:                                     ; preds = %18
  br i1 %21, label %24, label %23

; <label>:23:                                     ; preds = %22
  store i32 -2, i32* %0, align 4
  br label %24

; <label>:24:                                     ; preds = %23, %22
  store i32 -2, i32* %11, align 8
  br label %35

; <label>:25:                                     ; preds = %18
  br i1 %21, label %27, label %26

; <label>:26:                                     ; preds = %25
  store i32 0, i32* %0, align 4
  br label %27

; <label>:27:                                     ; preds = %25, %26
  store i32 0, i32* %11, align 8
  %28 = getelementptr inbounds i8, i8* %1, i64 5024
  %29 = bitcast i8* %28 to i32*
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %3, align 4
  %31 = getelementptr inbounds i8, i8* %1, i64 5016
  %32 = bitcast i8* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = bitcast i8** %2 to i64*
  store i64 %33, i64* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %8, %6, %24, %17, %27
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzBuffToBuffCompress(i8*, i32*, i8*, i32, i32, i32, i32) local_unnamed_addr #4 {
  %8 = alloca %struct.bz_stream, align 8
  %9 = icmp eq i8* %0, null
  %10 = icmp eq i32* %1, null
  %or.cond = or i1 %9, %10
  %11 = icmp eq i8* %2, null
  %or.cond2 = or i1 %or.cond, %11
  %.off = add i32 %4, -1
  %12 = icmp ugt i32 %.off, 8
  %13 = or i1 %or.cond2, %12
  %14 = icmp ugt i32 %5, 4
  %15 = or i1 %14, %13
  %16 = icmp ugt i32 %6, 250
  %17 = or i1 %16, %15
  br i1 %17, label %40, label %18

; <label>:18:                                     ; preds = %7
  %19 = icmp eq i32 %6, 0
  %. = select i1 %19, i32 30, i32 %6
  %20 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %8, i64 0, i32 9
  %21 = bitcast i8* (i8*, i32, i32)** %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 24, i32 8, i1 false)
  %22 = call i32 @BZ2_bzCompressInit(%struct.bz_stream* nonnull %8, i32 %4, i32 %5, i32 %.)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %40

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %8, i64 0, i32 0
  store i8* %2, i8** %25, align 8
  %26 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %8, i64 0, i32 4
  store i8* %0, i8** %26, align 8
  %27 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %8, i64 0, i32 1
  store i32 %3, i32* %27, align 8
  %28 = load i32, i32* %1, align 4
  %29 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %8, i64 0, i32 5
  store i32 %28, i32* %29, align 8
  %30 = call i32 @BZ2_bzCompress(%struct.bz_stream* nonnull %8, i32 2)
  switch i32 %30, label %38 [
    i32 3, label %36
    i32 4, label %31
  ]

; <label>:31:                                     ; preds = %24
  %32 = load i32, i32* %29, align 8
  %33 = load i32, i32* %1, align 4
  %34 = sub i32 %33, %32
  store i32 %34, i32* %1, align 4
  %35 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* nonnull %8)
  br label %40

; <label>:36:                                     ; preds = %24
  %37 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* nonnull %8)
  br label %40

; <label>:38:                                     ; preds = %24
  %39 = call i32 @BZ2_bzCompressEnd(%struct.bz_stream* nonnull %8)
  br label %40

; <label>:40:                                     ; preds = %18, %7, %38, %36, %31
  %.0 = phi i32 [ -8, %36 ], [ %30, %38 ], [ 0, %31 ], [ -2, %7 ], [ %22, %18 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzBuffToBuffDecompress(i8*, i32*, i8*, i32, i32, i32) local_unnamed_addr #4 {
  %7 = alloca %struct.bz_stream, align 8
  %8 = icmp eq i8* %0, null
  %9 = icmp eq i32* %1, null
  %or.cond = or i1 %8, %9
  %10 = icmp eq i8* %2, null
  %or.cond1 = or i1 %or.cond, %10
  %switch.not = icmp ugt i32 %4, 1
  %or.cond3.not = or i1 %or.cond1, %switch.not
  %11 = icmp ugt i32 %5, 4
  %or.cond4 = or i1 %or.cond3.not, %11
  br i1 %or.cond4, label %35, label %12

; <label>:12:                                     ; preds = %6
  %13 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i64 0, i32 9
  %14 = bitcast i8* (i8*, i32, i32)** %13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 24, i32 8, i1 false)
  %15 = call i32 @BZ2_bzDecompressInit(%struct.bz_stream* nonnull %7, i32 %5, i32 %4)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %35

; <label>:17:                                     ; preds = %12
  %18 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i64 0, i32 0
  store i8* %2, i8** %18, align 8
  %19 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i64 0, i32 4
  store i8* %0, i8** %19, align 8
  %20 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i64 0, i32 1
  store i32 %3, i32* %20, align 8
  %21 = load i32, i32* %1, align 4
  %22 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %7, i64 0, i32 5
  store i32 %21, i32* %22, align 8
  %23 = call i32 @BZ2_bzDecompress(%struct.bz_stream* nonnull %7)
  switch i32 %23, label %33 [
    i32 0, label %29
    i32 4, label %24
  ]

; <label>:24:                                     ; preds = %17
  %25 = load i32, i32* %22, align 8
  %26 = load i32, i32* %1, align 4
  %27 = sub i32 %26, %25
  store i32 %27, i32* %1, align 4
  %28 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* nonnull %7)
  br label %35

; <label>:29:                                     ; preds = %17
  %30 = load i32, i32* %22, align 8
  %31 = icmp eq i32 %30, 0
  %32 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* nonnull %7)
  %. = select i1 %31, i32 -8, i32 -7
  br label %35

; <label>:33:                                     ; preds = %17
  %34 = call i32 @BZ2_bzDecompressEnd(%struct.bz_stream* nonnull %7)
  br label %35

; <label>:35:                                     ; preds = %6, %29, %12, %33, %24
  %.0 = phi i32 [ %23, %33 ], [ 0, %24 ], [ -2, %6 ], [ %15, %12 ], [ %., %29 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i8* @BZ2_bzopen(i8* readonly, i8* readonly) local_unnamed_addr #4 {
  %3 = tail call fastcc i8* @bzopen_or_bzdopen(i8* %0, i32 -1, i8* %1, i32 0)
  ret i8* %3
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i8* @bzopen_or_bzdopen(i8* readonly, i32, i8* readonly, i32) unnamed_addr #4 {
  %5 = alloca i32, align 4
  %6 = alloca [5000 x i8], align 16
  %7 = alloca [10 x i8], align 1
  %8 = getelementptr inbounds [10 x i8], [10 x i8]* %7, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 10, i32 1, i1 false)
  %9 = icmp eq i8* %2, null
  br i1 %9, label %65, label %.preheader

.preheader:                                       ; preds = %4
  %10 = load i8, i8* %2, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %25
  %12 = phi i8 [ %27, %25 ], [ %10, %.lr.ph.preheader ]
  %.0117 = phi i32 [ %.1, %25 ], [ 0, %.lr.ph.preheader ]
  %.0316 = phi i8* [ %26, %25 ], [ %2, %.lr.ph.preheader ]
  %.0615 = phi i32 [ %.2, %25 ], [ 9, %.lr.ph.preheader ]
  %.0814 = phi i32 [ %.19, %25 ], [ 0, %.lr.ph.preheader ]
  %13 = sext i8 %12 to i32
  switch i32 %13, label %16 [
    i32 114, label %25
    i32 119, label %14
    i32 115, label %15
  ]

; <label>:14:                                     ; preds = %.lr.ph
  br label %25

; <label>:15:                                     ; preds = %.lr.ph
  br label %25

; <label>:16:                                     ; preds = %.lr.ph
  %17 = tail call i16** @__ctype_b_loc() #15
  %18 = load i16*, i16** %17, align 8
  %19 = sext i8 %12 to i64
  %20 = getelementptr inbounds i16, i16* %18, i64 %19
  %21 = load i16, i16* %20, align 2
  %22 = and i16 %21, 2048
  %23 = icmp eq i16 %22, 0
  %24 = add nsw i32 %13, -48
  %.06. = select i1 %23, i32 %.0615, i32 %24
  br label %25

; <label>:25:                                     ; preds = %16, %.lr.ph, %15, %14
  %.19 = phi i32 [ %.0814, %15 ], [ 1, %14 ], [ 0, %.lr.ph ], [ %.0814, %16 ]
  %.2 = phi i32 [ %.0615, %15 ], [ %.0615, %14 ], [ %.0615, %.lr.ph ], [ %.06., %16 ]
  %.1 = phi i32 [ 1, %15 ], [ %.0117, %14 ], [ %.0117, %.lr.ph ], [ %.0117, %16 ]
  %26 = getelementptr inbounds i8, i8* %.0316, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %25
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.08.lcssa = phi i32 [ 0, %.preheader ], [ %.19, %._crit_edge.loopexit ]
  %.06.lcssa = phi i32 [ 9, %.preheader ], [ %.2, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ 0, %.preheader ], [ %.1, %._crit_edge.loopexit ]
  %29 = icmp ne i32 %.08.lcssa, 0
  %strlen = call i64 @strlen(i8* nonnull %8)
  %endptr = getelementptr [10 x i8], [10 x i8]* %7, i64 0, i64 %strlen
  %30 = bitcast i8* %endptr to i16*
  %31 = select i1 %29, i16 119, i16 114
  store i16 %31, i16* %30, align 1
  %strlen10 = call i64 @strlen(i8* nonnull %8)
  %endptr11 = getelementptr [10 x i8], [10 x i8]* %7, i64 0, i64 %strlen10
  %32 = bitcast i8* %endptr11 to i16*
  store i16 98, i16* %32, align 1
  %33 = icmp eq i32 %3, 0
  br i1 %33, label %34, label %43

; <label>:34:                                     ; preds = %._crit_edge
  %35 = icmp eq i8* %0, null
  br i1 %35, label %38, label %36

; <label>:36:                                     ; preds = %34
  %strcmpload = load i8, i8* %0, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %41

; <label>:38:                                     ; preds = %36, %34
  %39 = icmp eq i32 %.08.lcssa, 0
  %stdin.val = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %stdout.val = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %40 = select i1 %39, %struct._IO_FILE* %stdin.val, %struct._IO_FILE* %stdout.val
  br label %45

; <label>:41:                                     ; preds = %36
  %42 = call %struct._IO_FILE* @fopen(i8* nonnull %0, i8* nonnull %8)
  br label %45

; <label>:43:                                     ; preds = %._crit_edge
  %44 = call %struct._IO_FILE* @fdopen(i32 %1, i8* nonnull %8) #11
  br label %45

; <label>:45:                                     ; preds = %38, %41, %43
  %.15 = phi %struct._IO_FILE* [ %44, %43 ], [ %40, %38 ], [ %42, %41 ]
  %46 = icmp eq %struct._IO_FILE* %.15, null
  br i1 %46, label %65, label %47

; <label>:47:                                     ; preds = %45
  %48 = icmp eq i32 %.08.lcssa, 0
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %47
  %50 = icmp sgt i32 %.06.lcssa, 1
  %..06 = select i1 %50, i32 %.06.lcssa, i32 1
  %51 = icmp slt i32 %..06, 9
  %.4 = select i1 %51, i32 %..06, i32 9
  %52 = call i8* @BZ2_bzWriteOpen(i32* nonnull %5, %struct._IO_FILE* nonnull %.15, i32 %.4, i32 0, i32 30)
  br label %56

; <label>:53:                                     ; preds = %47
  %54 = getelementptr inbounds [5000 x i8], [5000 x i8]* %6, i64 0, i64 0
  %55 = call i8* @BZ2_bzReadOpen(i32* nonnull %5, %struct._IO_FILE* nonnull %.15, i32 0, i32 %.01.lcssa, i8* nonnull %54, i32 0)
  br label %56

; <label>:56:                                     ; preds = %53, %49
  %.02 = phi i8* [ %52, %49 ], [ %55, %53 ]
  %57 = icmp eq i8* %.02, null
  br i1 %57, label %58, label %65

; <label>:58:                                     ; preds = %56
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %60 = icmp eq %struct._IO_FILE* %.15, %59
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %62 = icmp eq %struct._IO_FILE* %.15, %61
  %or.cond = or i1 %60, %62
  br i1 %or.cond, label %65, label %63

; <label>:63:                                     ; preds = %58
  %64 = call i32 @fclose(%struct._IO_FILE* nonnull %.15)
  br label %65

; <label>:65:                                     ; preds = %56, %63, %58, %45, %4
  %.0 = phi i8* [ null, %4 ], [ null, %45 ], [ null, %58 ], [ null, %63 ], [ %.02, %56 ]
  ret i8* %.0
}

; Function Attrs: noinline nounwind uwtable
define i8* @BZ2_bzdopen(i32, i8* readonly) local_unnamed_addr #4 {
  %3 = tail call fastcc i8* @bzopen_or_bzdopen(i8* null, i32 %0, i8* %1, i32 1)
  ret i8* %3
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzread(i8*, i8*, i32) local_unnamed_addr #4 {
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds i8, i8* %0, i64 5096
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 4
  br i1 %8, label %14, label %9

; <label>:9:                                      ; preds = %3
  %10 = call i32 @BZ2_bzRead(i32* nonnull %4, i8* nonnull %0, i8* %1, i32 %2)
  %11 = load i32, i32* %4, align 4
  %12 = or i32 %11, 4
  %13 = icmp eq i32 %12, 4
  %. = select i1 %13, i32 %10, i32 -1
  ret i32 %.

; <label>:14:                                     ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_bzwrite(i8*, i8*, i32) local_unnamed_addr #4 {
  %4 = alloca i32, align 4
  call void @BZ2_bzWrite(i32* nonnull %4, i8* %0, i8* %1, i32 %2)
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 0
  %. = select i1 %6, i32 %2, i32 -1
  ret i32 %.
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @BZ2_bzflush(i8* nocapture readnone) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define void @BZ2_bzclose(i8*) local_unnamed_addr #4 {
  %2 = alloca i32, align 4
  %3 = icmp eq i8* %0, null
  br i1 %3, label %22, label %4

; <label>:4:                                      ; preds = %1
  %5 = bitcast i8* %0 to %struct._IO_FILE**
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %7 = getelementptr inbounds i8, i8* %0, i64 5012
  %8 = load i8, i8* %7, align 4
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %14, label %10

; <label>:10:                                     ; preds = %4
  call void @BZ2_bzWriteClose(i32* nonnull %2, i8* nonnull %0, i32 0, i32* null, i32* null)
  %11 = load i32, i32* %2, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %10
  call void @BZ2_bzWriteClose(i32* null, i8* nonnull %0, i32 1, i32* null, i32* null)
  br label %15

; <label>:14:                                     ; preds = %4
  call void @BZ2_bzReadClose(i32* nonnull %2, i8* nonnull %0)
  br label %15

; <label>:15:                                     ; preds = %13, %10, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %17 = icmp eq %struct._IO_FILE* %6, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %19 = icmp eq %struct._IO_FILE* %6, %18
  %or.cond = or i1 %17, %19
  br i1 %or.cond, label %22, label %20

; <label>:20:                                     ; preds = %15
  %21 = call i32 @fclose(%struct._IO_FILE* %6)
  br label %22

; <label>:22:                                     ; preds = %1, %15, %20
  ret void
}

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define i8* @BZ2_bzerror(i8* nocapture readonly, i32* nocapture) local_unnamed_addr #5 {
  %3 = getelementptr inbounds i8, i8* %0, i64 5096
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 8
  %6 = icmp slt i32 %5, 0
  %. = select i1 %6, i32 %5, i32 0
  store i32 %., i32* %1, align 4
  %7 = sub nsw i32 0, %.
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [16 x i8*], [16 x i8*]* @bzerrorstrings, i64 0, i64 %8
  %10 = load i8*, i8** %9, align 8
  ret i8* %10
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc zeroext i8 @copy_output_until_stop(%struct.EState* nocapture) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 20
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 0
  %4 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %5 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4, i64 0, i32 5
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %1
  %8 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 11
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %.backedge
  %11 = phi %struct.bz_stream* [ %4, %.lr.ph ], [ %44, %.backedge ]
  %.01 = phi i8 [ 0, %.lr.ph ], [ 1, %.backedge ]
  %12 = load i32, i32* %2, align 8
  %13 = load i32, i32* %8, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %._crit_edge.loopexit

; <label>:15:                                     ; preds = %10
  %16 = load i8*, i8** %9, align 8
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds i8, i8* %16, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %11, i64 0, i32 4
  %21 = load i8*, i8** %20, align 8
  store i8 %19, i8* %21, align 1
  %22 = load i32, i32* %2, align 8
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %2, align 8
  %24 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %25 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %24, i64 0, i32 5
  %26 = load i32, i32* %25, align 8
  %27 = add i32 %26, -1
  store i32 %27, i32* %25, align 8
  %28 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %29 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %28, i64 0, i32 4
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  store i8* %31, i8** %29, align 8
  %32 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %33 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %32, i64 0, i32 6
  %34 = load i32, i32* %33, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* %33, align 4
  %36 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %37 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %36, i64 0, i32 6
  %38 = load i32, i32* %37, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %.backedge

; <label>:40:                                     ; preds = %15
  %41 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %36, i64 0, i32 7
  %42 = load i32, i32* %41, align 8
  %43 = add i32 %42, 1
  store i32 %43, i32* %41, align 8
  br label %.backedge

.backedge:                                        ; preds = %40, %15
  %44 = load %struct.bz_stream*, %struct.bz_stream** %3, align 8
  %45 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %44, i64 0, i32 5
  %46 = load i32, i32* %45, align 8
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %._crit_edge.loopexit, label %10

._crit_edge.loopexit:                             ; preds = %10, %.backedge
  %.0.lcssa.ph = phi i8 [ %.01, %10 ], [ 1, %.backedge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %.0.lcssa = phi i8 [ 0, %1 ], [ %.0.lcssa.ph, %._crit_edge.loopexit ]
  ret i8 %.0.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc zeroext i8 @copy_input_until_stop(%struct.EState*) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 1
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 2
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 0
  br i1 %4, label %.preheader, label %.preheader3

.preheader3:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 3
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 18
  %10 = load i32, i32* %9, align 8
  %11 = icmp slt i32 %8, %10
  br i1 %11, label %.lr.ph9, label %.loopexit

.lr.ph9:                                          ; preds = %.preheader3
  %12 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  %13 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %14 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %16 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  %17 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  br label %101

.preheader:                                       ; preds = %1
  %18 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 18
  %21 = load i32, i32* %20, align 8
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %23 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  %24 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %25 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %26 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %27 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  br label %29

; <label>:29:                                     ; preds = %.lr.ph, %.backedge
  %.05 = phi i8 [ 0, %.lr.ph ], [ 1, %.backedge ]
  %30 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %31 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %30, i64 0, i32 1
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.loopexit.loopexit, label %34

; <label>:34:                                     ; preds = %29
  %35 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %30, i64 0, i32 0
  %36 = load i8*, i8** %35, align 8
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = load i32, i32* %23, align 4
  %40 = icmp eq i32 %38, %39
  br i1 %40, label %64, label %41

; <label>:41:                                     ; preds = %34
  %42 = load i32, i32* %26, align 8
  %43 = icmp eq i32 %42, 1
  br i1 %43, label %44, label %64

; <label>:44:                                     ; preds = %41
  %45 = trunc i32 %39 to i8
  %46 = load i32, i32* %27, align 8
  %47 = shl i32 %46, 8
  %48 = lshr i32 %46, 24
  %49 = and i32 %39, 255
  %50 = xor i32 %48, %49
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = xor i32 %47, %53
  store i32 %54, i32* %27, align 8
  %55 = load i32, i32* %23, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %56
  store i8 1, i8* %57, align 1
  %58 = load i8*, i8** %28, align 8
  %59 = load i32, i32* %18, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  store i8 %45, i8* %61, align 1
  %62 = load i32, i32* %18, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %18, align 4
  store i32 %38, i32* %23, align 4
  br label %77

; <label>:64:                                     ; preds = %34, %41
  %65 = load i32, i32* %23, align 4
  %66 = icmp eq i32 %38, %65
  br i1 %66, label %67, label %70

; <label>:67:                                     ; preds = %64
  %68 = load i32, i32* %24, align 8
  %69 = icmp eq i32 %68, 255
  br i1 %69, label %thread-pre-split, label %75

thread-pre-split:                                 ; preds = %67
  %.pr = load i32, i32* %23, align 4
  br label %70

; <label>:70:                                     ; preds = %thread-pre-split, %64
  %71 = phi i32 [ %.pr, %thread-pre-split ], [ %65, %64 ]
  %72 = icmp ult i32 %71, 256
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %70
  tail call fastcc void @add_pair_to_block(%struct.EState* nonnull %0)
  br label %74

; <label>:74:                                     ; preds = %73, %70
  store i32 %38, i32* %23, align 4
  store i32 1, i32* %25, align 8
  br label %77

; <label>:75:                                     ; preds = %67
  %76 = add nsw i32 %68, 1
  store i32 %76, i32* %24, align 8
  br label %77

; <label>:77:                                     ; preds = %74, %75, %44
  %78 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %79 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %78, i64 0, i32 0
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  store i8* %81, i8** %79, align 8
  %82 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %83 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %82, i64 0, i32 1
  %84 = load i32, i32* %83, align 8
  %85 = add i32 %84, -1
  store i32 %85, i32* %83, align 8
  %86 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %87 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %86, i64 0, i32 2
  %88 = load i32, i32* %87, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %87, align 4
  %90 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %91 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %90, i64 0, i32 2
  %92 = load i32, i32* %91, align 4
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %.backedge

; <label>:94:                                     ; preds = %77
  %95 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %90, i64 0, i32 3
  %96 = load i32, i32* %95, align 8
  %97 = add i32 %96, 1
  store i32 %97, i32* %95, align 8
  br label %.backedge

.backedge:                                        ; preds = %94, %77
  %98 = load i32, i32* %18, align 4
  %99 = load i32, i32* %20, align 8
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %29, label %.loopexit.loopexit

; <label>:101:                                    ; preds = %.lr.ph9, %173
  %.18 = phi i8 [ 0, %.lr.ph9 ], [ 1, %173 ]
  %102 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %103 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %102, i64 0, i32 1
  %104 = load i32, i32* %103, align 8
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.loopexit.loopexit21, label %106

; <label>:106:                                    ; preds = %101
  %107 = load i32, i32* %6, align 8
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %.loopexit.loopexit21, label %109

; <label>:109:                                    ; preds = %106
  %110 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %102, i64 0, i32 0
  %111 = load i8*, i8** %110, align 8
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = load i32, i32* %12, align 4
  %115 = icmp eq i32 %113, %114
  br i1 %115, label %139, label %116

; <label>:116:                                    ; preds = %109
  %117 = load i32, i32* %15, align 8
  %118 = icmp eq i32 %117, 1
  br i1 %118, label %119, label %139

; <label>:119:                                    ; preds = %116
  %120 = trunc i32 %114 to i8
  %121 = load i32, i32* %16, align 8
  %122 = shl i32 %121, 8
  %123 = lshr i32 %121, 24
  %124 = and i32 %114, 255
  %125 = xor i32 %123, %124
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %126
  %128 = load i32, i32* %127, align 4
  %129 = xor i32 %122, %128
  store i32 %129, i32* %16, align 8
  %130 = load i32, i32* %12, align 4
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %131
  store i8 1, i8* %132, align 1
  %133 = load i8*, i8** %17, align 8
  %134 = load i32, i32* %7, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8* %133, i64 %135
  store i8 %120, i8* %136, align 1
  %137 = load i32, i32* %7, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %7, align 4
  store i32 %113, i32* %12, align 4
  br label %152

; <label>:139:                                    ; preds = %109, %116
  %140 = load i32, i32* %12, align 4
  %141 = icmp eq i32 %113, %140
  br i1 %141, label %142, label %145

; <label>:142:                                    ; preds = %139
  %143 = load i32, i32* %13, align 8
  %144 = icmp eq i32 %143, 255
  br i1 %144, label %thread-pre-split1, label %150

thread-pre-split1:                                ; preds = %142
  %.pr2 = load i32, i32* %12, align 4
  br label %145

; <label>:145:                                    ; preds = %thread-pre-split1, %139
  %146 = phi i32 [ %.pr2, %thread-pre-split1 ], [ %140, %139 ]
  %147 = icmp ult i32 %146, 256
  br i1 %147, label %148, label %149

; <label>:148:                                    ; preds = %145
  tail call fastcc void @add_pair_to_block(%struct.EState* nonnull %0)
  br label %149

; <label>:149:                                    ; preds = %148, %145
  store i32 %113, i32* %12, align 4
  store i32 1, i32* %14, align 8
  br label %152

; <label>:150:                                    ; preds = %142
  %151 = add nsw i32 %143, 1
  store i32 %151, i32* %13, align 8
  br label %152

; <label>:152:                                    ; preds = %149, %150, %119
  %153 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %154 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %153, i64 0, i32 0
  %155 = load i8*, i8** %154, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 1
  store i8* %156, i8** %154, align 8
  %157 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %158 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %157, i64 0, i32 1
  %159 = load i32, i32* %158, align 8
  %160 = add i32 %159, -1
  store i32 %160, i32* %158, align 8
  %161 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %162 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %161, i64 0, i32 2
  %163 = load i32, i32* %162, align 4
  %164 = add i32 %163, 1
  store i32 %164, i32* %162, align 4
  %165 = load %struct.bz_stream*, %struct.bz_stream** %5, align 8
  %166 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %165, i64 0, i32 2
  %167 = load i32, i32* %166, align 4
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %173

; <label>:169:                                    ; preds = %152
  %170 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %165, i64 0, i32 3
  %171 = load i32, i32* %170, align 8
  %172 = add i32 %171, 1
  store i32 %172, i32* %170, align 8
  br label %173

; <label>:173:                                    ; preds = %169, %152
  %174 = load i32, i32* %6, align 8
  %175 = add i32 %174, -1
  store i32 %175, i32* %6, align 8
  %176 = load i32, i32* %7, align 4
  %177 = load i32, i32* %9, align 8
  %178 = icmp slt i32 %176, %177
  br i1 %178, label %101, label %.loopexit.loopexit21

.loopexit.loopexit:                               ; preds = %.backedge, %29
  %.2.ph = phi i8 [ %.05, %29 ], [ 1, %.backedge ]
  br label %.loopexit

.loopexit.loopexit21:                             ; preds = %173, %101, %106
  %.2.ph22 = phi i8 [ %.18, %106 ], [ %.18, %101 ], [ 1, %173 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit21, %.loopexit.loopexit, %.preheader3, %.preheader
  %.2 = phi i8 [ 0, %.preheader ], [ 0, %.preheader3 ], [ %.2.ph, %.loopexit.loopexit ], [ %.2.ph22, %.loopexit.loopexit21 ]
  ret i8 %.2
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @flush_RL(%struct.EState*) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 4
  %4 = icmp ult i32 %3, 256
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %1
  tail call fastcc void @add_pair_to_block(%struct.EState* nonnull %0)
  br label %6

; <label>:6:                                      ; preds = %5, %1
  tail call fastcc void @init_RL(%struct.EState* nonnull %0)
  ret void
}

declare void @BZ2_compressBlock(%struct.EState*, i8 zeroext) local_unnamed_addr #7

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @add_pair_to_block(%struct.EState*) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 4
  %4 = trunc i32 %3 to i8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %8 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  %9 = and i32 %3, 255
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %.07 = phi i32 [ 0, %.lr.ph ], [ %19, %10 ]
  %11 = load i32, i32* %8, align 8
  %12 = shl i32 %11, 8
  %13 = lshr i32 %11, 24
  %14 = xor i32 %13, %9
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* @BZ2_crc32Table, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = xor i32 %12, %17
  store i32 %18, i32* %8, align 8
  %19 = add nuw nsw i32 %.07, 1
  %20 = load i32, i32* %5, align 8
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %22 = load i32, i32* %2, align 4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %23
  store i8 1, i8* %24, align 1
  %25 = load i32, i32* %5, align 8
  switch i32 %25, label %53 [
    i32 1, label %26
    i32 2, label %30
    i32 3, label %39
  ]

; <label>:26:                                     ; preds = %._crit_edge
  %27 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %29 = load i32, i32* %28, align 4
  br label %83

; <label>:30:                                     ; preds = %._crit_edge
  %31 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %34 = load i32, i32* %33, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %32, i64 %35
  store i8 %4, i8* %36, align 1
  %37 = load i32, i32* %33, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %33, align 4
  br label %83

; <label>:39:                                     ; preds = %._crit_edge
  %40 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %41 = load i8*, i8** %40, align 8
  %42 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %41, i64 %44
  store i8 %4, i8* %45, align 1
  %46 = load i32, i32* %42, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %42, align 4
  %48 = load i8*, i8** %40, align 8
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds i8, i8* %48, i64 %49
  store i8 %4, i8* %50, align 1
  %51 = load i32, i32* %42, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %42, align 4
  br label %83

; <label>:53:                                     ; preds = %._crit_edge
  %54 = add nsw i32 %25, -4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %55
  store i8 1, i8* %56, align 1
  %57 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %58 = load i8*, i8** %57, align 8
  %59 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %60 = load i32, i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %58, i64 %61
  store i8 %4, i8* %62, align 1
  %63 = load i32, i32* %59, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %59, align 4
  %65 = load i8*, i8** %57, align 8
  %66 = sext i32 %64 to i64
  %67 = getelementptr inbounds i8, i8* %65, i64 %66
  store i8 %4, i8* %67, align 1
  %68 = load i32, i32* %59, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %59, align 4
  %70 = load i8*, i8** %57, align 8
  %71 = sext i32 %69 to i64
  %72 = getelementptr inbounds i8, i8* %70, i64 %71
  store i8 %4, i8* %72, align 1
  %73 = load i32, i32* %59, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %59, align 4
  %75 = load i8*, i8** %57, align 8
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds i8, i8* %75, i64 %76
  store i8 %4, i8* %77, align 1
  %78 = load i32, i32* %59, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %59, align 4
  %80 = load i32, i32* %5, align 8
  %81 = add i32 %80, 252
  %82 = trunc i32 %81 to i8
  br label %83

; <label>:83:                                     ; preds = %53, %39, %30, %26
  %.sink6 = phi i32 [ %79, %53 ], [ %52, %39 ], [ %38, %30 ], [ %29, %26 ]
  %.sink4.in = phi i8** [ %57, %53 ], [ %40, %39 ], [ %31, %30 ], [ %27, %26 ]
  %.sink = phi i8 [ %82, %53 ], [ %4, %39 ], [ %4, %30 ], [ %4, %26 ]
  %.sink4 = load i8*, i8** %.sink4.in, align 8
  %84 = sext i32 %.sink6 to i64
  %85 = getelementptr inbounds i8, i8* %.sink4, i64 %84
  store i8 %.sink, i8* %85, align 1
  %86 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %86, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #9

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #10

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fdopen(i32, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #11

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #12

attributes #0 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind }
attributes #10 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind }
attributes #12 = { nounwind readonly }
attributes #13 = { cold }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
