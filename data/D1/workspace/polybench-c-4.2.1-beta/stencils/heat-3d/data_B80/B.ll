; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader19

.preheader19:                                     ; preds = %25, %2
  %storemerge22 = phi i32 [ 0, %2 ], [ %26, %25 ]
  %3 = add nuw i32 %storemerge22, 120
  %4 = sext i32 %storemerge22 to i64
  br label %.preheader

.preheader:                                       ; preds = %22, %.preheader19
  %storemerge121 = phi i32 [ 0, %.preheader19 ], [ %23, %22 ]
  %5 = add nuw i32 %3, %storemerge121
  %6 = sext i32 %storemerge121 to i64
  %7 = sext i32 %5 to i64
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = sub nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %6, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 %indvars.iv
  store double %12, double* %14, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %15 = sub nuw nsw i64 %7, %indvars.iv.next
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e+01
  %19 = fdiv double %18, 1.200000e+02
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %6, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 %indvars.iv.next
  store double %19, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %._crit_edge
  %23 = add nsw i32 %storemerge121, 1
  %24 = icmp slt i32 %23, 120
  br i1 %24, label %.preheader, label %25

; <label>:25:                                     ; preds = %22
  %26 = add nsw i32 %storemerge22, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader19, label %28

; <label>:28:                                     ; preds = %25
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %2
  %storemerge17 = phi i32 [ 1, %2 ], [ %85, %._crit_edge16 ]
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge8, %.preheader5
  %storemerge19 = phi i32 [ 1, %.preheader5 ], [ %3, %._crit_edge8 ]
  %3 = add nsw i32 %storemerge19, 1
  %4 = sext i32 %3 to i64
  %5 = sext i32 %storemerge19 to i64
  %6 = add nsw i32 %storemerge19, -1
  %7 = sext i32 %6 to i64
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader3
  %storemerge57.us = phi i32 [ 1, %.preheader3 ], [ %9, %._crit_edge.us ]
  %8 = sext i32 %storemerge57.us to i64
  %9 = add nsw i32 %storemerge57.us, 1
  %10 = sext i32 %9 to i64
  %11 = add nsw i32 %storemerge57.us, -1
  %12 = sext i32 %11 to i64
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader1.us
  %indvars.iv = phi i64 [ 1, %.preheader1.us ], [ %indvars.iv.next, %._crit_edge ]
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %8, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, 2.000000e+00
  %18 = fsub double %14, %17
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  %22 = fmul double %21, 1.250000e-01
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %10, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fsub double %24, %17
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %12, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fadd double %25, %27
  %29 = fmul double %28, 1.250000e-01
  %30 = fadd double %22, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fsub double %32, %17
  %34 = add nsw i64 %indvars.iv, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %33, %36
  %38 = fmul double %37, 1.250000e-01
  %39 = fadd double %30, %38
  %40 = fadd double %16, %39
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  store double %40, double* %41, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %42 = icmp slt i32 %9, 119
  br i1 %42, label %.preheader1.us, label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge.us
  %43 = icmp slt i32 %3, 119
  br i1 %43, label %.preheader3, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %._crit_edge8
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge14
  %storemerge215 = phi i32 [ %44, %._crit_edge14 ], [ 1, %.preheader2.preheader ]
  %44 = add nsw i32 %storemerge215, 1
  %45 = sext i32 %44 to i64
  %46 = sext i32 %storemerge215 to i64
  %47 = add nsw i32 %storemerge215, -1
  %48 = sext i32 %47 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader2
  %storemerge313.us = phi i32 [ 1, %.preheader2 ], [ %50, %._crit_edge12.us ]
  %49 = sext i32 %storemerge313.us to i64
  %50 = add nsw i32 %storemerge313.us, 1
  %51 = sext i32 %50 to i64
  %52 = add nsw i32 %storemerge313.us, -1
  %53 = sext i32 %52 to i64
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader.us
  %indvars.iv18 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next19, %._crit_edge1 ]
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %45, i64 %49, i64 %indvars.iv18
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %49, i64 %indvars.iv18
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, 2.000000e+00
  %59 = fsub double %55, %58
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %48, i64 %49, i64 %indvars.iv18
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  %63 = fmul double %62, 1.250000e-01
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %51, i64 %indvars.iv18
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %58
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %53, i64 %indvars.iv18
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  %70 = fmul double %69, 1.250000e-01
  %71 = fadd double %63, %70
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %49, i64 %indvars.iv.next19
  %73 = load double, double* %72, align 8
  %74 = fsub double %73, %58
  %75 = add nsw i64 %indvars.iv18, -1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %49, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %74, %77
  %79 = fmul double %78, 1.250000e-01
  %80 = fadd double %71, %79
  %81 = fadd double %57, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %46, i64 %49, i64 %indvars.iv18
  store double %81, double* %82, align 8
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 119
  br i1 %exitcond20, label %._crit_edge12.us, label %._crit_edge1

._crit_edge12.us:                                 ; preds = %._crit_edge1
  %83 = icmp slt i32 %50, 119
  br i1 %83, label %.preheader.us, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %84 = icmp slt i32 %44, 119
  br i1 %84, label %.preheader2, label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge14
  %85 = add nuw nsw i32 %storemerge17, 1
  %exitcond21 = icmp eq i32 %85, 501
  br i1 %exitcond21, label %86, label %.preheader5

; <label>:86:                                     ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader15

.preheader15:                                     ; preds = %25, %1
  %storemerge18 = phi i32 [ 0, %1 ], [ %26, %25 ]
  %6 = mul nuw nsw i32 %storemerge18, 120
  %7 = sext i32 %storemerge18 to i64
  br label %.preheader

.preheader:                                       ; preds = %22, %.preheader15
  %storemerge117 = phi i32 [ 0, %.preheader15 ], [ %23, %22 ]
  %8 = add nuw i32 %storemerge117, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %storemerge117 to i64
  %11 = zext i32 %9 to i64
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %22, label %._crit_edge1

; <label>:22:                                     ; preds = %._crit_edge
  %23 = add nsw i32 %storemerge117, 1
  %24 = icmp slt i32 %23, 120
  br i1 %24, label %.preheader, label %25

; <label>:25:                                     ; preds = %22
  %26 = add nsw i32 %storemerge18, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader15, label %28

; <label>:28:                                     ; preds = %25
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
