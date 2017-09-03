; ModuleID = 'B.ll'
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

._crit_edge:                                      ; preds = %17, %14, %2
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
.lr.ph4:
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv6 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next7, %..loopexit_crit_edge.us ]
  %6 = trunc i64 %indvars.iv6 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  store double %8, double* %9, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %10 = trunc i64 %indvars.iv.next7 to i32
  %11 = icmp eq i32 %10, 2000
  %12 = sitofp i32 %10 to double
  %.op = fdiv double %12, 2.000000e+03
  %13 = select i1 %11, double 0.000000e+00, double %.op
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %indvars.iv6, 3
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2000
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.000000e+03
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv6
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv6, 4
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 2.000000e+03
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv6
  store double %25, double* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %27, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.1, %27 ]
  %28 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %34 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 2.000000e+03
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %38, double* %39, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %27

..loopexit_crit_edge.us:                          ; preds = %27
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %._crit_edge, label %.lr.ph.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.us.preheader:
  %sunkaddr = ptrtoint double* %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next20, %._crit_edge10.us ]
  %sunkaddr21 = shl i64 %indvars.iv19, 3
  %sunkaddr22 = add i64 %sunkaddr, %sunkaddr21
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to double*
  %.pre = load double, double* %sunkaddr23, align 8
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader4.us
  %7 = phi double [ %.pre, %.preheader4.us ], [ %19, %6 ]
  %indvars.iv15 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next16.1, %6 ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv15
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  store double %13, double* %sunkaddr23, align 8
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next16
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %sunkaddr23, align 8
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16, 1999
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  br i1 %exitcond18.1, label %._crit_edge10.us, label %6

._crit_edge10.us:                                 ; preds = %6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond29, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  %sunkaddr24 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %sunkaddr25 = shl i64 %indvars.iv13, 3
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %.pre30 = load double, double* %sunkaddr27, align 8
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %21 = phi double [ %.pre30, %.preheader.us ], [ %33, %20 ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv13
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr27, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv13
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr27, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond28, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph7.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7._crit_edge, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next10, %.lr.ph7._crit_edge ]
  %7 = trunc i64 %indvars.iv9 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %.lr.ph7._crit_edge

; <label>:10:                                     ; preds = %.lr.ph7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %10, %.lr.ph7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond11, label %.lr.ph.preheader, label %.lr.ph7

.lr.ph.preheader:                                 ; preds = %.lr.ph7._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %.lr.ph._crit_edge

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %23, %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
