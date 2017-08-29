; ModuleID = 'blocksort.ll'
source_filename = "blocksort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [38 x i8] c"      %d work, %d block, ratio %5.2f\0A\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"    too repetitive; using fallback sorting algorithm\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"        bucket sorting ...\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"        depth %6d has \00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"%6d unresolved strings\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"        reconstructing block ...\0A\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"        main sort initialise ...\0A\00", align 1
@.str.7 = private unnamed_addr constant [48 x i8] c"        qsort [0x%x, 0x%x]   done %d   this %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [44 x i8] c"        %d pointers, %d sorted, %d scanned\0A\00", align 1
@incs = internal unnamed_addr constant [14 x i32] [i32 1, i32 4, i32 13, i32 40, i32 121, i32 364, i32 1093, i32 3280, i32 9841, i32 29524, i32 88573, i32 265720, i32 797161, i32 2391484], align 16

; Function Attrs: noinline nounwind uwtable
define void @BZ2_blockSort(%struct.EState* nocapture) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 8
  %4 = load i32*, i32** %3, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 6
  %8 = load i32*, i32** %7, align 8
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 28
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 12
  %14 = load i32, i32* %13, align 8
  %15 = icmp slt i32 %10, 10000
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %1
  %17 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 4
  %18 = load i32*, i32** %17, align 8
  %19 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 5
  %20 = load i32*, i32** %19, align 8
  tail call fastcc void @fallbackSort(i32* %18, i32* %20, i32* %8, i32 %10, i32 %12)
  br label %56

; <label>:21:                                     ; preds = %1
  %22 = add nsw i32 %10, 34
  %23 = and i32 %22, 1
  %24 = icmp eq i32 %23, 0
  %25 = add nsw i32 %10, 35
  %. = select i1 %24, i32 %22, i32 %25
  %26 = sext i32 %. to i64
  %27 = getelementptr inbounds i8, i8* %6, i64 %26
  %28 = bitcast i8* %27 to i16*
  %29 = icmp sgt i32 %14, 1
  %.01 = select i1 %29, i32 %14, i32 1
  %30 = icmp slt i32 %.01, 100
  %..01 = select i1 %30, i32 %.01, i32 100
  %31 = add nsw i32 %..01, -1
  %32 = sdiv i32 %31, 3
  %33 = mul nsw i32 %32, %10
  store i32 %33, i32* %2, align 4
  call fastcc void @mainSort(i32* %4, i8* %6, i16* %28, i32* %8, i32 %10, i32 %12, i32* nonnull %2)
  %34 = icmp sgt i32 %12, 2
  br i1 %34, label %35, label %43

; <label>:35:                                     ; preds = %21
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = load i32, i32* %2, align 4
  %38 = sub nsw i32 %33, %37
  %39 = sitofp i32 %38 to float
  %phitmp = sitofp i32 %10 to float
  %40 = fdiv float %39, %phitmp
  %41 = fpext float %40 to double
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i32 %38, i32 %10, double %41) #7
  br label %43

; <label>:43:                                     ; preds = %35, %21
  %44 = load i32, i32* %2, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %56

; <label>:46:                                     ; preds = %43
  %47 = icmp sgt i32 %12, 1
  br i1 %47, label %48, label %51

; <label>:48:                                     ; preds = %46
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %49) #7
  br label %51

; <label>:51:                                     ; preds = %48, %46
  %52 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 4
  %53 = load i32*, i32** %52, align 8
  %54 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 5
  %55 = load i32*, i32** %54, align 8
  tail call fastcc void @fallbackSort(i32* %53, i32* %55, i32* %8, i32 %10, i32 %12)
  br label %56

; <label>:56:                                     ; preds = %43, %51, %16
  %57 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 7
  store i32 -1, i32* %57, align 8
  %58 = load i32, i32* %9, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %.lr.ph.preheader, label %thread-pre-split

.lr.ph.preheader:                                 ; preds = %56
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %65
  %indvars.iv = phi i64 [ %indvars.iv.next, %65 ], [ 0, %.lr.ph.preheader ]
  %60 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv
  %61 = load i32, i32* %60, align 4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %.lr.ph
  %64 = trunc i64 %indvars.iv to i32
  store i32 %64, i32* %57, align 8
  br label %69

; <label>:65:                                     ; preds = %.lr.ph
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %66 = load i32, i32* %9, align 4
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %indvars.iv.next, %67
  br i1 %68, label %.lr.ph, label %thread-pre-split.loopexit

thread-pre-split.loopexit:                        ; preds = %65
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %thread-pre-split.loopexit, %56
  %.pr = load i32, i32* %57, align 8
  br label %69

; <label>:69:                                     ; preds = %thread-pre-split, %63
  %70 = phi i32 [ %.pr, %thread-pre-split ], [ %64, %63 ]
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %69
  tail call void @BZ2_bz__AssertH__fail(i32 1003) #5
  br label %73

; <label>:73:                                     ; preds = %69, %72
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @fallbackSort(i32*, i32* nocapture, i32* nocapture, i32, i32) unnamed_addr #0 {
  %6 = bitcast i32* %2 to i8*
  %7 = alloca [257 x i32], align 16
  %8 = bitcast [257 x i32]* %7 to i8*
  %9 = alloca [256 x i32], align 16
  %10 = bitcast [256 x i32]* %9 to i8*
  %11 = bitcast i32* %1 to i8*
  %12 = icmp sgt i32 %4, 3
  br i1 %12, label %13, label %.preheader36

; <label>:13:                                     ; preds = %5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %14) #7
  br label %.preheader36

.preheader36:                                     ; preds = %5, %13
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 1028, i32 16, i1 false)
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %.lr.ph63.preheader, label %.preheader34.preheader

.lr.ph63.preheader:                               ; preds = %.preheader36
  %17 = add i32 %3, -1
  %xtraiter100 = and i32 %3, 3
  %lcmp.mod101 = icmp eq i32 %xtraiter100, 0
  br i1 %lcmp.mod101, label %.lr.ph63.prol.loopexit, label %.lr.ph63.prol.preheader

.lr.ph63.prol.preheader:                          ; preds = %.lr.ph63.preheader
  br label %.lr.ph63.prol

.lr.ph63.prol:                                    ; preds = %.lr.ph63.prol.preheader, %.lr.ph63.prol
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %.lr.ph63.prol ], [ 0, %.lr.ph63.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph63.prol ], [ %xtraiter100, %.lr.ph63.prol.preheader ]
  %18 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv96.prol
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %21, align 4
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph63.prol.loopexit.loopexit, label %.lr.ph63.prol, !llvm.loop !1

.lr.ph63.prol.loopexit.loopexit:                  ; preds = %.lr.ph63.prol
  br label %.lr.ph63.prol.loopexit

.lr.ph63.prol.loopexit:                           ; preds = %.lr.ph63.prol.loopexit.loopexit, %.lr.ph63.preheader
  %indvars.iv96.unr = phi i64 [ 0, %.lr.ph63.preheader ], [ %indvars.iv.next97.prol, %.lr.ph63.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %17, 3
  br i1 %24, label %.preheader34.preheader, label %.lr.ph63.preheader108

.lr.ph63.preheader108:                            ; preds = %.lr.ph63.prol.loopexit
  %wide.trip.count98.3 = zext i32 %3 to i64
  br label %.lr.ph63

.lr.ph63:                                         ; preds = %.lr.ph63.preheader108, %.lr.ph63
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.3, %.lr.ph63 ], [ %indvars.iv96.unr, %.lr.ph63.preheader108 ]
  %25 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv96
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %31 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv.next97
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %34, align 4
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %37 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv.next97.1
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %40, align 4
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %43 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv.next97.2
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %46, align 4
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %exitcond99.3 = icmp eq i64 %indvars.iv.next97.3, %wide.trip.count98.3
  br i1 %exitcond99.3, label %.preheader34.preheader.loopexit, label %.lr.ph63

.preheader34.preheader.loopexit:                  ; preds = %.lr.ph63
  br label %.preheader34.preheader

.preheader34.preheader:                           ; preds = %.preheader34.preheader.loopexit, %.preheader36, %.lr.ph63.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %10, i8* nonnull %8, i64 1024, i32 16, i1 false)
  br label %.preheader34

.preheader33:                                     ; preds = %.preheader34
  %49 = icmp sgt i32 %3, 0
  br i1 %49, label %.lr.ph58.preheader, label %._crit_edge59

.lr.ph58.preheader:                               ; preds = %.preheader33
  %xtraiter88 = and i32 %3, 1
  %lcmp.mod89 = icmp eq i32 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph58.prol.loopexit, label %.lr.ph58.prol

.lr.ph58.prol:                                    ; preds = %.lr.ph58.preheader
  %50 = load i8, i8* %11, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, i32* %52, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %0, i64 %55
  store i32 0, i32* %56, align 4
  br label %.lr.ph58.prol.loopexit

.lr.ph58.prol.loopexit:                           ; preds = %.lr.ph58.preheader, %.lr.ph58.prol
  %indvars.iv84.unr = phi i64 [ 0, %.lr.ph58.preheader ], [ 1, %.lr.ph58.prol ]
  %57 = icmp eq i32 %3, 1
  br i1 %57, label %.preheader32.preheader.loopexit, label %.lr.ph58.preheader107

.lr.ph58.preheader107:                            ; preds = %.lr.ph58.prol.loopexit
  %wide.trip.count86.1 = zext i32 %3 to i64
  br label %.lr.ph58

.preheader34:                                     ; preds = %.preheader34, %.preheader34.preheader
  %indvars.iv90 = phi i64 [ 1, %.preheader34.preheader ], [ %indvars.iv.next91.3, %.preheader34 ]
  %58 = add nsw i64 %indvars.iv90, -1
  %59 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %58
  %60 = load i32, i32* %59, align 4
  %61 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv90
  %62 = load i32, i32* %61, align 4
  %63 = add nsw i32 %62, %60
  store i32 %63, i32* %61, align 4
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %64 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv.next91
  %65 = load i32, i32* %64, align 4
  %66 = add nsw i32 %65, %63
  store i32 %66, i32* %64, align 4
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %67 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv.next91.1
  %68 = load i32, i32* %67, align 4
  %69 = add nsw i32 %68, %66
  store i32 %69, i32* %67, align 4
  %indvars.iv.next91.2 = add nsw i64 %indvars.iv90, 3
  %70 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv.next91.2
  %71 = load i32, i32* %70, align 4
  %72 = add nsw i32 %71, %69
  store i32 %72, i32* %70, align 4
  %indvars.iv.next91.3 = add nsw i64 %indvars.iv90, 4
  %exitcond92.3 = icmp eq i64 %indvars.iv.next91.3, 257
  br i1 %exitcond92.3, label %.preheader33, label %.preheader34

.lr.ph58:                                         ; preds = %.lr.ph58.preheader107, %.lr.ph58
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.1, %.lr.ph58 ], [ %indvars.iv84.unr, %.lr.ph58.preheader107 ]
  %73 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv84
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %75
  %77 = load i32, i32* %76, align 4
  %78 = add nsw i32 %77, -1
  store i32 %78, i32* %76, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32* %0, i64 %79
  %81 = trunc i64 %indvars.iv84 to i32
  store i32 %81, i32* %80, align 4
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %82 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv.next85
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i64
  %85 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = add nsw i32 %86, -1
  store i32 %87, i32* %85, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %0, i64 %88
  %90 = trunc i64 %indvars.iv.next85 to i32
  store i32 %90, i32* %89, align 4
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next85.1, %wide.trip.count86.1
  br i1 %exitcond87.1, label %._crit_edge59.loopexit, label %.lr.ph58

._crit_edge59.loopexit:                           ; preds = %.lr.ph58
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %.preheader33
  %91 = icmp sgt i32 %3, -64
  br i1 %91, label %.preheader32.preheader.loopexit, label %.preheader32.preheader

.preheader32.preheader.loopexit:                  ; preds = %.lr.ph58.prol.loopexit, %._crit_edge59
  %92 = sdiv i32 %3, 32
  %93 = add nsw i32 %92, 1
  %94 = icmp sgt i32 %93, 0
  %smax = select i1 %94, i32 %93, i32 0
  %95 = zext i32 %smax to i64
  %96 = shl nuw nsw i64 %95, 2
  %97 = add nuw nsw i64 %96, 4
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %97, i32 4, i1 false)
  br label %.preheader32.preheader

.preheader32.preheader:                           ; preds = %.preheader32.preheader.loopexit, %._crit_edge59
  br label %.preheader32

.preheader32:                                     ; preds = %.preheader32.preheader, %.preheader32
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %.preheader32 ], [ 0, %.preheader32.preheader ]
  %98 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv79
  %99 = load i32, i32* %98, align 8
  %100 = and i32 %99, 31
  %101 = shl i32 1, %100
  %102 = ashr i32 %99, 5
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %2, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = or i32 %101, %105
  store i32 %106, i32* %104, align 4
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %107 = getelementptr inbounds [257 x i32], [257 x i32]* %7, i64 0, i64 %indvars.iv.next80
  %108 = load i32, i32* %107, align 4
  %109 = and i32 %108, 31
  %110 = shl i32 1, %109
  %111 = ashr i32 %108, 5
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32* %2, i64 %112
  %114 = load i32, i32* %113, align 4
  %115 = or i32 %110, %114
  store i32 %115, i32* %113, align 4
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80.1, 256
  br i1 %exitcond81.1, label %.preheader31.preheader, label %.preheader32

.preheader31.preheader:                           ; preds = %.preheader32
  br label %.preheader31

.preheader30:                                     ; preds = %.preheader31
  %116 = icmp sgt i32 %3, 0
  %wide.trip.count75 = zext i32 %3 to i64
  br label %136

.preheader31:                                     ; preds = %.preheader31.preheader, %.preheader31
  %.71852 = phi i32 [ %135, %.preheader31 ], [ 0, %.preheader31.preheader ]
  %117 = shl nsw i32 %.71852, 1
  %118 = add nsw i32 %117, %3
  %119 = and i32 %118, 31
  %120 = shl i32 1, %119
  %121 = ashr i32 %118, 5
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32* %2, i64 %122
  %124 = load i32, i32* %123, align 4
  %125 = or i32 %124, %120
  store i32 %125, i32* %123, align 4
  %126 = add nsw i32 %118, 1
  %127 = and i32 %126, 31
  %128 = shl i32 1, %127
  %129 = xor i32 %128, -1
  %130 = ashr i32 %126, 5
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32* %2, i64 %131
  %133 = load i32, i32* %132, align 4
  %134 = and i32 %133, %129
  store i32 %134, i32* %132, align 4
  %135 = add nuw nsw i32 %.71852, 1
  %exitcond78 = icmp eq i32 %135, 32
  br i1 %exitcond78, label %.preheader30, label %.preheader31

; <label>:136:                                    ; preds = %.preheader30, %246
  %.010 = phi i32 [ %247, %246 ], [ 1, %.preheader30 ]
  br i1 %12, label %137, label %.preheader29

; <label>:137:                                    ; preds = %136
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %139 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %138, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i32 %.010) #7
  br label %.preheader29

.preheader29:                                     ; preds = %137, %136
  br i1 %116, label %.lr.ph.preheader, label %.outer.preheader

.lr.ph.preheader:                                 ; preds = %.preheader29
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.0647 = phi i32 [ %.06..819, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %140 = trunc i64 %indvars.iv73 to i32
  %141 = ashr i32 %140, 5
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32* %2, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = trunc i64 %indvars.iv73 to i32
  %146 = and i32 %145, 31
  %147 = shl i32 1, %146
  %148 = and i32 %144, %147
  %149 = icmp eq i32 %148, 0
  %150 = trunc i64 %indvars.iv73 to i32
  %.06..819 = select i1 %149, i32 %.0647, i32 %150
  %151 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv73
  %152 = load i32, i32* %151, align 4
  %153 = sub i32 %152, %.010
  %154 = icmp slt i32 %153, 0
  %155 = select i1 %154, i32 %3, i32 0
  %.04 = add nsw i32 %155, %153
  %156 = sext i32 %.04 to i64
  %157 = getelementptr inbounds i32, i32* %1, i64 %156
  store i32 %.06..819, i32* %157, align 4
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond, label %.outer.preheader.loopexit, label %.lr.ph

.outer.preheader.loopexit:                        ; preds = %.lr.ph
  br label %.outer.preheader

.outer.preheader:                                 ; preds = %.outer.preheader.loopexit, %.preheader29
  br label %.outer

.outer.loopexit:                                  ; preds = %240
  br label %.outer

.outer:                                           ; preds = %.outer.preheader, %.outer.loopexit
  %.03.ph = phi i32 [ %214, %.outer.loopexit ], [ -1, %.outer.preheader ]
  %.0.ph = phi i32 [ %221, %.outer.loopexit ], [ 0, %.outer.preheader ]
  br label %158

; <label>:158:                                    ; preds = %.outer, %216
  %.03 = phi i32 [ %214, %216 ], [ %.03.ph, %.outer ]
  br label %159

; <label>:159:                                    ; preds = %159, %158
  %.15.in = phi i32 [ %.03, %158 ], [ %.15, %159 ]
  %.15 = add nsw i32 %.15.in, 1
  %160 = ashr i32 %.15, 5
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32* %2, i64 %161
  %163 = load i32, i32* %162, align 4
  %164 = and i32 %.15, 31
  %165 = shl i32 1, %164
  %166 = and i32 %165, %163
  %167 = icmp eq i32 %166, 0
  %168 = icmp ne i32 %164, 0
  %not. = xor i1 %167, true
  %169 = and i1 %168, %not.
  br i1 %169, label %159, label %170

; <label>:170:                                    ; preds = %159
  br i1 %167, label %.loopexit26, label %.preheader27.preheader

.preheader27.preheader:                           ; preds = %170
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.preheader, %.preheader27
  %.2 = phi i32 [ %176, %.preheader27 ], [ %.15, %.preheader27.preheader ]
  %171 = ashr i32 %.2, 5
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i32, i32* %2, i64 %172
  %174 = load i32, i32* %173, align 4
  %175 = icmp eq i32 %174, -1
  %176 = add nsw i32 %.2, 32
  br i1 %175, label %.preheader27, label %.preheader25.preheader

.preheader25.preheader:                           ; preds = %.preheader27
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.preheader, %.preheader25
  %.3 = phi i32 [ %185, %.preheader25 ], [ %.2, %.preheader25.preheader ]
  %177 = ashr i32 %.3, 5
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32* %2, i64 %178
  %180 = load i32, i32* %179, align 4
  %181 = and i32 %.3, 31
  %182 = shl i32 1, %181
  %183 = and i32 %182, %180
  %184 = icmp eq i32 %183, 0
  %185 = add nsw i32 %.3, 1
  br i1 %184, label %.loopexit26.loopexit, label %.preheader25

.loopexit26.loopexit:                             ; preds = %.preheader25
  br label %.loopexit26

.loopexit26:                                      ; preds = %.loopexit26.loopexit, %170
  %.4 = phi i32 [ %.15, %170 ], [ %.3, %.loopexit26.loopexit ]
  %186 = icmp sgt i32 %.4, %3
  br i1 %186, label %242, label %.preheader24.preheader

.preheader24.preheader:                           ; preds = %.loopexit26
  br label %.preheader24

.preheader24:                                     ; preds = %.preheader24.preheader, %.preheader24
  %.5 = phi i32 [ %197, %.preheader24 ], [ %.4, %.preheader24.preheader ]
  %187 = ashr i32 %.5, 5
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i32, i32* %2, i64 %188
  %190 = load i32, i32* %189, align 4
  %191 = and i32 %.5, 31
  %192 = shl i32 1, %191
  %193 = and i32 %192, %190
  %194 = icmp eq i32 %193, 0
  %195 = icmp ne i32 %191, 0
  %196 = and i1 %195, %194
  %197 = add nsw i32 %.5, 1
  br i1 %196, label %.preheader24, label %198

; <label>:198:                                    ; preds = %.preheader24
  br i1 %194, label %.preheader23.preheader, label %.loopexit22

.preheader23.preheader:                           ; preds = %198
  br label %.preheader23

.preheader23:                                     ; preds = %.preheader23.preheader, %.preheader23
  %.6 = phi i32 [ %204, %.preheader23 ], [ %.5, %.preheader23.preheader ]
  %199 = ashr i32 %.6, 5
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32* %2, i64 %200
  %202 = load i32, i32* %201, align 4
  %203 = icmp eq i32 %202, 0
  %204 = add nsw i32 %.6, 32
  br i1 %203, label %.preheader23, label %.preheader21.preheader

.preheader21.preheader:                           ; preds = %.preheader23
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.preheader, %.preheader21
  %.7 = phi i32 [ %213, %.preheader21 ], [ %.6, %.preheader21.preheader ]
  %205 = ashr i32 %.7, 5
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32* %2, i64 %206
  %208 = load i32, i32* %207, align 4
  %209 = and i32 %.7, 31
  %210 = shl i32 1, %209
  %211 = and i32 %210, %208
  %212 = icmp eq i32 %211, 0
  %213 = add nsw i32 %.7, 1
  br i1 %212, label %.preheader21, label %.loopexit22.loopexit

.loopexit22.loopexit:                             ; preds = %.preheader21
  br label %.loopexit22

.loopexit22:                                      ; preds = %.loopexit22.loopexit, %198
  %.8 = phi i32 [ %.5, %198 ], [ %.7, %.loopexit22.loopexit ]
  %214 = add nsw i32 %.8, -1
  %215 = icmp sgt i32 %.8, %3
  br i1 %215, label %242, label %216

; <label>:216:                                    ; preds = %.loopexit22
  %217 = icmp sgt i32 %.8, %.4
  br i1 %217, label %.lr.ph51.preheader, label %158

.lr.ph51.preheader:                               ; preds = %216
  %218 = add nsw i32 %.4, -1
  %.neg = sub i32 1, %.4
  %219 = add i32 %.0.ph, 1
  %220 = add i32 %219, %.neg
  %221 = add i32 %220, %214
  tail call fastcc void @fallbackQSort3(i32* %0, i32* %1, i32 %218, i32 %214)
  %222 = sext i32 %218 to i64
  %223 = sext i32 %.8 to i64
  br label %.lr.ph51

.lr.ph51:                                         ; preds = %.lr.ph51.preheader, %240
  %indvars.iv76 = phi i64 [ %222, %.lr.ph51.preheader ], [ %indvars.iv.next77, %240 ]
  %.0149 = phi i32 [ -1, %.lr.ph51.preheader ], [ %.12, %240 ]
  %224 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv76
  %225 = load i32, i32* %224, align 4
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds i32, i32* %1, i64 %226
  %228 = load i32, i32* %227, align 4
  %229 = icmp eq i32 %.0149, %228
  %230 = trunc i64 %indvars.iv76 to i32
  %231 = ashr i32 %230, 5
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, i32* %2, i64 %232
  br i1 %229, label %240, label %234

; <label>:234:                                    ; preds = %.lr.ph51
  %235 = trunc i64 %indvars.iv76 to i32
  %236 = and i32 %235, 31
  %237 = shl i32 1, %236
  %238 = load i32, i32* %233, align 4
  %239 = or i32 %238, %237
  store i32 %239, i32* %233, align 4
  br label %240

; <label>:240:                                    ; preds = %234, %.lr.ph51
  %.12 = phi i32 [ %228, %234 ], [ %.0149, %.lr.ph51 ]
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, 1
  %241 = icmp slt i64 %indvars.iv.next77, %223
  br i1 %241, label %.lr.ph51, label %.outer.loopexit

; <label>:242:                                    ; preds = %.loopexit22, %.loopexit26
  br i1 %12, label %243, label %246

; <label>:243:                                    ; preds = %242
  %244 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %245 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %244, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i64 0, i64 0), i32 %.0.ph) #7
  br label %246

; <label>:246:                                    ; preds = %243, %242
  %247 = shl nsw i32 %.010, 1
  %248 = icmp sgt i32 %247, %3
  %249 = icmp eq i32 %.0.ph, 0
  %or.cond = or i1 %248, %249
  br i1 %or.cond, label %250, label %136

; <label>:250:                                    ; preds = %246
  br i1 %12, label %251, label %.preheader20

; <label>:251:                                    ; preds = %250
  %252 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %253 = tail call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %252) #7
  br label %.preheader20

.preheader20:                                     ; preds = %251, %250
  %254 = icmp sgt i32 %3, 0
  br i1 %254, label %.preheader.preheader, label %._crit_edge.thread

.preheader.preheader:                             ; preds = %.preheader20
  %xtraiter = and i32 %3, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %255 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.prol
  %256 = load i32, i32* %255, align 4
  %257 = icmp eq i32 %256, 0
  %indvars.iv.next.prol = add i64 %indvars.iv.prol, 1
  br i1 %257, label %.preheader.prol, label %258

; <label>:258:                                    ; preds = %.preheader.prol
  %259 = trunc i64 %indvars.iv.prol to i32
  %260 = add nsw i32 %256, -1
  store i32 %260, i32* %255, align 4
  %261 = trunc i64 %indvars.iv.prol to i8
  %262 = load i32, i32* %0, align 4
  %263 = zext i32 %262 to i64
  %264 = getelementptr inbounds i8, i8* %11, i64 %263
  store i8 %261, i8* %264, align 1
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %258
  %indvars.iv70.unr = phi i64 [ 0, %.preheader.preheader ], [ 1, %258 ]
  %.2845.unr = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.prol, %258 ]
  %.39.lcssa.lcssa.unr = phi i32 [ undef, %.preheader.preheader ], [ %259, %258 ]
  %265 = icmp eq i32 %3, 1
  br i1 %265, label %._crit_edge, label %.preheader.preheader106

.preheader.preheader106:                          ; preds = %.preheader.prol.loopexit
  %wide.trip.count.1 = zext i32 %3 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader106, %285
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.1, %285 ], [ %indvars.iv70.unr, %.preheader.preheader106 ]
  %.2845 = phi i64 [ %indvars.iv.1, %285 ], [ %.2845.unr, %.preheader.preheader106 ]
  %sext = shl i64 %.2845, 32
  %266 = ashr exact i64 %sext, 32
  br label %267

; <label>:267:                                    ; preds = %267, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %267 ], [ %266, %.preheader ]
  %268 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv
  %269 = load i32, i32* %268, align 4
  %270 = icmp eq i32 %269, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %270, label %267, label %.preheader.172

.preheader.172:                                   ; preds = %267
  %271 = add nsw i32 %269, -1
  store i32 %271, i32* %268, align 4
  %272 = trunc i64 %indvars.iv to i8
  %273 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv70
  %274 = load i32, i32* %273, align 4
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds i8, i8* %11, i64 %275
  store i8 %272, i8* %276, align 1
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %sext105 = shl i64 %indvars.iv, 32
  %277 = ashr exact i64 %sext105, 32
  br label %281

._crit_edge.loopexit.unr-lcssa:                   ; preds = %285
  %278 = trunc i64 %indvars.iv.1 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.preheader.prol.loopexit
  %.28.lcssa = phi i32 [ %.39.lcssa.lcssa.unr, %.preheader.prol.loopexit ], [ %278, %._crit_edge.loopexit.unr-lcssa ]
  %279 = icmp slt i32 %.28.lcssa, 256
  br i1 %279, label %._crit_edge.thread, label %280

; <label>:280:                                    ; preds = %._crit_edge
  tail call void @BZ2_bz__AssertH__fail(i32 1005) #5
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader20, %280, %._crit_edge
  ret void

; <label>:281:                                    ; preds = %281, %.preheader.172
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %281 ], [ %277, %.preheader.172 ]
  %282 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.1
  %283 = load i32, i32* %282, align 4
  %284 = icmp eq i32 %283, 0
  %indvars.iv.next.1 = add i64 %indvars.iv.1, 1
  br i1 %284, label %281, label %285

; <label>:285:                                    ; preds = %281
  %286 = add nsw i32 %283, -1
  store i32 %286, i32* %282, align 4
  %287 = trunc i64 %indvars.iv.1 to i8
  %288 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next71
  %289 = load i32, i32* %288, align 4
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds i8, i8* %11, i64 %290
  store i8 %287, i8* %291, align 1
  %indvars.iv.next71.1 = add nsw i64 %indvars.iv70, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next71.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.preheader
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @mainSort(i32*, i8*, i16* nocapture, i32*, i32, i32, i32* nocapture) unnamed_addr #0 {
  %8 = bitcast i32* %3 to i8*
  %9 = alloca [256 x i32], align 16
  %10 = alloca [256 x i8], align 16
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 0
  %12 = alloca [256 x i32], align 16
  %13 = alloca [256 x i32], align 16
  %14 = icmp sgt i32 %5, 3
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %16) #7
  br label %18

; <label>:18:                                     ; preds = %7, %15
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 262148, i32 4, i1 false)
  %19 = load i8, i8* %1, align 1
  %20 = zext i8 %19 to i32
  %21 = shl nuw nsw i32 %20, 8
  %22 = add nsw i32 %4, -1
  %23 = icmp sgt i32 %22, 2
  br i1 %23, label %.lr.ph79.preheader, label %.preheader34

.lr.ph79.preheader:                               ; preds = %18
  %24 = sext i32 %22 to i64
  %25 = add i32 %4, -4
  %26 = and i32 %25, -4
  br label %.lr.ph79

.preheader34.loopexit:                            ; preds = %.lr.ph79
  %27 = add i32 %4, -5
  %28 = sub i32 %27, %26
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %18
  %.114.lcssa = phi i32 [ %22, %18 ], [ %28, %.preheader34.loopexit ]
  %.08.lcssa = phi i32 [ %21, %18 ], [ %73, %.preheader34.loopexit ]
  %29 = icmp sgt i32 %.114.lcssa, -1
  br i1 %29, label %.lr.ph75.preheader, label %.preheader33.preheader

.lr.ph75.preheader:                               ; preds = %.preheader34
  %30 = sext i32 %.114.lcssa to i64
  br label %.lr.ph75

.lr.ph79:                                         ; preds = %.lr.ph79.preheader, %.lr.ph79
  %indvars.iv124 = phi i64 [ %24, %.lr.ph79.preheader ], [ %indvars.iv.next125, %.lr.ph79 ]
  %.0877 = phi i32 [ %21, %.lr.ph79.preheader ], [ %73, %.lr.ph79 ]
  %31 = getelementptr inbounds i16, i16* %2, i64 %indvars.iv124
  store i16 0, i16* %31, align 2
  %32 = ashr i32 %.0877, 8
  %33 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv124
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = shl nuw nsw i32 %35, 8
  %37 = or i32 %36, %32
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %3, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* %39, align 4
  %42 = add nsw i64 %indvars.iv124, -1
  %43 = getelementptr inbounds i16, i16* %2, i64 %42
  store i16 0, i16* %43, align 2
  %44 = ashr i32 %37, 8
  %45 = getelementptr inbounds i8, i8* %1, i64 %42
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl nuw nsw i32 %47, 8
  %49 = or i32 %48, %44
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %3, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %51, align 4
  %54 = add nsw i64 %indvars.iv124, -2
  %55 = getelementptr inbounds i16, i16* %2, i64 %54
  store i16 0, i16* %55, align 2
  %56 = ashr i32 %49, 8
  %57 = getelementptr inbounds i8, i8* %1, i64 %54
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = shl nuw nsw i32 %59, 8
  %61 = or i32 %60, %56
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %3, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %63, align 4
  %66 = add nsw i64 %indvars.iv124, -3
  %67 = getelementptr inbounds i16, i16* %2, i64 %66
  store i16 0, i16* %67, align 2
  %68 = ashr i32 %61, 8
  %69 = getelementptr inbounds i8, i8* %1, i64 %66
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 8
  %73 = or i32 %72, %68
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %3, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = add i32 %76, 1
  store i32 %77, i32* %75, align 4
  %indvars.iv.next125 = add nsw i64 %indvars.iv124, -4
  %78 = icmp sgt i64 %indvars.iv.next125, 2
  br i1 %78, label %.lr.ph79, label %.preheader34.loopexit

.lr.ph75:                                         ; preds = %.lr.ph75.preheader, %.lr.ph75
  %indvars.iv121 = phi i64 [ %30, %.lr.ph75.preheader ], [ %indvars.iv.next122, %.lr.ph75 ]
  %.1974 = phi i32 [ %.08.lcssa, %.lr.ph75.preheader ], [ %85, %.lr.ph75 ]
  %79 = getelementptr inbounds i16, i16* %2, i64 %indvars.iv121
  store i16 0, i16* %79, align 2
  %80 = ashr i32 %.1974, 8
  %81 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv121
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = shl nuw nsw i32 %83, 8
  %85 = or i32 %84, %80
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32* %3, i64 %86
  %88 = load i32, i32* %87, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %87, align 4
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, -1
  %90 = icmp sgt i64 %indvars.iv121, 0
  br i1 %90, label %.lr.ph75, label %.preheader33.preheader.loopexit

.preheader33.preheader.loopexit:                  ; preds = %.lr.ph75
  br label %.preheader33.preheader

.preheader33.preheader:                           ; preds = %.preheader33.preheader.loopexit, %.preheader34
  %91 = sext i32 %4 to i64
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.1, %.preheader33.preheader
  %indvars.iv117 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next118.1.1, %.preheader33.1 ]
  %92 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv117
  %93 = load i8, i8* %92, align 1
  %94 = add nsw i64 %indvars.iv117, %91
  %95 = getelementptr inbounds i8, i8* %1, i64 %94
  store i8 %93, i8* %95, align 1
  %96 = getelementptr inbounds i16, i16* %2, i64 %94
  store i16 0, i16* %96, align 2
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %97 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv.next118
  %98 = load i8, i8* %97, align 1
  %99 = add nsw i64 %indvars.iv.next118, %91
  %100 = getelementptr inbounds i8, i8* %1, i64 %99
  store i8 %98, i8* %100, align 1
  %101 = getelementptr inbounds i16, i16* %2, i64 %99
  store i16 0, i16* %101, align 2
  %indvars.iv.next118.1 = or i64 %indvars.iv117, 2
  %exitcond.1120 = icmp eq i64 %indvars.iv.next118.1, 34
  br i1 %exitcond.1120, label %102, label %.preheader33.1

; <label>:102:                                    ; preds = %.preheader33
  br i1 %14, label %103, label %.preheader32.preheader

; <label>:103:                                    ; preds = %102
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %105 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %104) #7
  br label %.preheader32.preheader

.preheader32.preheader:                           ; preds = %103, %102
  br label %.preheader32

.preheader32:                                     ; preds = %.preheader32.preheader, %.preheader32
  %indvars.iv113 = phi i64 [ %indvars.iv.next114.3, %.preheader32 ], [ 1, %.preheader32.preheader ]
  %106 = add nsw i64 %indvars.iv113, -1
  %107 = getelementptr inbounds i32, i32* %3, i64 %106
  %108 = load i32, i32* %107, align 4
  %109 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv113
  %110 = load i32, i32* %109, align 4
  %111 = add i32 %110, %108
  store i32 %111, i32* %109, align 4
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %112 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next114
  %113 = load i32, i32* %112, align 4
  %114 = add i32 %113, %111
  store i32 %114, i32* %112, align 4
  %indvars.iv.next114.1 = add nsw i64 %indvars.iv113, 2
  %115 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next114.1
  %116 = load i32, i32* %115, align 4
  %117 = add i32 %116, %114
  store i32 %117, i32* %115, align 4
  %indvars.iv.next114.2 = add nsw i64 %indvars.iv113, 3
  %118 = getelementptr inbounds i32, i32* %3, i64 %indvars.iv.next114.2
  %119 = load i32, i32* %118, align 4
  %120 = add i32 %119, %117
  store i32 %120, i32* %118, align 4
  %indvars.iv.next114.3 = add nsw i64 %indvars.iv113, 4
  %exitcond.3116 = icmp eq i64 %indvars.iv.next114.3, 65537
  br i1 %exitcond.3116, label %121, label %.preheader32

; <label>:121:                                    ; preds = %.preheader32
  %122 = load i8, i8* %1, align 1
  %123 = zext i8 %122 to i16
  %124 = shl nuw i16 %123, 8
  %125 = icmp sgt i32 %22, 2
  br i1 %125, label %.lr.ph68.preheader, label %.preheader31

.lr.ph68.preheader:                               ; preds = %121
  %126 = sext i32 %22 to i64
  %127 = add i32 %4, -4
  %128 = and i32 %127, -4
  br label %.lr.ph68

.preheader31.loopexit:                            ; preds = %.lr.ph68
  %129 = add i32 %4, -5
  %130 = sub i32 %129, %128
  br label %.preheader31

.preheader31:                                     ; preds = %.preheader31.loopexit, %121
  %.518.lcssa = phi i32 [ %22, %121 ], [ %130, %.preheader31.loopexit ]
  %.02.lcssa = phi i16 [ %124, %121 ], [ %177, %.preheader31.loopexit ]
  %131 = icmp sgt i32 %.518.lcssa, -1
  br i1 %131, label %.lr.ph64.preheader, label %.preheader30.preheader

.lr.ph64.preheader:                               ; preds = %.preheader31
  %132 = sext i32 %.518.lcssa to i64
  br label %.lr.ph64

.lr.ph68:                                         ; preds = %.lr.ph68.preheader, %.lr.ph68
  %indvars.iv111 = phi i64 [ %126, %.lr.ph68.preheader ], [ %indvars.iv.next112, %.lr.ph68 ]
  %.0266 = phi i16 [ %124, %.lr.ph68.preheader ], [ %177, %.lr.ph68 ]
  %133 = lshr i16 %.0266, 8
  %134 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv111
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i16
  %137 = shl nuw i16 %136, 8
  %138 = or i16 %137, %133
  %139 = zext i16 %138 to i64
  %140 = getelementptr inbounds i32, i32* %3, i64 %139
  %141 = load i32, i32* %140, align 4
  %142 = add i32 %141, -1
  store i32 %142, i32* %140, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32* %0, i64 %143
  %145 = trunc i64 %indvars.iv111 to i32
  store i32 %145, i32* %144, align 4
  %146 = add nsw i64 %indvars.iv111, -1
  %147 = getelementptr inbounds i8, i8* %1, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i16
  %150 = shl nuw i16 %149, 8
  %151 = or i16 %150, %136
  %152 = zext i16 %151 to i64
  %153 = getelementptr inbounds i32, i32* %3, i64 %152
  %154 = load i32, i32* %153, align 4
  %155 = add i32 %154, -1
  store i32 %155, i32* %153, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32* %0, i64 %156
  %158 = trunc i64 %146 to i32
  store i32 %158, i32* %157, align 4
  %159 = add nsw i64 %indvars.iv111, -2
  %160 = getelementptr inbounds i8, i8* %1, i64 %159
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i16
  %163 = shl nuw i16 %162, 8
  %164 = or i16 %163, %149
  %165 = zext i16 %164 to i64
  %166 = getelementptr inbounds i32, i32* %3, i64 %165
  %167 = load i32, i32* %166, align 4
  %168 = add i32 %167, -1
  store i32 %168, i32* %166, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i32, i32* %0, i64 %169
  %171 = trunc i64 %159 to i32
  store i32 %171, i32* %170, align 4
  %172 = add nsw i64 %indvars.iv111, -3
  %173 = getelementptr inbounds i8, i8* %1, i64 %172
  %174 = load i8, i8* %173, align 1
  %175 = zext i8 %174 to i16
  %176 = shl nuw i16 %175, 8
  %177 = or i16 %176, %162
  %178 = zext i16 %177 to i64
  %179 = getelementptr inbounds i32, i32* %3, i64 %178
  %180 = load i32, i32* %179, align 4
  %181 = add i32 %180, -1
  store i32 %181, i32* %179, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32* %0, i64 %182
  %184 = trunc i64 %172 to i32
  store i32 %184, i32* %183, align 4
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, -4
  %185 = icmp sgt i64 %indvars.iv.next112, 2
  br i1 %185, label %.lr.ph68, label %.preheader31.loopexit

.lr.ph64:                                         ; preds = %.lr.ph64.preheader, %.lr.ph64
  %indvars.iv109 = phi i64 [ %132, %.lr.ph64.preheader ], [ %indvars.iv.next110, %.lr.ph64 ]
  %.1363 = phi i16 [ %.02.lcssa, %.lr.ph64.preheader ], [ %191, %.lr.ph64 ]
  %186 = lshr i16 %.1363, 8
  %187 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv109
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i16
  %190 = shl nuw i16 %189, 8
  %191 = or i16 %190, %186
  %192 = zext i16 %191 to i64
  %193 = getelementptr inbounds i32, i32* %3, i64 %192
  %194 = load i32, i32* %193, align 4
  %195 = add i32 %194, -1
  store i32 %195, i32* %193, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32* %0, i64 %196
  %198 = trunc i64 %indvars.iv109 to i32
  store i32 %198, i32* %197, align 4
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, -1
  %199 = icmp sgt i64 %indvars.iv109, 0
  br i1 %199, label %.lr.ph64, label %.preheader30.preheader.loopexit

.preheader30.preheader.loopexit:                  ; preds = %.lr.ph64
  br label %.preheader30.preheader

.preheader30.preheader:                           ; preds = %.preheader30.preheader.loopexit, %.preheader31
  call void @llvm.memset.p0i8.i64(i8* nonnull %11, i8 0, i64 256, i32 16, i1 false)
  br label %.preheader30

.preheader30:                                     ; preds = %.preheader30, %.preheader30.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader30.preheader ], [ %indvars.iv.next106.7, %.preheader30 ]
  %200 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv105
  %201 = trunc i64 %indvars.iv105 to i32
  store i32 %201, i32* %200, align 16
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %202 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106
  %203 = trunc i64 %indvars.iv.next106 to i32
  store i32 %203, i32* %202, align 4
  %indvars.iv.next106.1 = or i64 %indvars.iv105, 2
  %204 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.1
  %205 = trunc i64 %indvars.iv.next106.1 to i32
  store i32 %205, i32* %204, align 8
  %indvars.iv.next106.2 = or i64 %indvars.iv105, 3
  %206 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.2
  %207 = trunc i64 %indvars.iv.next106.2 to i32
  store i32 %207, i32* %206, align 4
  %indvars.iv.next106.3 = or i64 %indvars.iv105, 4
  %208 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.3
  %209 = trunc i64 %indvars.iv.next106.3 to i32
  store i32 %209, i32* %208, align 16
  %indvars.iv.next106.4 = or i64 %indvars.iv105, 5
  %210 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.4
  %211 = trunc i64 %indvars.iv.next106.4 to i32
  store i32 %211, i32* %210, align 4
  %indvars.iv.next106.5 = or i64 %indvars.iv105, 6
  %212 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.5
  %213 = trunc i64 %indvars.iv.next106.5 to i32
  store i32 %213, i32* %212, align 8
  %indvars.iv.next106.6 = or i64 %indvars.iv105, 7
  %214 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv.next106.6
  %215 = trunc i64 %indvars.iv.next106.6 to i32
  store i32 %215, i32* %214, align 4
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next106.7, 256
  br i1 %exitcond.7, label %.preheader28.preheader, label %.preheader30

.preheader28.preheader:                           ; preds = %.preheader30
  br label %.preheader28

.preheader28:                                     ; preds = %.preheader28.preheader, %._crit_edge60
  %.1 = phi i32 [ %216, %._crit_edge60 ], [ 364, %.preheader28.preheader ]
  %216 = sdiv i32 %.1, 3
  %217 = icmp slt i32 %.1, 768
  br i1 %217, label %.lr.ph59.preheader, label %._crit_edge60

.lr.ph59.preheader:                               ; preds = %.preheader28
  %218 = sext i32 %216 to i64
  br label %.lr.ph59

.lr.ph59:                                         ; preds = %.lr.ph59.preheader, %250
  %indvars.iv103 = phi i64 [ %218, %.lr.ph59.preheader ], [ %indvars.iv.next104, %250 ]
  %219 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv103
  %220 = load i32, i32* %219, align 4
  %221 = shl i32 %220, 8
  %222 = add i32 %221, 256
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i32, i32* %3, i64 %223
  %225 = load i32, i32* %224, align 4
  %226 = sext i32 %221 to i64
  %227 = getelementptr inbounds i32, i32* %3, i64 %226
  %228 = load i32, i32* %227, align 4
  %229 = sub i32 %225, %228
  %230 = trunc i64 %indvars.iv103 to i32
  br label %231

; <label>:231:                                    ; preds = %246, %.lr.ph59
  %.210 = phi i32 [ %230, %.lr.ph59 ], [ %232, %246 ]
  %232 = sub nsw i32 %.210, %216
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %233
  %235 = load i32, i32* %234, align 4
  %236 = shl i32 %235, 8
  %237 = add i32 %236, 256
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds i32, i32* %3, i64 %238
  %240 = load i32, i32* %239, align 4
  %241 = sext i32 %236 to i64
  %242 = getelementptr inbounds i32, i32* %3, i64 %241
  %243 = load i32, i32* %242, align 4
  %244 = sub i32 %240, %243
  %245 = icmp ugt i32 %244, %229
  br i1 %245, label %246, label %250

; <label>:246:                                    ; preds = %231
  %247 = sext i32 %.210 to i64
  %248 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %247
  store i32 %235, i32* %248, align 4
  %249 = icmp slt i32 %232, %216
  br i1 %249, label %250, label %231

; <label>:250:                                    ; preds = %231, %246
  %.311 = phi i32 [ %232, %246 ], [ %.210, %231 ]
  %251 = sext i32 %.311 to i64
  %252 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %251
  store i32 %220, i32* %252, align 4
  %indvars.iv.next104 = add nsw i64 %indvars.iv103, 1
  %253 = icmp slt i64 %indvars.iv.next104, 256
  br i1 %253, label %.lr.ph59, label %._crit_edge60.loopexit

._crit_edge60.loopexit:                           ; preds = %250
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge60.loopexit, %.preheader28
  %.1.off = add nsw i32 %.1, -3
  %254 = icmp ugt i32 %.1.off, 2
  br i1 %254, label %.preheader28, label %.preheader27.preheader

.preheader27.preheader:                           ; preds = %._crit_edge60
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.preheader, %473
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %473 ], [ 0, %.preheader27.preheader ]
  %.0456 = phi i32 [ %.15.lcssa, %473 ], [ 0, %.preheader27.preheader ]
  %255 = getelementptr inbounds [256 x i32], [256 x i32]* %9, i64 0, i64 %indvars.iv101
  %256 = load i32, i32* %255, align 4
  %257 = shl i32 %256, 8
  br i1 %14, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %.preheader27
  %258 = sext i32 %257 to i64
  %259 = zext i32 %256 to i64
  br label %.split

.split.us.preheader:                              ; preds = %.preheader27
  %260 = zext i32 %256 to i64
  %261 = sext i32 %257 to i64
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %292
  %indvars.iv90 = phi i64 [ 0, %.split.us.preheader ], [ %indvars.iv.next91, %292 ]
  %.1541.us = phi i32 [ %.0456, %.split.us.preheader ], [ %.4.us, %292 ]
  %262 = icmp eq i64 %indvars.iv90, %260
  br i1 %262, label %292, label %263

; <label>:263:                                    ; preds = %.split.us
  %264 = add nuw nsw i64 %indvars.iv90, %261
  %265 = getelementptr inbounds i32, i32* %3, i64 %264
  %266 = load i32, i32* %265, align 4
  %267 = and i32 %266, 2097152
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %289

; <label>:269:                                    ; preds = %263
  %270 = and i32 %266, -2097153
  %271 = add nsw i64 %264, 1
  %272 = getelementptr inbounds i32, i32* %3, i64 %271
  %273 = load i32, i32* %272, align 4
  %274 = and i32 %273, -2097153
  %275 = add i32 %274, -1
  %276 = icmp sgt i32 %275, %270
  br i1 %276, label %277, label %289

; <label>:277:                                    ; preds = %269
  %278 = sub i32 1, %270
  %279 = add i32 %278, %275
  %280 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %281 = trunc i64 %indvars.iv90 to i32
  %282 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %280, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.7, i64 0, i64 0), i32 %256, i32 %281, i32 %.1541.us, i32 %279) #7
  tail call fastcc void @mainQSort3(i32* %0, i8* %1, i16* %2, i32 %4, i32 %270, i32 %275, i32* %6)
  %283 = load i32, i32* %6, align 4
  %284 = icmp slt i32 %283, 0
  br i1 %284, label %.loopexit.loopexit, label %285

; <label>:285:                                    ; preds = %277
  %286 = add i32 %.1541.us, 1
  %287 = sub i32 %286, %270
  %288 = add i32 %287, %275
  br label %289

; <label>:289:                                    ; preds = %285, %269, %263
  %.3.us = phi i32 [ %.1541.us, %263 ], [ %288, %285 ], [ %.1541.us, %269 ]
  %290 = load i32, i32* %265, align 4
  %291 = or i32 %290, 2097152
  store i32 %291, i32* %265, align 4
  br label %292

; <label>:292:                                    ; preds = %289, %.split.us
  %.4.us = phi i32 [ %.3.us, %289 ], [ %.1541.us, %.split.us ]
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %293 = icmp slt i64 %indvars.iv.next91, 256
  br i1 %293, label %.split.us, label %.us-lcssa.us.loopexit

.split:                                           ; preds = %.split.preheader, %319
  %indvars.iv = phi i64 [ 0, %.split.preheader ], [ %indvars.iv.next, %319 ]
  %.1541 = phi i32 [ %.0456, %.split.preheader ], [ %.4, %319 ]
  %294 = icmp eq i64 %indvars.iv, %259
  br i1 %294, label %319, label %295

; <label>:295:                                    ; preds = %.split
  %296 = add nuw nsw i64 %indvars.iv, %258
  %297 = getelementptr inbounds i32, i32* %3, i64 %296
  %298 = load i32, i32* %297, align 4
  %299 = and i32 %298, 2097152
  %300 = icmp eq i32 %299, 0
  br i1 %300, label %301, label %316

; <label>:301:                                    ; preds = %295
  %302 = and i32 %298, -2097153
  %303 = add nsw i64 %296, 1
  %304 = getelementptr inbounds i32, i32* %3, i64 %303
  %305 = load i32, i32* %304, align 4
  %306 = and i32 %305, -2097153
  %307 = add i32 %306, -1
  %308 = icmp sgt i32 %307, %302
  br i1 %308, label %309, label %316

; <label>:309:                                    ; preds = %301
  tail call fastcc void @mainQSort3(i32* %0, i8* %1, i16* %2, i32 %4, i32 %302, i32 %307, i32* %6)
  %310 = load i32, i32* %6, align 4
  %311 = icmp slt i32 %310, 0
  br i1 %311, label %.loopexit.loopexit137, label %312

; <label>:312:                                    ; preds = %309
  %313 = add i32 %.1541, 1
  %314 = sub i32 %313, %302
  %315 = add i32 %314, %307
  br label %316

; <label>:316:                                    ; preds = %301, %312, %295
  %.3 = phi i32 [ %.1541, %295 ], [ %315, %312 ], [ %.1541, %301 ]
  %317 = load i32, i32* %297, align 4
  %318 = or i32 %317, 2097152
  store i32 %318, i32* %297, align 4
  br label %319

; <label>:319:                                    ; preds = %316, %.split
  %.4 = phi i32 [ %.3, %316 ], [ %.1541, %.split ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %320 = icmp slt i64 %indvars.iv.next, 256
  br i1 %320, label %.split, label %.us-lcssa.us.loopexit138

.us-lcssa.us.loopexit:                            ; preds = %292
  br label %.us-lcssa.us

.us-lcssa.us.loopexit138:                         ; preds = %319
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit138, %.us-lcssa.us.loopexit
  %.15.lcssa = phi i32 [ %.4.us, %.us-lcssa.us.loopexit ], [ %.4, %.us-lcssa.us.loopexit138 ]
  %321 = sext i32 %256 to i64
  %322 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 %321
  %323 = load i8, i8* %322, align 1
  %324 = icmp eq i8 %323, 0
  br i1 %324, label %.preheader26.preheader, label %325

; <label>:325:                                    ; preds = %.us-lcssa.us
  tail call void @BZ2_bz__AssertH__fail(i32 1006) #5
  br label %.preheader26.preheader

.preheader26.preheader:                           ; preds = %.us-lcssa.us, %325
  %326 = sext i32 %256 to i64
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26, %.preheader26.preheader
  %indvars.iv92 = phi i64 [ 0, %.preheader26.preheader ], [ %indvars.iv.next93.1, %.preheader26 ]
  %327 = shl i64 %indvars.iv92, 8
  %328 = add nsw i64 %327, %326
  %329 = getelementptr inbounds i32, i32* %3, i64 %328
  %330 = load i32, i32* %329, align 4
  %331 = and i32 %330, -2097153
  %332 = getelementptr inbounds [256 x i32], [256 x i32]* %12, i64 0, i64 %indvars.iv92
  store i32 %331, i32* %332, align 8
  %333 = add nsw i64 %328, 1
  %334 = getelementptr inbounds i32, i32* %3, i64 %333
  %335 = load i32, i32* %334, align 4
  %336 = and i32 %335, -2097153
  %337 = add i32 %336, -1
  %338 = getelementptr inbounds [256 x i32], [256 x i32]* %13, i64 0, i64 %indvars.iv92
  store i32 %337, i32* %338, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %339 = shl i64 %indvars.iv.next93, 8
  %340 = add nsw i64 %339, %326
  %341 = getelementptr inbounds i32, i32* %3, i64 %340
  %342 = load i32, i32* %341, align 4
  %343 = and i32 %342, -2097153
  %344 = getelementptr inbounds [256 x i32], [256 x i32]* %12, i64 0, i64 %indvars.iv.next93
  store i32 %343, i32* %344, align 4
  %345 = add nsw i64 %340, 1
  %346 = getelementptr inbounds i32, i32* %3, i64 %345
  %347 = load i32, i32* %346, align 4
  %348 = and i32 %347, -2097153
  %349 = add i32 %348, -1
  %350 = getelementptr inbounds [256 x i32], [256 x i32]* %13, i64 0, i64 %indvars.iv.next93
  store i32 %349, i32* %350, align 4
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 256
  br i1 %exitcond.1, label %351, label %.preheader26

; <label>:351:                                    ; preds = %.preheader26
  %352 = shl i32 %256, 8
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i32, i32* %3, i64 %353
  %355 = load i32, i32* %354, align 4
  %356 = and i32 %355, -2097153
  %357 = getelementptr inbounds [256 x i32], [256 x i32]* %12, i64 0, i64 %321
  %358 = load i32, i32* %357, align 4
  %359 = icmp slt i32 %356, %358
  br i1 %359, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %351
  %360 = sext i32 %356 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %379
  %indvars.iv94 = phi i64 [ %360, %.lr.ph.preheader ], [ %indvars.iv.next95, %379 ]
  %361 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv94
  %362 = load i32, i32* %361, align 4
  %363 = add i32 %362, -1
  %364 = icmp slt i32 %363, 0
  %365 = select i1 %364, i32 %4, i32 0
  %. = add nsw i32 %365, %363
  %366 = sext i32 %. to i64
  %367 = getelementptr inbounds i8, i8* %1, i64 %366
  %368 = load i8, i8* %367, align 1
  %369 = zext i8 %368 to i64
  %370 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 %369
  %371 = load i8, i8* %370, align 1
  %372 = icmp eq i8 %371, 0
  br i1 %372, label %373, label %379

; <label>:373:                                    ; preds = %.lr.ph
  %374 = getelementptr inbounds [256 x i32], [256 x i32]* %12, i64 0, i64 %369
  %375 = load i32, i32* %374, align 4
  %376 = add nsw i32 %375, 1
  store i32 %376, i32* %374, align 4
  %377 = sext i32 %375 to i64
  %378 = getelementptr inbounds i32, i32* %0, i64 %377
  store i32 %., i32* %378, align 4
  br label %379

; <label>:379:                                    ; preds = %373, %.lr.ph
  %indvars.iv.next95 = add i64 %indvars.iv94, 1
  %380 = load i32, i32* %357, align 4
  %381 = sext i32 %380 to i64
  %382 = icmp slt i64 %indvars.iv.next95, %381
  br i1 %382, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %379
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %351
  %383 = add i32 %352, 256
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds i32, i32* %3, i64 %384
  %386 = load i32, i32* %385, align 4
  %387 = and i32 %386, -2097153
  %.744 = add i32 %387, -1
  %388 = getelementptr inbounds [256 x i32], [256 x i32]* %13, i64 0, i64 %321
  %389 = load i32, i32* %388, align 4
  %390 = icmp sgt i32 %.744, %389
  br i1 %390, label %.lr.ph47.preheader, label %._crit_edge48

.lr.ph47.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.lr.ph47.preheader, %.backedge25
  %.745 = phi i32 [ %.7, %.backedge25 ], [ %.744, %.lr.ph47.preheader ]
  %391 = sext i32 %.745 to i64
  %392 = getelementptr inbounds i32, i32* %0, i64 %391
  %393 = load i32, i32* %392, align 4
  %394 = add i32 %393, -1
  %395 = icmp slt i32 %394, 0
  %396 = select i1 %395, i32 %4, i32 0
  %.23 = add nsw i32 %396, %394
  %397 = sext i32 %.23 to i64
  %398 = getelementptr inbounds i8, i8* %1, i64 %397
  %399 = load i8, i8* %398, align 1
  %400 = zext i8 %399 to i64
  %401 = getelementptr inbounds [256 x i8], [256 x i8]* %10, i64 0, i64 %400
  %402 = load i8, i8* %401, align 1
  %403 = icmp eq i8 %402, 0
  br i1 %403, label %404, label %.backedge25

; <label>:404:                                    ; preds = %.lr.ph47
  %405 = getelementptr inbounds [256 x i32], [256 x i32]* %13, i64 0, i64 %400
  %406 = load i32, i32* %405, align 4
  %407 = add nsw i32 %406, -1
  store i32 %407, i32* %405, align 4
  %408 = sext i32 %406 to i64
  %409 = getelementptr inbounds i32, i32* %0, i64 %408
  store i32 %.23, i32* %409, align 4
  br label %.backedge25

.backedge25:                                      ; preds = %404, %.lr.ph47
  %.7 = add i32 %.745, -1
  %410 = load i32, i32* %388, align 4
  %411 = icmp sgt i32 %.7, %410
  br i1 %411, label %.lr.ph47, label %._crit_edge48.loopexit

._crit_edge48.loopexit:                           ; preds = %.backedge25
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge
  %.lcssa37 = phi i32 [ %389, %._crit_edge ], [ %410, %._crit_edge48.loopexit ]
  %412 = load i32, i32* %357, align 4
  %413 = add nsw i32 %412, -1
  %414 = icmp eq i32 %413, %.lcssa37
  br i1 %414, label %.preheader24.preheader, label %415

; <label>:415:                                    ; preds = %._crit_edge48
  %416 = icmp eq i32 %412, 0
  %417 = icmp eq i32 %.lcssa37, %22
  %or.cond = and i1 %417, %416
  br i1 %or.cond, label %.preheader24.preheader, label %418

; <label>:418:                                    ; preds = %415
  tail call void @BZ2_bz__AssertH__fail(i32 1007) #5
  br label %.preheader24.preheader

.preheader24.preheader:                           ; preds = %418, %._crit_edge48, %415
  %419 = sext i32 %256 to i64
  br label %.preheader24

.preheader24:                                     ; preds = %.preheader24, %.preheader24.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader24.preheader ], [ %indvars.iv.next97.3, %.preheader24 ]
  %420 = shl i64 %indvars.iv96, 8
  %421 = add nsw i64 %420, %419
  %422 = getelementptr inbounds i32, i32* %3, i64 %421
  %423 = load i32, i32* %422, align 4
  %424 = or i32 %423, 2097152
  store i32 %424, i32* %422, align 4
  %indvars.iv.next97 = shl i64 %indvars.iv96, 8
  %425 = or i64 %indvars.iv.next97, 256
  %426 = add nsw i64 %425, %419
  %427 = getelementptr inbounds i32, i32* %3, i64 %426
  %428 = load i32, i32* %427, align 4
  %429 = or i32 %428, 2097152
  store i32 %429, i32* %427, align 4
  %indvars.iv.next97.1 = shl i64 %indvars.iv96, 8
  %430 = or i64 %indvars.iv.next97.1, 512
  %431 = add nsw i64 %430, %419
  %432 = getelementptr inbounds i32, i32* %3, i64 %431
  %433 = load i32, i32* %432, align 4
  %434 = or i32 %433, 2097152
  store i32 %434, i32* %432, align 4
  %indvars.iv.next97.2 = shl i64 %indvars.iv96, 8
  %435 = or i64 %indvars.iv.next97.2, 768
  %436 = add nsw i64 %435, %419
  %437 = getelementptr inbounds i32, i32* %3, i64 %436
  %438 = load i32, i32* %437, align 4
  %439 = or i32 %438, 2097152
  store i32 %439, i32* %437, align 4
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next97.3, 256
  br i1 %exitcond.3, label %440, label %.preheader24

; <label>:440:                                    ; preds = %.preheader24
  store i8 1, i8* %322, align 1
  %441 = icmp slt i64 %indvars.iv101, 255
  br i1 %441, label %442, label %473

; <label>:442:                                    ; preds = %440
  %443 = load i32, i32* %354, align 4
  %444 = and i32 %443, -2097153
  %445 = load i32, i32* %385, align 4
  %446 = and i32 %445, -2097153
  %447 = sub i32 %446, %444
  br label %448

; <label>:448:                                    ; preds = %448, %442
  %.0 = phi i32 [ 0, %442 ], [ %451, %448 ]
  %449 = ashr i32 %447, %.0
  %450 = icmp sgt i32 %449, 65534
  %451 = add nuw nsw i32 %.0, 1
  br i1 %450, label %448, label %.preheader

.preheader:                                       ; preds = %448
  %452 = icmp sgt i32 %447, 0
  br i1 %452, label %.lr.ph53.preheader, label %._crit_edge54

.lr.ph53.preheader:                               ; preds = %.preheader
  %453 = sext i32 %447 to i64
  %454 = sext i32 %444 to i64
  br label %.lr.ph53

.lr.ph53:                                         ; preds = %.lr.ph53.preheader, %.backedge
  %indvars.iv99 = phi i64 [ %453, %.lr.ph53.preheader ], [ %indvars.iv.next100, %.backedge ]
  %indvars.iv.next100 = add nsw i64 %indvars.iv99, -1
  %455 = add nsw i64 %indvars.iv.next100, %454
  %456 = getelementptr inbounds i32, i32* %0, i64 %455
  %457 = load i32, i32* %456, align 4
  %458 = trunc i64 %indvars.iv.next100 to i32
  %459 = ashr i32 %458, %.0
  %460 = trunc i32 %459 to i16
  %461 = sext i32 %457 to i64
  %462 = getelementptr inbounds i16, i16* %2, i64 %461
  store i16 %460, i16* %462, align 2
  %463 = icmp slt i32 %457, 34
  br i1 %463, label %465, label %.backedge

.backedge:                                        ; preds = %.lr.ph53, %465
  %464 = icmp sgt i64 %indvars.iv99, 1
  br i1 %464, label %.lr.ph53, label %._crit_edge54.loopexit

; <label>:465:                                    ; preds = %.lr.ph53
  %466 = add nsw i32 %457, %4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds i16, i16* %2, i64 %467
  store i16 %460, i16* %468, align 2
  br label %.backedge

._crit_edge54.loopexit:                           ; preds = %.backedge
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.preheader
  %469 = add nsw i32 %447, -1
  %470 = ashr i32 %469, %.0
  %471 = icmp slt i32 %470, 65536
  br i1 %471, label %473, label %472

; <label>:472:                                    ; preds = %._crit_edge54
  tail call void @BZ2_bz__AssertH__fail(i32 1002) #5
  br label %473

; <label>:473:                                    ; preds = %440, %472, %._crit_edge54
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %474 = icmp slt i64 %indvars.iv.next102, 256
  br i1 %474, label %.preheader27, label %475

; <label>:475:                                    ; preds = %473
  br i1 %14, label %476, label %.loopexit

; <label>:476:                                    ; preds = %475
  %477 = sub nsw i32 %4, %.15.lcssa
  %478 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %479 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %478, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.8, i64 0, i64 0), i32 %4, i32 %.15.lcssa, i32 %477) #7
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %277
  br label %.loopexit

.loopexit.loopexit137:                            ; preds = %309
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit137, %.loopexit.loopexit, %476, %475
  ret void

.preheader33.1:                                   ; preds = %.preheader33
  %480 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv.next118.1
  %481 = load i8, i8* %480, align 1
  %482 = add nsw i64 %indvars.iv.next118.1, %91
  %483 = getelementptr inbounds i8, i8* %1, i64 %482
  store i8 %481, i8* %483, align 1
  %484 = getelementptr inbounds i16, i16* %2, i64 %482
  store i16 0, i16* %484, align 2
  %indvars.iv.next118.1141 = or i64 %indvars.iv117, 3
  %485 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv.next118.1141
  %486 = load i8, i8* %485, align 1
  %487 = add nsw i64 %indvars.iv.next118.1141, %91
  %488 = getelementptr inbounds i8, i8* %1, i64 %487
  store i8 %486, i8* %488, align 1
  %489 = getelementptr inbounds i16, i16* %2, i64 %487
  store i16 0, i16* %489, align 2
  %indvars.iv.next118.1.1 = add nsw i64 %indvars.iv117, 4
  br label %.preheader33
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @BZ2_bz__AssertH__fail(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @fallbackQSort3(i32*, i32* nocapture readonly, i32, i32) unnamed_addr #0 {
  %5 = alloca [100 x i32], align 16
  %6 = alloca [100 x i32], align 16
  %7 = getelementptr inbounds [100 x i32], [100 x i32]* %5, i64 0, i64 0
  store i32 %2, i32* %7, align 16
  %8 = getelementptr inbounds [100 x i32], [100 x i32]* %6, i64 0, i64 0
  store i32 %3, i32* %8, align 16
  %scevgep248 = getelementptr i32, i32* %0, i64 1
  %scevgep254 = getelementptr i32, i32* %0, i64 1
  %scevgep257 = getelementptr i32, i32* %0, i64 2
  %scevgep292 = getelementptr i32, i32* %0, i64 1
  %scevgep300 = getelementptr i32, i32* %0, i64 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %4, %.outer34.backedge
  %.011.ph98 = phi i32 [ 1, %4 ], [ %.011.ph.be, %.outer34.backedge ]
  %.017.ph97 = phi i32 [ 0, %4 ], [ %27, %.outer34.backedge ]
  %9 = sext i32 %.011.ph98 to i64
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %20
  %indvars.iv = phi i64 [ %9, %.lr.ph ], [ %indvars.iv.next, %20 ]
  %11 = icmp slt i64 %indvars.iv, 99
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %10
  tail call void @BZ2_bz__AssertH__fail(i32 1004) #5
  br label %13

; <label>:13:                                     ; preds = %12, %10
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %14 = getelementptr inbounds [100 x i32], [100 x i32]* %5, i64 0, i64 %indvars.iv.next
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds [100 x i32], [100 x i32]* %6, i64 0, i64 %indvars.iv.next
  %17 = load i32, i32* %16, align 4
  %18 = sub nsw i32 %17, %15
  %19 = icmp slt i32 %18, 10
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  tail call fastcc void @fallbackSimpleSort(i32* %0, i32* %1, i32 %15, i32 %17)
  %21 = icmp sgt i64 %indvars.iv, 1
  br i1 %21, label %10, label %.outer34._crit_edge.loopexit

; <label>:22:                                     ; preds = %13
  %23 = trunc i64 %indvars.iv to i32
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = mul nuw nsw i32 %.017.ph97, 7621
  %26 = add nuw nsw i32 %25, 1
  %27 = and i32 %26, 32767
  %28 = urem i32 %27, 3
  %trunc = trunc i32 %28 to i2
  switch i2 %trunc, label %32 [
    i2 0, label %33
    i2 1, label %29
  ]

; <label>:29:                                     ; preds = %22
  %30 = add nsw i32 %17, %15
  %31 = ashr i32 %30, 1
  br label %32

; <label>:32:                                     ; preds = %22, %29
  %.pn.in = phi i32 [ %31, %29 ], [ %17, %22 ]
  br label %33

; <label>:33:                                     ; preds = %22, %32
  %.pn19.in = phi i32 [ %.pn.in, %32 ], [ %15, %22 ]
  %.pn19 = sext i32 %.pn19.in to i64
  %.pn18.in.in = getelementptr inbounds i32, i32* %0, i64 %.pn19
  %.pn18.in = load i32, i32* %.pn18.in.in, align 4
  %.pn18 = zext i32 %.pn18.in to i64
  %.116.in = getelementptr inbounds i32, i32* %1, i64 %.pn18
  %.116 = load i32, i32* %.116.in, align 4
  br label %34

; <label>:34:                                     ; preds = %81, %33
  %.09 = phi i32 [ %17, %33 ], [ %82, %81 ]
  %.07 = phi i32 [ %15, %33 ], [ %.18.ph.lcssa, %81 ]
  %.05 = phi i32 [ %17, %33 ], [ %91, %81 ]
  %.04 = phi i32 [ %15, %33 ], [ %90, %81 ]
  %35 = icmp sgt i32 %.04, %.05
  br i1 %35, label %.preheader, label %.lr.ph52.preheader

.lr.ph52.preheader:                               ; preds = %34
  %36 = sext i32 %.05 to i64
  %37 = sext i32 %.07 to i64
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %.lr.ph52.preheader, %.outer33
  %indvars.iv146 = phi i64 [ %37, %.lr.ph52.preheader ], [ %indvars.iv.next147, %.outer33 ]
  %.1.ph60 = phi i32 [ %.04, %.lr.ph52.preheader ], [ %55, %.outer33 ]
  %38 = sext i32 %.1.ph60 to i64
  br label %44

.preheader.loopexit100:                           ; preds = %.outer33
  %39 = trunc i64 %indvars.iv.next147 to i32
  br label %.preheader

.preheader.loopexit:                              ; preds = %57, %60
  %.1.lcssa.ph = phi i32 [ %59, %57 ], [ %61, %60 ]
  %40 = trunc i64 %indvars.iv146 to i32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader.loopexit100, %34
  %.18.ph.lcssa = phi i32 [ %.07, %34 ], [ %39, %.preheader.loopexit100 ], [ %40, %.preheader.loopexit ]
  %.1.lcssa = phi i32 [ %.04, %34 ], [ %55, %.preheader.loopexit100 ], [ %.1.lcssa.ph, %.preheader.loopexit ]
  %41 = icmp sgt i32 %.1.lcssa, %.05
  br i1 %41, label %.outer._crit_edge.loopexit340, label %.lr.ph64.preheader

.lr.ph64.preheader:                               ; preds = %.preheader
  %42 = sext i32 %.1.lcssa to i64
  %43 = sext i32 %.09 to i64
  br label %.lr.ph64

; <label>:44:                                     ; preds = %60, %.lr.ph52
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %60 ], [ %38, %.lr.ph52 ]
  %.151 = phi i32 [ %61, %60 ], [ %.1.ph60, %.lr.ph52 ]
  %45 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv144
  %46 = load i32, i32* %45, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32* %1, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = sub nsw i32 %49, %.116
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %.outer33, label %57

.outer33:                                         ; preds = %44
  %52 = trunc i64 %indvars.iv144 to i32
  %53 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv146
  %54 = load i32, i32* %53, align 4
  store i32 %54, i32* %45, align 4
  store i32 %46, i32* %53, align 4
  %indvars.iv.next147 = add i64 %indvars.iv146, 1
  %55 = add nsw i32 %52, 1
  %56 = icmp slt i32 %52, %.05
  br i1 %56, label %.lr.ph52, label %.preheader.loopexit100

; <label>:57:                                     ; preds = %44
  %58 = icmp sgt i32 %50, 0
  %59 = trunc i64 %indvars.iv144 to i32
  br i1 %58, label %.preheader.loopexit, label %60

; <label>:60:                                     ; preds = %57
  %indvars.iv.next145 = add nsw i64 %indvars.iv144, 1
  %61 = add nsw i32 %.151, 1
  %62 = icmp slt i64 %indvars.iv144, %36
  br i1 %62, label %44, label %.preheader.loopexit

; <label>:63:                                     ; preds = %79, %.lr.ph64
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %79 ], [ %76, %.lr.ph64 ]
  %64 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv148
  %65 = load i32, i32* %64, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %1, i64 %66
  %68 = load i32, i32* %67, align 4
  %69 = sub nsw i32 %68, %.116
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.outer, label %77

.outer:                                           ; preds = %63
  %71 = trunc i64 %indvars.iv148 to i32
  %72 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv150
  %73 = load i32, i32* %72, align 4
  store i32 %73, i32* %64, align 4
  store i32 %65, i32* %72, align 4
  %indvars.iv.next151 = add i64 %indvars.iv150, -1
  %74 = add nsw i32 %71, -1
  %75 = icmp slt i32 %.1.lcssa, %71
  br i1 %75, label %.lr.ph64, label %.outer._crit_edge.loopexit99

.lr.ph64:                                         ; preds = %.lr.ph64.preheader, %.outer
  %indvars.iv150 = phi i64 [ %43, %.lr.ph64.preheader ], [ %indvars.iv.next151, %.outer ]
  %.16.ph75 = phi i32 [ %.05, %.lr.ph64.preheader ], [ %74, %.outer ]
  %76 = sext i32 %.16.ph75 to i64
  br label %63

; <label>:77:                                     ; preds = %63
  %78 = icmp slt i32 %69, 0
  br i1 %78, label %81, label %79

; <label>:79:                                     ; preds = %77
  %indvars.iv.next149 = add nsw i64 %indvars.iv148, -1
  %80 = icmp slt i64 %42, %indvars.iv148
  br i1 %80, label %63, label %.outer._crit_edge.loopexit

; <label>:81:                                     ; preds = %77
  %82 = trunc i64 %indvars.iv150 to i32
  %83 = trunc i64 %indvars.iv148 to i32
  %84 = sext i32 %.1.lcssa to i64
  %85 = getelementptr inbounds i32, i32* %0, i64 %84
  %86 = load i32, i32* %85, align 4
  %sext165 = shl i64 %indvars.iv148, 32
  %87 = ashr exact i64 %sext165, 32
  %88 = getelementptr inbounds i32, i32* %0, i64 %87
  %89 = load i32, i32* %88, align 4
  store i32 %89, i32* %85, align 4
  store i32 %86, i32* %88, align 4
  %90 = add nsw i32 %.1.lcssa, 1
  %91 = add nsw i32 %83, -1
  br label %34

.outer._crit_edge.loopexit:                       ; preds = %79
  %92 = trunc i64 %indvars.iv150 to i32
  %93 = trunc i64 %indvars.iv.next149 to i32
  br label %.outer._crit_edge

.outer._crit_edge.loopexit99:                     ; preds = %.outer
  %94 = trunc i64 %indvars.iv.next151 to i32
  br label %.outer._crit_edge

.outer._crit_edge.loopexit340:                    ; preds = %.preheader
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit340, %.outer._crit_edge.loopexit99, %.outer._crit_edge.loopexit
  %.110.ph.lcssa49 = phi i32 [ %92, %.outer._crit_edge.loopexit ], [ %94, %.outer._crit_edge.loopexit99 ], [ %.09, %.outer._crit_edge.loopexit340 ]
  %.16.lcssa = phi i32 [ %93, %.outer._crit_edge.loopexit ], [ %74, %.outer._crit_edge.loopexit99 ], [ %.05, %.outer._crit_edge.loopexit340 ]
  %95 = icmp slt i32 %.110.ph.lcssa49, %.18.ph.lcssa
  br i1 %95, label %.outer34.backedge, label %96

; <label>:96:                                     ; preds = %.outer._crit_edge
  %97 = sub nsw i32 %.18.ph.lcssa, %15
  %98 = sub nsw i32 %.1.lcssa, %.18.ph.lcssa
  %99 = icmp slt i32 %97, %98
  %100 = select i1 %99, i32 %97, i32 %98
  %101 = icmp sgt i32 %100, 0
  br i1 %101, label %.lr.ph88.preheader, label %._crit_edge89

.lr.ph88.preheader:                               ; preds = %96
  %102 = sub nsw i32 %.1.lcssa, %100
  %103 = sext i32 %102 to i64
  %104 = sext i32 %15 to i64
  %105 = add i32 %.18.ph.lcssa, -1
  %106 = sub i32 %105, %.1.lcssa
  %107 = add i32 %15, -1
  %108 = sub i32 %107, %.18.ph.lcssa
  %109 = icmp sgt i32 %106, %108
  %smax281 = select i1 %109, i32 %106, i32 %108
  %110 = icmp sgt i32 %smax281, -2
  %smax282 = select i1 %110, i32 %smax281, i32 -2
  %111 = icmp sgt i32 %106, %108
  %smax283 = select i1 %111, i32 %106, i32 %108
  %112 = sub i32 %smax282, %smax283
  %113 = zext i32 %112 to i64
  %114 = add nuw nsw i64 %113, 1
  %min.iters.check284 = icmp ult i64 %114, 8
  br i1 %min.iters.check284, label %.lr.ph88.preheader339, label %min.iters.checked285

min.iters.checked285:                             ; preds = %.lr.ph88.preheader
  %n.vec287 = and i64 %114, 8589934584
  %cmp.zero288 = icmp eq i64 %n.vec287, 0
  br i1 %cmp.zero288, label %.lr.ph88.preheader339, label %vector.memcheck307

vector.memcheck307:                               ; preds = %min.iters.checked285
  %scevgep290 = getelementptr i32, i32* %0, i64 %104
  %115 = add i32 %.18.ph.lcssa, -1
  %116 = sub i32 %115, %.1.lcssa
  %117 = add i32 %15, -1
  %118 = sub i32 %117, %.18.ph.lcssa
  %119 = icmp sgt i32 %116, %118
  %smax293 = select i1 %119, i32 %116, i32 %118
  %120 = icmp sgt i32 %smax293, -2
  %smax294 = select i1 %120, i32 %smax293, i32 -2
  %121 = icmp sgt i32 %116, %118
  %smax295 = select i1 %121, i32 %116, i32 %118
  %122 = sub i32 %smax294, %smax295
  %123 = zext i32 %122 to i64
  %124 = add nsw i64 %104, %123
  %scevgep296 = getelementptr i32, i32* %scevgep292, i64 %124
  %scevgep298 = getelementptr i32, i32* %0, i64 %103
  %125 = add nsw i64 %103, %123
  %scevgep301 = getelementptr i32, i32* %scevgep300, i64 %125
  %bound0303 = icmp ult i32* %scevgep290, %scevgep301
  %bound1304 = icmp ult i32* %scevgep298, %scevgep296
  %memcheck.conflict306 = and i1 %bound0303, %bound1304
  %ind.end312 = add nsw i64 %104, %n.vec287
  %ind.end314 = add nsw i64 %103, %n.vec287
  %cast.crd316 = trunc i64 %n.vec287 to i32
  %ind.end317 = sub i32 %100, %cast.crd316
  br i1 %memcheck.conflict306, label %.lr.ph88.preheader339, label %vector.body278.preheader

vector.body278.preheader:                         ; preds = %vector.memcheck307
  %126 = add nsw i64 %n.vec287, -8
  %127 = lshr exact i64 %126, 3
  %128 = and i64 %127, 1
  %lcmp.mod = icmp eq i64 %128, 0
  br i1 %lcmp.mod, label %vector.body278.prol.preheader, label %vector.body278.prol.loopexit.unr-lcssa

vector.body278.prol.preheader:                    ; preds = %vector.body278.preheader
  br label %vector.body278.prol

vector.body278.prol:                              ; preds = %vector.body278.prol.preheader
  %129 = getelementptr inbounds i32, i32* %0, i64 %104
  %130 = bitcast i32* %129 to <4 x i32>*
  %wide.load334.prol = load <4 x i32>, <4 x i32>* %130, align 4, !alias.scope !3, !noalias !6
  %131 = getelementptr i32, i32* %129, i64 4
  %132 = bitcast i32* %131 to <4 x i32>*
  %wide.load335.prol = load <4 x i32>, <4 x i32>* %132, align 4, !alias.scope !3, !noalias !6
  %133 = getelementptr inbounds i32, i32* %0, i64 %103
  %134 = bitcast i32* %133 to <4 x i32>*
  %wide.load336.prol = load <4 x i32>, <4 x i32>* %134, align 4, !alias.scope !6
  %135 = getelementptr i32, i32* %133, i64 4
  %136 = bitcast i32* %135 to <4 x i32>*
  %wide.load337.prol = load <4 x i32>, <4 x i32>* %136, align 4, !alias.scope !6
  %137 = bitcast i32* %129 to <4 x i32>*
  store <4 x i32> %wide.load336.prol, <4 x i32>* %137, align 4, !alias.scope !3, !noalias !6
  %138 = bitcast i32* %131 to <4 x i32>*
  store <4 x i32> %wide.load337.prol, <4 x i32>* %138, align 4, !alias.scope !3, !noalias !6
  %139 = bitcast i32* %133 to <4 x i32>*
  store <4 x i32> %wide.load334.prol, <4 x i32>* %139, align 4, !alias.scope !6
  %140 = bitcast i32* %135 to <4 x i32>*
  store <4 x i32> %wide.load335.prol, <4 x i32>* %140, align 4, !alias.scope !6
  br label %vector.body278.prol.loopexit.unr-lcssa

vector.body278.prol.loopexit.unr-lcssa:           ; preds = %vector.body278.preheader, %vector.body278.prol
  %index309.unr.ph = phi i64 [ 8, %vector.body278.prol ], [ 0, %vector.body278.preheader ]
  br label %vector.body278.prol.loopexit

vector.body278.prol.loopexit:                     ; preds = %vector.body278.prol.loopexit.unr-lcssa
  %141 = icmp eq i64 %127, 0
  br i1 %141, label %middle.block279, label %vector.body278.preheader.new

vector.body278.preheader.new:                     ; preds = %vector.body278.prol.loopexit
  br label %vector.body278

vector.body278:                                   ; preds = %vector.body278, %vector.body278.preheader.new
  %index309 = phi i64 [ %index309.unr.ph, %vector.body278.preheader.new ], [ %index.next310.1, %vector.body278 ]
  %142 = add i64 %104, %index309
  %143 = add i64 %103, %index309
  %144 = getelementptr inbounds i32, i32* %0, i64 %142
  %145 = bitcast i32* %144 to <4 x i32>*
  %wide.load334 = load <4 x i32>, <4 x i32>* %145, align 4, !alias.scope !3, !noalias !6
  %146 = getelementptr i32, i32* %144, i64 4
  %147 = bitcast i32* %146 to <4 x i32>*
  %wide.load335 = load <4 x i32>, <4 x i32>* %147, align 4, !alias.scope !3, !noalias !6
  %148 = getelementptr inbounds i32, i32* %0, i64 %143
  %149 = bitcast i32* %148 to <4 x i32>*
  %wide.load336 = load <4 x i32>, <4 x i32>* %149, align 4, !alias.scope !6
  %150 = getelementptr i32, i32* %148, i64 4
  %151 = bitcast i32* %150 to <4 x i32>*
  %wide.load337 = load <4 x i32>, <4 x i32>* %151, align 4, !alias.scope !6
  %152 = bitcast i32* %144 to <4 x i32>*
  store <4 x i32> %wide.load336, <4 x i32>* %152, align 4, !alias.scope !3, !noalias !6
  %153 = bitcast i32* %146 to <4 x i32>*
  store <4 x i32> %wide.load337, <4 x i32>* %153, align 4, !alias.scope !3, !noalias !6
  %154 = bitcast i32* %148 to <4 x i32>*
  store <4 x i32> %wide.load334, <4 x i32>* %154, align 4, !alias.scope !6
  %155 = bitcast i32* %150 to <4 x i32>*
  store <4 x i32> %wide.load335, <4 x i32>* %155, align 4, !alias.scope !6
  %index.next310 = add i64 %index309, 8
  %156 = add i64 %104, %index.next310
  %157 = add i64 %103, %index.next310
  %158 = getelementptr inbounds i32, i32* %0, i64 %156
  %159 = bitcast i32* %158 to <4 x i32>*
  %wide.load334.1 = load <4 x i32>, <4 x i32>* %159, align 4, !alias.scope !3, !noalias !6
  %160 = getelementptr i32, i32* %158, i64 4
  %161 = bitcast i32* %160 to <4 x i32>*
  %wide.load335.1 = load <4 x i32>, <4 x i32>* %161, align 4, !alias.scope !3, !noalias !6
  %162 = getelementptr inbounds i32, i32* %0, i64 %157
  %163 = bitcast i32* %162 to <4 x i32>*
  %wide.load336.1 = load <4 x i32>, <4 x i32>* %163, align 4, !alias.scope !6
  %164 = getelementptr i32, i32* %162, i64 4
  %165 = bitcast i32* %164 to <4 x i32>*
  %wide.load337.1 = load <4 x i32>, <4 x i32>* %165, align 4, !alias.scope !6
  %166 = bitcast i32* %158 to <4 x i32>*
  store <4 x i32> %wide.load336.1, <4 x i32>* %166, align 4, !alias.scope !3, !noalias !6
  %167 = bitcast i32* %160 to <4 x i32>*
  store <4 x i32> %wide.load337.1, <4 x i32>* %167, align 4, !alias.scope !3, !noalias !6
  %168 = bitcast i32* %162 to <4 x i32>*
  store <4 x i32> %wide.load334.1, <4 x i32>* %168, align 4, !alias.scope !6
  %169 = bitcast i32* %164 to <4 x i32>*
  store <4 x i32> %wide.load335.1, <4 x i32>* %169, align 4, !alias.scope !6
  %index.next310.1 = add i64 %index309, 16
  %170 = icmp eq i64 %index.next310.1, %n.vec287
  br i1 %170, label %middle.block279.unr-lcssa, label %vector.body278, !llvm.loop !8

middle.block279.unr-lcssa:                        ; preds = %vector.body278
  br label %middle.block279

middle.block279:                                  ; preds = %vector.body278.prol.loopexit, %middle.block279.unr-lcssa
  %cmp.n318 = icmp eq i64 %114, %n.vec287
  br i1 %cmp.n318, label %._crit_edge89, label %.lr.ph88.preheader339

.lr.ph88.preheader339:                            ; preds = %middle.block279, %vector.memcheck307, %min.iters.checked285, %.lr.ph88.preheader
  %indvars.iv154.ph = phi i64 [ %104, %vector.memcheck307 ], [ %104, %min.iters.checked285 ], [ %104, %.lr.ph88.preheader ], [ %ind.end312, %middle.block279 ]
  %indvars.iv152.ph = phi i64 [ %103, %vector.memcheck307 ], [ %103, %min.iters.checked285 ], [ %103, %.lr.ph88.preheader ], [ %ind.end314, %middle.block279 ]
  %.0386.ph = phi i32 [ %100, %vector.memcheck307 ], [ %100, %min.iters.checked285 ], [ %100, %.lr.ph88.preheader ], [ %ind.end317, %middle.block279 ]
  br label %.lr.ph88

.lr.ph88:                                         ; preds = %.lr.ph88.preheader339, %.lr.ph88
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %.lr.ph88 ], [ %indvars.iv154.ph, %.lr.ph88.preheader339 ]
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %.lr.ph88 ], [ %indvars.iv152.ph, %.lr.ph88.preheader339 ]
  %.0386 = phi i32 [ %175, %.lr.ph88 ], [ %.0386.ph, %.lr.ph88.preheader339 ]
  %171 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv154
  %172 = load i32, i32* %171, align 4
  %173 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv152
  %174 = load i32, i32* %173, align 4
  store i32 %174, i32* %171, align 4
  store i32 %172, i32* %173, align 4
  %indvars.iv.next155 = add nsw i64 %indvars.iv154, 1
  %indvars.iv.next153 = add nsw i64 %indvars.iv152, 1
  %175 = add nsw i32 %.0386, -1
  %176 = icmp sgt i32 %.0386, 1
  br i1 %176, label %.lr.ph88, label %._crit_edge89.loopexit, !llvm.loop !11

._crit_edge89.loopexit:                           ; preds = %.lr.ph88
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit, %middle.block279, %96
  %177 = sub nsw i32 %17, %.110.ph.lcssa49
  %178 = sub nsw i32 %.110.ph.lcssa49, %.16.lcssa
  %179 = icmp slt i32 %177, %178
  %180 = select i1 %179, i32 %177, i32 %178
  %181 = icmp sgt i32 %180, 0
  br i1 %181, label %.lr.ph95.preheader, label %._crit_edge96

.lr.ph95.preheader:                               ; preds = %._crit_edge89
  %182 = sub nsw i32 %17, %180
  %183 = sext i32 %182 to i64
  %184 = sext i32 %.1.lcssa to i64
  %185 = add i32 %.110.ph.lcssa49, -1
  %186 = sub i32 %185, %17
  %187 = add i32 %.16.lcssa, -1
  %188 = sub i32 %187, %.110.ph.lcssa49
  %189 = icmp sgt i32 %186, %188
  %smax = select i1 %189, i32 %186, i32 %188
  %190 = icmp sgt i32 %smax, -2
  %smax245 = select i1 %190, i32 %smax, i32 -2
  %191 = icmp sgt i32 %186, %188
  %smax246 = select i1 %191, i32 %186, i32 %188
  %192 = sub i32 %smax245, %smax246
  %193 = zext i32 %192 to i64
  %194 = add nuw nsw i64 %193, 1
  %min.iters.check = icmp ult i64 %194, 8
  br i1 %min.iters.check, label %.lr.ph95.preheader338, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph95.preheader
  %n.vec = and i64 %194, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph95.preheader338, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i32, i32* %0, i64 %184
  %195 = add i32 %.110.ph.lcssa49, -1
  %196 = sub i32 %195, %17
  %197 = add i32 %.16.lcssa, -1
  %198 = sub i32 %197, %.110.ph.lcssa49
  %199 = icmp sgt i32 %196, %198
  %smax249 = select i1 %199, i32 %196, i32 %198
  %200 = icmp sgt i32 %smax249, -2
  %smax250 = select i1 %200, i32 %smax249, i32 -2
  %201 = icmp sgt i32 %196, %198
  %smax251 = select i1 %201, i32 %196, i32 %198
  %202 = sub i32 %smax250, %smax251
  %203 = zext i32 %202 to i64
  %204 = add nsw i64 %184, %203
  %scevgep252 = getelementptr i32, i32* %scevgep248, i64 %204
  %scevgep255 = getelementptr i32, i32* %scevgep254, i64 %183
  %205 = add nsw i64 %183, %203
  %scevgep258 = getelementptr i32, i32* %scevgep257, i64 %205
  %bound0 = icmp ult i32* %scevgep, %scevgep258
  %bound1 = icmp ult i32* %scevgep255, %scevgep252
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add nsw i64 %184, %n.vec
  %ind.end261 = add nsw i64 %183, %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end263 = sub i32 %180, %cast.crd
  br i1 %memcheck.conflict, label %.lr.ph95.preheader338, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %206 = add nsw i64 %n.vec, -8
  %207 = lshr exact i64 %206, 3
  %208 = and i64 %207, 1
  %lcmp.mod380 = icmp eq i64 %208, 0
  br i1 %lcmp.mod380, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %209 = add nsw i64 %183, 1
  %210 = getelementptr inbounds i32, i32* %0, i64 %184
  %211 = bitcast i32* %210 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %211, align 4, !alias.scope !12, !noalias !15
  %212 = getelementptr i32, i32* %210, i64 4
  %213 = bitcast i32* %212 to <4 x i32>*
  %wide.load275.prol = load <4 x i32>, <4 x i32>* %213, align 4, !alias.scope !12, !noalias !15
  %214 = getelementptr inbounds i32, i32* %0, i64 %209
  %215 = bitcast i32* %214 to <4 x i32>*
  %wide.load276.prol = load <4 x i32>, <4 x i32>* %215, align 4, !alias.scope !15
  %216 = getelementptr i32, i32* %214, i64 4
  %217 = bitcast i32* %216 to <4 x i32>*
  %wide.load277.prol = load <4 x i32>, <4 x i32>* %217, align 4, !alias.scope !15
  %218 = bitcast i32* %210 to <4 x i32>*
  store <4 x i32> %wide.load276.prol, <4 x i32>* %218, align 4, !alias.scope !12, !noalias !15
  %219 = bitcast i32* %212 to <4 x i32>*
  store <4 x i32> %wide.load277.prol, <4 x i32>* %219, align 4, !alias.scope !12, !noalias !15
  %220 = bitcast i32* %214 to <4 x i32>*
  store <4 x i32> %wide.load.prol, <4 x i32>* %220, align 4, !alias.scope !15
  %221 = bitcast i32* %216 to <4 x i32>*
  store <4 x i32> %wide.load275.prol, <4 x i32>* %221, align 4, !alias.scope !15
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %222 = icmp eq i64 %207, 0
  br i1 %222, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %223 = add i64 %184, %index
  %224 = add i64 %183, %index
  %225 = add nsw i64 %224, 1
  %226 = getelementptr inbounds i32, i32* %0, i64 %223
  %227 = bitcast i32* %226 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %227, align 4, !alias.scope !12, !noalias !15
  %228 = getelementptr i32, i32* %226, i64 4
  %229 = bitcast i32* %228 to <4 x i32>*
  %wide.load275 = load <4 x i32>, <4 x i32>* %229, align 4, !alias.scope !12, !noalias !15
  %230 = getelementptr inbounds i32, i32* %0, i64 %225
  %231 = bitcast i32* %230 to <4 x i32>*
  %wide.load276 = load <4 x i32>, <4 x i32>* %231, align 4, !alias.scope !15
  %232 = getelementptr i32, i32* %230, i64 4
  %233 = bitcast i32* %232 to <4 x i32>*
  %wide.load277 = load <4 x i32>, <4 x i32>* %233, align 4, !alias.scope !15
  %234 = bitcast i32* %226 to <4 x i32>*
  store <4 x i32> %wide.load276, <4 x i32>* %234, align 4, !alias.scope !12, !noalias !15
  %235 = bitcast i32* %228 to <4 x i32>*
  store <4 x i32> %wide.load277, <4 x i32>* %235, align 4, !alias.scope !12, !noalias !15
  %236 = bitcast i32* %230 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %236, align 4, !alias.scope !15
  %237 = bitcast i32* %232 to <4 x i32>*
  store <4 x i32> %wide.load275, <4 x i32>* %237, align 4, !alias.scope !15
  %index.next = add i64 %index, 8
  %238 = add i64 %184, %index.next
  %239 = add i64 %183, %index.next
  %240 = add nsw i64 %239, 1
  %241 = getelementptr inbounds i32, i32* %0, i64 %238
  %242 = bitcast i32* %241 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %242, align 4, !alias.scope !12, !noalias !15
  %243 = getelementptr i32, i32* %241, i64 4
  %244 = bitcast i32* %243 to <4 x i32>*
  %wide.load275.1 = load <4 x i32>, <4 x i32>* %244, align 4, !alias.scope !12, !noalias !15
  %245 = getelementptr inbounds i32, i32* %0, i64 %240
  %246 = bitcast i32* %245 to <4 x i32>*
  %wide.load276.1 = load <4 x i32>, <4 x i32>* %246, align 4, !alias.scope !15
  %247 = getelementptr i32, i32* %245, i64 4
  %248 = bitcast i32* %247 to <4 x i32>*
  %wide.load277.1 = load <4 x i32>, <4 x i32>* %248, align 4, !alias.scope !15
  %249 = bitcast i32* %241 to <4 x i32>*
  store <4 x i32> %wide.load276.1, <4 x i32>* %249, align 4, !alias.scope !12, !noalias !15
  %250 = bitcast i32* %243 to <4 x i32>*
  store <4 x i32> %wide.load277.1, <4 x i32>* %250, align 4, !alias.scope !12, !noalias !15
  %251 = bitcast i32* %245 to <4 x i32>*
  store <4 x i32> %wide.load.1, <4 x i32>* %251, align 4, !alias.scope !15
  %252 = bitcast i32* %247 to <4 x i32>*
  store <4 x i32> %wide.load275.1, <4 x i32>* %252, align 4, !alias.scope !15
  %index.next.1 = add i64 %index, 16
  %253 = icmp eq i64 %index.next.1, %n.vec
  br i1 %253, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !17

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %194, %n.vec
  br i1 %cmp.n, label %._crit_edge96, label %.lr.ph95.preheader338

.lr.ph95.preheader338:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph95.preheader
  %indvars.iv160.ph = phi i64 [ %184, %vector.memcheck ], [ %184, %min.iters.checked ], [ %184, %.lr.ph95.preheader ], [ %ind.end, %middle.block ]
  %indvars.iv158.ph = phi i64 [ %183, %vector.memcheck ], [ %183, %min.iters.checked ], [ %183, %.lr.ph95.preheader ], [ %ind.end261, %middle.block ]
  %.092.ph = phi i32 [ %180, %vector.memcheck ], [ %180, %min.iters.checked ], [ %180, %.lr.ph95.preheader ], [ %ind.end263, %middle.block ]
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %.lr.ph95.preheader338, %.lr.ph95
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %.lr.ph95 ], [ %indvars.iv160.ph, %.lr.ph95.preheader338 ]
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %.lr.ph95 ], [ %indvars.iv158.ph, %.lr.ph95.preheader338 ]
  %.092 = phi i32 [ %258, %.lr.ph95 ], [ %.092.ph, %.lr.ph95.preheader338 ]
  %indvars.iv.next159 = add nsw i64 %indvars.iv158, 1
  %254 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv160
  %255 = load i32, i32* %254, align 4
  %256 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next159
  %257 = load i32, i32* %256, align 4
  store i32 %257, i32* %254, align 4
  store i32 %255, i32* %256, align 4
  %indvars.iv.next161 = add nsw i64 %indvars.iv160, 1
  %258 = add nsw i32 %.092, -1
  %259 = icmp sgt i32 %.092, 1
  br i1 %259, label %.lr.ph95, label %._crit_edge96.loopexit, !llvm.loop !18

._crit_edge96.loopexit:                           ; preds = %.lr.ph95
  br label %._crit_edge96

._crit_edge96:                                    ; preds = %._crit_edge96.loopexit, %middle.block, %._crit_edge89
  %260 = add i32 %15, -1
  %261 = sub i32 %260, %.18.ph.lcssa
  %262 = add i32 %261, %.1.lcssa
  %263 = add i32 %17, 1
  %264 = sub i32 %263, %.110.ph.lcssa49
  %265 = add i32 %264, %.16.lcssa
  %266 = sub nsw i32 %262, %15
  %267 = sub nsw i32 %17, %265
  %268 = icmp sgt i32 %266, %267
  %. = select i1 %268, i32 %15, i32 %265
  %.29 = select i1 %268, i32 %262, i32 %17
  %.30 = select i1 %268, i32 %265, i32 %15
  %.31 = select i1 %268, i32 %17, i32 %262
  store i32 %., i32* %14, align 4
  store i32 %.29, i32* %16, align 4
  %sext = shl i64 %indvars.iv, 32
  %269 = ashr exact i64 %sext, 32
  %270 = getelementptr inbounds [100 x i32], [100 x i32]* %5, i64 0, i64 %269
  store i32 %.30, i32* %270, align 4
  %271 = getelementptr inbounds [100 x i32], [100 x i32]* %6, i64 0, i64 %269
  store i32 %.31, i32* %271, align 4
  %.112 = add nsw i32 %23, 1
  br label %.outer34.backedge

.outer34.backedge:                                ; preds = %._crit_edge96, %.outer._crit_edge
  %.011.ph.be = phi i32 [ %24, %.outer._crit_edge ], [ %.112, %._crit_edge96 ]
  %272 = icmp sgt i32 %.011.ph.be, 0
  br i1 %272, label %.lr.ph, label %.outer34._crit_edge.loopexit341

.outer34._crit_edge.loopexit:                     ; preds = %20
  br label %.outer34._crit_edge

.outer34._crit_edge.loopexit341:                  ; preds = %.outer34.backedge
  br label %.outer34._crit_edge

.outer34._crit_edge:                              ; preds = %.outer34._crit_edge.loopexit341, %.outer34._crit_edge.loopexit
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @fallbackSimpleSort(i32* nocapture, i32* nocapture readonly, i32, i32) unnamed_addr #3 {
  %5 = icmp eq i32 %3, %2
  br i1 %5, label %.loopexit, label %6

; <label>:6:                                      ; preds = %4
  %7 = sub nsw i32 %3, %2
  %8 = icmp sgt i32 %7, 3
  br i1 %8, label %13, label %.preheader

.preheader.loopexit:                              ; preds = %.critedge
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %13, %6
  %9 = icmp sgt i32 %3, %2
  br i1 %9, label %.lr.ph10.preheader, label %.loopexit

.lr.ph10.preheader:                               ; preds = %.preheader
  %10 = sext i32 %3 to i64
  %11 = sext i32 %3 to i64
  %12 = sext i32 %2 to i64
  br label %.lr.ph10

; <label>:13:                                     ; preds = %6
  %14 = add nsw i32 %3, -4
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %.preheader, label %.lr.ph19.preheader

.lr.ph19.preheader:                               ; preds = %13
  %16 = sext i32 %3 to i64
  %17 = sext i32 %14 to i64
  %18 = sext i32 %3 to i64
  %19 = sext i32 %2 to i64
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %.critedge
  %indvars.iv26 = phi i64 [ %17, %.lr.ph19.preheader ], [ %indvars.iv.next27, %.critedge ]
  %indvars.iv = phi i32 [ %3, %.lr.ph19.preheader ], [ %indvars.iv.next, %.critedge ]
  %20 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv26
  %21 = load i32, i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32* %1, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i64 %indvars.iv26, 4
  %26 = icmp sgt i64 %25, %18
  br i1 %26, label %.critedge, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %.lr.ph19
  %27 = sext i32 %indvars.iv to i64
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %34
  %indvars.iv24 = phi i64 [ %27, %.lr.ph14.preheader ], [ %indvars.iv.next25, %34 ]
  %.0.in12.in = phi i64 [ %indvars.iv26, %.lr.ph14.preheader ], [ %indvars.iv24, %34 ]
  %28 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv24
  %29 = load i32, i32* %28, align 4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %1, i64 %30
  %32 = load i32, i32* %31, align 4
  %33 = icmp ugt i32 %24, %32
  br i1 %33, label %34, label %.critedge.loopexit

; <label>:34:                                     ; preds = %.lr.ph14
  %sext29 = shl i64 %.0.in12.in, 32
  %35 = ashr exact i64 %sext29, 32
  %36 = getelementptr inbounds i32, i32* %0, i64 %35
  store i32 %29, i32* %36, align 4
  %indvars.iv.next25 = add i64 %indvars.iv24, 4
  %37 = icmp sgt i64 %indvars.iv.next25, %16
  br i1 %37, label %.critedge.loopexit, label %.lr.ph14

.critedge.loopexit:                               ; preds = %34, %.lr.ph14
  %.0.in.lcssa.ph = phi i64 [ %indvars.iv24, %34 ], [ %.0.in12.in, %.lr.ph14 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.lr.ph19
  %.0.in.lcssa = phi i64 [ %indvars.iv26, %.lr.ph19 ], [ %.0.in.lcssa.ph, %.critedge.loopexit ]
  %sext = shl i64 %.0.in.lcssa, 32
  %38 = ashr exact i64 %sext, 32
  %39 = getelementptr inbounds i32, i32* %0, i64 %38
  store i32 %21, i32* %39, align 4
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %40 = icmp sgt i64 %indvars.iv26, %19
  %indvars.iv.next = add i32 %indvars.iv, -1
  br i1 %40, label %.lr.ph19, label %.preheader.loopexit

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.critedge3
  %indvars.iv22 = phi i64 [ %10, %.lr.ph10.preheader ], [ %indvars.iv.next23, %.critedge3 ]
  %.129.in = phi i32 [ %3, %.lr.ph10.preheader ], [ %.129, %.critedge3 ]
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, -1
  %.129 = add nsw i32 %.129.in, -1
  %41 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next23
  %42 = load i32, i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %1, i64 %43
  %45 = load i32, i32* %44, align 4
  %46 = icmp sgt i32 %.129.in, %3
  br i1 %46, label %.critedge3, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph10
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %54
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %54 ], [ %indvars.iv22, %.lr.ph.preheader ]
  %.14 = phi i32 [ %57, %54 ], [ %.129.in, %.lr.ph.preheader ]
  %47 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv20
  %48 = load i32, i32* %47, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %1, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = icmp ugt i32 %45, %51
  %53 = trunc i64 %indvars.iv20 to i32
  br i1 %52, label %54, label %.critedge3.loopexit

; <label>:54:                                     ; preds = %.lr.ph
  %55 = add nsw i64 %indvars.iv20, -1
  %56 = getelementptr inbounds i32, i32* %0, i64 %55
  store i32 %48, i32* %56, align 4
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %57 = add nsw i32 %.14, 1
  %58 = icmp slt i64 %indvars.iv20, %11
  br i1 %58, label %.lr.ph, label %.critedge3.loopexit

.critedge3.loopexit:                              ; preds = %.lr.ph, %54
  %.1.lcssa.ph = phi i32 [ %57, %54 ], [ %53, %.lr.ph ]
  br label %.critedge3

.critedge3:                                       ; preds = %.critedge3.loopexit, %.lr.ph10
  %.1.lcssa = phi i32 [ %.129.in, %.lr.ph10 ], [ %.1.lcssa.ph, %.critedge3.loopexit ]
  %59 = add nsw i32 %.1.lcssa, -1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %0, i64 %60
  store i32 %42, i32* %61, align 4
  %62 = icmp sgt i64 %indvars.iv.next23, %12
  br i1 %62, label %.lr.ph10, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.critedge3
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @mainQSort3(i32*, i8* readonly, i16* nocapture readonly, i32, i32, i32, i32* nocapture) unnamed_addr #0 {
  %8 = alloca [100 x i32], align 16
  %9 = alloca [100 x i32], align 16
  %10 = alloca [100 x i32], align 16
  %11 = getelementptr inbounds [100 x i32], [100 x i32]* %8, i64 0, i64 0
  store i32 %4, i32* %11, align 16
  %12 = getelementptr inbounds [100 x i32], [100 x i32]* %9, i64 0, i64 0
  store i32 %5, i32* %12, align 16
  %13 = getelementptr inbounds [100 x i32], [100 x i32]* %10, i64 0, i64 0
  store i32 2, i32* %13, align 16
  %scevgep260 = getelementptr i32, i32* %0, i64 1
  %scevgep266 = getelementptr i32, i32* %0, i64 1
  %scevgep269 = getelementptr i32, i32* %0, i64 2
  %scevgep304 = getelementptr i32, i32* %0, i64 1
  %scevgep312 = getelementptr i32, i32* %0, i64 1
  br label %.lr.ph99

.lr.ph99:                                         ; preds = %7, %.outer43.backedge
  %.06.ph113 = phi i32 [ 1, %7 ], [ %.06.ph.be, %.outer43.backedge ]
  %14 = icmp slt i32 %.06.ph113, 98
  %15 = add nsw i32 %.06.ph113, -1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x i32], [100 x i32]* %8, i64 0, i64 %16
  %18 = getelementptr inbounds [100 x i32], [100 x i32]* %9, i64 0, i64 %16
  %19 = getelementptr inbounds [100 x i32], [100 x i32]* %10, i64 0, i64 %16
  br label %20

; <label>:20:                                     ; preds = %124, %.lr.ph99
  br i1 %14, label %22, label %21

; <label>:21:                                     ; preds = %20
  tail call void @BZ2_bz__AssertH__fail(i32 1001) #5
  br label %22

; <label>:22:                                     ; preds = %21, %20
  %23 = load i32, i32* %17, align 4
  %24 = load i32, i32* %18, align 4
  %25 = load i32, i32* %19, align 4
  %26 = sub nsw i32 %24, %23
  %27 = icmp slt i32 %26, 20
  %28 = icmp sgt i32 %25, 14
  %or.cond = or i1 %27, %28
  br i1 %or.cond, label %29, label %32

; <label>:29:                                     ; preds = %22
  tail call fastcc void @mainSimpleSort(i32* %0, i8* %1, i16* %2, i32 %3, i32 %23, i32 %24, i32 %25, i32* %6)
  %30 = load i32, i32* %6, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %.loopexit, label %.outer43.backedge

; <label>:32:                                     ; preds = %22
  %33 = sext i32 %23 to i64
  %34 = getelementptr inbounds i32, i32* %0, i64 %33
  %35 = load i32, i32* %34, align 4
  %36 = add i32 %35, %25
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %1, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = sext i32 %24 to i64
  %41 = getelementptr inbounds i32, i32* %0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = add i32 %42, %25
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %1, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = add nsw i32 %24, %23
  %48 = ashr i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %0, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = add i32 %51, %25
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %1, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = tail call fastcc zeroext i8 @mmed3(i8 zeroext %39, i8 zeroext %46, i8 zeroext %55)
  %57 = zext i8 %56 to i32
  br label %58

; <label>:58:                                     ; preds = %109, %32
  %.012 = phi i32 [ %24, %32 ], [ %110, %109 ]
  %.010 = phi i32 [ %23, %32 ], [ %.111.ph.lcssa, %109 ]
  %.08 = phi i32 [ %24, %32 ], [ %119, %109 ]
  %.07 = phi i32 [ %23, %32 ], [ %118, %109 ]
  %59 = icmp sgt i32 %.07, %.08
  br i1 %59, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %58
  %60 = sext i32 %.08 to i64
  %61 = sext i32 %.010 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.outer42
  %indvars.iv161 = phi i64 [ %61, %.lr.ph.preheader ], [ %indvars.iv.next162, %.outer42 ]
  %.1.ph76 = phi i32 [ %.07, %.lr.ph.preheader ], [ %81, %.outer42 ]
  %62 = sext i32 %.1.ph76 to i64
  br label %68

.preheader.loopexit115:                           ; preds = %.outer42
  %63 = trunc i64 %indvars.iv.next162 to i32
  br label %.preheader

.preheader.loopexit:                              ; preds = %83, %86
  %.1.lcssa.ph = phi i32 [ %85, %83 ], [ %87, %86 ]
  %64 = trunc i64 %indvars.iv161 to i32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader.loopexit115, %58
  %.111.ph.lcssa = phi i32 [ %.010, %58 ], [ %63, %.preheader.loopexit115 ], [ %64, %.preheader.loopexit ]
  %.1.lcssa = phi i32 [ %.07, %58 ], [ %81, %.preheader.loopexit115 ], [ %.1.lcssa.ph, %.preheader.loopexit ]
  %65 = icmp sgt i32 %.1.lcssa, %.08
  br i1 %65, label %.outer._crit_edge.loopexit350, label %.lr.ph80.preheader

.lr.ph80.preheader:                               ; preds = %.preheader
  %66 = sext i32 %.1.lcssa to i64
  %67 = sext i32 %.012 to i64
  br label %.lr.ph80

; <label>:68:                                     ; preds = %86, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %86 ], [ %62, %.lr.ph ]
  %.168 = phi i32 [ %87, %86 ], [ %.1.ph76, %.lr.ph ]
  %69 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %70 = load i32, i32* %69, align 4
  %71 = add i32 %70, %25
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %1, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = sub nsw i32 %75, %57
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %.outer42, label %83

.outer42:                                         ; preds = %68
  %78 = trunc i64 %indvars.iv to i32
  %79 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv161
  %80 = load i32, i32* %79, align 4
  store i32 %80, i32* %69, align 4
  store i32 %70, i32* %79, align 4
  %indvars.iv.next162 = add i64 %indvars.iv161, 1
  %81 = add nsw i32 %78, 1
  %82 = icmp slt i32 %78, %.08
  br i1 %82, label %.lr.ph, label %.preheader.loopexit115

; <label>:83:                                     ; preds = %68
  %84 = icmp sgt i32 %76, 0
  %85 = trunc i64 %indvars.iv to i32
  br i1 %84, label %.preheader.loopexit, label %86

; <label>:86:                                     ; preds = %83
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %87 = add nsw i32 %.168, 1
  %88 = icmp slt i64 %indvars.iv, %60
  br i1 %88, label %68, label %.preheader.loopexit

; <label>:89:                                     ; preds = %107, %.lr.ph80
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %107 ], [ %104, %.lr.ph80 ]
  %90 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv163
  %91 = load i32, i32* %90, align 4
  %92 = add i32 %91, %25
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %1, i64 %93
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = sub nsw i32 %96, %57
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %.outer, label %105

.outer:                                           ; preds = %89
  %99 = trunc i64 %indvars.iv163 to i32
  %100 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv165
  %101 = load i32, i32* %100, align 4
  store i32 %101, i32* %90, align 4
  store i32 %91, i32* %100, align 4
  %indvars.iv.next166 = add i64 %indvars.iv165, -1
  %102 = add nsw i32 %99, -1
  %103 = icmp slt i32 %.1.lcssa, %99
  br i1 %103, label %.lr.ph80, label %.outer._crit_edge.loopexit114

.lr.ph80:                                         ; preds = %.lr.ph80.preheader, %.outer
  %indvars.iv165 = phi i64 [ %67, %.lr.ph80.preheader ], [ %indvars.iv.next166, %.outer ]
  %.19.ph90 = phi i32 [ %.08, %.lr.ph80.preheader ], [ %102, %.outer ]
  %104 = sext i32 %.19.ph90 to i64
  br label %89

; <label>:105:                                    ; preds = %89
  %106 = icmp slt i32 %97, 0
  br i1 %106, label %109, label %107

; <label>:107:                                    ; preds = %105
  %indvars.iv.next164 = add nsw i64 %indvars.iv163, -1
  %108 = icmp slt i64 %66, %indvars.iv163
  br i1 %108, label %89, label %.outer._crit_edge.loopexit

; <label>:109:                                    ; preds = %105
  %110 = trunc i64 %indvars.iv165 to i32
  %111 = trunc i64 %indvars.iv163 to i32
  %112 = sext i32 %.1.lcssa to i64
  %113 = getelementptr inbounds i32, i32* %0, i64 %112
  %114 = load i32, i32* %113, align 4
  %sext = shl i64 %indvars.iv163, 32
  %115 = ashr exact i64 %sext, 32
  %116 = getelementptr inbounds i32, i32* %0, i64 %115
  %117 = load i32, i32* %116, align 4
  store i32 %117, i32* %113, align 4
  store i32 %114, i32* %116, align 4
  %118 = add nsw i32 %.1.lcssa, 1
  %119 = add nsw i32 %111, -1
  br label %58

.outer._crit_edge.loopexit:                       ; preds = %107
  %120 = trunc i64 %indvars.iv165 to i32
  %121 = trunc i64 %indvars.iv.next164 to i32
  br label %.outer._crit_edge

.outer._crit_edge.loopexit114:                    ; preds = %.outer
  %122 = trunc i64 %indvars.iv.next166 to i32
  br label %.outer._crit_edge

.outer._crit_edge.loopexit350:                    ; preds = %.preheader
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit350, %.outer._crit_edge.loopexit114, %.outer._crit_edge.loopexit
  %.113.ph.lcssa53 = phi i32 [ %120, %.outer._crit_edge.loopexit ], [ %122, %.outer._crit_edge.loopexit114 ], [ %.012, %.outer._crit_edge.loopexit350 ]
  %.19.lcssa = phi i32 [ %121, %.outer._crit_edge.loopexit ], [ %102, %.outer._crit_edge.loopexit114 ], [ %.08, %.outer._crit_edge.loopexit350 ]
  %123 = icmp slt i32 %.113.ph.lcssa53, %.111.ph.lcssa
  br i1 %123, label %124, label %126

; <label>:124:                                    ; preds = %.outer._crit_edge
  %125 = add nsw i32 %25, 1
  store i32 %125, i32* %19, align 4
  br label %20

; <label>:126:                                    ; preds = %.outer._crit_edge
  %127 = sub nsw i32 %.111.ph.lcssa, %23
  %128 = sub nsw i32 %.1.lcssa, %.111.ph.lcssa
  %129 = icmp slt i32 %127, %128
  %130 = select i1 %129, i32 %127, i32 %128
  %131 = icmp sgt i32 %130, 0
  br i1 %131, label %.lr.ph104.preheader, label %._crit_edge105

.lr.ph104.preheader:                              ; preds = %126
  %132 = sub nsw i32 %.1.lcssa, %130
  %133 = sext i32 %132 to i64
  %134 = sext i32 %23 to i64
  %135 = add i32 %23, -1
  %136 = sub i32 %135, %.111.ph.lcssa
  %137 = add i32 %.111.ph.lcssa, -1
  %138 = sub i32 %137, %.1.lcssa
  %139 = icmp sgt i32 %136, %138
  %smax293 = select i1 %139, i32 %136, i32 %138
  %140 = icmp sgt i32 %smax293, -2
  %smax294 = select i1 %140, i32 %smax293, i32 -2
  %141 = icmp sgt i32 %136, %138
  %smax295 = select i1 %141, i32 %136, i32 %138
  %142 = sub i32 %smax294, %smax295
  %143 = zext i32 %142 to i64
  %144 = add nuw nsw i64 %143, 1
  %min.iters.check296 = icmp ult i64 %144, 8
  br i1 %min.iters.check296, label %.lr.ph104.preheader352, label %min.iters.checked297

min.iters.checked297:                             ; preds = %.lr.ph104.preheader
  %n.vec299 = and i64 %144, 8589934584
  %cmp.zero300 = icmp eq i64 %n.vec299, 0
  br i1 %cmp.zero300, label %.lr.ph104.preheader352, label %vector.memcheck319

vector.memcheck319:                               ; preds = %min.iters.checked297
  %scevgep302 = getelementptr i32, i32* %0, i64 %134
  %145 = add i32 %23, -1
  %146 = sub i32 %145, %.111.ph.lcssa
  %147 = add i32 %.111.ph.lcssa, -1
  %148 = sub i32 %147, %.1.lcssa
  %149 = icmp sgt i32 %146, %148
  %smax305 = select i1 %149, i32 %146, i32 %148
  %150 = icmp sgt i32 %smax305, -2
  %smax306 = select i1 %150, i32 %smax305, i32 -2
  %151 = icmp sgt i32 %146, %148
  %smax307 = select i1 %151, i32 %146, i32 %148
  %152 = sub i32 %smax306, %smax307
  %153 = zext i32 %152 to i64
  %154 = add nsw i64 %134, %153
  %scevgep308 = getelementptr i32, i32* %scevgep304, i64 %154
  %scevgep310 = getelementptr i32, i32* %0, i64 %133
  %155 = add nsw i64 %133, %153
  %scevgep313 = getelementptr i32, i32* %scevgep312, i64 %155
  %bound0315 = icmp ult i32* %scevgep302, %scevgep313
  %bound1316 = icmp ult i32* %scevgep310, %scevgep308
  %memcheck.conflict318 = and i1 %bound0315, %bound1316
  %ind.end324 = add nsw i64 %134, %n.vec299
  %ind.end326 = add nsw i64 %133, %n.vec299
  %cast.crd328 = trunc i64 %n.vec299 to i32
  %ind.end329 = sub i32 %130, %cast.crd328
  br i1 %memcheck.conflict318, label %.lr.ph104.preheader352, label %vector.body290.preheader

vector.body290.preheader:                         ; preds = %vector.memcheck319
  %156 = add nsw i64 %n.vec299, -8
  %157 = lshr exact i64 %156, 3
  %158 = and i64 %157, 1
  %lcmp.mod = icmp eq i64 %158, 0
  br i1 %lcmp.mod, label %vector.body290.prol.preheader, label %vector.body290.prol.loopexit.unr-lcssa

vector.body290.prol.preheader:                    ; preds = %vector.body290.preheader
  br label %vector.body290.prol

vector.body290.prol:                              ; preds = %vector.body290.prol.preheader
  %159 = getelementptr inbounds i32, i32* %0, i64 %134
  %160 = bitcast i32* %159 to <4 x i32>*
  %wide.load346.prol = load <4 x i32>, <4 x i32>* %160, align 4, !alias.scope !19, !noalias !22
  %161 = getelementptr i32, i32* %159, i64 4
  %162 = bitcast i32* %161 to <4 x i32>*
  %wide.load347.prol = load <4 x i32>, <4 x i32>* %162, align 4, !alias.scope !19, !noalias !22
  %163 = getelementptr inbounds i32, i32* %0, i64 %133
  %164 = bitcast i32* %163 to <4 x i32>*
  %wide.load348.prol = load <4 x i32>, <4 x i32>* %164, align 4, !alias.scope !22
  %165 = getelementptr i32, i32* %163, i64 4
  %166 = bitcast i32* %165 to <4 x i32>*
  %wide.load349.prol = load <4 x i32>, <4 x i32>* %166, align 4, !alias.scope !22
  %167 = bitcast i32* %159 to <4 x i32>*
  store <4 x i32> %wide.load348.prol, <4 x i32>* %167, align 4, !alias.scope !19, !noalias !22
  %168 = bitcast i32* %161 to <4 x i32>*
  store <4 x i32> %wide.load349.prol, <4 x i32>* %168, align 4, !alias.scope !19, !noalias !22
  %169 = bitcast i32* %163 to <4 x i32>*
  store <4 x i32> %wide.load346.prol, <4 x i32>* %169, align 4, !alias.scope !22
  %170 = bitcast i32* %165 to <4 x i32>*
  store <4 x i32> %wide.load347.prol, <4 x i32>* %170, align 4, !alias.scope !22
  br label %vector.body290.prol.loopexit.unr-lcssa

vector.body290.prol.loopexit.unr-lcssa:           ; preds = %vector.body290.preheader, %vector.body290.prol
  %index321.unr.ph = phi i64 [ 8, %vector.body290.prol ], [ 0, %vector.body290.preheader ]
  br label %vector.body290.prol.loopexit

vector.body290.prol.loopexit:                     ; preds = %vector.body290.prol.loopexit.unr-lcssa
  %171 = icmp eq i64 %157, 0
  br i1 %171, label %middle.block291, label %vector.body290.preheader.new

vector.body290.preheader.new:                     ; preds = %vector.body290.prol.loopexit
  br label %vector.body290

vector.body290:                                   ; preds = %vector.body290, %vector.body290.preheader.new
  %index321 = phi i64 [ %index321.unr.ph, %vector.body290.preheader.new ], [ %index.next322.1, %vector.body290 ]
  %172 = add i64 %134, %index321
  %173 = add i64 %133, %index321
  %174 = getelementptr inbounds i32, i32* %0, i64 %172
  %175 = bitcast i32* %174 to <4 x i32>*
  %wide.load346 = load <4 x i32>, <4 x i32>* %175, align 4, !alias.scope !19, !noalias !22
  %176 = getelementptr i32, i32* %174, i64 4
  %177 = bitcast i32* %176 to <4 x i32>*
  %wide.load347 = load <4 x i32>, <4 x i32>* %177, align 4, !alias.scope !19, !noalias !22
  %178 = getelementptr inbounds i32, i32* %0, i64 %173
  %179 = bitcast i32* %178 to <4 x i32>*
  %wide.load348 = load <4 x i32>, <4 x i32>* %179, align 4, !alias.scope !22
  %180 = getelementptr i32, i32* %178, i64 4
  %181 = bitcast i32* %180 to <4 x i32>*
  %wide.load349 = load <4 x i32>, <4 x i32>* %181, align 4, !alias.scope !22
  %182 = bitcast i32* %174 to <4 x i32>*
  store <4 x i32> %wide.load348, <4 x i32>* %182, align 4, !alias.scope !19, !noalias !22
  %183 = bitcast i32* %176 to <4 x i32>*
  store <4 x i32> %wide.load349, <4 x i32>* %183, align 4, !alias.scope !19, !noalias !22
  %184 = bitcast i32* %178 to <4 x i32>*
  store <4 x i32> %wide.load346, <4 x i32>* %184, align 4, !alias.scope !22
  %185 = bitcast i32* %180 to <4 x i32>*
  store <4 x i32> %wide.load347, <4 x i32>* %185, align 4, !alias.scope !22
  %index.next322 = add i64 %index321, 8
  %186 = add i64 %134, %index.next322
  %187 = add i64 %133, %index.next322
  %188 = getelementptr inbounds i32, i32* %0, i64 %186
  %189 = bitcast i32* %188 to <4 x i32>*
  %wide.load346.1 = load <4 x i32>, <4 x i32>* %189, align 4, !alias.scope !19, !noalias !22
  %190 = getelementptr i32, i32* %188, i64 4
  %191 = bitcast i32* %190 to <4 x i32>*
  %wide.load347.1 = load <4 x i32>, <4 x i32>* %191, align 4, !alias.scope !19, !noalias !22
  %192 = getelementptr inbounds i32, i32* %0, i64 %187
  %193 = bitcast i32* %192 to <4 x i32>*
  %wide.load348.1 = load <4 x i32>, <4 x i32>* %193, align 4, !alias.scope !22
  %194 = getelementptr i32, i32* %192, i64 4
  %195 = bitcast i32* %194 to <4 x i32>*
  %wide.load349.1 = load <4 x i32>, <4 x i32>* %195, align 4, !alias.scope !22
  %196 = bitcast i32* %188 to <4 x i32>*
  store <4 x i32> %wide.load348.1, <4 x i32>* %196, align 4, !alias.scope !19, !noalias !22
  %197 = bitcast i32* %190 to <4 x i32>*
  store <4 x i32> %wide.load349.1, <4 x i32>* %197, align 4, !alias.scope !19, !noalias !22
  %198 = bitcast i32* %192 to <4 x i32>*
  store <4 x i32> %wide.load346.1, <4 x i32>* %198, align 4, !alias.scope !22
  %199 = bitcast i32* %194 to <4 x i32>*
  store <4 x i32> %wide.load347.1, <4 x i32>* %199, align 4, !alias.scope !22
  %index.next322.1 = add i64 %index321, 16
  %200 = icmp eq i64 %index.next322.1, %n.vec299
  br i1 %200, label %middle.block291.unr-lcssa, label %vector.body290, !llvm.loop !24

middle.block291.unr-lcssa:                        ; preds = %vector.body290
  br label %middle.block291

middle.block291:                                  ; preds = %vector.body290.prol.loopexit, %middle.block291.unr-lcssa
  %cmp.n330 = icmp eq i64 %144, %n.vec299
  br i1 %cmp.n330, label %._crit_edge105, label %.lr.ph104.preheader352

.lr.ph104.preheader352:                           ; preds = %middle.block291, %vector.memcheck319, %min.iters.checked297, %.lr.ph104.preheader
  %indvars.iv169.ph = phi i64 [ %134, %vector.memcheck319 ], [ %134, %min.iters.checked297 ], [ %134, %.lr.ph104.preheader ], [ %ind.end324, %middle.block291 ]
  %indvars.iv167.ph = phi i64 [ %133, %vector.memcheck319 ], [ %133, %min.iters.checked297 ], [ %133, %.lr.ph104.preheader ], [ %ind.end326, %middle.block291 ]
  %.03102.ph = phi i32 [ %130, %vector.memcheck319 ], [ %130, %min.iters.checked297 ], [ %130, %.lr.ph104.preheader ], [ %ind.end329, %middle.block291 ]
  br label %.lr.ph104

.lr.ph104:                                        ; preds = %.lr.ph104.preheader352, %.lr.ph104
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %.lr.ph104 ], [ %indvars.iv169.ph, %.lr.ph104.preheader352 ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %.lr.ph104 ], [ %indvars.iv167.ph, %.lr.ph104.preheader352 ]
  %.03102 = phi i32 [ %205, %.lr.ph104 ], [ %.03102.ph, %.lr.ph104.preheader352 ]
  %201 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv169
  %202 = load i32, i32* %201, align 4
  %203 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv167
  %204 = load i32, i32* %203, align 4
  store i32 %204, i32* %201, align 4
  store i32 %202, i32* %203, align 4
  %indvars.iv.next170 = add nsw i64 %indvars.iv169, 1
  %indvars.iv.next168 = add nsw i64 %indvars.iv167, 1
  %205 = add nsw i32 %.03102, -1
  %206 = icmp sgt i32 %.03102, 1
  br i1 %206, label %.lr.ph104, label %._crit_edge105.loopexit, !llvm.loop !25

._crit_edge105.loopexit:                          ; preds = %.lr.ph104
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit, %middle.block291, %126
  %207 = sub nsw i32 %24, %.113.ph.lcssa53
  %208 = sub nsw i32 %.113.ph.lcssa53, %.19.lcssa
  %209 = icmp slt i32 %207, %208
  %210 = select i1 %209, i32 %207, i32 %208
  %211 = icmp sgt i32 %210, 0
  br i1 %211, label %.lr.ph111.preheader, label %._crit_edge112

.lr.ph111.preheader:                              ; preds = %._crit_edge105
  %212 = sub nsw i32 %24, %210
  %213 = sext i32 %212 to i64
  %214 = sext i32 %.1.lcssa to i64
  %215 = add i32 %.113.ph.lcssa53, -1
  %216 = sub i32 %215, %24
  %217 = add i32 %.19.lcssa, -1
  %218 = sub i32 %217, %.113.ph.lcssa53
  %219 = icmp sgt i32 %216, %218
  %smax = select i1 %219, i32 %216, i32 %218
  %220 = icmp sgt i32 %smax, -2
  %smax257 = select i1 %220, i32 %smax, i32 -2
  %221 = icmp sgt i32 %216, %218
  %smax258 = select i1 %221, i32 %216, i32 %218
  %222 = sub i32 %smax257, %smax258
  %223 = zext i32 %222 to i64
  %224 = add nuw nsw i64 %223, 1
  %min.iters.check = icmp ult i64 %224, 8
  br i1 %min.iters.check, label %.lr.ph111.preheader351, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph111.preheader
  %n.vec = and i64 %224, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph111.preheader351, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i32, i32* %0, i64 %214
  %225 = add i32 %.113.ph.lcssa53, -1
  %226 = sub i32 %225, %24
  %227 = add i32 %.19.lcssa, -1
  %228 = sub i32 %227, %.113.ph.lcssa53
  %229 = icmp sgt i32 %226, %228
  %smax261 = select i1 %229, i32 %226, i32 %228
  %230 = icmp sgt i32 %smax261, -2
  %smax262 = select i1 %230, i32 %smax261, i32 -2
  %231 = icmp sgt i32 %226, %228
  %smax263 = select i1 %231, i32 %226, i32 %228
  %232 = sub i32 %smax262, %smax263
  %233 = zext i32 %232 to i64
  %234 = add nsw i64 %214, %233
  %scevgep264 = getelementptr i32, i32* %scevgep260, i64 %234
  %scevgep267 = getelementptr i32, i32* %scevgep266, i64 %213
  %235 = add nsw i64 %213, %233
  %scevgep270 = getelementptr i32, i32* %scevgep269, i64 %235
  %bound0 = icmp ult i32* %scevgep, %scevgep270
  %bound1 = icmp ult i32* %scevgep267, %scevgep264
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add nsw i64 %214, %n.vec
  %ind.end273 = add nsw i64 %213, %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end275 = sub i32 %210, %cast.crd
  br i1 %memcheck.conflict, label %.lr.ph111.preheader351, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %236 = add nsw i64 %n.vec, -8
  %237 = lshr exact i64 %236, 3
  %238 = and i64 %237, 1
  %lcmp.mod387 = icmp eq i64 %238, 0
  br i1 %lcmp.mod387, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %239 = add nsw i64 %213, 1
  %240 = getelementptr inbounds i32, i32* %0, i64 %214
  %241 = bitcast i32* %240 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %241, align 4, !alias.scope !26, !noalias !29
  %242 = getelementptr i32, i32* %240, i64 4
  %243 = bitcast i32* %242 to <4 x i32>*
  %wide.load287.prol = load <4 x i32>, <4 x i32>* %243, align 4, !alias.scope !26, !noalias !29
  %244 = getelementptr inbounds i32, i32* %0, i64 %239
  %245 = bitcast i32* %244 to <4 x i32>*
  %wide.load288.prol = load <4 x i32>, <4 x i32>* %245, align 4, !alias.scope !29
  %246 = getelementptr i32, i32* %244, i64 4
  %247 = bitcast i32* %246 to <4 x i32>*
  %wide.load289.prol = load <4 x i32>, <4 x i32>* %247, align 4, !alias.scope !29
  %248 = bitcast i32* %240 to <4 x i32>*
  store <4 x i32> %wide.load288.prol, <4 x i32>* %248, align 4, !alias.scope !26, !noalias !29
  %249 = bitcast i32* %242 to <4 x i32>*
  store <4 x i32> %wide.load289.prol, <4 x i32>* %249, align 4, !alias.scope !26, !noalias !29
  %250 = bitcast i32* %244 to <4 x i32>*
  store <4 x i32> %wide.load.prol, <4 x i32>* %250, align 4, !alias.scope !29
  %251 = bitcast i32* %246 to <4 x i32>*
  store <4 x i32> %wide.load287.prol, <4 x i32>* %251, align 4, !alias.scope !29
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %252 = icmp eq i64 %237, 0
  br i1 %252, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %253 = add i64 %214, %index
  %254 = add i64 %213, %index
  %255 = add nsw i64 %254, 1
  %256 = getelementptr inbounds i32, i32* %0, i64 %253
  %257 = bitcast i32* %256 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %257, align 4, !alias.scope !26, !noalias !29
  %258 = getelementptr i32, i32* %256, i64 4
  %259 = bitcast i32* %258 to <4 x i32>*
  %wide.load287 = load <4 x i32>, <4 x i32>* %259, align 4, !alias.scope !26, !noalias !29
  %260 = getelementptr inbounds i32, i32* %0, i64 %255
  %261 = bitcast i32* %260 to <4 x i32>*
  %wide.load288 = load <4 x i32>, <4 x i32>* %261, align 4, !alias.scope !29
  %262 = getelementptr i32, i32* %260, i64 4
  %263 = bitcast i32* %262 to <4 x i32>*
  %wide.load289 = load <4 x i32>, <4 x i32>* %263, align 4, !alias.scope !29
  %264 = bitcast i32* %256 to <4 x i32>*
  store <4 x i32> %wide.load288, <4 x i32>* %264, align 4, !alias.scope !26, !noalias !29
  %265 = bitcast i32* %258 to <4 x i32>*
  store <4 x i32> %wide.load289, <4 x i32>* %265, align 4, !alias.scope !26, !noalias !29
  %266 = bitcast i32* %260 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %266, align 4, !alias.scope !29
  %267 = bitcast i32* %262 to <4 x i32>*
  store <4 x i32> %wide.load287, <4 x i32>* %267, align 4, !alias.scope !29
  %index.next = add i64 %index, 8
  %268 = add i64 %214, %index.next
  %269 = add i64 %213, %index.next
  %270 = add nsw i64 %269, 1
  %271 = getelementptr inbounds i32, i32* %0, i64 %268
  %272 = bitcast i32* %271 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %272, align 4, !alias.scope !26, !noalias !29
  %273 = getelementptr i32, i32* %271, i64 4
  %274 = bitcast i32* %273 to <4 x i32>*
  %wide.load287.1 = load <4 x i32>, <4 x i32>* %274, align 4, !alias.scope !26, !noalias !29
  %275 = getelementptr inbounds i32, i32* %0, i64 %270
  %276 = bitcast i32* %275 to <4 x i32>*
  %wide.load288.1 = load <4 x i32>, <4 x i32>* %276, align 4, !alias.scope !29
  %277 = getelementptr i32, i32* %275, i64 4
  %278 = bitcast i32* %277 to <4 x i32>*
  %wide.load289.1 = load <4 x i32>, <4 x i32>* %278, align 4, !alias.scope !29
  %279 = bitcast i32* %271 to <4 x i32>*
  store <4 x i32> %wide.load288.1, <4 x i32>* %279, align 4, !alias.scope !26, !noalias !29
  %280 = bitcast i32* %273 to <4 x i32>*
  store <4 x i32> %wide.load289.1, <4 x i32>* %280, align 4, !alias.scope !26, !noalias !29
  %281 = bitcast i32* %275 to <4 x i32>*
  store <4 x i32> %wide.load.1, <4 x i32>* %281, align 4, !alias.scope !29
  %282 = bitcast i32* %277 to <4 x i32>*
  store <4 x i32> %wide.load287.1, <4 x i32>* %282, align 4, !alias.scope !29
  %index.next.1 = add i64 %index, 16
  %283 = icmp eq i64 %index.next.1, %n.vec
  br i1 %283, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !31

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %224, %n.vec
  br i1 %cmp.n, label %._crit_edge112, label %.lr.ph111.preheader351

.lr.ph111.preheader351:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph111.preheader
  %indvars.iv175.ph = phi i64 [ %214, %vector.memcheck ], [ %214, %min.iters.checked ], [ %214, %.lr.ph111.preheader ], [ %ind.end, %middle.block ]
  %indvars.iv173.ph = phi i64 [ %213, %vector.memcheck ], [ %213, %min.iters.checked ], [ %213, %.lr.ph111.preheader ], [ %ind.end273, %middle.block ]
  %.0108.ph = phi i32 [ %210, %vector.memcheck ], [ %210, %min.iters.checked ], [ %210, %.lr.ph111.preheader ], [ %ind.end275, %middle.block ]
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111.preheader351, %.lr.ph111
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %.lr.ph111 ], [ %indvars.iv175.ph, %.lr.ph111.preheader351 ]
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %.lr.ph111 ], [ %indvars.iv173.ph, %.lr.ph111.preheader351 ]
  %.0108 = phi i32 [ %288, %.lr.ph111 ], [ %.0108.ph, %.lr.ph111.preheader351 ]
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, 1
  %284 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv175
  %285 = load i32, i32* %284, align 4
  %286 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next174
  %287 = load i32, i32* %286, align 4
  store i32 %287, i32* %284, align 4
  store i32 %285, i32* %286, align 4
  %indvars.iv.next176 = add nsw i64 %indvars.iv175, 1
  %288 = add nsw i32 %.0108, -1
  %289 = icmp sgt i32 %.0108, 1
  br i1 %289, label %.lr.ph111, label %._crit_edge112.loopexit, !llvm.loop !32

._crit_edge112.loopexit:                          ; preds = %.lr.ph111
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %middle.block, %._crit_edge105
  %290 = sub i32 %23, %.111.ph.lcssa
  %291 = add i32 %290, %.1.lcssa
  %292 = add nsw i32 %291, -1
  %293 = sub i32 %.19.lcssa, %.113.ph.lcssa53
  %294 = add i32 %293, %24
  %295 = add nsw i32 %294, 1
  %296 = add nsw i32 %25, 1
  %297 = sub nsw i32 %292, %23
  %298 = sub nsw i32 %24, %295
  %299 = icmp slt i32 %297, %298
  %. = select i1 %299, i32 %23, i32 %295
  %.36 = select i1 %299, i32 %295, i32 %23
  %.37 = select i1 %299, i32 %292, i32 %24
  %.38 = select i1 %299, i32 %24, i32 %292
  %300 = sub nsw i32 %.37, %.
  %301 = sub nsw i32 %294, %291
  %302 = icmp slt i32 %300, %301
  %.. = select i1 %302, i32 %., i32 %291
  %..39 = select i1 %302, i32 %291, i32 %.
  %.37. = select i1 %302, i32 %.37, i32 %294
  %..37 = select i1 %302, i32 %294, i32 %.37
  %.40 = select i1 %302, i32 %25, i32 %296
  %.41 = select i1 %302, i32 %296, i32 %25
  %303 = sub nsw i32 %.38, %.36
  %304 = sub nsw i32 %..37, %..39
  %305 = icmp slt i32 %303, %304
  %.36..sroa.825.1 = select i1 %305, i32 %.36, i32 %..39
  %.sroa.825.1..36 = select i1 %305, i32 %..39, i32 %.36
  %.38..sroa.8.1 = select i1 %305, i32 %.38, i32 %..37
  %.sroa.8.1..38 = select i1 %305, i32 %..37, i32 %.38
  %..sroa.6.1 = select i1 %305, i32 %25, i32 %.41
  %.sroa.6.1. = select i1 %305, i32 %.41, i32 %25
  store i32 %.sroa.825.1..36, i32* %17, align 4
  store i32 %.sroa.8.1..38, i32* %18, align 4
  store i32 %.sroa.6.1., i32* %19, align 4
  %306 = sext i32 %.06.ph113 to i64
  %307 = getelementptr inbounds [100 x i32], [100 x i32]* %8, i64 0, i64 %306
  store i32 %.36..sroa.825.1, i32* %307, align 4
  %308 = getelementptr inbounds [100 x i32], [100 x i32]* %9, i64 0, i64 %306
  store i32 %.38..sroa.8.1, i32* %308, align 4
  %309 = getelementptr inbounds [100 x i32], [100 x i32]* %10, i64 0, i64 %306
  store i32 %..sroa.6.1, i32* %309, align 4
  %310 = add nsw i32 %.06.ph113, 1
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [100 x i32], [100 x i32]* %8, i64 0, i64 %311
  store i32 %.., i32* %312, align 4
  %313 = getelementptr inbounds [100 x i32], [100 x i32]* %9, i64 0, i64 %311
  store i32 %.37., i32* %313, align 4
  %314 = getelementptr inbounds [100 x i32], [100 x i32]* %10, i64 0, i64 %311
  store i32 %.40, i32* %314, align 4
  %315 = add nsw i32 %.06.ph113, 2
  br label %.outer43.backedge

.outer43.backedge:                                ; preds = %._crit_edge112, %29
  %.06.ph.be = phi i32 [ %15, %29 ], [ %315, %._crit_edge112 ]
  %316 = icmp sgt i32 %.06.ph.be, 0
  br i1 %316, label %.lr.ph99, label %.loopexit

.loopexit:                                        ; preds = %29, %.outer43.backedge
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @mainSimpleSort(i32* nocapture, i8* readonly, i16* nocapture readonly, i32, i32, i32, i32, i32* nocapture) unnamed_addr #3 {
  %9 = sub nsw i32 %5, %4
  %10 = add nsw i32 %9, 1
  %11 = icmp slt i32 %10, 2
  br i1 %11, label %.loopexit4, label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %8
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %.preheader6
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.preheader6 ], [ 0, %.preheader6.preheader ]
  %12 = getelementptr inbounds [14 x i32], [14 x i32]* @incs, i64 0, i64 %indvars.iv16
  %13 = load i32, i32* %12, align 4
  %14 = icmp sgt i32 %13, %9
  %indvars.iv.next17 = add nuw i64 %indvars.iv16, 1
  br i1 %14, label %.preheader, label %.preheader6

.preheader:                                       ; preds = %.preheader6
  %15 = trunc i64 %indvars.iv16 to i32
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph12.preheader, label %.loopexit4

.lr.ph12.preheader:                               ; preds = %.preheader
  %17 = sext i32 %5 to i64
  %18 = sext i32 %5 to i64
  %19 = sext i32 %5 to i64
  %sext = shl i64 %indvars.iv16, 32
  %20 = ashr exact i64 %sext, 32
  br label %.lr.ph12

.loopexit.loopexit:                               ; preds = %27, %46, %69
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph12
  %21 = icmp sgt i64 %indvars.iv14, 1
  br i1 %21, label %.lr.ph12, label %.loopexit4.loopexit20

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %.loopexit
  %indvars.iv14 = phi i64 [ %20, %.lr.ph12.preheader ], [ %indvars.iv.next15, %.loopexit ]
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, -1
  %22 = getelementptr inbounds [14 x i32], [14 x i32]* @incs, i64 0, i64 %indvars.iv.next15
  %23 = load i32, i32* %22, align 4
  %24 = add nsw i32 %23, %4
  %25 = icmp sgt i32 %24, %5
  br i1 %25, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph12
  %26 = sext i32 %24 to i64
  br label %.lr.ph

; <label>:27:                                     ; preds = %92
  %28 = icmp sgt i64 %indvars.iv.next, %17
  br i1 %28, label %.loopexit.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %27
  %indvars.iv = phi i64 [ %26, %.lr.ph.preheader ], [ %indvars.iv.next, %27 ]
  %29 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %30, %6
  %32 = trunc i64 %indvars.iv to i32
  br label %33

; <label>:33:                                     ; preds = %41, %.lr.ph
  %.01 = phi i32 [ %32, %.lr.ph ], [ %34, %41 ]
  %34 = sub nsw i32 %.01, %23
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32* %0, i64 %35
  %37 = load i32, i32* %36, align 4
  %38 = add i32 %37, %6
  %39 = tail call fastcc zeroext i8 @mainGtU(i32 %38, i32 %31, i8* %1, i16* %2, i32 %3, i32* %7)
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %46, label %41

; <label>:41:                                     ; preds = %33
  %42 = load i32, i32* %36, align 4
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds i32, i32* %0, i64 %43
  store i32 %42, i32* %44, align 4
  %45 = icmp slt i32 %34, %24
  br i1 %45, label %46, label %33

; <label>:46:                                     ; preds = %41, %33
  %.12 = phi i32 [ %.01, %33 ], [ %34, %41 ]
  %47 = sext i32 %.12 to i64
  %48 = getelementptr inbounds i32, i32* %0, i64 %47
  store i32 %30, i32* %48, align 4
  %49 = add nsw i64 %indvars.iv, 1
  %50 = icmp slt i64 %indvars.iv, %19
  br i1 %50, label %51, label %.loopexit.loopexit

; <label>:51:                                     ; preds = %46
  %52 = getelementptr inbounds i32, i32* %0, i64 %49
  %53 = load i32, i32* %52, align 4
  %54 = add i32 %53, %6
  %55 = trunc i64 %49 to i32
  br label %56

; <label>:56:                                     ; preds = %64, %51
  %.2 = phi i32 [ %55, %51 ], [ %57, %64 ]
  %57 = sub nsw i32 %.2, %23
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %0, i64 %58
  %60 = load i32, i32* %59, align 4
  %61 = add i32 %60, %6
  %62 = tail call fastcc zeroext i8 @mainGtU(i32 %61, i32 %54, i8* %1, i16* %2, i32 %3, i32* %7)
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %56
  %65 = load i32, i32* %59, align 4
  %66 = sext i32 %.2 to i64
  %67 = getelementptr inbounds i32, i32* %0, i64 %66
  store i32 %65, i32* %67, align 4
  %68 = icmp slt i32 %57, %24
  br i1 %68, label %69, label %56

; <label>:69:                                     ; preds = %64, %56
  %.3 = phi i32 [ %.2, %56 ], [ %57, %64 ]
  %70 = sext i32 %.3 to i64
  %71 = getelementptr inbounds i32, i32* %0, i64 %70
  store i32 %53, i32* %71, align 4
  %72 = add nsw i64 %indvars.iv, 2
  %73 = icmp sgt i64 %72, %18
  br i1 %73, label %.loopexit.loopexit, label %74

; <label>:74:                                     ; preds = %69
  %75 = getelementptr inbounds i32, i32* %0, i64 %72
  %76 = load i32, i32* %75, align 4
  %77 = add i32 %76, %6
  %78 = trunc i64 %72 to i32
  br label %79

; <label>:79:                                     ; preds = %87, %74
  %.4 = phi i32 [ %78, %74 ], [ %80, %87 ]
  %80 = sub nsw i32 %.4, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %0, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = add i32 %83, %6
  %85 = tail call fastcc zeroext i8 @mainGtU(i32 %84, i32 %77, i8* %1, i16* %2, i32 %3, i32* %7)
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %92, label %87

; <label>:87:                                     ; preds = %79
  %88 = load i32, i32* %82, align 4
  %89 = sext i32 %.4 to i64
  %90 = getelementptr inbounds i32, i32* %0, i64 %89
  store i32 %88, i32* %90, align 4
  %91 = icmp slt i32 %80, %24
  br i1 %91, label %92, label %79

; <label>:92:                                     ; preds = %87, %79
  %.5 = phi i32 [ %.4, %79 ], [ %80, %87 ]
  %93 = sext i32 %.5 to i64
  %94 = getelementptr inbounds i32, i32* %0, i64 %93
  store i32 %76, i32* %94, align 4
  %95 = load i32, i32* %7, align 4
  %96 = icmp slt i32 %95, 0
  %indvars.iv.next = add i64 %indvars.iv, 3
  br i1 %96, label %.loopexit4.loopexit, label %27

.loopexit4.loopexit:                              ; preds = %92
  br label %.loopexit4

.loopexit4.loopexit20:                            ; preds = %.loopexit
  br label %.loopexit4

.loopexit4:                                       ; preds = %.loopexit4.loopexit20, %.loopexit4.loopexit, %.preheader, %8
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal fastcc zeroext i8 @mmed3(i8 zeroext, i8 zeroext, i8 zeroext) unnamed_addr #4 {
  %4 = icmp ugt i8 %0, %1
  %. = select i1 %4, i8 %0, i8 %1
  %.3 = select i1 %4, i8 %1, i8 %0
  %5 = icmp ugt i8 %., %2
  %6 = icmp ugt i8 %.3, %2
  %.3. = select i1 %6, i8 %.3, i8 %2
  %.2 = select i1 %5, i8 %.3., i8 %.
  ret i8 %.2
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc zeroext i8 @mainGtU(i32, i32, i8* readonly, i16* nocapture readonly, i32, i32* nocapture) unnamed_addr #3 {
  %7 = zext i32 %0 to i64
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = zext i32 %1 to i64
  %11 = getelementptr inbounds i8, i8* %2, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = icmp eq i8 %9, %12
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %6
  %15 = icmp ugt i8 %9, %12
  br label %.loopexit

; <label>:16:                                     ; preds = %6
  %17 = add i32 %0, 1
  %18 = add i32 %1, 1
  %19 = zext i32 %17 to i64
  %20 = getelementptr inbounds i8, i8* %2, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = zext i32 %18 to i64
  %23 = getelementptr inbounds i8, i8* %2, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = icmp eq i8 %21, %24
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %16
  %27 = icmp ugt i8 %21, %24
  br label %.loopexit

; <label>:28:                                     ; preds = %16
  %29 = add i32 %0, 2
  %30 = add i32 %1, 2
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds i8, i8* %2, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = zext i32 %30 to i64
  %35 = getelementptr inbounds i8, i8* %2, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = icmp eq i8 %33, %36
  br i1 %37, label %40, label %38

; <label>:38:                                     ; preds = %28
  %39 = icmp ugt i8 %33, %36
  br label %.loopexit

; <label>:40:                                     ; preds = %28
  %41 = add i32 %0, 3
  %42 = add i32 %1, 3
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i8, i8* %2, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i32 %42 to i64
  %47 = getelementptr inbounds i8, i8* %2, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = icmp eq i8 %45, %48
  br i1 %49, label %52, label %50

; <label>:50:                                     ; preds = %40
  %51 = icmp ugt i8 %45, %48
  br label %.loopexit

; <label>:52:                                     ; preds = %40
  %53 = add i32 %0, 4
  %54 = add i32 %1, 4
  %55 = zext i32 %53 to i64
  %56 = getelementptr inbounds i8, i8* %2, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i32 %54 to i64
  %59 = getelementptr inbounds i8, i8* %2, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = icmp eq i8 %57, %60
  br i1 %61, label %64, label %62

; <label>:62:                                     ; preds = %52
  %63 = icmp ugt i8 %57, %60
  br label %.loopexit

; <label>:64:                                     ; preds = %52
  %65 = add i32 %0, 5
  %66 = add i32 %1, 5
  %67 = zext i32 %65 to i64
  %68 = getelementptr inbounds i8, i8* %2, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = zext i32 %66 to i64
  %71 = getelementptr inbounds i8, i8* %2, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = icmp eq i8 %69, %72
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %64
  %75 = icmp ugt i8 %69, %72
  br label %.loopexit

; <label>:76:                                     ; preds = %64
  %77 = add i32 %0, 6
  %78 = add i32 %1, 6
  %79 = zext i32 %77 to i64
  %80 = getelementptr inbounds i8, i8* %2, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = zext i32 %78 to i64
  %83 = getelementptr inbounds i8, i8* %2, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = icmp eq i8 %81, %84
  br i1 %85, label %88, label %86

; <label>:86:                                     ; preds = %76
  %87 = icmp ugt i8 %81, %84
  br label %.loopexit

; <label>:88:                                     ; preds = %76
  %89 = add i32 %0, 7
  %90 = add i32 %1, 7
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds i8, i8* %2, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i32 %90 to i64
  %95 = getelementptr inbounds i8, i8* %2, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = icmp eq i8 %93, %96
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %88
  %99 = icmp ugt i8 %93, %96
  br label %.loopexit

; <label>:100:                                    ; preds = %88
  %101 = add i32 %0, 8
  %102 = add i32 %1, 8
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds i8, i8* %2, i64 %103
  %105 = load i8, i8* %104, align 1
  %106 = zext i32 %102 to i64
  %107 = getelementptr inbounds i8, i8* %2, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = icmp eq i8 %105, %108
  br i1 %109, label %112, label %110

; <label>:110:                                    ; preds = %100
  %111 = icmp ugt i8 %105, %108
  br label %.loopexit

; <label>:112:                                    ; preds = %100
  %113 = add i32 %0, 9
  %114 = add i32 %1, 9
  %115 = zext i32 %113 to i64
  %116 = getelementptr inbounds i8, i8* %2, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i32 %114 to i64
  %119 = getelementptr inbounds i8, i8* %2, i64 %118
  %120 = load i8, i8* %119, align 1
  %121 = icmp eq i8 %117, %120
  br i1 %121, label %124, label %122

; <label>:122:                                    ; preds = %112
  %123 = icmp ugt i8 %117, %120
  br label %.loopexit

; <label>:124:                                    ; preds = %112
  %125 = add i32 %0, 10
  %126 = add i32 %1, 10
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i8, i8* %2, i64 %127
  %129 = load i8, i8* %128, align 1
  %130 = zext i32 %126 to i64
  %131 = getelementptr inbounds i8, i8* %2, i64 %130
  %132 = load i8, i8* %131, align 1
  %133 = icmp eq i8 %129, %132
  br i1 %133, label %136, label %134

; <label>:134:                                    ; preds = %124
  %135 = icmp ugt i8 %129, %132
  br label %.loopexit

; <label>:136:                                    ; preds = %124
  %137 = add i32 %0, 11
  %138 = add i32 %1, 11
  %139 = zext i32 %137 to i64
  %140 = getelementptr inbounds i8, i8* %2, i64 %139
  %141 = load i8, i8* %140, align 1
  %142 = zext i32 %138 to i64
  %143 = getelementptr inbounds i8, i8* %2, i64 %142
  %144 = load i8, i8* %143, align 1
  %145 = icmp eq i8 %141, %144
  br i1 %145, label %148, label %146

; <label>:146:                                    ; preds = %136
  %147 = icmp ugt i8 %141, %144
  br label %.loopexit

; <label>:148:                                    ; preds = %136
  %149 = add i32 %0, 12
  %150 = add i32 %1, 12
  %151 = add i32 %4, 8
  br label %152

; <label>:152:                                    ; preds = %310, %148
  %.04 = phi i32 [ %151, %148 ], [ %317, %310 ]
  %.02 = phi i32 [ %150, %148 ], [ %.13, %310 ]
  %.01 = phi i32 [ %149, %148 ], [ %., %310 ]
  %153 = zext i32 %.01 to i64
  %154 = getelementptr inbounds i8, i8* %2, i64 %153
  %155 = load i8, i8* %154, align 1
  %156 = zext i32 %.02 to i64
  %157 = getelementptr inbounds i8, i8* %2, i64 %156
  %158 = load i8, i8* %157, align 1
  %159 = icmp eq i8 %155, %158
  br i1 %159, label %162, label %160

; <label>:160:                                    ; preds = %152
  %161 = icmp ugt i8 %155, %158
  br label %.loopexit

; <label>:162:                                    ; preds = %152
  %163 = getelementptr inbounds i16, i16* %3, i64 %153
  %164 = load i16, i16* %163, align 2
  %165 = getelementptr inbounds i16, i16* %3, i64 %156
  %166 = load i16, i16* %165, align 2
  %167 = icmp eq i16 %164, %166
  br i1 %167, label %170, label %168

; <label>:168:                                    ; preds = %162
  %169 = icmp ugt i16 %164, %166
  br label %.loopexit

; <label>:170:                                    ; preds = %162
  %171 = add i32 %.01, 1
  %172 = add i32 %.02, 1
  %173 = zext i32 %171 to i64
  %174 = getelementptr inbounds i8, i8* %2, i64 %173
  %175 = load i8, i8* %174, align 1
  %176 = zext i32 %172 to i64
  %177 = getelementptr inbounds i8, i8* %2, i64 %176
  %178 = load i8, i8* %177, align 1
  %179 = icmp eq i8 %175, %178
  br i1 %179, label %182, label %180

; <label>:180:                                    ; preds = %170
  %181 = icmp ugt i8 %175, %178
  br label %.loopexit

; <label>:182:                                    ; preds = %170
  %183 = getelementptr inbounds i16, i16* %3, i64 %173
  %184 = load i16, i16* %183, align 2
  %185 = getelementptr inbounds i16, i16* %3, i64 %176
  %186 = load i16, i16* %185, align 2
  %187 = icmp eq i16 %184, %186
  br i1 %187, label %190, label %188

; <label>:188:                                    ; preds = %182
  %189 = icmp ugt i16 %184, %186
  br label %.loopexit

; <label>:190:                                    ; preds = %182
  %191 = add i32 %.01, 2
  %192 = add i32 %.02, 2
  %193 = zext i32 %191 to i64
  %194 = getelementptr inbounds i8, i8* %2, i64 %193
  %195 = load i8, i8* %194, align 1
  %196 = zext i32 %192 to i64
  %197 = getelementptr inbounds i8, i8* %2, i64 %196
  %198 = load i8, i8* %197, align 1
  %199 = icmp eq i8 %195, %198
  br i1 %199, label %202, label %200

; <label>:200:                                    ; preds = %190
  %201 = icmp ugt i8 %195, %198
  br label %.loopexit

; <label>:202:                                    ; preds = %190
  %203 = getelementptr inbounds i16, i16* %3, i64 %193
  %204 = load i16, i16* %203, align 2
  %205 = getelementptr inbounds i16, i16* %3, i64 %196
  %206 = load i16, i16* %205, align 2
  %207 = icmp eq i16 %204, %206
  br i1 %207, label %210, label %208

; <label>:208:                                    ; preds = %202
  %209 = icmp ugt i16 %204, %206
  br label %.loopexit

; <label>:210:                                    ; preds = %202
  %211 = add i32 %.01, 3
  %212 = add i32 %.02, 3
  %213 = zext i32 %211 to i64
  %214 = getelementptr inbounds i8, i8* %2, i64 %213
  %215 = load i8, i8* %214, align 1
  %216 = zext i32 %212 to i64
  %217 = getelementptr inbounds i8, i8* %2, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = icmp eq i8 %215, %218
  br i1 %219, label %222, label %220

; <label>:220:                                    ; preds = %210
  %221 = icmp ugt i8 %215, %218
  br label %.loopexit

; <label>:222:                                    ; preds = %210
  %223 = getelementptr inbounds i16, i16* %3, i64 %213
  %224 = load i16, i16* %223, align 2
  %225 = getelementptr inbounds i16, i16* %3, i64 %216
  %226 = load i16, i16* %225, align 2
  %227 = icmp eq i16 %224, %226
  br i1 %227, label %230, label %228

; <label>:228:                                    ; preds = %222
  %229 = icmp ugt i16 %224, %226
  br label %.loopexit

; <label>:230:                                    ; preds = %222
  %231 = add i32 %.01, 4
  %232 = add i32 %.02, 4
  %233 = zext i32 %231 to i64
  %234 = getelementptr inbounds i8, i8* %2, i64 %233
  %235 = load i8, i8* %234, align 1
  %236 = zext i32 %232 to i64
  %237 = getelementptr inbounds i8, i8* %2, i64 %236
  %238 = load i8, i8* %237, align 1
  %239 = icmp eq i8 %235, %238
  br i1 %239, label %242, label %240

; <label>:240:                                    ; preds = %230
  %241 = icmp ugt i8 %235, %238
  br label %.loopexit

; <label>:242:                                    ; preds = %230
  %243 = getelementptr inbounds i16, i16* %3, i64 %233
  %244 = load i16, i16* %243, align 2
  %245 = getelementptr inbounds i16, i16* %3, i64 %236
  %246 = load i16, i16* %245, align 2
  %247 = icmp eq i16 %244, %246
  br i1 %247, label %250, label %248

; <label>:248:                                    ; preds = %242
  %249 = icmp ugt i16 %244, %246
  br label %.loopexit

; <label>:250:                                    ; preds = %242
  %251 = add i32 %.01, 5
  %252 = add i32 %.02, 5
  %253 = zext i32 %251 to i64
  %254 = getelementptr inbounds i8, i8* %2, i64 %253
  %255 = load i8, i8* %254, align 1
  %256 = zext i32 %252 to i64
  %257 = getelementptr inbounds i8, i8* %2, i64 %256
  %258 = load i8, i8* %257, align 1
  %259 = icmp eq i8 %255, %258
  br i1 %259, label %262, label %260

; <label>:260:                                    ; preds = %250
  %261 = icmp ugt i8 %255, %258
  br label %.loopexit

; <label>:262:                                    ; preds = %250
  %263 = getelementptr inbounds i16, i16* %3, i64 %253
  %264 = load i16, i16* %263, align 2
  %265 = getelementptr inbounds i16, i16* %3, i64 %256
  %266 = load i16, i16* %265, align 2
  %267 = icmp eq i16 %264, %266
  br i1 %267, label %270, label %268

; <label>:268:                                    ; preds = %262
  %269 = icmp ugt i16 %264, %266
  br label %.loopexit

; <label>:270:                                    ; preds = %262
  %271 = add i32 %.01, 6
  %272 = add i32 %.02, 6
  %273 = zext i32 %271 to i64
  %274 = getelementptr inbounds i8, i8* %2, i64 %273
  %275 = load i8, i8* %274, align 1
  %276 = zext i32 %272 to i64
  %277 = getelementptr inbounds i8, i8* %2, i64 %276
  %278 = load i8, i8* %277, align 1
  %279 = icmp eq i8 %275, %278
  br i1 %279, label %282, label %280

; <label>:280:                                    ; preds = %270
  %281 = icmp ugt i8 %275, %278
  br label %.loopexit

; <label>:282:                                    ; preds = %270
  %283 = getelementptr inbounds i16, i16* %3, i64 %273
  %284 = load i16, i16* %283, align 2
  %285 = getelementptr inbounds i16, i16* %3, i64 %276
  %286 = load i16, i16* %285, align 2
  %287 = icmp eq i16 %284, %286
  br i1 %287, label %290, label %288

; <label>:288:                                    ; preds = %282
  %289 = icmp ugt i16 %284, %286
  br label %.loopexit

; <label>:290:                                    ; preds = %282
  %291 = add i32 %.01, 7
  %292 = add i32 %.02, 7
  %293 = zext i32 %291 to i64
  %294 = getelementptr inbounds i8, i8* %2, i64 %293
  %295 = load i8, i8* %294, align 1
  %296 = zext i32 %292 to i64
  %297 = getelementptr inbounds i8, i8* %2, i64 %296
  %298 = load i8, i8* %297, align 1
  %299 = icmp eq i8 %295, %298
  br i1 %299, label %302, label %300

; <label>:300:                                    ; preds = %290
  %301 = icmp ugt i8 %295, %298
  br label %.loopexit

; <label>:302:                                    ; preds = %290
  %303 = getelementptr inbounds i16, i16* %3, i64 %293
  %304 = load i16, i16* %303, align 2
  %305 = getelementptr inbounds i16, i16* %3, i64 %296
  %306 = load i16, i16* %305, align 2
  %307 = icmp eq i16 %304, %306
  br i1 %307, label %310, label %308

; <label>:308:                                    ; preds = %302
  %309 = icmp ugt i16 %304, %306
  br label %.loopexit

; <label>:310:                                    ; preds = %302
  %311 = add i32 %.01, 8
  %312 = add i32 %.02, 8
  %313 = icmp ult i32 %311, %4
  %314 = select i1 %313, i32 0, i32 %4
  %. = sub i32 %311, %314
  %315 = icmp ult i32 %312, %4
  %316 = select i1 %315, i32 0, i32 %4
  %.13 = sub i32 %312, %316
  %317 = add nsw i32 %.04, -8
  %318 = load i32, i32* %5, align 4
  %319 = add nsw i32 %318, -1
  store i32 %319, i32* %5, align 4
  %320 = icmp sgt i32 %317, -1
  br i1 %320, label %152, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %310
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %308, %300, %288, %280, %268, %260, %248, %240, %228, %220, %208, %200, %188, %180, %168, %160, %146, %134, %122, %110, %98, %86, %74, %62, %50, %38, %26, %14
  %.0.shrunk = phi i1 [ %15, %14 ], [ %27, %26 ], [ %39, %38 ], [ %51, %50 ], [ %63, %62 ], [ %75, %74 ], [ %87, %86 ], [ %99, %98 ], [ %111, %110 ], [ %123, %122 ], [ %135, %134 ], [ %147, %146 ], [ %161, %160 ], [ %169, %168 ], [ %181, %180 ], [ %189, %188 ], [ %201, %200 ], [ %209, %208 ], [ %221, %220 ], [ %229, %228 ], [ %241, %240 ], [ %249, %248 ], [ %261, %260 ], [ %269, %268 ], [ %281, %280 ], [ %289, %288 ], [ %301, %300 ], [ %309, %308 ], [ false, %.loopexit.loopexit ]
  %.0 = zext i1 %.0.shrunk to i8
  ret i8 %.0
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { argmemonly nounwind }
attributes #7 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !9, !10}
!25 = distinct !{!25, !9, !10}
!26 = !{!27}
!27 = distinct !{!27, !28}
!28 = distinct !{!28, !"LVerDomain"}
!29 = !{!30}
!30 = distinct !{!30, !28}
!31 = distinct !{!31, !9, !10}
!32 = distinct !{!32, !9, !10}
