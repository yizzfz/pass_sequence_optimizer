; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph47.preheader:
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.lr.ph47.preheader, %.lr.ph47
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %.lr.ph47 ], [ 0, %.lr.ph47.preheader ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv99
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv99
  %8 = bitcast double* %7 to <2 x double>*
  %9 = trunc i64 %indvars.iv99 to i32
  %10 = or i32 %9, 1
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv99
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %13 = trunc i64 %indvars.iv.next100.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, 2000
  br i1 %exitcond102.1, label %.lr.ph37.preheader.preheader, label %.lr.ph47

.lr.ph37.preheader.preheader:                     ; preds = %.lr.ph47
  br label %.lr.ph37.preheader

.lr.ph37.preheader:                               ; preds = %.lr.ph37.preheader.preheader, %._crit_edge42..preheader14_crit_edge
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge42..preheader14_crit_edge ], [ 0, %.lr.ph37.preheader.preheader ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge42..preheader14_crit_edge ], [ 1, %.lr.ph37.preheader.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv97, 2001
  %22 = add nuw nsw i64 %21, 1
  %scevgep93 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %22
  %scevgep9394 = bitcast double* %scevgep93 to i8*
  %23 = sub i64 1998, %indvars.iv97
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %.lr.ph37

.lr.ph37:                                         ; preds = %.lr.ph37, %.lr.ph37.preheader
  %indvars.iv81 = phi i64 [ 0, %.lr.ph37.preheader ], [ %indvars.iv.next82, %.lr.ph37 ]
  %27 = sub nsw i64 0, %indvars.iv81
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv81
  store double %32, double* %33, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next82, %indvars.iv95
  br i1 %exitcond86, label %.preheader14._crit_edge, label %.lr.ph37

.preheader14._crit_edge:                          ; preds = %.lr.ph37
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %34 = icmp slt i64 %indvars.iv.next98, 2000
  br i1 %34, label %._crit_edge42..preheader14_crit_edge, label %._crit_edge44

._crit_edge42..preheader14_crit_edge:             ; preds = %.preheader14._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9394, i8 0, i64 %26, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv97
  store double 1.000000e+00, double* %35, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  br label %.lr.ph37.preheader

._crit_edge44:                                    ; preds = %.preheader14._crit_edge
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv97
  store double 1.000000e+00, double* %36, align 8
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge34.us.3

.preheader11.us:                                  ; preds = %.preheader11.us.preheader, %._crit_edge23.us-lcssa.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge23.us-lcssa.us.us ], [ 0, %.preheader11.us.preheader ]
  br label %.preheader10.us.us

.preheader10.us.us:                               ; preds = %._crit_edge21.us.us, %.preheader11.us
  %indvars.iv62 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next63, %._crit_edge21.us.us ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv66
  br label %.preheader10.us.us.new

._crit_edge21.us.us:                              ; preds = %.preheader10.us.us.new
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 2000
  br i1 %exitcond65, label %._crit_edge23.us-lcssa.us.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us, %.preheader10.us.us.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.preheader10.us.us.new ], [ 0, %.preheader10.us.us ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv66
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv62, i64 %indvars.iv54
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv66
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv62, i64 %indvars.iv.next55
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 2000
  br i1 %exitcond57.1, label %._crit_edge21.us.us, label %.preheader10.us.us.new

._crit_edge23.us-lcssa.us.us:                     ; preds = %._crit_edge21.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 2000
  br i1 %exitcond69, label %.preheader.us.preheader, label %.preheader11.us

.preheader.us.preheader:                          ; preds = %._crit_edge23.us-lcssa.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.preheader.us ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv51, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond, label %._crit_edge18, label %.preheader.us

._crit_edge18:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %37) #4
  ret void

._crit_edge34.us.3:                               ; preds = %._crit_edge34.us.3, %._crit_edge44
  %indvars.iv74 = phi i64 [ 0, %._crit_edge44 ], [ %indvars.iv.next75.3.1, %._crit_edge34.us.3 ]
  %74 = mul nuw nsw i64 %indvars.iv74, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %75 = add nuw nsw i64 %74, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %76 = add nuw nsw i64 %74, 32000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %77 = add nuw nsw i64 %74, 48000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next75.3 = or i64 %indvars.iv74, 4
  %78 = mul nuw nsw i64 %indvars.iv.next75.3, 16000
  %scevgep.1121 = getelementptr i8, i8* %37, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1121, i8 0, i64 16000, i32 8, i1 false)
  %79 = add nuw nsw i64 %78, 16000
  %scevgep.1.1 = getelementptr i8, i8* %37, i64 %79
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %80 = add nuw nsw i64 %78, 32000
  %scevgep.2.1 = getelementptr i8, i8* %37, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %81 = add nuw nsw i64 %78, 48000
  %scevgep.3.1 = getelementptr i8, i8* %37, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next75.3.1 = add nsw i64 %indvars.iv74, 8
  %exitcond77.3.1 = icmp eq i64 %indvars.iv.next75.3.1, 2000
  br i1 %exitcond77.3.1, label %.preheader11.us.preheader, label %._crit_edge34.us.3

.preheader11.us.preheader:                        ; preds = %._crit_edge34.us.3
  br label %.preheader11.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader12.preheader:
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.preheader, %._crit_edge42
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge42 ], [ 0, %.preheader12.preheader ]
  %5 = add i64 %indvars.iv98, 4294967295
  %6 = icmp sgt i64 %indvars.iv98, 0
  br i1 %6, label %.lr.ph33.preheader, label %._crit_edge42

.lr.ph33.preheader:                               ; preds = %.preheader12
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 0
  br label %.lr.ph33

.lr.ph41:                                         ; preds = %._crit_edge30
  br i1 true, label %.lr.ph41.split.us.preheader, label %.lr.ph41.._crit_edge42_crit_edge

.lr.ph41.._crit_edge42_crit_edge:                 ; preds = %.lr.ph41
  br label %._crit_edge42

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %xtraiter88103 = and i64 %indvars.iv98, 1
  %lcmp.mod89 = icmp eq i64 %xtraiter88103, 0
  %8 = trunc i64 %5 to i32
  %9 = icmp eq i32 %8, 0
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %.lr.ph41.split.us.preheader, %._crit_edge38.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge38.us ], [ %indvars.iv98, %.lr.ph41.split.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv92
  %11 = load double, double* %10, align 8
  br i1 %lcmp.mod89, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41.split.us
  %12 = load double, double* %7, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv92
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph41.split.us
  %indvars.iv83.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph41.split.us ]
  %.135.us.unr.ph = phi double [ %16, %.prol.preheader ], [ %11, %.lr.ph41.split.us ]
  %.lcssa50.unr.ph = phi double [ %16, %.prol.preheader ], [ undef, %.lr.ph41.split.us ]
  br i1 %9, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new.preheader, %.lr.ph41.split.us.new
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.lr.ph41.split.us.new ], [ %indvars.iv83.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %.135.us = phi double [ %30, %.lr.ph41.split.us.new ], [ %.135.us.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv83
  %18 = bitcast double* %17 to <2 x double>*
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv92
  %20 = load double, double* %19, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %21 = load <2 x double>, <2 x double>* %18, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next84, i64 %indvars.iv92
  %23 = load double, double* %22, align 8
  %24 = insertelement <2 x double> undef, double %20, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %21, %25
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %.135.us, %27
  %30 = fsub double %29, %28
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next84.1, %indvars.iv98
  br i1 %exitcond87.1, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit
  %.lcssa50 = phi double [ %.lcssa50.unr.ph, %.prol.loopexit ], [ %30, %._crit_edge38.us.loopexit ]
  store double %.lcssa50, double* %10, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 2000
  br i1 %exitcond95, label %._crit_edge42.loopexit, label %.lr.ph41.split.us

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %._crit_edge30
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge30 ], [ 0, %.lr.ph33.preheader ]
  %31 = add i64 %indvars.iv76, 4294967295
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv76
  %33 = load double, double* %32, align 8
  %34 = icmp sgt i64 %indvars.iv76, 0
  br i1 %34, label %.lr.ph29.preheader, label %._crit_edge30

.lr.ph29.preheader:                               ; preds = %.lr.ph33
  %xtraiter72104 = and i64 %indvars.iv76, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter72104, 0
  br i1 %lcmp.mod73, label %.lr.ph29.prol.loopexit, label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.preheader
  %35 = load double, double* %7, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv76
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %33, %38
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.prol, %.lr.ph29.preheader
  %indvars.iv67.unr.ph = phi i64 [ 1, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  %.027.unr.ph = phi double [ %39, %.lr.ph29.prol ], [ %33, %.lr.ph29.preheader ]
  %.lcssa49.unr.ph = phi double [ %39, %.lr.ph29.prol ], [ undef, %.lr.ph29.preheader ]
  %40 = trunc i64 %31 to i32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %._crit_edge30, label %.lr.ph29.preheader123

.lr.ph29.preheader123:                            ; preds = %.lr.ph29.prol.loopexit
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader123, %.lr.ph29
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %.lr.ph29 ], [ %indvars.iv67.unr.ph, %.lr.ph29.preheader123 ]
  %.027 = phi double [ %55, %.lr.ph29 ], [ %.027.unr.ph, %.lr.ph29.preheader123 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv67
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv67, i64 %indvars.iv76
  %45 = load double, double* %44, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next68, i64 %indvars.iv76
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.027, %52
  %55 = fsub double %54, %53
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next68.1, %indvars.iv76
  br i1 %exitcond71.1, label %._crit_edge30.loopexit, label %.lr.ph29

._crit_edge30.loopexit:                           ; preds = %.lr.ph29
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.lr.ph29.prol.loopexit, %.lr.ph33
  %.0.lcssa = phi double [ %33, %.lr.ph33 ], [ %.lcssa49.unr.ph, %.lr.ph29.prol.loopexit ], [ %55, %._crit_edge30.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv76, i64 %indvars.iv76
  %57 = load double, double* %56, align 8
  %58 = fdiv double %.0.lcssa, %57
  store double %58, double* %32, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next77, %indvars.iv98
  br i1 %exitcond81, label %.lr.ph41, label %.lr.ph33

._crit_edge42.loopexit:                           ; preds = %._crit_edge38.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.lr.ph41.._crit_edge42_crit_edge, %._crit_edge42.loopexit, %.preheader12
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 2000
  br i1 %exitcond101, label %.lr.ph25.preheader, label %.preheader12

.lr.ph25.preheader:                               ; preds = %._crit_edge42
  br label %.lr.ph25

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %._crit_edge22
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge22 ], [ 0, %.lr.ph25.preheader ]
  %59 = add i64 %indvars.iv64, 4294967295
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv64
  %61 = load double, double* %60, align 8
  %62 = icmp sgt i64 %indvars.iv64, 0
  br i1 %62, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.lr.ph25
  %63 = trunc i64 %indvars.iv64 to i32
  %xtraiter57 = and i32 %63, 3
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  br i1 %lcmp.mod58, label %.lr.ph21.prol.loopexit, label %.lr.ph21.prol.preheader

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader, %.lr.ph21.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph21.prol ], [ 0, %.lr.ph21.prol.preheader ]
  %.219.prol = phi double [ %69, %.lr.ph21.prol ], [ %61, %.lr.ph21.prol.preheader ]
  %prol.iter60 = phi i32 [ %prol.iter60.sub, %.lr.ph21.prol ], [ %xtraiter57, %.lr.ph21.prol.preheader ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv.prol
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %.219.prol, %68
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter60.sub = add i32 %prol.iter60, -1
  %prol.iter60.cmp = icmp eq i32 %prol.iter60.sub, 0
  br i1 %prol.iter60.cmp, label %.lr.ph21.prol.loopexit.loopexit, label %.lr.ph21.prol, !llvm.loop !1

.lr.ph21.prol.loopexit.loopexit:                  ; preds = %.lr.ph21.prol
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.loopexit, %.lr.ph21.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph21.preheader ], [ %indvars.iv.next.prol, %.lr.ph21.prol.loopexit.loopexit ]
  %.219.unr = phi double [ %61, %.lr.ph21.preheader ], [ %69, %.lr.ph21.prol.loopexit.loopexit ]
  %.lcssa48.unr = phi double [ undef, %.lr.ph21.preheader ], [ %69, %.lr.ph21.prol.loopexit.loopexit ]
  %70 = trunc i64 %59 to i32
  %71 = icmp ult i32 %70, 3
  br i1 %71, label %._crit_edge22, label %.lr.ph21.preheader122

.lr.ph21.preheader122:                            ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader122, %.lr.ph21
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph21 ], [ %indvars.iv.unr, %.lr.ph21.preheader122 ]
  %.219 = phi double [ %93, %.lr.ph21 ], [ %.219.unr, %.lr.ph21.preheader122 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv
  %73 = bitcast double* %72 to <2 x double>*
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %75 = bitcast double* %74 to <2 x double>*
  %76 = load <2 x double>, <2 x double>* %73, align 8
  %77 = load <2 x double>, <2 x double>* %75, align 8
  %78 = fmul <2 x double> %76, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.219, %79
  %82 = fsub double %81, %80
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv.next.1
  %84 = bitcast double* %83 to <2 x double>*
  %85 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %86 = bitcast double* %85 to <2 x double>*
  %87 = load <2 x double>, <2 x double>* %84, align 8
  %88 = load <2 x double>, <2 x double>* %86, align 8
  %89 = fmul <2 x double> %87, %88
  %90 = extractelement <2 x double> %89, i32 0
  %91 = extractelement <2 x double> %89, i32 1
  %92 = fsub double %82, %90
  %93 = fsub double %92, %91
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.361 = icmp eq i64 %indvars.iv.next.3, %indvars.iv64
  br i1 %exitcond.361, label %._crit_edge22.loopexit, label %.lr.ph21

._crit_edge22.loopexit:                           ; preds = %.lr.ph21
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph21.prol.loopexit, %.lr.ph25
  %.2.lcssa = phi double [ %61, %.lr.ph25 ], [ %.lcssa48.unr, %.lr.ph21.prol.loopexit ], [ %93, %._crit_edge22.loopexit ]
  %94 = getelementptr inbounds double, double* %4, i64 %indvars.iv64
  store double %.2.lcssa, double* %94, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond, label %.lr.ph16.preheader, label %.lr.ph25

.lr.ph16.preheader:                               ; preds = %._crit_edge22
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16.preheader, %._crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge ], [ 2000, %.lr.ph16.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph16.preheader ]
  %95 = add nsw i32 %indvar, -1
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, -1
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next54
  %97 = load double, double* %96, align 8
  %98 = icmp slt i64 %indvars.iv53, 2000
  br i1 %98, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph16
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph.prol ], [ %indvars.iv53, %.lr.ph.prol.preheader ]
  %.313.prol = phi double [ %104, %.lr.ph.prol ], [ %97, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv51.prol
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv51.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fsub double %.313.prol, %103
  %indvars.iv.next52.prol = add nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv51.unr = phi i64 [ %indvars.iv53, %.lr.ph.preheader ], [ %indvars.iv.next52.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.313.unr = phi double [ %97, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %105 = icmp ult i32 %95, 3
  br i1 %105, label %._crit_edge, label %.lr.ph.preheader121

.lr.ph.preheader121:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader121, %.lr.ph
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.3, %.lr.ph ], [ %indvars.iv51.unr, %.lr.ph.preheader121 ]
  %.313 = phi double [ %127, %.lr.ph ], [ %.313.unr, %.lr.ph.preheader121 ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv51
  %107 = bitcast double* %106 to <2 x double>*
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %109 = bitcast double* %108 to <2 x double>*
  %110 = load <2 x double>, <2 x double>* %107, align 8
  %111 = load <2 x double>, <2 x double>* %109, align 8
  %112 = fmul <2 x double> %110, %111
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = fsub double %.313, %113
  %116 = fsub double %115, %114
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv.next52.1
  %118 = bitcast double* %117 to <2 x double>*
  %119 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next52.1
  %120 = bitcast double* %119 to <2 x double>*
  %121 = load <2 x double>, <2 x double>* %118, align 8
  %122 = load <2 x double>, <2 x double>* %120, align 8
  %123 = fmul <2 x double> %121, %122
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fsub double %116, %124
  %127 = fsub double %126, %125
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next52.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph16
  %.3.lcssa = phi double [ %97, %.lr.ph16 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %127, %._crit_edge.loopexit ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv.next54
  %129 = load double, double* %128, align 8
  %130 = fdiv double %.3.lcssa, %129
  %131 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next54
  store double %130, double* %131, align 8
  %132 = icmp sgt i64 %indvars.iv53, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %132, label %.lr.ph16, label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
