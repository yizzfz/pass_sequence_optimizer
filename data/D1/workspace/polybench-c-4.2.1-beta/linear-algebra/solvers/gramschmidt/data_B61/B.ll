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
  %9 = bitcast i8* %3 to [1200 x double]*
  %10 = bitcast i8* %4 to [1200 x double]*
  %11 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %9, [1200 x double]* %10, [1200 x double]* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %19

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge19

._crit_edge19:                                    ; preds = %13
  br label %19

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %17, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %._crit_edge19, %._crit_edge, %16
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.preheader.lr.ph, label %..preheader26_crit_edge

..preheader26_crit_edge:                          ; preds = %5
  br label %.preheader26

.preheader27.preheader.lr.ph:                     ; preds = %5
  br i1 true, label %.preheader27.preheader.us.preheader, label %.preheader27.preheader.lr.ph.._crit_edge_crit_edge

.preheader27.preheader.lr.ph.._crit_edge_crit_edge: ; preds = %.preheader27.preheader.lr.ph
  br label %._crit_edge

.preheader27.preheader.us.preheader:              ; preds = %.preheader27.preheader.lr.ph
  br label %.preheader27.preheader.us

.preheader27.preheader.us:                        ; preds = %.preheader27._crit_edge.us..preheader27.preheader.us_crit_edge, %.preheader27.preheader.us.preheader
  %indvars.iv3240.us = phi i64 [ %indvars.iv.next33.us, %.preheader27._crit_edge.us..preheader27.preheader.us_crit_edge ], [ 0, %.preheader27.preheader.us.preheader ]
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %.preheader27.us..preheader27.us_crit_edge, %.preheader27.preheader.us
  %indvars.iv3038.us = phi i64 [ 0, %.preheader27.preheader.us ], [ %indvars.iv.next31.us, %.preheader27.us..preheader27.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv3038.us, %indvars.iv3240.us
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3240.us, i64 %indvars.iv3038.us
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3240.us, i64 %indvars.iv3038.us
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next31.us = add nuw nsw i64 %indvars.iv3038.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next31.us, 1200
  br i1 %exitcond44, label %.preheader27._crit_edge.us, label %.preheader27.us..preheader27.us_crit_edge

.preheader27.us..preheader27.us_crit_edge:        ; preds = %.preheader27.us
  br label %.preheader27.us

.preheader27._crit_edge.us:                       ; preds = %.preheader27.us
  %indvars.iv.next33.us = add nuw nsw i64 %indvars.iv3240.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next33.us, 1000
  br i1 %exitcond45, label %.preheader26.loopexit, label %.preheader27._crit_edge.us..preheader27.preheader.us_crit_edge

.preheader27._crit_edge.us..preheader27.preheader.us_crit_edge: ; preds = %.preheader27._crit_edge.us
  br label %.preheader27.preheader.us

.preheader26.loopexit:                            ; preds = %.preheader27._crit_edge.us
  br label %.preheader26

.preheader26:                                     ; preds = %..preheader26_crit_edge, %.preheader26.loopexit
  br i1 true, label %.preheader.preheader.lr.ph, label %.preheader26.._crit_edge_crit_edge

.preheader26.._crit_edge_crit_edge:               ; preds = %.preheader26
  br label %._crit_edge

.preheader.preheader.lr.ph:                       ; preds = %.preheader26
  br i1 true, label %.preheader.preheader.lr.ph..preheader.preheader.prol.loopexit_crit_edge, label %.preheader._crit_edge.prol.preheader

.preheader.preheader.lr.ph..preheader.preheader.prol.loopexit_crit_edge: ; preds = %.preheader.preheader.lr.ph
  br label %.preheader.preheader.prol.loopexit

.preheader._crit_edge.prol.preheader:             ; preds = %.preheader.preheader.lr.ph
  br label %.preheader._crit_edge.prol

.preheader._crit_edge.prol:                       ; preds = %.preheader._crit_edge.prol..preheader._crit_edge.prol_crit_edge, %.preheader._crit_edge.prol.preheader
  br i1 true, label %.preheader.preheader.prol.loopexit.loopexit, label %.preheader._crit_edge.prol..preheader._crit_edge.prol_crit_edge, !llvm.loop !1

.preheader._crit_edge.prol..preheader._crit_edge.prol_crit_edge: ; preds = %.preheader._crit_edge.prol
  br label %.preheader._crit_edge.prol

.preheader.preheader.prol.loopexit.loopexit:      ; preds = %.preheader._crit_edge.prol
  br label %.preheader.preheader.prol.loopexit

.preheader.preheader.prol.loopexit:               ; preds = %.preheader.preheader.lr.ph..preheader.preheader.prol.loopexit_crit_edge, %.preheader.preheader.prol.loopexit.loopexit
  br i1 false, label %.preheader.preheader.prol.loopexit.._crit_edge_crit_edge, label %.preheader._crit_edge.3.preheader

.preheader.preheader.prol.loopexit.._crit_edge_crit_edge: ; preds = %.preheader.preheader.prol.loopexit
  br label %._crit_edge

.preheader._crit_edge.3.preheader:                ; preds = %.preheader.preheader.prol.loopexit
  br i1 false, label %.preheader._crit_edge.3.prol.preheader, label %.preheader._crit_edge.3.preheader..preheader._crit_edge.3.prol.loopexit_crit_edge

.preheader._crit_edge.3.preheader..preheader._crit_edge.3.prol.loopexit_crit_edge: ; preds = %.preheader._crit_edge.3.preheader
  br label %.preheader._crit_edge.3.prol.loopexit

.preheader._crit_edge.3.prol.preheader:           ; preds = %.preheader._crit_edge.3.preheader
  br label %.preheader._crit_edge.3.prol

.preheader._crit_edge.3.prol:                     ; preds = %.preheader._crit_edge.3.prol.preheader
  br label %.preheader._crit_edge.3.prol.loopexit

.preheader._crit_edge.3.prol.loopexit:            ; preds = %.preheader._crit_edge.3.preheader..preheader._crit_edge.3.prol.loopexit_crit_edge, %.preheader._crit_edge.3.prol
  br i1 false, label %.preheader._crit_edge.3.prol.loopexit.._crit_edge.loopexit_crit_edge, label %.preheader._crit_edge.3.preheader.new

.preheader._crit_edge.3.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %.preheader._crit_edge.3.prol.loopexit
  br label %._crit_edge.loopexit

.preheader._crit_edge.3.preheader.new:            ; preds = %.preheader._crit_edge.3.prol.loopexit
  br label %.preheader._crit_edge.3

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.preheader._crit_edge.3
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.3.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.preheader.prol.loopexit.._crit_edge_crit_edge, %.preheader26.._crit_edge_crit_edge, %.preheader27.preheader.lr.ph.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void

.preheader._crit_edge.3:                          ; preds = %.preheader._crit_edge.3..preheader._crit_edge.3_crit_edge, %.preheader._crit_edge.3.preheader.new
  %indvars.iv2836 = phi i64 [ 0, %.preheader._crit_edge.3.preheader.new ], [ %indvars.iv.next29.3.1, %.preheader._crit_edge.3..preheader._crit_edge.3_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv2836, i64 0
  %scevgep47 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29 = or i64 %indvars.iv2836, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29, i64 0
  %scevgep47.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.1 = or i64 %indvars.iv2836, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.1, i64 0
  %scevgep47.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.2 = or i64 %indvars.iv2836, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.2, i64 0
  %scevgep47.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.3 = or i64 %indvars.iv2836, 4
  %scevgep.157 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.3, i64 0
  %scevgep47.158 = bitcast double* %scevgep.157 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.158, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.159 = or i64 %indvars.iv2836, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.159, i64 0
  %scevgep47.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.1.1 = or i64 %indvars.iv2836, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.1.1, i64 0
  %scevgep47.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.2.1 = or i64 %indvars.iv2836, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next29.2.1, i64 0
  %scevgep47.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next29.3.1 = add nsw i64 %indvars.iv2836, 8
  %exitcond43.3.1 = icmp eq i64 %indvars.iv.next29.3.1, 1200
  br i1 %exitcond43.3.1, label %._crit_edge.loopexit.unr-lcssa, label %.preheader._crit_edge.3..preheader._crit_edge.3_crit_edge

.preheader._crit_edge.3..preheader._crit_edge.3_crit_edge: ; preds = %.preheader._crit_edge.3
  br label %.preheader._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader66.preheader.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %5
  br label %._crit_edge

.preheader66.preheader.lr.ph:                     ; preds = %5
  br label %.preheader66.preheader

.preheader66.preheader:                           ; preds = %.preheader65._crit_edge..preheader66.preheader_crit_edge, %.preheader66.preheader.lr.ph
  %indvars.iv7791 = phi i64 [ 0, %.preheader66.preheader.lr.ph ], [ %indvars.iv.next78, %.preheader65._crit_edge..preheader66.preheader_crit_edge ]
  br i1 true, label %.preheader66.preheader108, label %.preheader66.preheader..preheader66._crit_edge_crit_edge

.preheader66.preheader..preheader66._crit_edge_crit_edge: ; preds = %.preheader66.preheader
  br label %.preheader66._crit_edge

.preheader66.preheader108:                        ; preds = %.preheader66.preheader
  br i1 true, label %.preheader66.preheader108..preheader66.prol.loopexit_crit_edge, label %.preheader66.prol.preheader

.preheader66.preheader108..preheader66.prol.loopexit_crit_edge: ; preds = %.preheader66.preheader108
  br label %.preheader66.prol.loopexit

.preheader66.prol.preheader:                      ; preds = %.preheader66.preheader108
  br label %.preheader66.prol

.preheader66.prol:                                ; preds = %.preheader66.prol..preheader66.prol_crit_edge, %.preheader66.prol.preheader
  br i1 true, label %.preheader66.prol.loopexit.loopexit, label %.preheader66.prol..preheader66.prol_crit_edge, !llvm.loop !3

.preheader66.prol..preheader66.prol_crit_edge:    ; preds = %.preheader66.prol
  br label %.preheader66.prol

.preheader66.prol.loopexit.loopexit:              ; preds = %.preheader66.prol
  br label %.preheader66.prol.loopexit

.preheader66.prol.loopexit:                       ; preds = %.preheader66.preheader108..preheader66.prol.loopexit_crit_edge, %.preheader66.prol.loopexit.loopexit
  br i1 false, label %.preheader66.prol.loopexit..preheader66._crit_edge_crit_edge, label %.preheader66.preheader151

.preheader66.prol.loopexit..preheader66._crit_edge_crit_edge: ; preds = %.preheader66.prol.loopexit
  br label %.preheader66._crit_edge

.preheader66.preheader151:                        ; preds = %.preheader66.prol.loopexit
  br label %.preheader66

.preheader66:                                     ; preds = %.preheader66..preheader66_crit_edge, %.preheader66.preheader151
  %.080 = phi double [ %21, %.preheader66..preheader66_crit_edge ], [ 0.000000e+00, %.preheader66.preheader151 ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next.3, %.preheader66..preheader66_crit_edge ], [ 0, %.preheader66.preheader151 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv79, i64 %indvars.iv7791
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %.080, %8
  %indvars.iv.next = or i64 %indvars.iv79, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv7791
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = or i64 %indvars.iv79, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv7791
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = or i64 %indvars.iv79, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv7791
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv79, 4
  %exitcond109.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond109.3, label %.preheader66._crit_edge.loopexit, label %.preheader66..preheader66_crit_edge

.preheader66..preheader66_crit_edge:              ; preds = %.preheader66
  br label %.preheader66

.preheader66._crit_edge.loopexit:                 ; preds = %.preheader66
  br label %.preheader66._crit_edge

.preheader66._crit_edge:                          ; preds = %.preheader66.prol.loopexit..preheader66._crit_edge_crit_edge, %.preheader66.preheader..preheader66._crit_edge_crit_edge, %.preheader66._crit_edge.loopexit
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader66.preheader..preheader66._crit_edge_crit_edge ], [ undef, %.preheader66.prol.loopexit..preheader66._crit_edge_crit_edge ], [ %21, %.preheader66._crit_edge.loopexit ]
  %22 = tail call double @sqrt(double %.0.lcssa) #4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7791, i64 %indvars.iv7791
  store double %22, double* %23, align 8
  br i1 true, label %.lr.ph82, label %.preheader66._crit_edge..preheader65.preheader_crit_edge

.preheader66._crit_edge..preheader65.preheader_crit_edge: ; preds = %.preheader66._crit_edge
  br label %.preheader65.preheader

.lr.ph82:                                         ; preds = %.preheader66._crit_edge
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7791, i64 %indvars.iv7791
  br i1 true, label %.lr.ph82..prol.loopexit_crit_edge, label %25

.lr.ph82..prol.loopexit_crit_edge:                ; preds = %.lr.ph82
  br label %.prol.loopexit

; <label>:25:                                     ; preds = %.lr.ph82
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph82..prol.loopexit_crit_edge, %25
  %indvars.iv6781.unr.ph = phi i64 [ 1, %25 ], [ 0, %.lr.ph82..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit..preheader65.preheader_crit_edge, label %.lr.ph82.new.preheader

.prol.loopexit..preheader65.preheader_crit_edge:  ; preds = %.prol.loopexit
  br label %.preheader65.preheader

.lr.ph82.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph82.new

.preheader65.preheader.loopexit:                  ; preds = %.lr.ph82.new
  br label %.preheader65.preheader

.preheader65.preheader:                           ; preds = %.prol.loopexit..preheader65.preheader_crit_edge, %.preheader66._crit_edge..preheader65.preheader_crit_edge, %.preheader65.preheader.loopexit
  %exitcond88 = icmp eq i64 %indvars.iv7791, 1199
  br i1 %exitcond88, label %.preheader65.preheader..preheader65._crit_edge_crit_edge, label %.lr.ph90

.preheader65.preheader..preheader65._crit_edge_crit_edge: ; preds = %.preheader65.preheader
  br label %.preheader65._crit_edge

.lr.ph90:                                         ; preds = %.preheader65.preheader
  br i1 true, label %.lr.ph90.split.us.preheader, label %.lr.ph90.split.split.preheader

.lr.ph90.split.us.preheader:                      ; preds = %.lr.ph90
  br label %.lr.ph90.split.us

.lr.ph90.split.split.preheader:                   ; preds = %.lr.ph90
  br label %.preheader65._crit_edge

.lr.ph90.split.us:                                ; preds = %.preheader65.loopexit.us..lr.ph90.split.us_crit_edge, %.lr.ph90.split.us.preheader
  %indvars.iv.next7689.in.us = phi i64 [ %indvars.iv.next7689.us, %.preheader65.loopexit.us..lr.ph90.split.us_crit_edge ], [ %indvars.iv7791, %.lr.ph90.split.us.preheader ]
  %indvars.iv.next7689.us = add nuw nsw i64 %indvars.iv.next7689.in.us, 1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7791, i64 %indvars.iv.next7689.us
  store double 0.000000e+00, double* %26, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7791, i64 %indvars.iv.next7689.us
  br i1 true, label %.lr.ph90.split.us..prol.loopexit118_crit_edge, label %28

.lr.ph90.split.us..prol.loopexit118_crit_edge:    ; preds = %.lr.ph90.split.us
  br label %.prol.loopexit118

; <label>:28:                                     ; preds = %.lr.ph90.split.us
  br label %.prol.loopexit118

.prol.loopexit118:                                ; preds = %.lr.ph90.split.us..prol.loopexit118_crit_edge, %28
  %indvars.iv6983.us.unr.ph = phi i64 [ 1, %28 ], [ 0, %.lr.ph90.split.us..prol.loopexit118_crit_edge ]
  br i1 false, label %.prol.loopexit118..preheader.preheader.us_crit_edge, label %.lr.ph90.split.us.new.preheader

.prol.loopexit118..preheader.preheader.us_crit_edge: ; preds = %.prol.loopexit118
  br label %.preheader.preheader.us

.lr.ph90.split.us.new.preheader:                  ; preds = %.prol.loopexit118
  br label %.lr.ph90.split.us.new

.lr.ph90.split.us.new:                            ; preds = %.lr.ph90.split.us.new..lr.ph90.split.us.new_crit_edge, %.lr.ph90.split.us.new.preheader
  %indvars.iv6983.us = phi i64 [ %indvars.iv.next70.us.1, %.lr.ph90.split.us.new..lr.ph90.split.us.new_crit_edge ], [ %indvars.iv6983.us.unr.ph, %.lr.ph90.split.us.new.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6983.us, i64 %indvars.iv7791
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6983.us, i64 %indvars.iv.next7689.us
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %27, align 8
  %35 = fadd double %34, %33
  store double %35, double* %27, align 8
  %indvars.iv.next70.us = add nuw nsw i64 %indvars.iv6983.us, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next70.us, i64 %indvars.iv7791
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next70.us, i64 %indvars.iv.next7689.us
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %27, align 8
  %42 = fadd double %41, %40
  store double %42, double* %27, align 8
  %indvars.iv.next70.us.1 = add nuw nsw i64 %indvars.iv6983.us, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next70.us.1, 1000
  br i1 %exitcond111.1, label %.preheader.preheader.us.loopexit, label %.lr.ph90.split.us.new..lr.ph90.split.us.new_crit_edge

.lr.ph90.split.us.new..lr.ph90.split.us.new_crit_edge: ; preds = %.lr.ph90.split.us.new
  br label %.lr.ph90.split.us.new

.preheader.preheader.us.loopexit:                 ; preds = %.lr.ph90.split.us.new
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.prol.loopexit118..preheader.preheader.us_crit_edge, %.preheader.preheader.us.loopexit
  br i1 true, label %.lr.ph86.us, label %.preheader.preheader.us..preheader65.loopexit.us_crit_edge

.preheader.preheader.us..preheader65.loopexit.us_crit_edge: ; preds = %.preheader.preheader.us
  br label %.preheader65.loopexit.us

.lr.ph86.us:                                      ; preds = %.preheader.preheader.us
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7791, i64 %indvars.iv.next7689.us
  br i1 true, label %.lr.ph86.us..preheader.us.prol.loopexit_crit_edge, label %.preheader.us.prol

.lr.ph86.us..preheader.us.prol.loopexit_crit_edge: ; preds = %.lr.ph86.us
  br label %.preheader.us.prol.loopexit

.preheader.us.prol:                               ; preds = %.lr.ph86.us
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.lr.ph86.us..preheader.us.prol.loopexit_crit_edge, %.preheader.us.prol
  %indvars.iv7185.us.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.lr.ph86.us..preheader.us.prol.loopexit_crit_edge ]
  br i1 false, label %.preheader.us.prol.loopexit..preheader65.loopexit.us_crit_edge, label %.preheader.us.preheader

.preheader.us.prol.loopexit..preheader65.loopexit.us_crit_edge: ; preds = %.preheader.us.prol.loopexit
  br label %.preheader65.loopexit.us

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv7185.us = phi i64 [ %indvars.iv.next72.us.1, %.preheader.us..preheader.us_crit_edge ], [ %indvars.iv7185.us.unr.ph, %.preheader.us.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7185.us, i64 %indvars.iv.next7689.us
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7185.us, i64 %indvars.iv7791
  %47 = load double, double* %46, align 8
  %48 = load double, double* %43, align 8
  %49 = fmul double %47, %48
  %50 = fsub double %45, %49
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7185.us, i64 %indvars.iv.next7689.us
  store double %50, double* %51, align 8
  %indvars.iv.next72.us = add nuw nsw i64 %indvars.iv7185.us, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next72.us, i64 %indvars.iv.next7689.us
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next72.us, i64 %indvars.iv7791
  %55 = load double, double* %54, align 8
  %56 = load double, double* %43, align 8
  %57 = fmul double %55, %56
  %58 = fsub double %53, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next72.us, i64 %indvars.iv.next7689.us
  store double %58, double* %59, align 8
  %indvars.iv.next72.us.1 = add nuw nsw i64 %indvars.iv7185.us, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next72.us.1, 1000
  br i1 %exitcond112.1, label %.preheader65.loopexit.us.loopexit, label %.preheader.us..preheader.us_crit_edge

.preheader.us..preheader.us_crit_edge:            ; preds = %.preheader.us
  br label %.preheader.us

.preheader65.loopexit.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader65.loopexit.us

.preheader65.loopexit.us:                         ; preds = %.preheader.us.prol.loopexit..preheader65.loopexit.us_crit_edge, %.preheader.preheader.us..preheader65.loopexit.us_crit_edge, %.preheader65.loopexit.us.loopexit
  %exitcond.us = icmp eq i64 %indvars.iv.next7689.us, 1199
  br i1 %exitcond.us, label %.preheader65._crit_edge.loopexit, label %.preheader65.loopexit.us..lr.ph90.split.us_crit_edge

.preheader65.loopexit.us..lr.ph90.split.us_crit_edge: ; preds = %.preheader65.loopexit.us
  br label %.lr.ph90.split.us

.lr.ph82.new:                                     ; preds = %.lr.ph82.new..lr.ph82.new_crit_edge, %.lr.ph82.new.preheader
  %indvars.iv6781 = phi i64 [ %indvars.iv.next68.1, %.lr.ph82.new..lr.ph82.new_crit_edge ], [ %indvars.iv6781.unr.ph, %.lr.ph82.new.preheader ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6781, i64 %indvars.iv7791
  %61 = load double, double* %60, align 8
  %62 = load double, double* %24, align 8
  %63 = fdiv double %61, %62
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6781, i64 %indvars.iv7791
  store double %63, double* %64, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv6781, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next68, i64 %indvars.iv7791
  %66 = load double, double* %65, align 8
  %67 = load double, double* %24, align 8
  %68 = fdiv double %66, %67
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next68, i64 %indvars.iv7791
  store double %68, double* %69, align 8
  %indvars.iv.next68.1 = add nuw nsw i64 %indvars.iv6781, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next68.1, 1000
  br i1 %exitcond110.1, label %.preheader65.preheader.loopexit, label %.lr.ph82.new..lr.ph82.new_crit_edge

.lr.ph82.new..lr.ph82.new_crit_edge:              ; preds = %.lr.ph82.new
  br label %.lr.ph82.new

.preheader65._crit_edge.loopexit:                 ; preds = %.preheader65.loopexit.us
  br label %.preheader65._crit_edge

.preheader65._crit_edge:                          ; preds = %.preheader65.preheader..preheader65._crit_edge_crit_edge, %.preheader65._crit_edge.loopexit, %.lr.ph90.split.split.preheader
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv7791, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next78, 1200
  br i1 %exitcond113, label %._crit_edge.loopexit, label %.preheader65._crit_edge..preheader66.preheader_crit_edge

.preheader65._crit_edge..preheader66.preheader_crit_edge: ; preds = %.preheader65._crit_edge
  br label %.preheader66.preheader

._crit_edge.loopexit:                             ; preds = %.preheader65._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader25.preheader.lr.ph, label %.._crit_edge43_crit_edge

.._crit_edge43_crit_edge:                         ; preds = %4
  br label %._crit_edge43

.preheader25.preheader.lr.ph:                     ; preds = %4
  br label %.preheader25.preheader

.preheader25.preheader:                           ; preds = %.preheader25._crit_edge..preheader25.preheader_crit_edge, %.preheader25.preheader.lr.ph
  %indvars.iv3041 = phi i64 [ 0, %.preheader25.preheader.lr.ph ], [ %indvars.iv.next31, %.preheader25._crit_edge..preheader25.preheader_crit_edge ]
  %9 = mul nsw i64 %indvars.iv3041, 1200
  br label %10

; <label>:10:                                     ; preds = %.preheader25._crit_edge1, %.preheader25.preheader
  %indvars.iv2839 = phi i64 [ 0, %.preheader25.preheader ], [ %indvars.iv.next29, %.preheader25._crit_edge1 ]
  %11 = add nsw i64 %indvars.iv2839, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %..preheader25_crit_edge

..preheader25_crit_edge:                          ; preds = %10
  br label %.preheader25

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc34 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %.preheader25

.preheader25:                                     ; preds = %..preheader25_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3041, i64 %indvars.iv2839
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2839, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond, label %.preheader25._crit_edge, label %.preheader25._crit_edge1

.preheader25._crit_edge1:                         ; preds = %.preheader25
  br label %10

.preheader25._crit_edge:                          ; preds = %.preheader25
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3041, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond48, label %._crit_edge43.loopexit, label %.preheader25._crit_edge..preheader25.preheader_crit_edge

.preheader25._crit_edge..preheader25.preheader_crit_edge: ; preds = %.preheader25._crit_edge
  br label %.preheader25.preheader

._crit_edge43.loopexit:                           ; preds = %.preheader25._crit_edge
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %.._crit_edge43_crit_edge, %._crit_edge43.loopexit
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br i1 true, label %.preheader.preheader.us.preheader, label %._crit_edge43.._crit_edge_crit_edge

._crit_edge43.._crit_edge_crit_edge:              ; preds = %._crit_edge43
  br label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %._crit_edge43
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us..preheader.preheader.us_crit_edge, %.preheader.preheader.us.preheader
  %indvars.iv2636.us = phi i64 [ %indvars.iv.next27.us, %.preheader._crit_edge.us..preheader.preheader.us_crit_edge ], [ 0, %.preheader.preheader.us.preheader ]
  %25 = mul nsw i64 %indvars.iv2636.us, 1200
  br label %26

; <label>:26:                                     ; preds = %.preheader.us._crit_edge, %.preheader.preheader.us
  %indvars.iv35.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us._crit_edge ]
  %27 = add nsw i64 %indvars.iv35.us, %25
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %..preheader.us_crit_edge

..preheader.us_crit_edge:                         ; preds = %26
  br label %.preheader.us

; <label>:31:                                     ; preds = %26
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %..preheader.us_crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2636.us, i64 %indvars.iv35.us
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv35.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond45, label %.preheader._crit_edge.us, label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us
  br label %26

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2636.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next27.us, 1000
  br i1 %exitcond46, label %._crit_edge.loopexit, label %.preheader._crit_edge.us..preheader.preheader.us_crit_edge

.preheader._crit_edge.us..preheader.preheader.us_crit_edge: ; preds = %.preheader._crit_edge.us
  br label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge43.._crit_edge_crit_edge, %._crit_edge.loopexit
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %39) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
