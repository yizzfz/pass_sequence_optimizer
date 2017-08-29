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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph20:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph20, %._crit_edge
  %indvars.iv26 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next27, %._crit_edge ]
  %indvars.iv24 = phi i64 [ 1, %.lr.ph20 ], [ %indvars.iv.next25, %._crit_edge ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv26
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv26 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv26
  store double %6, double* %7, align 8
  %8 = add i32 %5, 2001
  %xtraiter29 = and i64 %indvars.iv.next27, 1
  %lcmp.mod = icmp eq i64 %xtraiter29, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 2.000000e+00
  %11 = fdiv double %10, 2.000000e+03
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %13 = icmp eq i64 %indvars.iv26, 0
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %8, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %8, %18
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, <double 2.000000e+00, double 2.000000e+00>
  %24 = fdiv <2 x double> %23, <double 2.000000e+03, double 2.000000e+03>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond, label %._crit_edge21, label %.lr.ph

._crit_edge21:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph34:
  %sunkaddr52 = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr56 = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.lr.ph34
  %indvars.iv42 = phi i64 [ 0, %.lr.ph34 ], [ %indvars.iv.next43, %._crit_edge ]
  %5 = add i64 %indvars.iv42, 4294967295
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv42
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv42
  store double %7, double* %8, align 8
  %9 = icmp sgt i64 %indvars.iv42, 0
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %xtraiter45 = and i64 %indvars.iv42, 1
  %lcmp.mod = icmp eq i64 %xtraiter45, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 0
  %11 = load double, double* %10, align 8
  %12 = load double, double* %2, align 8
  %13 = fmul double %11, %12
  %14 = fsub double %7, %13
  %sunkaddr49 = shl i64 %indvars.iv42, 3
  %sunkaddr50 = add i64 %sunkaddr, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  store double %14, double* %sunkaddr51, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %14, %.prol.preheader ], [ %7, %.lr.ph ]
  %.lcssa37.unr.ph = phi double [ %14, %.prol.preheader ], [ undef, %.lr.ph ]
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr53 = shl i64 %indvars.iv42, 3
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %17 = phi double [ %29, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %sunkaddr55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %sunkaddr55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv42
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa37.unr.ph, %.prol.loopexit ], [ %7, %4 ], [ %29, %._crit_edge.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv42, i64 %indvars.iv42
  %31 = load double, double* %30, align 8
  %32 = fdiv double %.lcssa, %31
  %sunkaddr57 = shl i64 %indvars.iv42, 3
  %sunkaddr58 = add i64 %sunkaddr56, %sunkaddr57
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  store double %32, double* %sunkaddr59, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond, label %._crit_edge35, label %4

._crit_edge35:                                    ; preds = %._crit_edge
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

.lr.ph:                                           ; preds = %.lr.ph.preheader, %16
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.lr.ph.preheader ]
  %7 = phi %struct._IO_FILE* [ %17, %16 ], [ %6, %.lr.ph.preheader ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #5
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
