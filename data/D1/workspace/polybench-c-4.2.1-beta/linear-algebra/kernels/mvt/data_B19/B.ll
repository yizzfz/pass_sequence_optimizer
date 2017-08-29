; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 2000, double* %8, double* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph7.split.us.preheader, label %.loopexit._crit_edge

.lr.ph7.split.us.preheader:                       ; preds = %6
  %7 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %..loopexit.loopexit_crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %..loopexit.loopexit_crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %8 = trunc i64 %indvars.iv26.us to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv26.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %12 = trunc i64 %indvars.iv.next3.us to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %11, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv26.us
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv26.us, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv26.us
  %26 = add nuw nsw i64 %indvars.iv26.us, 4
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 2.000000e+03, double 2.000000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv26.us
  store double %34, double* %35, align 8
  br i1 true, label %.prol.loopexit, label %36

; <label>:36:                                     ; preds = %.lr.ph7.split.us
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv26.us, i64 0
  store double %7, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph7.split.us, %36
  %indvars.iv5.us.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph7.split.us ]
  br i1 false, label %..loopexit.loopexit_crit_edge.us, label %.lr.ph7.split.us.new.preheader

.lr.ph7.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph7.split.us.new

.lr.ph7.split.us.new:                             ; preds = %.lr.ph7.split.us.new.preheader, %.lr.ph7.split.us.new
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph7.split.us.new ], [ %indvars.iv5.us.unr.ph, %.lr.ph7.split.us.new.preheader ]
  %38 = mul nuw nsw i64 %indvars.iv5.us, %indvars.iv26.us
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 2000
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %43 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv26.us
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 2000
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fdiv <2 x double> %48, <double 2.000000e+03, double 2.000000e+03>
  %50 = bitcast double* %42 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv5.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2000
  br i1 %exitcond.us.1, label %..loopexit.loopexit_crit_edge.us.loopexit, label %.lr.ph7.split.us.new

..loopexit.loopexit_crit_edge.us.loopexit:        ; preds = %.lr.ph7.split.us.new
  br label %..loopexit.loopexit_crit_edge.us

..loopexit.loopexit_crit_edge.us:                 ; preds = %..loopexit.loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 2000
  br i1 %exitcond, label %.loopexit._crit_edge.loopexit, label %.lr.ph7.split.us

.loopexit._crit_edge.loopexit:                    ; preds = %..loopexit.loopexit_crit_edge.us
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.preheader.us.preheader, label %._crit_edge

.preheader4.preheader.us.preheader:               ; preds = %6
  %sunkaddr30 = ptrtoint double* %1 to i64
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4._crit_edge.us, %.preheader4.preheader.us.preheader
  %indvars.iv1120.us = phi i64 [ %indvars.iv.next12.us, %.preheader4._crit_edge.us ], [ 0, %.preheader4.preheader.us.preheader ]
  br i1 true, label %.preheader4.us.prol.loopexit, label %.preheader4.us.prol

.preheader4.us.prol:                              ; preds = %.preheader4.preheader.us
  %sunkaddr27 = shl i64 %indvars.iv1120.us, 3
  %sunkaddr28 = add i64 %sunkaddr30, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %7 = load double, double* %sunkaddr29, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv1120.us, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %3, align 8
  %11 = fmul double %9, %10
  %12 = fadd double %7, %11
  store double %12, double* %sunkaddr29, align 8
  br label %.preheader4.us.prol.loopexit

.preheader4.us.prol.loopexit:                     ; preds = %.preheader4.preheader.us, %.preheader4.us.prol
  %indvars.iv718.us.unr.ph = phi i64 [ 1, %.preheader4.us.prol ], [ 0, %.preheader4.preheader.us ]
  br i1 false, label %.preheader4._crit_edge.us, label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.us.prol.loopexit
  %sunkaddr31 = shl i64 %indvars.iv1120.us, 3
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  %.pre = load double, double* %sunkaddr33, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %.preheader4.us
  %13 = phi double [ %25, %.preheader4.us ], [ %.pre, %.preheader4.us.preheader ]
  %indvars.iv718.us = phi i64 [ %indvars.iv.next8.us.1, %.preheader4.us ], [ %indvars.iv718.us.unr.ph, %.preheader4.us.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv1120.us, i64 %indvars.iv718.us
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv718.us
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %sunkaddr33, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv718.us, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv1120.us, i64 %indvars.iv.next8.us
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next8.us
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %sunkaddr33, align 8
  %indvars.iv.next8.us.1 = add nuw nsw i64 %indvars.iv718.us, 2
  %exitcond10.us.1 = icmp eq i64 %indvars.iv.next8.us.1, 2000
  br i1 %exitcond10.us.1, label %.preheader4._crit_edge.us.loopexit, label %.preheader4.us

.preheader4._crit_edge.us.loopexit:               ; preds = %.preheader4.us
  br label %.preheader4._crit_edge.us

.preheader4._crit_edge.us:                        ; preds = %.preheader4._crit_edge.us.loopexit, %.preheader4.us.prol.loopexit
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1120.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next12.us, 2000
  br i1 %exitcond26, label %.preheader.preheader.us.preheader, label %.preheader4.preheader.us

.preheader.preheader.us.preheader:                ; preds = %.preheader4._crit_edge.us
  %sunkaddr38 = ptrtoint double* %2 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv515.us = phi i64 [ %indvars.iv.next6.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  br i1 true, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.preheader.us
  %sunkaddr35 = shl i64 %indvars.iv515.us, 3
  %sunkaddr36 = add i64 %sunkaddr38, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %26 = load double, double* %sunkaddr37, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv515.us
  %28 = load double, double* %27, align 8
  %29 = load double, double* %4, align 8
  %30 = fmul double %28, %29
  %31 = fadd double %26, %30
  store double %31, double* %sunkaddr37, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.preheader.us, %.preheader.us.prol
  %indvars.iv14.us.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  br i1 false, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  %sunkaddr39 = shl i64 %indvars.iv515.us, 3
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %.pre42 = load double, double* %sunkaddr41, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %32 = phi double [ %44, %.preheader.us ], [ %.pre42, %.preheader.us.preheader ]
  %indvars.iv14.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us ], [ %indvars.iv14.us.unr.ph, %.preheader.us.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv14.us, i64 %indvars.iv515.us
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv14.us
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %sunkaddr41, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next.us, i64 %indvars.iv515.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %sunkaddr41, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv14.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2000
  br i1 %exitcond.us.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv515.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph9.preheader, label %._crit_edge.critedge

.lr.ph9.preheader:                                ; preds = %3
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %13
  %indvars.iv47 = phi i64 [ %indvars.iv.next5, %13 ], [ 0, %.lr.ph9.preheader ]
  %8 = trunc i64 %indvars.iv47 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph9, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv47
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond11, label %._crit_edge10, label %.lr.ph9

._crit_edge10:                                    ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge10.._crit_edge_crit_edge

._crit_edge10.._crit_edge_crit_edge:              ; preds = %._crit_edge10
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge10
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %27
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %27 ], [ 0, %.lr.ph.preheader ]
  %22 = trunc i64 %indvars.iv6 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %.lr.ph, %25
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge10.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
