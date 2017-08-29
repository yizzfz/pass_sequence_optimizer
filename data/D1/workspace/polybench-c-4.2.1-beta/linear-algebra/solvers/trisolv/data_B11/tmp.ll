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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %4, %._crit_edge
  %indvars.iv23 = phi i64 [ 0, %4 ], [ %indvars.iv.next24, %._crit_edge ]
  %indvars.iv21 = phi i64 [ 1, %4 ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv23
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv23 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv23
  store double %7, double* %8, align 8
  %9 = add nuw nsw i64 %indvars.iv23, 2001
  %xtraiter25 = and i64 %indvars.iv.next24, 1
  %lcmp.mod = icmp eq i64 %xtraiter25, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 2.000000e+00
  %13 = fdiv double %12, 2.000000e+03
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 0
  store double %13, double* %14, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %15 = icmp eq i64 %indvars.iv23, 0
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %16 = sub nuw nsw i64 %9, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = sub nuw nsw i64 %9, %indvars.iv.next
  %21 = trunc i64 %20 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %24, <double 2.000000e+00, double 2.000000e+00>
  %26 = fdiv <2 x double> %25, <double 2.000000e+03, double 2.000000e+03>
  %27 = bitcast double* %19 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond, label %28, label %.lr.ph

; <label>:28:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %4
  %indvars.iv39 = phi i64 [ 0, %4 ], [ %indvars.iv.next40, %._crit_edge ]
  %6 = add i64 %indvars.iv39, 4294967295
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv39
  store double %8, double* %9, align 8
  %10 = icmp sgt i64 %indvars.iv39, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %5
  %xtraiter41 = and i64 %indvars.iv39, 1
  %lcmp.mod = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 0
  %12 = load double, double* %11, align 8
  %13 = load double, double* %2, align 8
  %14 = fmul double %12, %13
  %15 = fsub double %8, %14
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr46 = mul i64 %indvars.iv39, 8
  %sunkaddr47 = add i64 %sunkaddr, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  store double %15, double* %sunkaddr48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %15, %.prol.preheader ], [ %8, %.lr.ph ]
  %.lcssa34.unr.ph = phi double [ %15, %.prol.preheader ], [ undef, %.lr.ph ]
  %16 = trunc i64 %6 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %18 = phi double [ %30, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  %sunkaddr49 = ptrtoint double* %2 to i64
  %sunkaddr50 = mul i64 %indvars.iv39, 8
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  store double %24, double* %sunkaddr52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %sunkaddr52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv39
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %5
  %.lcssa = phi double [ %8, %5 ], [ %.lcssa34.unr.ph, %.prol.loopexit ], [ %30, %._crit_edge.loopexit ]
  %31 = ptrtoint double* %2 to i64
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv39
  %33 = load double, double* %32, align 8
  %34 = fdiv double %.lcssa, %33
  %sunkaddr28 = shl nsw i64 %indvars.iv39, 3
  %sunkaddr29 = add i64 %31, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  store double %34, double* %sunkaddr30, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond, label %35, label %5

; <label>:35:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %8

; <label>:8:                                      ; preds = %18, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %18 ]
  %9 = phi %struct._IO_FILE* [ %7, %2 ], [ %19, %18 ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %11) #5
  %13 = trunc i64 %indvars.iv to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #4
  br label %18

; <label>:18:                                     ; preds = %8, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %20, label %8

; <label>:20:                                     ; preds = %18
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
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
