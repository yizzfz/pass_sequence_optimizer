; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %39, %3
  %indvars.iv6 = phi i64 [ 0, %3 ], [ %indvars.iv.next7, %39 ]
  %4 = icmp sgt i64 %indvars.iv6, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 0
  store double %8, double* %9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %10 = icmp eq i64 %indvars.iv6, 1
  br i1 %10, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %11 = add nuw nsw i64 %indvars.iv, %indvars.iv6
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1000
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = add nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %14, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fdiv <2 x double> %21, <double 1.000000e+03, double 1.000000e+03>
  %23 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv6
  store double 1.000000e+00, double* %24, align 8
  %25 = add nuw nsw i64 %indvars.iv6, 1200
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %._crit_edge
  %indvars.iv3 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next4.1, %._crit_edge9 ]
  %26 = sub nuw nsw i64 %25, %indvars.iv3
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv3
  %indvars.iv.next4 = or i64 %indvars.iv3, 1
  %31 = sub nuw nsw i64 %25, %indvars.iv.next4
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, <double 1.200000e+03, double 1.200000e+03>
  %38 = bitcast double* %30 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv3, 2
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4.1, 1200
  br i1 %exitcond5.1, label %39, label %._crit_edge9

; <label>:39:                                     ; preds = %._crit_edge9
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %40, label %.preheader

; <label>:40:                                     ; preds = %39
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %4 = insertelement <2 x double> undef, double %0, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %6 = insertelement <2 x double> undef, double %0, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader1

.preheader1:                                      ; preds = %.us-lcssa.us, %3
  %indvars.iv9 = phi i64 [ 0, %3 ], [ %indvars.iv.next10, %.us-lcssa.us ]
  %indvars.iv1 = phi i64 [ 1, %3 ], [ %indvars.iv.next2, %.us-lcssa.us ]
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %8 = icmp slt i64 %indvars.iv.next10, 1000
  br i1 %8, label %.preheader1..preheader.us_crit_edge, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader1..preheader.us_crit_edge:              ; preds = %.preheader1
  %9 = sub nuw nsw i64 999, %indvars.iv9
  %xtraiter = and i64 %9, 1
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv9
  %indvars.iv.next4.prol = add nuw nsw i64 %indvars.iv1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader1..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %.preheader1..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = icmp eq i64 %xtraiter, 0
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv6
  br i1 %11, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %13 = load double, double* %10, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv6
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %12, align 8
  %18 = fadd double %17, %16
  store double %18, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv3.unr.ph = phi i64 [ %indvars.iv.next4.prol, %.prol.preheader ], [ %indvars.iv1, %.preheader.us ]
  %19 = icmp eq i64 %indvars.iv9, 998
  br i1 %19, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv3.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next4.1, %.preheader.us.new ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv9
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv6
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = load double, double* %12, align 8
  %26 = fadd double %25, %24
  store double %26, double* %12, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next4, i64 %indvars.iv9
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next4, i64 %indvars.iv6
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %12, align 8
  %33 = fadd double %32, %31
  store double %33, double* %12, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4.1, 1000
  br i1 %exitcond5.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv6
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %0
  store double %36, double* %34, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond8, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.4, %.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %38 = bitcast double* %37 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %40 = fmul <2 x double> %39, %5
  %41 = bitcast double* %37 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv.next.1
  %43 = bitcast double* %42 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %45 = fmul <2 x double> %44, %7
  %46 = bitcast double* %42 to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv.next.3
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %0
  store double %49, double* %47, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %.us-lcssa.us.loopexit14, label %.preheader

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit14:                          ; preds = %.preheader
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit14, %.us-lcssa.us.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond11, label %50, label %.preheader1

; <label>:50:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
