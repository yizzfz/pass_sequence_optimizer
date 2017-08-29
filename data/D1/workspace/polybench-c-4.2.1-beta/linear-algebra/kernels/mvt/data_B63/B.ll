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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 2000, double* %8, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br i1 true, label %.lr.ph2, label %._crit_edge

.lr.ph2:                                          ; preds = %6
  %7 = fdiv double 0.000000e+00, 2.000000e+03
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph2
  %indvars.iv5 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next6, %..loopexit_crit_edge.us ]
  %8 = trunc i64 %indvars.iv5 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %11 = icmp eq i64 %indvars.iv.next6, 2000
  %12 = trunc i64 %indvars.iv.next6 to i32
  %13 = sitofp i32 %12 to double
  %14 = select i1 %11, double 0.000000e+00, double %13
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv5, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  %26 = add nuw nsw i64 %indvars.iv5, 4
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 2.000000e+03, double 2.000000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %34, double* %35, align 8
  br i1 true, label %.prol.loopexit, label %36

; <label>:36:                                     ; preds = %.lr.ph.us
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 0
  store double %7, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %36
  %indvars.iv.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph.us ]
  br i1 false, label %..loopexit_crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %38 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 2000
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 2000
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fdiv <2 x double> %48, <double 2.000000e+03, double 2.000000e+03>
  %50 = bitcast double* %42 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double*, double*, double*, double*, [2000 x double]*) unnamed_addr #2 {
  %7 = alloca double*, align 8
  %8 = alloca [2000 x double]*, align 8
  store double* %4, double** %7, align 8
  store [2000 x double]* %5, [2000 x double]** %8, align 8
  br i1 true, label %.preheader5.lr.ph, label %.preheader4._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %sunkaddr34 = ptrtoint double* %1 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us, %.preheader5.lr.ph
  %indvars.iv27 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next28, %._crit_edge9.us ]
  br i1 true, label %.prol.loopexit24, label %9

; <label>:9:                                      ; preds = %.preheader5.us
  %sunkaddr31 = shl i64 %indvars.iv27, 3
  %sunkaddr32 = add i64 %sunkaddr34, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  %10 = load double, double* %sunkaddr33, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv27, i64 0
  %12 = load double, double* %11, align 8
  %13 = load double, double* %3, align 8
  %14 = fmul double %12, %13
  %15 = fadd double %10, %14
  store double %15, double* %sunkaddr33, align 8
  br label %.prol.loopexit24

.prol.loopexit24:                                 ; preds = %.preheader5.us, %9
  %indvars.iv19.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader5.us ]
  br i1 false, label %._crit_edge9.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit24
  %sunkaddr35 = shl i64 %indvars.iv27, 3
  %sunkaddr36 = add i64 %sunkaddr34, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %.pre = load double, double* %sunkaddr37, align 8
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader, %.preheader5.us.new
  %16 = phi double [ %28, %.preheader5.us.new ], [ %.pre, %.preheader5.us.new.preheader ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %.preheader5.us.new ], [ %indvars.iv19.unr.ph, %.preheader5.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv19
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %16, %21
  store double %22, double* %sunkaddr37, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next20
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %sunkaddr37, align 8
  %indvars.iv.next20.1 = add nuw nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, 2000
  br i1 %exitcond22.1, label %._crit_edge9.us.loopexit, label %.preheader5.us.new

._crit_edge9.us.loopexit:                         ; preds = %.preheader5.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit24
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 2000
  br i1 %exitcond30, label %.preheader.lr.ph, label %.preheader5.us

.preheader.lr.ph:                                 ; preds = %._crit_edge9.us
  %29 = load [2000 x double]*, [2000 x double]** %8, align 8
  %30 = load double*, double** %7, align 8
  %sunkaddr42 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge.us ]
  br i1 true, label %.prol.loopexit, label %31

; <label>:31:                                     ; preds = %.preheader.us
  %sunkaddr39 = shl i64 %indvars.iv16, 3
  %sunkaddr40 = add i64 %sunkaddr42, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %32 = load double, double* %sunkaddr41, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 0, i64 %indvars.iv16
  %34 = load double, double* %33, align 8
  %35 = load double, double* %30, align 8
  %36 = fmul double %34, %35
  %37 = fadd double %32, %36
  store double %37, double* %sunkaddr41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %31
  %indvars.iv.unr.ph = phi i64 [ 1, %31 ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %sunkaddr43 = shl i64 %indvars.iv16, 3
  %sunkaddr44 = add i64 %sunkaddr42, %sunkaddr43
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to double*
  %.pre47 = load double, double* %sunkaddr45, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %38 = phi double [ %50, %.preheader.us.new ], [ %.pre47, %.preheader.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv, i64 %indvars.iv16
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %30, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %sunkaddr45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv.next, i64 %indvars.iv16
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %30, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %sunkaddr45, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond, label %.preheader4._crit_edge.loopexit, label %.preheader.us

.preheader4._crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %6
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
  br i1 true, label %.lr.ph6.preheader, label %._crit_edge14.critedge

.lr.ph6.preheader:                                ; preds = %3
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6.preheader, %.lr.ph6._crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.lr.ph6._crit_edge ], [ 0, %.lr.ph6.preheader ]
  %8 = trunc i64 %indvars.iv9 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph6._crit_edge

; <label>:11:                                     ; preds = %.lr.ph6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.lr.ph6._crit_edge

.lr.ph6._crit_edge:                               ; preds = %.lr.ph6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %._crit_edge, label %.lr.ph6

._crit_edge:                                      ; preds = %.lr.ph6._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge.._crit_edge14_crit_edge

._crit_edge.._crit_edge14_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge14

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %.lr.ph._crit_edge

; <label>:24:                                     ; preds = %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %24
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge14.loopexit, label %.lr.ph

._crit_edge14.critedge:                           ; preds = %3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %._crit_edge14

._crit_edge14.loopexit:                           ; preds = %.lr.ph._crit_edge
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge.._crit_edge14_crit_edge, %._crit_edge14.loopexit, %._crit_edge14.critedge
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #5
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
