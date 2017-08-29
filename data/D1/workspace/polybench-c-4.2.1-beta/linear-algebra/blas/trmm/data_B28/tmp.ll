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
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %41, %5
  %indvars.iv41 = phi i64 [ 0, %5 ], [ %indvars.iv.next42, %41 ]
  %6 = add nuw nsw i64 %indvars.iv41, 4294967295
  %7 = icmp sgt i64 %indvars.iv41, 0
  br i1 %7, label %.lr.ph, label %.preheader._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter43 = and i64 %indvars.iv41, 1
  %lcmp.mod = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod, label %._crit_edge32.prol.loopexit, label %._crit_edge32.prol

._crit_edge32.prol:                               ; preds = %.lr.ph
  %8 = trunc i64 %indvars.iv41 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 0
  store double %11, double* %12, align 8
  br label %._crit_edge32.prol.loopexit

._crit_edge32.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge32.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge32.prol ], [ 0, %.lr.ph ]
  %13 = trunc i64 %6 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %.preheader._crit_edge, label %._crit_edge32.preheader

._crit_edge32.preheader:                          ; preds = %._crit_edge32.prol.loopexit
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.preheader, %._crit_edge32
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge32 ], [ %indvars.iv.unr.ph, %._crit_edge32.preheader ]
  %15 = add nuw nsw i64 %indvars.iv, %indvars.iv41
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = add nuw nsw i64 %indvars.iv.next, %indvars.iv41
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv.next
  store double %25, double* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv41
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %._crit_edge32

.preheader._crit_edge.loopexit:                   ; preds = %._crit_edge32
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %._crit_edge32.prol.loopexit, %.preheader
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv41
  store double 1.000000e+00, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv41, 1200
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33, %.preheader._crit_edge
  %indvars.iv36 = phi i64 [ 0, %.preheader._crit_edge ], [ %indvars.iv.next37.1, %._crit_edge33 ]
  %29 = sub nuw nsw i64 %28, %indvars.iv36
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1200
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.200000e+03
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv36
  store double %33, double* %34, align 8
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %35 = sub nuw nsw i64 %28, %indvars.iv.next37
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1200
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.200000e+03
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next37
  store double %39, double* %40, align 8
  %indvars.iv.next37.1 = add nuw nsw i64 %indvars.iv36, 2
  %exitcond.138 = icmp eq i64 %indvars.iv.next37.1, 1200
  br i1 %exitcond.138, label %41, label %._crit_edge33

; <label>:41:                                     ; preds = %._crit_edge33
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond, label %42, label %.preheader

; <label>:42:                                     ; preds = %41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader27

.preheader27:                                     ; preds = %.us-lcssa.us, %5
  %indvars.iv38 = phi i64 [ 0, %5 ], [ %indvars.iv.next39, %.us-lcssa.us ]
  %indvars.iv32 = phi i64 [ 1, %5 ], [ %indvars.iv.next33.pre-phi, %.us-lcssa.us ]
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %6 = icmp slt i64 %indvars.iv.next39, 1000
  br i1 %6, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader27
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader27
  %7 = sub nsw i64 998, %indvars.iv38
  %8 = sub nuw nsw i64 999, %indvars.iv38
  %xtraiter41 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %xtraiter41, 0
  %9 = trunc i64 %7 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv32, i64 %indvars.iv38
  %indvars.iv.next35.prol = add nuw nsw i64 %indvars.iv32, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next37, %._crit_edge.us ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv36
  br i1 %lcmp.mod, label %._crit_edge30.us.prol.loopexit, label %._crit_edge30.us.prol

._crit_edge30.us.prol:                            ; preds = %.preheader.us
  %13 = load double, double* %11, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv36
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %12, align 8
  %18 = fadd double %17, %16
  store double %18, double* %12, align 8
  br label %._crit_edge30.us.prol.loopexit

._crit_edge30.us.prol.loopexit:                   ; preds = %.preheader.us, %._crit_edge30.us.prol
  %indvars.iv34.unr.ph = phi i64 [ %indvars.iv.next35.prol, %._crit_edge30.us.prol ], [ %indvars.iv32, %.preheader.us ]
  %.pre44 = load double, double* %12, align 8
  br i1 %10, label %._crit_edge.us, label %._crit_edge30.us.preheader

._crit_edge30.us.preheader:                       ; preds = %._crit_edge30.us.prol.loopexit
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.preheader, %._crit_edge30.us
  %19 = phi double [ %31, %._crit_edge30.us ], [ %.pre44, %._crit_edge30.us.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %._crit_edge30.us ], [ %indvars.iv34.unr.ph, %._crit_edge30.us.preheader ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv38
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv36
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next35, i64 %indvars.iv38
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next35, i64 %indvars.iv36
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next35.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge30.us

._crit_edge.us.loopexit:                          ; preds = %._crit_edge30.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge30.us.prol.loopexit
  %32 = phi double [ %.pre44, %._crit_edge30.us.prol.loopexit ], [ %31, %._crit_edge.us.loopexit ]
  %33 = fmul double %32, %2
  store double %33, double* %12, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %.preheader ], [ 0, %.preheader.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  store double %36, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %2
  store double %39, double* %37, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  store double %42, double* %40, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %2
  store double %45, double* %43, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.3
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %2
  store double %48, double* %46, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %.us-lcssa.us.loopexit43, label %.preheader

.us-lcssa.us.loopexit43:                          ; preds = %.preheader
  %.pre45 = add nuw nsw i64 %indvars.iv32, 1
  br label %.us-lcssa.us

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit, %.us-lcssa.us.loopexit43
  %indvars.iv.next33.pre-phi = phi i64 [ %.pre45, %.us-lcssa.us.loopexit43 ], [ %indvars.iv.next35.prol, %.us-lcssa.us.loopexit ]
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond40, label %49, label %.preheader27

; <label>:49:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv15 = phi i64 [ 0, %3 ], [ %indvars.iv.next16, %19 ]
  %8 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge14
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %._crit_edge14

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
