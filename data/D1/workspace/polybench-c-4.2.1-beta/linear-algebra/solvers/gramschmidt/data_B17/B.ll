; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %.preheader27.us.preheader, %._crit_edge33.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge33.us ], [ 0, %.preheader27.us.preheader ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader27.us
  %indvars.iv40.us = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next41.us, %6 ]
  %7 = mul nsw i64 %indvars.iv40.us, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = fmul double %11, 1.000000e+02
  %13 = fadd double %12, 1.000000e+01
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv40.us
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv40.us
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv40.us, 1
  %exitcond43.us = icmp eq i64 %indvars.iv.next41.us, 1200
  br i1 %exitcond43.us, label %._crit_edge33.us, label %6

._crit_edge33.us:                                 ; preds = %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  br i1 true, label %.preheader.lr.ph, label %._crit_edge30

.preheader.lr.ph:                                 ; preds = %.preheader26
  br i1 true, label %.preheader.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  br i1 true, label %.preheader.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !1

.preheader.prol.loopexit.loopexit:                ; preds = %._crit_edge.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.lr.ph
  br i1 false, label %._crit_edge30, label %._crit_edge.3.preheader

._crit_edge.3.preheader:                          ; preds = %.preheader.prol.loopexit
  br i1 false, label %._crit_edge.3.prol.preheader, label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.preheader:                     ; preds = %._crit_edge.3.preheader
  br label %._crit_edge.3.prol

._crit_edge.3.prol:                               ; preds = %._crit_edge.3.prol.preheader
  br label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.loopexit:                      ; preds = %._crit_edge.3.prol, %._crit_edge.3.preheader
  %indvars.iv36.unr56 = phi i64 [ 0, %._crit_edge.3.preheader ], [ 4, %._crit_edge.3.prol ]
  br i1 false, label %._crit_edge30.loopexit, label %._crit_edge.3.preheader.new

._crit_edge.3.preheader.new:                      ; preds = %._crit_edge.3.prol.loopexit
  br label %._crit_edge.3

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %._crit_edge.3
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %._crit_edge.3.prol.loopexit, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader27.lr.ph, %.preheader.prol.loopexit, %.preheader26
  ret void

._crit_edge.3:                                    ; preds = %._crit_edge.3, %._crit_edge.3.preheader.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr56, %._crit_edge.3.preheader.new ], [ %indvars.iv.next37.3.1, %._crit_edge.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 0
  %scevgep45 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37, i64 0
  %scevgep45.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.1 = or i64 %indvars.iv36, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1, i64 0
  %scevgep45.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.2 = or i64 %indvars.iv36, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2, i64 0
  %scevgep45.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %scevgep.157 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.3, i64 0
  %scevgep45.158 = bitcast double* %scevgep.157 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.158, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.159 = add nsw i64 %indvars.iv36, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.159, i64 0
  %scevgep45.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.1.1 = add nsw i64 %indvars.iv36, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.1.1, i64 0
  %scevgep45.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.2.1 = add nsw i64 %indvars.iv36, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next37.2.1, i64 0
  %scevgep45.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep45.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next37.3.1 = add nsw i64 %indvars.iv36, 8
  %exitcond39.3.1 = icmp eq i64 %indvars.iv.next37.3.1, 1200
  br i1 %exitcond39.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader65.lr.ph, label %._crit_edge82

.preheader65.lr.ph:                               ; preds = %5
  br label %.preheader65

.loopexit.loopexit109:                            ; preds = %.lr.ph80
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.loopexit.loopexit109, %._crit_edge71
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 1200
  br i1 %exitcond104, label %._crit_edge82.loopexit, label %.preheader65

.preheader65:                                     ; preds = %.loopexit, %.preheader65.lr.ph
  %indvars.iv101 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next102, %.loopexit ]
  %indvars.iv95 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next96, %.loopexit ]
  br i1 true, label %.lr.ph.preheader, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader65
  br label %._crit_edge71

.lr.ph.preheader:                                 ; preds = %.preheader65
  br i1 true, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  br i1 true, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  br i1 false, label %._crit_edge, label %.lr.ph.preheader126

.lr.ph.preheader126:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader126, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ 0, %.lr.ph.preheader126 ]
  %.067 = phi double [ %21, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader126 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv101
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %.067, %8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv101
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv101
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv101
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %.0.lcssa = phi double [ undef, %.lr.ph.prol.loopexit ], [ %21, %._crit_edge.loopexit ]
  %22 = tail call double @sqrt(double %.0.lcssa) #4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv101, i64 %indvars.iv101
  store double %22, double* %23, align 8
  br i1 true, label %.lr.ph70.preheader, label %._crit_edge71

.lr.ph70.preheader:                               ; preds = %._crit_edge
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv101
  %25 = load double, double* %24, align 8
  %26 = fdiv double %25, %22
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv101
  store double %26, double* %27, align 8
  br i1 false, label %._crit_edge71, label %._crit_edge105.preheader

._crit_edge105.preheader:                         ; preds = %.lr.ph70.preheader
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.1, %._crit_edge105.preheader
  %indvars.iv.next84123 = phi i64 [ 1, %._crit_edge105.preheader ], [ %indvars.iv.next84.1, %._crit_edge105.1 ]
  %.pre = load double, double* %23, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next84123, i64 %indvars.iv101
  %29 = load double, double* %28, align 8
  %30 = fdiv double %29, %.pre
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next84123, i64 %indvars.iv101
  store double %30, double* %31, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv.next84123, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 1000
  br i1 %exitcond86, label %._crit_edge71.loopexit, label %._crit_edge105.1

._crit_edge71.loopexit:                           ; preds = %._crit_edge105
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.lr.ph70.preheader, %._crit_edge.thread, %._crit_edge
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %32 = icmp slt i64 %indvars.iv.next102, 1200
  br i1 %32, label %.lr.ph80, label %.loopexit

.lr.ph80:                                         ; preds = %._crit_edge71
  br i1 true, label %.lr.ph80.split.us.preheader, label %.loopexit.loopexit109

.lr.ph80.split.us.preheader:                      ; preds = %.lr.ph80
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv101
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv97.us = phi i64 [ %indvars.iv.next98.us, %._crit_edge77.us ], [ %indvars.iv95, %.lr.ph80.split.us.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv101, i64 %indvars.iv97.us
  store double 0.000000e+00, double* %34, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph80.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph80.split.us
  %indvars.iv87.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph80.split.us ]
  br i1 false, label %.lr.ph76.us.preheader, label %.lr.ph80.split.us.new.preheader

.lr.ph80.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph80.split.us.new

.lr.ph80.split.us.new:                            ; preds = %.lr.ph80.split.us.new.preheader, %.lr.ph80.split.us.new
  %35 = phi double [ %47, %.lr.ph80.split.us.new ], [ 0.000000e+00, %.lr.ph80.split.us.new.preheader ]
  %indvars.iv87.us = phi i64 [ %indvars.iv.next88.us.1, %.lr.ph80.split.us.new ], [ %indvars.iv87.us.unr.ph, %.lr.ph80.split.us.new.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv87.us, i64 %indvars.iv101
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv87.us, i64 %indvars.iv97.us
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %34, align 8
  %indvars.iv.next88.us = add nuw nsw i64 %indvars.iv87.us, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next88.us, i64 %indvars.iv101
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next88.us, i64 %indvars.iv97.us
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %34, align 8
  %indvars.iv.next88.us.1 = add nuw nsw i64 %indvars.iv87.us, 2
  %exitcond90.us.1 = icmp eq i64 %indvars.iv.next88.us.1, 1000
  br i1 %exitcond90.us.1, label %.lr.ph76.us.preheader.loopexit, label %.lr.ph80.split.us.new

.lr.ph76.us.preheader.loopexit:                   ; preds = %.lr.ph80.split.us.new
  br label %.lr.ph76.us.preheader

.lr.ph76.us.preheader:                            ; preds = %.lr.ph76.us.preheader.loopexit, %.prol.loopexit
  %.ph = phi double [ undef, %.prol.loopexit ], [ %47, %.lr.ph76.us.preheader.loopexit ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv97.us
  %49 = load double, double* %48, align 8
  %50 = load double, double* %33, align 8
  %51 = fmul double %50, %.ph
  %52 = fsub double %49, %51
  store double %52, double* %48, align 8
  br i1 false, label %._crit_edge77.us, label %._crit_edge106.us.preheader

._crit_edge106.us.preheader:                      ; preds = %.lr.ph76.us.preheader
  br label %._crit_edge106.us

._crit_edge77.us.loopexit:                        ; preds = %._crit_edge106.us
  br label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %._crit_edge77.us.loopexit, %.lr.ph76.us.preheader
  %indvars.iv.next98.us = add nuw nsw i64 %indvars.iv97.us, 1
  %exitcond100.us = icmp eq i64 %indvars.iv.next98.us, 1200
  br i1 %exitcond100.us, label %.loopexit.loopexit, label %.lr.ph80.split.us

._crit_edge106.us:                                ; preds = %._crit_edge106.us.1, %._crit_edge106.us.preheader
  %indvars.iv.next92.us125 = phi i64 [ 1, %._crit_edge106.us.preheader ], [ %indvars.iv.next92.us.1, %._crit_edge106.us.1 ]
  %.pre107.us = load double, double* %34, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next92.us125, i64 %indvars.iv97.us
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next92.us125, i64 %indvars.iv101
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %.pre107.us
  %58 = fsub double %54, %57
  store double %58, double* %53, align 8
  %indvars.iv.next92.us = add nuw nsw i64 %indvars.iv.next92.us125, 1
  %exitcond94.us = icmp eq i64 %indvars.iv.next92.us, 1000
  br i1 %exitcond94.us, label %._crit_edge77.us.loopexit, label %._crit_edge106.us.1

._crit_edge82.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge82.loopexit, %5
  ret void

._crit_edge105.1:                                 ; preds = %._crit_edge105
  %.pre.1 = load double, double* %23, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next84, i64 %indvars.iv101
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %.pre.1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next84, i64 %indvars.iv101
  store double %61, double* %62, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv.next84123, 2
  br label %._crit_edge105

._crit_edge106.us.1:                              ; preds = %._crit_edge106.us
  %.pre107.us.1 = load double, double* %34, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next92.us, i64 %indvars.iv97.us
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next92.us, i64 %indvars.iv101
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %.pre107.us.1
  %68 = fsub double %64, %67
  store double %68, double* %63, align 8
  %indvars.iv.next92.us.1 = add nsw i64 %indvars.iv.next92.us125, 2
  br label %._crit_edge106.us
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader4.lr.ph, label %._crit_edge14

.preheader4.lr.ph:                                ; preds = %4
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge11, %.preheader4.lr.ph
  %indvars.iv22 = phi i64 [ 0, %.preheader4.lr.ph ], [ %indvars.iv.next23, %._crit_edge11 ]
  %9 = mul i64 %indvars.iv22, 1200
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader4
  %indvars.iv15 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next16, %17 ]
  %11 = add i64 %indvars.iv15, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv15
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge11, label %10

._crit_edge11:                                    ; preds = %17
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond25, label %._crit_edge14.loopexit, label %.preheader4

._crit_edge14.loopexit:                           ; preds = %._crit_edge11
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br i1 true, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %._crit_edge14
  br i1 true, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %26 = mul i64 %indvars.iv, 1200
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %34 ]
  %28 = add i64 %indvars.iv.us, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #6
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv.us
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %27

._crit_edge.us:                                   ; preds = %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader.lr.ph, %._crit_edge14
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
