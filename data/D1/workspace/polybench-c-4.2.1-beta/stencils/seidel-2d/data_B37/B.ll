; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_seidel_2d([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %1 = trunc i64 %indvars.iv5 to i32
  %2 = sitofp i32 %1 to double
  %3 = insertelement <2 x double> undef, double %2, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %5, %._crit_edge ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %9 = add nuw nsw i64 %indvars.iv, 3
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fmul <2 x double> %4, %13
  %15 = fadd <2 x double> %14, <double 2.000000e+00, double 2.000000e+00>
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = bitcast double* %8 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %exitcond9.1 = icmp eq i64 %5, 2000
  br i1 %exitcond9.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]*) unnamed_addr #0 {
.preheader3.lr.ph:
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge6, %.preheader3.lr.ph
  %.027 = phi i32 [ 0, %.preheader3.lr.ph ], [ %24, %._crit_edge6 ]
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %1 = add nsw i64 %indvars.iv9, -1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 1
  %.pre15 = load double, double* %.phi.trans.insert14, align 8
  %.phi.trans.insert16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv9, i64 0
  %.pre17 = load double, double* %.phi.trans.insert16, align 8
  %.phi.trans.insert18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv9, i64 1
  %.pre19 = load double, double* %.phi.trans.insert18, align 8
  %.phi.trans.insert20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next10, i64 0
  %.pre21 = load double, double* %.phi.trans.insert20, align 8
  %.phi.trans.insert22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next10, i64 1
  %.pre23 = load double, double* %.phi.trans.insert22, align 8
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader
  %2 = phi double [ %.pre23, %.preheader ], [ %21, %._crit_edge2 ]
  %3 = phi double [ %.pre21, %.preheader ], [ %2, %._crit_edge2 ]
  %4 = phi double [ %.pre19, %.preheader ], [ %16, %._crit_edge2 ]
  %5 = phi double [ %.pre17, %.preheader ], [ %23, %._crit_edge2 ]
  %6 = phi double [ %.pre15, %.preheader ], [ %10, %._crit_edge2 ]
  %7 = phi double [ %.pre, %.preheader ], [ %6, %._crit_edge2 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %8 = fadd double %7, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fadd double %8, %10
  %12 = fadd double %11, %5
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv
  %14 = fadd double %12, %4
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  %18 = fadd double %17, %3
  %19 = fadd double %18, %2
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next10, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = fdiv double %22, 9.000000e+00
  store double %23, double* %13, align 8
  %exitcond24 = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond24, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge2
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1999
  br i1 %exitcond12, label %._crit_edge6, label %.preheader

._crit_edge6:                                     ; preds = %._crit_edge
  %24 = add nuw nsw i32 %.027, 1
  %exitcond13 = icmp eq i32 %24, 500
  br i1 %exitcond13, label %._crit_edge8, label %.preheader.preheader

._crit_edge8:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv5, 2000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond9, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
