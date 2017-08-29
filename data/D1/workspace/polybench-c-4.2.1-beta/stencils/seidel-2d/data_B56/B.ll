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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_seidel_2d([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph5:
  br label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %._crit_edge.us, %.lr.ph5
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next8, %._crit_edge.us ]
  %1 = trunc i64 %indvars.iv7 to i32
  %2 = sitofp i32 %1 to double
  %3 = insertelement <2 x double> undef, double %2, i32 0
  %4 = insertelement <2 x double> %3, double %2, i32 1
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.new.preheader ], [ %5, %.lr.ph.us.new ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
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
  %exitcond.1 = icmp eq i64 %5, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph.us.new

._crit_edge.us:                                   ; preds = %.lr.ph.us.new
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %._crit_edge6, label %.lr.ph.us.new.preheader

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph10:
  br label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %._crit_edge7, %.lr.ph10
  %.028 = phi i32 [ 0, %.lr.ph10 ], [ %25, %._crit_edge7 ]
  br label %.lr.ph6.split

.lr.ph6.split:                                    ; preds = %._crit_edge, %.lr.ph6.split.preheader
  %indvars.iv17 = phi i64 [ 1, %.lr.ph6.split.preheader ], [ %indvars.iv.next18, %._crit_edge ]
  %1 = add nsw i64 %indvars.iv17, -1
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 0
  %.pre = load double, double* %.phi.trans.insert, align 8
  %.phi.trans.insert19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 1
  %.pre20 = load double, double* %.phi.trans.insert19, align 8
  %.phi.trans.insert21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 0
  %.pre22 = load double, double* %.phi.trans.insert21, align 8
  %.phi.trans.insert23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 1
  %.pre24 = load double, double* %.phi.trans.insert23, align 8
  %.phi.trans.insert25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next18, i64 0
  %.pre26 = load double, double* %.phi.trans.insert25, align 8
  %.phi.trans.insert27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next18, i64 1
  %.pre28 = load double, double* %.phi.trans.insert27, align 8
  br label %2

; <label>:2:                                      ; preds = %2, %.lr.ph6.split
  %3 = phi double [ %.pre28, %.lr.ph6.split ], [ %22, %2 ]
  %4 = phi double [ %.pre26, %.lr.ph6.split ], [ %3, %2 ]
  %5 = phi double [ %.pre24, %.lr.ph6.split ], [ %17, %2 ]
  %6 = phi double [ %.pre22, %.lr.ph6.split ], [ %24, %2 ]
  %7 = phi double [ %.pre20, %.lr.ph6.split ], [ %11, %2 ]
  %8 = phi double [ %.pre, %.lr.ph6.split ], [ %7, %2 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph6.split ], [ %indvars.iv.next, %2 ]
  %9 = fadd double %8, %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %1, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %13 = fadd double %12, %6
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv
  %15 = fadd double %13, %5
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  %19 = fadd double %18, %4
  %20 = fadd double %19, %3
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next18, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  %24 = fdiv double %23, 9.000000e+00
  store double %24, double* %14, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond16, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %2
  %exitcond = icmp eq i64 %indvars.iv.next18, 1999
  br i1 %exitcond, label %._crit_edge7, label %.lr.ph6.split

._crit_edge7:                                     ; preds = %._crit_edge
  %25 = add nuw nsw i32 %.028, 1
  %exitcond15 = icmp eq i32 %25, 500
  br i1 %exitcond15, label %._crit_edge11, label %.lr.ph6.split.preheader

._crit_edge11:                                    ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond7, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
