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
  tail call fastcc void @init_array([2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_trisolv([2000 x double]* %6, double* %7, double* %8)
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
  tail call fastcc void @print_array(double* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph2, %._crit_edge
  %indvars.iv8 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next9, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %.lr.ph2 ], [ %indvars.iv.next7, %._crit_edge ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %3 = getelementptr inbounds double, double* %1, i64 %indvars.iv8
  store double -9.990000e+02, double* %3, align 8
  %4 = trunc i64 %indvars.iv8 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  store double %5, double* %6, align 8
  %7 = trunc i64 %indvars.iv8 to i32
  %8 = add i32 %7, 2001
  %xtraiter11 = and i64 %indvars.iv.next9, 1
  %lcmp.mod = icmp eq i64 %xtraiter11, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %9

; <label>:9:                                      ; preds = %.lr.ph
  %10 = sitofp i32 %8 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %9, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %9 ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv8, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %15 = trunc i64 %indvars.iv to i32
  %16 = sub i32 %8, %15
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = trunc i64 %indvars.iv.next to i32
  %20 = sub i32 %8, %19
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %23, <double 2.000000e+00, double 2.000000e+00>
  %25 = fdiv <2 x double> %24, <double 2.000000e+03, double 2.000000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph12.preheader:
  %3 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %3, align 8
  %sunkaddr = ptrtoint double* %1 to i64
  %4 = ptrtoint double* %1 to i64
  %5 = ptrtoint double* %1 to i64
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %._crit_edge
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge ], [ 0, %.lr.ph12.preheader ]
  %6 = add nuw nsw i64 %indvars.iv23, 4294967295
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv23
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  store double %8, double* %9, align 8
  %10 = icmp sgt i64 %indvars.iv23, 0
  %11 = load [2000 x double]*, [2000 x double]** %3, align 8
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph12
  %xtraiter26 = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %xtraiter26, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %12

; <label>:12:                                     ; preds = %.lr.ph
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv23, i64 0
  %14 = load double, double* %13, align 8
  %15 = load double, double* %1, align 8
  %16 = fmul double %14, %15
  %17 = fsub double %8, %16
  %sunkaddr27 = shl i64 %indvars.iv23, 3
  %sunkaddr28 = add i64 %4, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  store double %17, double* %sunkaddr29, align 8
  %18 = load [2000 x double]*, [2000 x double]** %3, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %12, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %12 ], [ 0, %.lr.ph ]
  %.unr.ph = phi [2000 x double]* [ %18, %12 ], [ %11, %.lr.ph ]
  %.unr20.ph = phi double [ %17, %12 ], [ %8, %.lr.ph ]
  %.lcssa17.unr.ph = phi double [ %17, %12 ], [ undef, %.lr.ph ]
  %.lcssa16.unr.ph = phi [2000 x double]* [ %18, %12 ], [ undef, %.lr.ph ]
  %19 = trunc i64 %6 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr38 = shl i64 %indvars.iv23, 3
  %sunkaddr39 = add i64 %sunkaddr, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = phi [2000 x double]* [ %36, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %22 = phi double [ %35, %.lr.ph.new ], [ %.unr20.ph, %.lr.ph.new.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %21, i64 %indvars.iv23, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %sunkaddr40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = load [2000 x double]*, [2000 x double]** %3, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %indvars.iv23, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %28, %34
  store double %35, double* %sunkaddr40, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %36 = load [2000 x double]*, [2000 x double]** %3, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph12
  %.lcssa9 = phi double [ %8, %.lr.ph12 ], [ %.lcssa17.unr.ph, %.prol.loopexit ], [ %35, %._crit_edge.loopexit ]
  %.lcssa = phi [2000 x double]* [ %11, %.lr.ph12 ], [ %.lcssa16.unr.ph, %.prol.loopexit ], [ %36, %._crit_edge.loopexit ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa, i64 %indvars.iv23, i64 %indvars.iv23
  %38 = load double, double* %37, align 8
  %39 = fdiv double %.lcssa9, %38
  %sunkaddr6 = shl nsw i64 %indvars.iv23, 3
  %sunkaddr7 = add i64 %5, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  store double %39, double* %sunkaddr8, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph12

._crit_edge13:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %15
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph.preheader ]
  %6 = phi %struct._IO_FILE* [ %16, %15 ], [ %5, %.lr.ph.preheader ]
  %7 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %8) #5
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %15
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
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
