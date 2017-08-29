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
  tail call fastcc void @init_array(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
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
  tail call fastcc void @print_array(double* %8, double* %9)
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
define internal fastcc void @init_array(double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph7.split.us.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %5
  br label %._crit_edge

.lr.ph7.split.us.preheader:                       ; preds = %5
  %6 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %..loopexit_crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv26.us = phi i64 [ %indvars.iv.next3.us, %..loopexit_crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %7 = trunc i64 %indvars.iv26.us to i32
  %8 = srem i32 %7, 2000
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %0, i64 %indvars.iv26.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %11 = trunc i64 %indvars.iv.next3.us to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %10, align 8
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv26.us
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %indvars.iv26.us, 3
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv26.us
  %25 = add nuw nsw i64 %indvars.iv26.us, 4
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2000
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 2.000000e+03, double 2.000000e+03>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  store double %32, double* %24, align 8
  %34 = getelementptr inbounds double, double* %3, i64 %indvars.iv26.us
  store double %33, double* %34, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph7.split.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv26.us, i64 0
  store double %6, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph7.split.us
  br i1 false, label %.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.lr.ph7.split.us.new.preheader

.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  br label %..loopexit_crit_edge.us

.lr.ph7.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph7.split.us.new

.lr.ph7.split.us.new:                             ; preds = %.lr.ph7.split.us.new.preheader, %.lr.ph7.split.us.new
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph7.split.us.new ], [ 0, %.lr.ph7.split.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv5.us, %indvars.iv26.us
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %41 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv26.us
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 2000
  %44 = sitofp i32 %43 to double
  %45 = insertelement <2 x double> undef, double %39, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fdiv <2 x double> %46, <double 2.000000e+03, double 2.000000e+03>
  %48 = bitcast double* %40 to <2 x double>*
  store <2 x double> %47, <2 x double>* %48, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv5.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2000
  br i1 %exitcond.us.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph7.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph7.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph7.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.us.preheader, label %.._crit_edge17_crit_edge

.._crit_edge17_crit_edge:                         ; preds = %5
  br label %._crit_edge17

.preheader4.us.preheader:                         ; preds = %5
  %sunkaddr35 = ptrtoint double* %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge21.us, %.preheader4.us.preheader
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %._crit_edge21.us ], [ 0, %.preheader4.us.preheader ]
  br i1 true, label %.prol.loopexit27, label %.prol.preheader26

.prol.preheader26:                                ; preds = %.preheader4.us
  %sunkaddr32 = shl i64 %indvars.iv1122.us, 3
  %sunkaddr33 = add i64 %sunkaddr35, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %6 = load double, double* %sunkaddr34, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv1122.us, i64 0
  %8 = load double, double* %7, align 8
  %9 = load double, double* %2, align 8
  %10 = fmul double %8, %9
  %11 = fadd double %6, %10
  store double %11, double* %sunkaddr34, align 8
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.preheader4.us
  br i1 false, label %.prol.loopexit27.._crit_edge21.us_crit_edge, label %.preheader4.us.new.preheader

.prol.loopexit27.._crit_edge21.us_crit_edge:      ; preds = %.prol.loopexit27
  br label %._crit_edge21.us

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit27
  %sunkaddr36 = shl i64 %indvars.iv1122.us, 3
  %sunkaddr37 = add i64 %sunkaddr35, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %.pre = load double, double* %sunkaddr38, align 8
  br label %.preheader4.us.new

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader, %.preheader4.us.new
  %12 = phi double [ %24, %.preheader4.us.new ], [ %.pre, %.preheader4.us.new.preheader ]
  %indvars.iv719.us = phi i64 [ %indvars.iv.next8.us.1, %.preheader4.us.new ], [ 0, %.preheader4.us.new.preheader ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv1122.us, i64 %indvars.iv719.us
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %2, i64 %indvars.iv719.us
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr38, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv1122.us, i64 %indvars.iv.next8.us
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next8.us
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %sunkaddr38, align 8
  %indvars.iv.next8.us.1 = add nuw nsw i64 %indvars.iv719.us, 2
  %exitcond10.us.1 = icmp eq i64 %indvars.iv.next8.us.1, 2000
  br i1 %exitcond10.us.1, label %._crit_edge21.us.loopexit, label %.preheader4.us.new

._crit_edge21.us.loopexit:                        ; preds = %.preheader4.us.new
  br label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %.prol.loopexit27.._crit_edge21.us_crit_edge, %._crit_edge21.us.loopexit
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next12.us, 2000
  br i1 %exitcond30, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge21.us
  %sunkaddr47 = ptrtoint double* %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv515.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %sunkaddr44 = shl i64 %indvars.iv515.us, 3
  %sunkaddr45 = add i64 %sunkaddr47, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %25 = load double, double* %sunkaddr46, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv515.us
  %27 = load double, double* %26, align 8
  %28 = load double, double* %3, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %25, %29
  store double %30, double* %sunkaddr46, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %sunkaddr48 = shl i64 %indvars.iv515.us, 3
  %sunkaddr49 = add i64 %sunkaddr47, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %.pre31 = load double, double* %sunkaddr50, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %31 = phi double [ %43, %.preheader.us.new ], [ %.pre31, %.preheader.us.new.preheader ]
  %indvars.iv14.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv14.us, i64 %indvars.iv515.us
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %3, i64 %indvars.iv14.us
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %sunkaddr50, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next.us, i64 %indvars.iv515.us
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %sunkaddr50, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv14.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2000
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv515.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us, 2000
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph9.preheader, label %._crit_edge.critedge

.lr.ph9.preheader:                                ; preds = %2
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %12
  %indvars.iv47 = phi i64 [ %indvars.iv.next5, %12 ], [ 0, %.lr.ph9.preheader ]
  %7 = trunc i64 %indvars.iv47 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %.lr.ph9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %.lr.ph9, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv47
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond11, label %._crit_edge10, label %.lr.ph9

._crit_edge10:                                    ; preds = %12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge10.._crit_edge_crit_edge

._crit_edge10.._crit_edge_crit_edge:              ; preds = %._crit_edge10
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge10
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %26
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.lr.ph.preheader ]
  %21 = trunc i64 %indvars.iv6 to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %.lr.ph, %24
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.critedge:                             ; preds = %2
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %26
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge10.._crit_edge_crit_edge, %._crit_edge.loopexit, %._crit_edge.critedge
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #5
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
