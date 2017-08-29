; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %10 = bitcast i8* %5 to [1300 x double]*
  %11 = bitcast i8* %6 to [1300 x double]*
  %12 = bitcast i8* %8 to double*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  call void (...) @polybench_timer_start() #4
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %7 to double*
  %16 = bitcast i8* %9 to double*
  call void @kernel_gesummv(double %13, double %14, [1300 x double]* %10, [1300 x double]* %11, double* %15, double* %12, double* %16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to double*
  call void @print_array(double* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1300 x double]* nocapture, [1300 x double]* nocapture, double* nocapture) #2 {
.lr.ph31:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge.us, %.lr.ph31
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge.us ], [ 0, %.lr.ph31 ]
  %5 = trunc i64 %indvars.iv40 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.300000e+03
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv40
  store double %7, double* %8, align 8
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge35
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge36 ], [ 0, %._crit_edge35 ]
  %9 = mul nuw nsw i64 %indvars.iv, %indvars.iv40
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1300
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv
  %15 = add nuw nsw i64 %9, 2
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1300
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %13, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fdiv <2 x double> %20, <double 1.300000e+03, double 1.300000e+03>
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  store double %22, double* %14, align 8
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge36

._crit_edge.us:                                   ; preds = %._crit_edge36
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 1300
  br i1 %exitcond43, label %._crit_edge33, label %._crit_edge35

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gesummv(double, double, [1300 x double]* nocapture readonly, [1300 x double]* nocapture readonly, double* nocapture, double* nocapture readonly, double* nocapture) #2 {
.lr.ph39.split.us.preheader:
  %sunkaddr59 = ptrtoint double* %4 to i64
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr55 = ptrtoint double* %6 to i64
  %sunkaddr63 = ptrtoint double* %6 to i64
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %.lr.ph39.split.us.preheader, %._crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.lr.ph39.split.us.preheader ]
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv48
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds double, double* %6, i64 %indvars.iv48
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr52 = shl i64 %indvars.iv48, 3
  %sunkaddr53 = add i64 %sunkaddr, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  %sunkaddr56 = shl i64 %indvars.iv48, 3
  %sunkaddr57 = add i64 %sunkaddr55, %sunkaddr56
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to double*
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.lr.ph39.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge44 ], [ 0, %.lr.ph39.split.us ]
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = load double, double* %sunkaddr54, align 8
  %15 = fadd double %13, %14
  store double %15, double* %sunkaddr54, align 8
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = load double, double* %11, align 8
  %19 = fmul double %17, %18
  %20 = load double, double* %sunkaddr58, align 8
  %21 = fadd double %19, %20
  store double %21, double* %sunkaddr58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge44

._crit_edge.us:                                   ; preds = %._crit_edge44
  %sunkaddr60 = shl i64 %indvars.iv48, 3
  %sunkaddr61 = add i64 %sunkaddr59, %sunkaddr60
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  %22 = load double, double* %sunkaddr62, align 8
  %23 = fmul double %22, %0
  %24 = fmul double %21, %1
  %25 = fadd double %23, %24
  %sunkaddr64 = shl i64 %indvars.iv48, 3
  %sunkaddr65 = add i64 %sunkaddr63, %sunkaddr64
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to double*
  store double %25, double* %sunkaddr66, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1300
  br i1 %exitcond51, label %._crit_edge41, label %.lr.ph39.split.us

._crit_edge41:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly) #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge8, label %.lr.ph

._crit_edge8:                                     ; preds = %._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
