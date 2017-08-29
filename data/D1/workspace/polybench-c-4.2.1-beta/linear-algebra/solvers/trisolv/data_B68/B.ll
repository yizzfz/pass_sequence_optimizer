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
  %9 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %10 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %9, i8** %10, align 8
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = bitcast [2000 x double]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast [2000 x double]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = load i32, i32* %5, align 4
  %16 = bitcast [2000 x [2000 x double]]** %6 to [2000 x double]**
  %17 = load [2000 x double]*, [2000 x double]** %16, align 8
  %18 = bitcast [2000 x double]** %7 to double**
  %19 = load double*, double** %18, align 8
  %20 = bitcast i8* %13 to double*
  tail call fastcc void @init_array(i32 %15, [2000 x double]* %17, double* %19, double* %20)
  tail call void (...) @polybench_timer_start() #4
  %21 = load i32, i32* %5, align 4
  %22 = bitcast [2000 x [2000 x double]]** %6 to [2000 x double]**
  %23 = load [2000 x double]*, [2000 x double]** %22, align 8
  %24 = bitcast [2000 x double]** %7 to double**
  %25 = load double*, double** %24, align 8
  %26 = bitcast [2000 x double]** %8 to double**
  %27 = load double*, double** %26, align 8
  tail call fastcc void @kernel_trisolv(i32 %21, [2000 x double]* %23, double* %25, double* %27)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %40) #4
  %41 = bitcast [2000 x double]** %7 to i8**
  %42 = load i8*, i8** %41, align 8
  tail call void @free(i8* %42) #4
  %43 = bitcast [2000 x double]** %8 to i8**
  %44 = load i8*, i8** %43, align 8
  tail call void @free(i8* %44) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #2 {
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
  br i1 %10, label %.lr.ph4, label %56

.lr.ph4:                                          ; preds = %4
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

; <label>:21:                                     ; preds = %.lr.ph4, %._crit_edge
  %indvars.iv11 = phi i64 [ %17, %.lr.ph4 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph4 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv9 = phi i32 [ %16, %.lr.ph4 ], [ %indvars.iv.next10, %._crit_edge ]
  %22 = phi i32 [ %.promoted, %.lr.ph4 ], [ %53, %._crit_edge ]
  %23 = getelementptr inbounds double, double* %11, i64 %indvars.iv11
  store double -9.990000e+02, double* %23, align 8
  %24 = trunc i64 %indvars.iv11 to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %12, i64 %indvars.iv11
  store double %25, double* %26, align 8
  %27 = icmp slt i64 %indvars.iv11, 0
  br i1 %27, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %21
  %28 = add i32 %16, %indvar
  %xtraiter = and i32 %28, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %29 = add i32 %22, 1
  %30 = add i32 %29, %13
  %31 = sitofp i32 %30 to double
  %32 = fmul double %31, 2.000000e+00
  %33 = fdiv double %32, %14
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv11, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %35 = sub i32 0, %indvar
  %36 = icmp eq i32 %.promoted, %35
  br i1 %36, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %37 = add i32 %22, 1
  %38 = add i32 %37, %13
  %39 = add i32 %22, 1
  %40 = add i32 %39, %13
  %wide.trip.count.1 = zext i32 %indvars.iv9 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = trunc i64 %indvars.iv to i32
  %42 = sub i32 %38, %41
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = trunc i64 %indvars.iv.next to i32
  %46 = sub i32 %40, %45
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %49, <double 2.000000e+00, double 2.000000e+00>
  %51 = fdiv <2 x double> %50, %20
  %52 = bitcast double* %44 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %21
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %53 = add nsw i32 %22, 1
  %54 = icmp slt i64 %indvars.iv.next12, %18
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %54, label %21, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge
  %55 = trunc i64 %indvars.iv.next12 to i32
  store i32 %55, i32* %9, align 4
  br label %56

; <label>:56:                                     ; preds = %._crit_edge5, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #2 {
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
  br i1 %10, label %.lr.ph3, label %57

.lr.ph3:                                          ; preds = %4
  %11 = load double*, double** %8, align 8
  %12 = load double*, double** %7, align 8
  %13 = load [2000 x double]*, [2000 x double]** %6, align 8
  %14 = load i32, i32* %5, align 4
  %.promoted5 = load i32, i32* %9, align 4
  %15 = add i32 %.promoted5, -1
  %16 = sext i32 %.promoted5 to i64
  %17 = sext i32 %14 to i64
  br label %18

; <label>:18:                                     ; preds = %.lr.ph3, %._crit_edge
  %indvars.iv11 = phi i64 [ %16, %.lr.ph3 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph3 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv9 = phi i32 [ %.promoted5, %.lr.ph3 ], [ %indvars.iv.next10, %._crit_edge ]
  %19 = getelementptr inbounds double, double* %11, i64 %indvars.iv11
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv11
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %24 = icmp sgt i64 %indvars.iv11, 0
  br i1 %24, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %18
  %25 = add i32 %.promoted5, %indvar
  %26 = getelementptr inbounds double, double* %12, i64 %indvars.iv11
  %xtraiter = and i32 %25, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv11, i64 0
  %28 = load double, double* %27, align 8
  %29 = load double, double* %12, align 8
  %30 = fmul double %28, %29
  %31 = load double, double* %26, align 8
  %32 = fsub double %31, %30
  store double %32, double* %26, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %33 = sub i32 0, %indvar
  %34 = icmp eq i32 %15, %33
  br i1 %34, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv9 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv11, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %26, align 8
  %41 = fsub double %40, %39
  store double %41, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv11, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %12, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %26, align 8
  %48 = fsub double %47, %46
  store double %48, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %18
  %49 = getelementptr inbounds double, double* %12, i64 %indvars.iv11
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv11, i64 %indvars.iv11
  %52 = load double, double* %51, align 8
  %53 = fdiv double %50, %52
  %54 = getelementptr inbounds double, double* %12, i64 %indvars.iv11
  store double %53, double* %54, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  %55 = icmp slt i64 %indvars.iv.next12, %17
  %indvar.next = add i32 %indvar, 1
  br i1 %55, label %18, label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge
  %56 = trunc i64 %indvars.iv.next12 to i32
  store i32 %56, i32* %9, align 4
  br label %57

; <label>:57:                                     ; preds = %._crit_edge4, %4
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
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %11, label %.lr.ph, label %31

.lr.ph:                                           ; preds = %2
  %13 = load double*, double** %4, align 8
  %14 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %15 = sext i32 %.promoted to i64
  %16 = sext i32 %14 to i64
  br label %17

; <label>:17:                                     ; preds = %.lr.ph, %27
  %indvars.iv = phi i64 [ %15, %.lr.ph ], [ %indvars.iv.next, %27 ]
  %18 = phi %struct._IO_FILE* [ %12, %.lr.ph ], [ %29, %27 ]
  %19 = getelementptr inbounds double, double* %13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %20) #6
  %22 = trunc i64 %indvars.iv to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %17
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %17, %25
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %28 = icmp slt i64 %indvars.iv.next, %16
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %28, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %27
  %30 = trunc i64 %indvars.iv.next to i32
  store i32 %30, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %._crit_edge, %2
  %.lcssa = phi %struct._IO_FILE* [ %29, %._crit_edge ], [ %12, %2 ]
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
