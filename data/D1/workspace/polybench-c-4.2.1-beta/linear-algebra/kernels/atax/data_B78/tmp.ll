; ModuleID = 'A.ll'
source_filename = "atax.c"
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
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2100 x double]* nocapture, double* nocapture) #2 {
.lr.ph5:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv19 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next20, %._crit_edge ]
  %2 = trunc i64 %indvars.iv19 to i32
  %3 = sitofp i32 %2 to double
  %4 = fdiv double %3, 2.100000e+03
  %5 = fadd double %4, 1.000000e+00
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv19
  store double %5, double* %6, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 2100
  br i1 %exitcond22, label %.lr.ph2.split.us.new.preheader.preheader, label %._crit_edge

.lr.ph2.split.us.new.preheader.preheader:         ; preds = %._crit_edge
  br label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %._crit_edge.us, %.lr.ph2.split.us.new.preheader.preheader
  %indvars.iv17 = phi i64 [ 0, %.lr.ph2.split.us.new.preheader.preheader ], [ %indvars.iv.next18, %._crit_edge.us ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new, %.lr.ph2.split.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph2.split.us.new ]
  %7 = add nsw i64 %indvars.iv17, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2100
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = add nsw i64 %indvars.iv17, %indvars.iv.next
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 2100
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 9.500000e+03, double 9.500000e+03>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph2.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph2.split.us.new
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1900
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph2.split.us.new.preheader

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) #0 {
.lr.ph8:
  %scevgep4445 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4445, i8 0, i64 16800, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph8
  %indvars.iv41 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next42, %._crit_edge ]
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next42, 2100
  br i1 %exitcond68, label %.lr.ph5.split.us.new.preheader.preheader, label %._crit_edge

.lr.ph5.split.us.new.preheader.preheader:         ; preds = %._crit_edge
  %sunkaddr62 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph5.split.us.new.preheader

.lr.ph5.split.us.new.preheader:                   ; preds = %._crit_edge3.us, %.lr.ph5.split.us.new.preheader.preheader
  %indvars.iv35 = phi i64 [ 0, %.lr.ph5.split.us.new.preheader.preheader ], [ %indvars.iv.next36, %._crit_edge3.us ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv35
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr63 = shl nuw nsw i64 %indvars.iv35, 3
  %sunkaddr64 = add i64 %sunkaddr62, %sunkaddr63
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to double*
  br label %.lr.ph5.split.us.new

._crit_edge3.us:                                  ; preds = %.lr.ph2.us.new
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 1900
  br i1 %exitcond, label %._crit_edge6, label %.lr.ph5.split.us.new.preheader

.lr.ph2.us.new:                                   ; preds = %.lr.ph2.us.new, %.lr.ph2.us.new.preheader
  %indvars.iv26 = phi i64 [ 0, %.lr.ph2.us.new.preheader ], [ %indvars.iv.next27.1, %.lr.ph2.us.new ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv26
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv26
  %8 = load double, double* %7, align 8
  %9 = load double, double* %sunkaddr61, align 8
  %10 = fmul double %8, %9
  %11 = fadd double %6, %10
  store double %11, double* %5, align 8
  %indvars.iv.next27 = or i64 %indvars.iv26, 1
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next27
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv.next27
  %15 = load double, double* %14, align 8
  %16 = load double, double* %sunkaddr61, align 8
  %17 = fmul double %15, %16
  %18 = fadd double %13, %17
  store double %18, double* %12, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond.134 = icmp eq i64 %indvars.iv.next27.1, 2100
  br i1 %exitcond.134, label %._crit_edge3.us, label %.lr.ph2.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new, %.lr.ph5.split.us.new.preheader
  %19 = phi double [ 0.000000e+00, %.lr.ph5.split.us.new.preheader ], [ %31, %.lr.ph5.split.us.new ]
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph5.split.us.new ]
  %20 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %sunkaddr65, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %sunkaddr65, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.lr.ph2.us.new.preheader, label %.lr.ph5.split.us.new

.lr.ph2.us.new.preheader:                         ; preds = %.lr.ph5.split.us.new
  %sunkaddr59 = shl nuw nsw i64 %indvars.iv35, 3
  %sunkaddr60 = add i64 %sunkaddr, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  br label %.lr.ph2.us.new

._crit_edge6:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly) #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge1 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge1

; <label>:8:                                      ; preds = %._crit_edge2
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
