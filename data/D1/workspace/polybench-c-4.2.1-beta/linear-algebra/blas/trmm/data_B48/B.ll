; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
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
  call void @print_array([1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
.lr.ph5:
  store double 1.500000e+00, double* %0, align 8
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3, %.lr.ph5
  %indvars.iv13 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next14, %._crit_edge3 ]
  %3 = add nuw nsw i64 %indvars.iv13, 4294967295
  %4 = icmp sgt i64 %indvars.iv13, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge3._crit_edge
  %xtraiter16 = and i64 %indvars.iv13, 1
  %lcmp.mod = icmp eq i64 %xtraiter16, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %5

; <label>:5:                                      ; preds = %.lr.ph
  %6 = trunc i64 %indvars.iv13 to i32
  %7 = srem i32 %6, 1000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv13, i64 0
  store double %9, double* %10, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %5
  %indvars.iv.unr.ph = phi i64 [ 1, %5 ], [ 0, %.lr.ph ]
  %11 = trunc i64 %3 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %13 = add nuw nsw i64 %indvars.iv13, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = add nuw nsw i64 %indvars.iv13, %indvars.iv.next
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1000
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.000000e+03>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv13
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %._crit_edge3._crit_edge
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv13
  store double 1.000000e+00, double* %26, align 8
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %._crit_edge
  %indvars.iv9 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next10, %._crit_edge1 ]
  %27 = sub nsw i64 %indvars.iv13, %indvars.iv9
  %28 = add nsw i64 %27, 1200
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1200
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.200000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv9
  store double %32, double* %33, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond, label %._crit_edge3, label %._crit_edge1

._crit_edge3:                                     ; preds = %._crit_edge1
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %._crit_edge6, label %._crit_edge3._crit_edge

._crit_edge6:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) #2 {
.lr.ph5:
  %3 = insertelement <2 x double> undef, double %0, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = insertelement <2 x double> undef, double %0, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge3..lr.ph2_crit_edge, %.lr.ph5
  %indvars.iv14 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next15, %._crit_edge3..lr.ph2_crit_edge ]
  %indvars.iv8 = phi i64 [ 1, %.lr.ph5 ], [ %indvars.iv.next9, %._crit_edge3..lr.ph2_crit_edge ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %7 = icmp slt i64 %indvars.iv.next15, 1000
  br i1 %7, label %.lr.ph2.split.us.preheader, label %.lr.ph2.split.preheader

.lr.ph2.split.preheader:                          ; preds = %.lr.ph2
  br label %.lr.ph2.split

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %8 = sub nsw i64 998, %indvars.iv14
  %9 = sub nuw nsw i64 999, %indvars.iv14
  %xtraiter17 = and i64 %9, 1
  %10 = trunc i64 %8 to i32
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv14
  %indvars.iv.next11.prol = add nuw nsw i64 %indvars.iv8, 1
  %12 = icmp eq i64 %xtraiter17, 0
  %13 = icmp eq i32 %10, 0
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv12
  br i1 %12, label %.prol.loopexit, label %15

; <label>:15:                                     ; preds = %.lr.ph2.split.us
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv12
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = load double, double* %14, align 8
  %21 = fadd double %20, %19
  store double %21, double* %14, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph2.split.us, %15
  %indvars.iv10.unr.ph = phi i64 [ %indvars.iv.next11.prol, %15 ], [ %indvars.iv8, %.lr.ph2.split.us ]
  br i1 %13, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new.preheader, %.lr.ph2.split.us.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next11.1, %.lr.ph2.split.us.new ], [ %indvars.iv10.unr.ph, %.lr.ph2.split.us.new.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv14
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv12
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %14, align 8
  %28 = fadd double %27, %26
  store double %28, double* %14, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv14
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next11, i64 %indvars.iv12
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %14, align 8
  %35 = fadd double %34, %33
  store double %35, double* %14, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next11.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv12
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %0
  store double %38, double* %36, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

.lr.ph2.split:                                    ; preds = %.lr.ph2.split.preheader, %.lr.ph2.split
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %.lr.ph2.split ], [ 0, %.lr.ph2.split.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %40 = bitcast double* %39 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %40, align 8
  %42 = fmul <2 x double> %41, %4
  %43 = bitcast double* %39 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv.next.1
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, %6
  %48 = bitcast double* %44 to <2 x double>*
  store <2 x double> %47, <2 x double>* %48, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv.next.3
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %0
  store double %51, double* %49, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %._crit_edge3.loopexit2, label %.lr.ph2.split

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3.loopexit2:                           ; preds = %.lr.ph2.split
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit2, %._crit_edge3.loopexit
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %._crit_edge6, label %._crit_edge3..lr.ph2_crit_edge

._crit_edge3..lr.ph2_crit_edge:                   ; preds = %._crit_edge3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %.lr.ph2

._crit_edge6:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
