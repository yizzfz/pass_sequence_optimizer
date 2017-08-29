; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [2000 x [2000 x double]]*, align 8
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2000, i32* %5, align 4
  %9 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %10 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %9, i8** %10, align 8
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %12 = bitcast [2000 x double]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %14 = bitcast [2000 x double]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = load i32, i32* %5, align 4
  %16 = bitcast [2000 x [2000 x double]]** %6 to [2000 x double]**
  %17 = load [2000 x double]*, [2000 x double]** %16, align 8
  %18 = bitcast [2000 x double]** %7 to double**
  %19 = load double*, double** %18, align 8
  %20 = bitcast i8* %13 to double*
  tail call fastcc void @init_array(i32 %15, [2000 x double]* %17, double* %19, double* %20)
  tail call void (...) @polybench_timer_start() #3
  %21 = load i32, i32* %5, align 4
  %22 = bitcast [2000 x [2000 x double]]** %6 to [2000 x double]**
  %23 = load [2000 x double]*, [2000 x double]** %22, align 8
  %24 = bitcast [2000 x double]** %7 to double**
  %25 = load double*, double** %24, align 8
  %26 = bitcast [2000 x double]** %8 to double**
  %27 = load double*, double** %26, align 8
  tail call fastcc void @kernel_trisolv(i32 %21, [2000 x double]* %23, double* %25, double* %27)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %28 = load i32, i32* %3, align 4
  %29 = icmp sgt i32 %28, 42
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %2
  %31 = load i8**, i8*** %4, align 8
  %32 = load i8*, i8** %31, align 8
  %strcmpload = load i8, i8* %32, align 1
  %33 = icmp eq i8 %strcmpload, 0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %5, align 4
  %36 = bitcast [2000 x double]** %7 to double**
  %37 = load double*, double** %36, align 8
  tail call fastcc void @print_array(i32 %35, double* %37)
  br label %38

; <label>:38:                                     ; preds = %30, %34, %2
  %39 = bitcast [2000 x [2000 x double]]** %6 to i8**
  %40 = load i8*, i8** %39, align 8
  tail call void @free(i8* %40) #3
  %41 = bitcast [2000 x double]** %7 to i8**
  %42 = load i8*, i8** %41, align 8
  tail call void @free(i8* %42) #3
  %43 = bitcast [2000 x double]** %8 to i8**
  %44 = load i8*, i8** %43, align 8
  tail call void @free(i8* %44) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca [2000 x double]*, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store [2000 x double]* %1, [2000 x double]** %6, align 8
  store double* %2, double** %7, align 8
  store double* %3, double** %8, align 8
  store i32 0, i32* %9, align 4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph6, label %59

.lr.ph6:                                          ; preds = %4
  %11 = load double*, double** %7, align 8
  %12 = load double*, double** %8, align 8
  %13 = load i32, i32* %5, align 4
  %14 = sitofp i32 %13 to double
  %15 = load [2000 x double]*, [2000 x double]** %6, align 8
  %.promoted = load i32, i32* %9, align 4
  %16 = add i32 %.promoted, 1
  %17 = sext i32 %.promoted to i64
  %18 = sext i32 %13 to i64
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  br label %21

; <label>:21:                                     ; preds = %.lr.ph6, %._crit_edge
  %indvars.iv13 = phi i64 [ %17, %.lr.ph6 ], [ %indvars.iv.next14, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph6 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv11 = phi i32 [ %16, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge ]
  %22 = phi i32 [ %.promoted, %.lr.ph6 ], [ %56, %._crit_edge ]
  %storemerge4 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next14, %._crit_edge ]
  %sext = shl i64 %storemerge4, 32
  %23 = ashr exact i64 %sext, 32
  %24 = getelementptr inbounds double, double* %11, i64 %23
  store double -9.990000e+02, double* %24, align 8
  %25 = trunc i64 %indvars.iv13 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %12, i64 %indvars.iv13
  store double %26, double* %27, align 8
  %28 = icmp slt i64 %indvars.iv13, 0
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %21
  %29 = add i32 %16, %indvar
  %xtraiter = and i32 %29, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = add i32 %22, 1
  %31 = add i32 %30, %13
  %32 = sitofp i32 %31 to double
  %33 = fmul double %32, 2.000000e+00
  %34 = fdiv double %33, %14
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv13, i64 0
  store double %34, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %36 = sub i32 0, %indvar
  %37 = icmp eq i32 %.promoted, %36
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %38 = trunc i64 %indvars.iv13 to i32
  %39 = trunc i64 %indvars.iv13 to i32
  %wide.trip.count.1 = zext i32 %indvars.iv11 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %40 = sub nsw i64 1, %indvars.iv
  %41 = trunc i64 %40 to i32
  %42 = add i32 %41, %38
  %43 = add i32 %42, %13
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv13, i64 %indvars.iv
  %46 = sub i64 0, %indvars.iv
  %47 = trunc i64 %46 to i32
  %48 = add i32 %47, %39
  %49 = add i32 %48, %13
  %50 = sitofp i32 %49 to double
  %51 = insertelement <2 x double> undef, double %44, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %52, <double 2.000000e+00, double 2.000000e+00>
  %54 = fdiv <2 x double> %53, %20
  %55 = bitcast double* %45 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %21
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %56 = add nsw i32 %22, 1
  %57 = icmp slt i64 %indvars.iv.next14, %18
  %indvars.iv.next12 = add i32 %indvars.iv11, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %57, label %21, label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge
  %58 = trunc i64 %indvars.iv.next14 to i32
  store i32 %58, i32* %9, align 4
  br label %59

; <label>:59:                                     ; preds = %._crit_edge7, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca [2000 x double]*, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store [2000 x double]* %1, [2000 x double]** %6, align 8
  store double* %2, double** %7, align 8
  store double* %3, double** %8, align 8
  store i32 0, i32* %9, align 4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph7, label %59

.lr.ph7:                                          ; preds = %4
  %11 = load double*, double** %8, align 8
  %12 = load double*, double** %7, align 8
  %13 = load [2000 x double]*, [2000 x double]** %6, align 8
  %14 = load i32, i32* %5, align 4
  %.promoted = load i32, i32* %9, align 4
  %15 = add i32 %.promoted, -1
  %16 = sext i32 %.promoted to i64
  %17 = sext i32 %14 to i64
  br label %18

; <label>:18:                                     ; preds = %.lr.ph7, %._crit_edge
  %indvars.iv16 = phi i64 [ %16, %.lr.ph7 ], [ %indvars.iv.next17, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph7 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv14 = phi i32 [ %.promoted, %.lr.ph7 ], [ %indvars.iv.next15, %._crit_edge ]
  %storemerge5 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next17, %._crit_edge ]
  %sext = shl i64 %storemerge5, 32
  %19 = ashr exact i64 %sext, 32
  %20 = getelementptr inbounds double, double* %11, i64 %19
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds double, double* %12, i64 %19
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %25 = icmp sgt i64 %indvars.iv16, 0
  br i1 %25, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %18
  %26 = add i32 %.promoted, %indvar
  %xtraiter = and i32 %26, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv16, i64 0
  %28 = load double, double* %27, align 8
  %29 = load double, double* %12, align 8
  %30 = fmul double %28, %29
  %31 = getelementptr inbounds double, double* %12, i64 %indvars.iv16
  %32 = load double, double* %31, align 8
  %33 = fsub double %32, %30
  store double %33, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %34 = sub i32 0, %indvar
  %35 = icmp eq i32 %15, %34
  br i1 %35, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %36 = getelementptr inbounds double, double* %12, i64 %indvars.iv16
  %37 = getelementptr inbounds double, double* %12, i64 %indvars.iv16
  %wide.trip.count.1 = zext i32 %indvars.iv14 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv16, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %36, align 8
  %44 = fsub double %43, %42
  store double %44, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv16, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %12, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %37, align 8
  %51 = fsub double %50, %49
  store double %51, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %18
  %52 = getelementptr inbounds double, double* %12, i64 %indvars.iv16
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv16, i64 %indvars.iv16
  %55 = load double, double* %54, align 8
  %56 = fdiv double %53, %55
  store double %56, double* %52, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %indvars.iv.next15 = add i32 %indvars.iv14, 1
  %57 = icmp slt i64 %indvars.iv.next17, %17
  %indvar.next = add i32 %indvar, 1
  br i1 %57, label %18, label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge
  %58 = trunc i64 %indvars.iv.next17 to i32
  store i32 %58, i32* %9, align 4
  br label %59

; <label>:59:                                     ; preds = %._crit_edge8, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %11, label %.lr.ph, label %30

.lr.ph:                                           ; preds = %2
  %13 = load double*, double** %4, align 8
  %14 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %26
  %16 = phi i32 [ %.promoted, %.lr.ph ], [ %27, %26 ]
  %17 = phi %struct._IO_FILE* [ %12, %.lr.ph ], [ %29, %26 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %27, %26 ]
  %18 = sext i32 %storemerge1 to i64
  %19 = getelementptr inbounds double, double* %13, i64 %18
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %20) #5
  %22 = srem i32 %16, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %15
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #4
  br label %26

; <label>:26:                                     ; preds = %15, %24
  %27 = add nsw i32 %16, 1
  %28 = icmp slt i32 %27, %14
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %28, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %26
  store i32 %27, i32* %5, align 4
  br label %30

; <label>:30:                                     ; preds = %._crit_edge, %2
  %.lcssa = phi %struct._IO_FILE* [ %29, %._crit_edge ], [ %12, %2 ]
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
