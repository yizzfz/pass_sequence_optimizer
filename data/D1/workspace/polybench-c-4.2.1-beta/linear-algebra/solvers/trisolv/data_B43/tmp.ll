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
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge1

._crit_edge1:                                     ; preds = %10
  br label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(double* %14)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge1, %._crit_edge, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*, double*, double*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv3 = phi i64 [ 1, %3 ], [ %indvars.iv.next4, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %6, double* %7, align 8
  %8 = add nuw nsw i64 %indvars.iv5, 2001
  %xtraiter7 = and i64 %indvars.iv.next6, 1
  %lcmp.mod = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %14 = icmp eq i64 %indvars.iv5, 0
  br i1 %14, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %15 = sub nuw nsw i64 %8, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = sub nuw nsw i64 %8, %indvars.iv.next
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %23, <double 2.000000e+00, double 2.000000e+00>
  %25 = fdiv <2 x double> %24, <double 2.000000e+03, double 2.000000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %._crit_edge.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond, label %27, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br label %.lr.ph

; <label>:27:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]*, double*, double*) unnamed_addr #0 {
  %4 = alloca [2000 x double]*, align 8
  store [2000 x double]* %0, [2000 x double]** %4, align 8
  %sunkaddr = ptrtoint double* %1 to i64
  %sunkaddr31 = ptrtoint double* %1 to i64
  %5 = ptrtoint double* %1 to i64
  %6 = ptrtoint double* %1 to i64
  br label %7

; <label>:7:                                      ; preds = %._crit_edge._crit_edge, %3
  %indvars.iv23 = phi i64 [ 0, %3 ], [ %indvars.iv.next24, %._crit_edge._crit_edge ]
  %8 = add i64 %indvars.iv23, 4294967295
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv23
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  store double %10, double* %11, align 8
  %12 = icmp sgt i64 %indvars.iv23, 0
  %13 = load [2000 x double]*, [2000 x double]** %4, align 8
  br i1 %12, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %7
  br label %._crit_edge

.lr.ph:                                           ; preds = %7
  %xtraiter25 = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %xtraiter25, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv23, i64 0
  %15 = load double, double* %14, align 8
  %16 = load double, double* %1, align 8
  %17 = fmul double %15, %16
  %18 = fsub double %10, %17
  %sunkaddr11.prol = shl nsw i64 %indvars.iv23, 3
  %sunkaddr12.prol = add i64 %5, %sunkaddr11.prol
  %sunkaddr13.prol = inttoptr i64 %sunkaddr12.prol to double*
  store double %18, double* %sunkaddr13.prol, align 8
  %19 = load [2000 x double]*, [2000 x double]** %4, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi [2000 x double]* [ %19, %.prol.preheader ], [ %13, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr20.ph = phi double [ %18, %.prol.preheader ], [ %10, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa17.unr.ph = phi double [ %18, %.prol.preheader ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %.lcssa16.unr.ph = phi [2000 x double]* [ %19, %.prol.preheader ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %20 = trunc i64 %8 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr28 = shl i64 %indvars.iv23, 3
  %sunkaddr29 = add i64 %sunkaddr, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  %sunkaddr32 = shl i64 %indvars.iv23, 3
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %22 = phi [2000 x double]* [ %37, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %23 = phi double [ %36, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.unr20.ph, %.lr.ph.new.preheader ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %indvars.iv23, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %sunkaddr30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = load [2000 x double]*, [2000 x double]** %4, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv23, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %29, %35
  store double %36, double* %sunkaddr34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = load [2000 x double]*, [2000 x double]** %4, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %.lcssa9 = phi double [ %10, %.._crit_edge_crit_edge ], [ %.lcssa17.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %36, %._crit_edge.loopexit ]
  %.lcssa = phi [2000 x double]* [ %13, %.._crit_edge_crit_edge ], [ %.lcssa16.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %37, %._crit_edge.loopexit ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa, i64 %indvars.iv23, i64 %indvars.iv23
  %39 = load double, double* %38, align 8
  %40 = fdiv double %.lcssa9, %39
  %sunkaddr5 = shl nsw i64 %indvars.iv23, 3
  %sunkaddr6 = add i64 %sunkaddr5, %6
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %40, double* %sunkaddr7, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond, label %41, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %7

; <label>:41:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %7

; <label>:7:                                      ; preds = %._crit_edge1, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge1 ]
  %8 = phi %struct._IO_FILE* [ %6, %1 ], [ %18, %._crit_edge1 ]
  %9 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %10) #5
  %12 = trunc i64 %indvars.iv to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %17

; <label>:15:                                     ; preds = %7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %._crit_edge1

._crit_edge1:                                     ; preds = %17
  br label %7

; <label>:19:                                     ; preds = %17
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
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
