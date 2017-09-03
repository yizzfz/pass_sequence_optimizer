; ModuleID = 'B.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
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
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %11, double* %12)
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
define internal fastcc void @init_array(i32, i32, [1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph9:
  br label %21

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %5 = trunc i64 %indvars.iv12 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.100000e+03
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  store double %7, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv12
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.100000e+03
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv12
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.100000e+03
  %20 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1899
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next13, 2100
  br i1 %exitcond22, label %._crit_edge6, label %.lr.ph5.split.us

; <label>:21:                                     ; preds = %21, %.lr.ph9
  %indvars.iv18 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next19.1, %21 ]
  %22 = trunc i64 %indvars.iv18 to i32
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.900000e+03
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv18
  store double %24, double* %25, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %26 = trunc i64 %indvars.iv.next19 to i32
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.900000e+03
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next19
  store double %28, double* %29, align 8
  %exitcond21.1 = icmp eq i64 %indvars.iv.next19, 1899
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  br i1 %exitcond21.1, label %.lr.ph5.split.us.preheader, label %21

.lr.ph5.split.us.preheader:                       ; preds = %21
  br label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.lr.ph4.split.us.preheader:
  %7 = bitcast double* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 15200, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr23 = ptrtoint double* %4 to i64
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv10
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr20 = shl i64 %indvars.iv10, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %sunkaddr25 = add i64 %sunkaddr23, %sunkaddr20
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %9 ], [ 0, %.lr.ph4.split.us ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = load double, double* %sunkaddr22, align 8
  %13 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %11, %15
  store double %16, double* %10, align 8
  %17 = load double, double* %sunkaddr26, align 8
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %17, %21
  store double %22, double* %sunkaddr26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1899
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next11, 2100
  br i1 %exitcond27, label %._crit_edge5, label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph7.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7._crit_edge, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next10, %.lr.ph7._crit_edge ]
  %8 = trunc i64 %indvars.iv9 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph7._crit_edge

; <label>:11:                                     ; preds = %.lr.ph7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %11, %.lr.ph7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1900
  br i1 %exitcond11, label %.lr.ph.preheader, label %.lr.ph7

.lr.ph.preheader:                                 ; preds = %.lr.ph7._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %.lr.ph._crit_edge

; <label>:24:                                     ; preds = %.lr.ph
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %24, %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
