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

; <label>:15:                                     ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph:
  br label %4

; <label>:4:                                      ; preds = %.unr-lcssa, %.lr.ph
  %indvars.iv1925 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next20, %.unr-lcssa ]
  %indvars.iv2124 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next22, %.unr-lcssa ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv2124
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv2124 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv2124
  store double %7, double* %8, align 8
  %9 = add nsw i64 %indvars.iv2124, 2001
  %10 = and i64 %indvars.iv2124, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %4
  %11 = trunc i64 %9 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 2.000000e+00
  %14 = fdiv double %13, 2.000000e+03
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2124, i64 0
  store double %14, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %4, %.prol.preheader
  %indvars.iv23.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %4 ]
  %16 = icmp eq i64 %indvars.iv2124, 0
  br i1 %16, label %.unr-lcssa, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %indvars.iv23 = phi i64 [ %indvars.iv.next.1, %.new ], [ %indvars.iv23.unr.ph, %.new.preheader ]
  %17 = sub nsw i64 %9, %indvars.iv23
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2124, i64 %indvars.iv23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv23, 1
  %21 = sub nsw i64 %9, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, <double 2.000000e+00, double 2.000000e+00>
  %27 = fdiv <2 x double> %26, <double 2.000000e+03, double 2.000000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1925
  br i1 %exitcond.1, label %.unr-lcssa.loopexit, label %.new

.unr-lcssa.loopexit:                              ; preds = %.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2124, 1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1925, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %.unr-lcssa
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph42:
  %4 = ptrtoint double* %2 to i64
  %sunkaddr51 = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.lr.ph42
  %indvars.iv2540 = phi [2000 x double]* [ %1, %.lr.ph42 ], [ %31, %._crit_edge ]
  %indvars.iv2839 = phi i64 [ 0, %.lr.ph42 ], [ %indvars.iv.next29, %._crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv2839
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv2839
  store double %7, double* %8, align 8
  %exitcond37 = icmp eq i64 %indvars.iv2839, 0
  br i1 %exitcond37, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %5
  %xtraiter = and i64 %indvars.iv2839, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2839, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %2, align 8
  %12 = fmul double %10, %11
  %13 = fsub double %7, %12
  %sunkaddr48 = shl i64 %indvars.iv2839, 3
  %sunkaddr49 = add i64 %sunkaddr, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  store double %13, double* %sunkaddr50, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %.lcssa45.unr.ph = phi double [ %13, %.prol.preheader ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %13, %.prol.preheader ], [ %7, %.lr.ph ]
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv2839, 1
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr52 = shl i64 %indvars.iv2839, 3
  %sunkaddr53 = add i64 %sunkaddr51, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %15 = phi double [ %27, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv38.unr.ph, %.lr.ph.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2839, i64 %indvars.iv38
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %sunkaddr54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv38, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2839, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv2839
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %5
  %.lcssa = phi double [ %7, %5 ], [ %.lcssa45.unr.ph, %.prol.loopexit ], [ %27, %._crit_edge.loopexit ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv2540, i64 0, i64 %indvars.iv2839
  %29 = load double, double* %28, align 8
  %30 = fdiv double %.lcssa, %29
  %sunkaddr34 = shl i64 %indvars.iv2839, 3
  %sunkaddr35 = add i64 %4, %sunkaddr34
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  store double %30, double* %sunkaddr36, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2839, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv2540, i64 1, i64 0
  %31 = bitcast double* %scevgep to [2000 x double]*
  %exitcond = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond, label %._crit_edge43, label %5

._crit_edge43:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %16, %.lr.ph.preheader
  %7 = phi %struct._IO_FILE* [ %6, %.lr.ph.preheader ], [ %17, %16 ]
  %indvars.iv5 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %16 ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #5
  %11 = trunc i64 %indvars.iv5 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %16
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
