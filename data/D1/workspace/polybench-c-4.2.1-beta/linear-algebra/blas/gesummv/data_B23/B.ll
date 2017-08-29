; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  call fastcc void @init_array(i32 1300, double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  call void (...) @polybench_timer_start() #4
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %5 to [1300 x double]*
  %16 = bitcast i8* %6 to [1300 x double]*
  %17 = bitcast i8* %7 to double*
  %18 = bitcast i8* %8 to double*
  %19 = bitcast i8* %9 to double*
  call fastcc void @kernel_gesummv(i32 1300, double %13, double %14, [1300 x double]* %15, [1300 x double]* %16, double* %17, double* %18, double* %19)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %20 = icmp sgt i32 %0, 42
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %22, align 1
  %23 = icmp eq i8 %strcmpload, 0
  br i1 %23, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %21
  %25 = bitcast i8* %9 to double*
  call fastcc void @print_array(i32 1300, double* %25)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %2, %24
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [1300 x double]* nocapture, [1300 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph33.split.us.preheader:
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br label %.lr.ph33.split.us

.lr.ph33.split.us:                                ; preds = %._crit_edge.us, %.lr.ph33.split.us.preheader
  %indvars.iv2630.us = phi i64 [ 0, %.lr.ph33.split.us.preheader ], [ %indvars.iv.next27.us, %._crit_edge.us ]
  %6 = trunc i64 %indvars.iv2630.us to i32
  %7 = srem i32 %6, 1300
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.300000e+03
  %10 = getelementptr inbounds double, double* %5, i64 %indvars.iv2630.us
  store double %9, double* %10, align 8
  br label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us, %.lr.ph33.split.us
  %indvars.iv29.us = phi i64 [ 0, %.lr.ph33.split.us ], [ %indvars.iv.next.us, %._crit_edge37.us ]
  %11 = mul nuw nsw i64 %indvars.iv29.us, %indvars.iv2630.us
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1300
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv2630.us, i64 %indvars.iv29.us
  %17 = mul nuw nsw i64 %indvars.iv29.us, %indvars.iv2630.us
  %18 = add nuw nsw i64 %17, 2
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1300
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %15, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 1.300000e+03, double 1.300000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %16, align 8
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv2630.us, i64 %indvars.iv29.us
  store double %26, double* %27, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv29.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1300
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge37.us

._crit_edge.us:                                   ; preds = %._crit_edge37.us
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2630.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next27.us, 1300
  br i1 %exitcond, label %._crit_edge35, label %.lr.ph33.split.us

._crit_edge35:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32, double, double, [1300 x double]* nocapture readonly, [1300 x double]* nocapture readonly, double* nocapture, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
.lr.ph44.split.us.preheader:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr54 = ptrtoint double* %5 to i64
  %sunkaddr58 = ptrtoint double* %7 to i64
  %sunkaddr62 = ptrtoint double* %7 to i64
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %._crit_edge.us, %.lr.ph44.split.us.preheader
  %indvars.iv3842.us = phi i64 [ 0, %.lr.ph44.split.us.preheader ], [ %indvars.iv.next39.us, %._crit_edge.us ]
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv3842.us
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds double, double* %7, i64 %indvars.iv3842.us
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr51 = shl i64 %indvars.iv3842.us, 3
  %sunkaddr52 = add i64 %sunkaddr, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  %sunkaddr55 = shl i64 %indvars.iv3842.us, 3
  %sunkaddr56 = add i64 %sunkaddr54, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  %sunkaddr59 = shl i64 %indvars.iv3842.us, 3
  %sunkaddr60 = add i64 %sunkaddr58, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  %sunkaddr63 = shl i64 %indvars.iv3842.us, 3
  %sunkaddr64 = add i64 %sunkaddr62, %sunkaddr63
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to double*
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us, %.lr.ph44.split.us
  %indvars.iv41.us = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next.us, %._crit_edge48.us ]
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv3842.us, i64 %indvars.iv41.us
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds double, double* %6, i64 %indvars.iv41.us
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = load double, double* %sunkaddr53, align 8
  %16 = fadd double %14, %15
  store double %16, double* %sunkaddr57, align 8
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv3842.us, i64 %indvars.iv41.us
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv41.us
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = load double, double* %sunkaddr61, align 8
  %23 = fadd double %21, %22
  store double %23, double* %sunkaddr65, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv41.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1300
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge48.us

._crit_edge.us:                                   ; preds = %._crit_edge48.us
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv3842.us
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %1
  %27 = getelementptr inbounds double, double* %7, i64 %indvars.iv3842.us
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = fadd double %26, %29
  %31 = getelementptr inbounds double, double* %7, i64 %indvars.iv3842.us
  store double %30, double* %31, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3842.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next39.us, 1300
  br i1 %exitcond, label %._crit_edge46, label %.lr.ph44.split.us

._crit_edge46:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
..lr.ph_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %..lr.ph_crit_edge
  %indvars.iv5 = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge8, label %.lr.ph

._crit_edge8:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
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
