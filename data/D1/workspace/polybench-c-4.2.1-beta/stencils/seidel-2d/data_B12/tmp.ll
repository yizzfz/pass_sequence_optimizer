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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %0, 1
  %wide.trip.count16 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv14 to i32
  %7 = sitofp i32 %6 to double
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %8 = fmul double %7, 2.000000e+00
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, %4
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %5, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %7, %14
  %16 = fadd double %15, 2.000000e+00
  %17 = fdiv double %16, %4
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = add nsw i64 %indvars.iv, 3
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = fmul double %7, %21
  %23 = fadd double %22, 2.000000e+00
  %24 = fdiv double %23, %4
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv.next
  store double %24, double* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader37.lr.ph, label %._crit_edge43

.preheader37.lr.ph:                               ; preds = %3
  %5 = add nsw i32 %1, -2
  %6 = add i32 %1, -1
  %7 = icmp slt i32 %5, 1
  %wide.trip.count46 = zext i32 %6 to i64
  %wide.trip.count = zext i32 %6 to i64
  br label %.preheader37

.preheader37:                                     ; preds = %._crit_edge41, %.preheader37.lr.ph
  %storemerge42 = phi i32 [ 0, %.preheader37.lr.ph ], [ %37, %._crit_edge41 ]
  br i1 %7, label %._crit_edge41, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader37
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge ], [ 1, %.preheader.preheader ]
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %8, i64 0
  %9 = add nsw i64 %indvars.iv44, -1
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %store_forwarded = phi double [ %load_initial, %.preheader ], [ %36, %10 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %10 ]
  %11 = add nsw i64 %indvars.iv, -1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %9, i64 %11
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %9, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %9, i64 %indvars.iv.next
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = fadd double %19, %store_forwarded
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next45, i64 %11
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next45, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next45, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %36 = fdiv double %35, 9.000000e+00
  store double %36, double* %21, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %10
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond47, label %._crit_edge41.loopexit, label %.preheader

._crit_edge41.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %.preheader37
  %37 = add nuw nsw i32 %storemerge42, 1
  %exitcond48 = icmp eq i32 %37, %0
  br i1 %exitcond48, label %._crit_edge43.loopexit, label %.preheader37

._crit_edge43.loopexit:                           ; preds = %._crit_edge41
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.preheader.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
