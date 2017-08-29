; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  tail call void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %9)
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
  tail call void @print_array(i32 2000, double* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*) #2 {
.lr.ph5:
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit, %.lr.ph5
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.loopexit ], [ 0, %.lr.ph5 ]
  %sext = shl i64 %indvars.iv17, 32
  %4 = ashr exact i64 %sext, 32
  %5 = getelementptr inbounds double, double* %2, i64 %4
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv17 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv17
  store double %7, double* %8, align 8
  %9 = and i64 %indvars.iv17, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %10 = add i32 %6, 2001
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 2.000000e+00
  %13 = fdiv double %12, 2.000000e+03
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 0
  store double %13, double* %14, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %indvars.iv17, 0
  br i1 %15, label %.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %16 = sub nsw i64 1, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = add i32 %17, %6
  %19 = add i32 %18, 2000
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = sub i64 0, %indvars.iv
  %23 = trunc i64 %22 to i32
  %24 = add i32 %23, %6
  %25 = add i32 %24, 2000
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %20, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %28, <double 2.000000e+00, double 2.000000e+00>
  %30 = fdiv <2 x double> %29, <double 2.000000e+03, double 2.000000e+03>
  %31 = bitcast double* %21 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv17
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.unr-lcssa, label %.lr.ph

.loopexit.unr-lcssa:                              ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph.prol.loopexit, %.loopexit.unr-lcssa
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond19, label %._crit_edge, label %.lr.ph.preheader

._crit_edge:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trisolv(i32, [2000 x double]*, double*, double*) #2 {
.lr.ph5:
  %sunkaddr.prol = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr.1 = ptrtoint double* %2 to i64
  %sunkaddr22 = ptrtoint double* %2 to i64
  br label %4

; <label>:4:                                      ; preds = %.loopexit, %.lr.ph5
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.loopexit ], [ 0, %.lr.ph5 ]
  %indvars.iv13 = phi i32 [ %indvars.iv.next14, %.loopexit ], [ -1, %.lr.ph5 ]
  %5 = add i64 %indvars.iv15, 4294967295
  %6 = and i64 %5, 4294967295
  %sext = shl i64 %indvars.iv15, 32
  %7 = ashr exact i64 %sext, 32
  %8 = getelementptr inbounds double, double* %3, i64 %7
  %9 = bitcast double* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds double, double* %2, i64 %7
  %12 = bitcast double* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = icmp sgt i64 %indvars.iv15, 0
  %.phi.trans.insert = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  %.pre = load double, double* %.phi.trans.insert, align 8
  br i1 %13, label %..lr.ph_crit_edge, label %.loopexit

..lr.ph_crit_edge:                                ; preds = %4
  %wide.trip.count = zext i32 %indvars.iv13 to i64
  %14 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %14, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 0
  %16 = load double, double* %15, align 8
  %17 = load double, double* %2, align 8
  %18 = fmul double %16, %17
  %19 = fsub double %.pre, %18
  %sunkaddr19.prol = shl nuw nsw i64 %indvars.iv15, 3
  %sunkaddr20.prol = add i64 %sunkaddr.prol, %sunkaddr19.prol
  %sunkaddr21.prol = inttoptr i64 %sunkaddr20.prol to double*
  store double %19, double* %sunkaddr21.prol, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %..lr.ph_crit_edge, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %19, %.lr.ph.prol ], [ undef, %..lr.ph_crit_edge ]
  %.unr.ph = phi double [ %19, %.lr.ph.prol ], [ %.pre, %..lr.ph_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %..lr.ph_crit_edge ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %6, 0
  br i1 %20, label %.loopexit.loopexit, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  %sunkaddr19 = shl nuw nsw i64 %indvars.iv15, 3
  %sunkaddr20 = add i64 %sunkaddr, %sunkaddr19
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to double*
  %sunkaddr19.1 = shl nuw nsw i64 %indvars.iv15, 3
  %sunkaddr20.1 = add i64 %sunkaddr.1, %sunkaddr19.1
  %sunkaddr21.1 = inttoptr i64 %sunkaddr20.1 to double*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %21 = phi double [ %.unr.ph, %..lr.ph_crit_edge.new ], [ %33, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %..lr.ph_crit_edge.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %sunkaddr21.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %33, %.loopexit.loopexit.unr-lcssa ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  %34 = phi double [ %.pre, %4 ], [ %.lcssa, %.loopexit.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv15
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  %sunkaddr23 = shl nuw nsw i64 %indvars.iv15, 3
  %sunkaddr24 = add i64 %sunkaddr22, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  store double %37, double* %sunkaddr25, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %indvars.iv.next14 = add nsw i32 %indvars.iv13, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond26, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge4, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge4 ]
  %7 = phi %struct._IO_FILE* [ %6, %.lr.ph.preheader ], [ %16, %._crit_edge4 ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge4

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond13 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond13, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %._crit_edge4
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
