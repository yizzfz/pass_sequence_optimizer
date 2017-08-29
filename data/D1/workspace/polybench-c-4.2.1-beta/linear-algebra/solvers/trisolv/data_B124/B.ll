; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph6, label %.loopexit

.lr.ph6:                                          ; preds = %4
  %6 = sitofp i32 %0 to double
  %7 = sext i32 %0 to i64
  %8 = insertelement <2 x double> undef, double %6, i32 0
  %9 = insertelement <2 x double> %8, double %6, i32 1
  br label %10

; <label>:10:                                     ; preds = %.lr.ph6, %._crit_edge
  %indvar = phi i32 [ 0, %.lr.ph6 ], [ %.pre, %._crit_edge ]
  %indvars.iv13 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next14, %._crit_edge ]
  %indvars.iv11 = phi i32 [ 1, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge ]
  %sext = shl i64 %indvars.iv13, 32
  %11 = ashr exact i64 %sext, 32
  %12 = getelementptr inbounds double, double* %2, i64 %11
  store double -9.990000e+02, double* %12, align 8
  %13 = trunc i64 %indvars.iv13 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv13
  store double %14, double* %15, align 8
  %16 = icmp slt i64 %indvars.iv13, 0
  %.pre = add i32 %indvar, 1
  br i1 %16, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  %xtraiter = and i32 %.pre, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %17 = add i32 %13, 1
  %18 = add i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 2.000000e+00
  %21 = fdiv double %20, %6
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 0
  store double %21, double* %22, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %23 = icmp eq i32 %indvar, 0
  br i1 %23, label %._crit_edge, label %.lr.ph.preheader15

.lr.ph.preheader15:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv11 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader15, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader15 ]
  %24 = sub nsw i64 1, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = add i32 %25, %13
  %27 = add i32 %26, %0
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %30 = sub i64 0, %indvars.iv
  %31 = trunc i64 %30 to i32
  %32 = add i32 %31, %13
  %33 = add i32 %32, %0
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %28, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fmul <2 x double> %36, <double 2.000000e+00, double 2.000000e+00>
  %38 = fdiv <2 x double> %37, %9
  %39 = bitcast double* %29 to <2 x double>*
  store <2 x double> %38, <2 x double>* %39, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %10, %.lr.ph.prol.loopexit
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %40 = icmp slt i64 %indvars.iv.next14, %7
  %indvars.iv.next12 = add i32 %indvars.iv11, 1
  br i1 %40, label %10, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph6, label %.loopexit

.lr.ph6:                                          ; preds = %4
  %6 = sext i32 %0 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  br label %7

; <label>:7:                                      ; preds = %.lr.ph6, %._crit_edge
  %indvar = phi i32 [ 0, %.lr.ph6 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv13 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next14, %._crit_edge ]
  %indvars.iv11 = phi i32 [ 0, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge ]
  %sext = shl i64 %indvars.iv13, 32
  %8 = ashr exact i64 %sext, 32
  %9 = getelementptr inbounds double, double* %3, i64 %8
  %10 = bitcast double* %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds double, double* %2, i64 %8
  %13 = bitcast double* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = icmp sgt i64 %indvars.iv13, 0
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %7
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 0
  %16 = load double, double* %15, align 8
  %17 = load double, double* %2, align 8
  %18 = fmul double %16, %17
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %20 = load double, double* %19, align 8
  %21 = fsub double %20, %18
  store double %21, double* %19, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %22 = icmp eq i32 %indvar, 1
  br i1 %22, label %._crit_edge, label %.lr.ph.preheader15

.lr.ph.preheader15:                               ; preds = %.lr.ph.prol.loopexit
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %wide.trip.count.1 = zext i32 %indvars.iv11 to i64
  %.pre = load double, double* %23, align 8
  %sunkaddr16 = shl i64 %indvars.iv13, 3
  %sunkaddr17 = add i64 %sunkaddr, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader15, %.lr.ph
  %24 = phi double [ %36, %.lr.ph ], [ %.pre, %.lr.ph.preheader15 ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader15 ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %sunkaddr18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %30, %35
  store double %36, double* %sunkaddr18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %7
  %37 = getelementptr inbounds double, double* %2, i64 %indvars.iv13
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv13
  %40 = load double, double* %39, align 8
  %41 = fdiv double %38, %40
  store double %41, double* %37, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %indvars.iv.next12 = add i32 %indvars.iv11, 1
  %42 = icmp slt i64 %indvars.iv.next14, %6
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %42, label %7, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %9 = phi i32 [ %19, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %10 = phi %struct._IO_FILE* [ %21, %._crit_edge ], [ %8, %.lr.ph.preheader ]
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds double, double* %1, i64 %11
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %13) #6
  %15 = srem i32 %9, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %.lr.ph
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %17
  %19 = add nsw i32 %9, 1
  %20 = icmp slt i32 %19, %0
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %20, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %.lcssa = phi %struct._IO_FILE* [ %8, %2 ], [ %21, %.loopexit.loopexit ]
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
