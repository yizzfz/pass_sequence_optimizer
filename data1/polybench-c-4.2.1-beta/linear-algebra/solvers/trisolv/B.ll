; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  call void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  call void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %4 to double*
  call void @print_array(i32 2000, double* %15)
  br label %16

; <label>:16:                                     ; preds = %11, %14, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*) #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph4, label %._crit_edge5

.lr.ph4:                                          ; preds = %4
  %6 = sitofp i32 %0 to double
  %7 = sext i32 %0 to i64
  %8 = insertelement <2 x double> undef, double %6, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %10

; <label>:10:                                     ; preds = %.lr.ph4, %._crit_edge
  %indvars.iv11 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph4 ], [ %.pre, %._crit_edge ]
  %indvars.iv9 = phi i32 [ 1, %.lr.ph4 ], [ %indvars.iv.next10, %._crit_edge ]
  %11 = phi i32 [ 0, %.lr.ph4 ], [ %38, %._crit_edge ]
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  store double -9.990000e+02, double* %12, align 8
  %13 = trunc i64 %indvars.iv11 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %14, double* %15, align 8
  %16 = icmp slt i64 %indvars.iv11, 0
  %.pre = add i32 %indvar, 1
  br i1 %16, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %10
  %xtraiter = and i32 %.pre, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %17 = add i32 %11, 1
  %18 = add i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 2.000000e+00
  %21 = fdiv double %20, %6
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  store double %21, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %23 = icmp eq i32 %indvar, 0
  br i1 %23, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %24 = add i32 %11, 1
  %25 = add i32 %24, %0
  %wide.trip.count.1 = zext i32 %indvars.iv9 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %26 = trunc i64 %indvars.iv to i32
  %27 = sub i32 %25, %26
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = trunc i64 %indvars.iv.next to i32
  %31 = sub i32 %25, %30
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %28, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fmul <2 x double> %34, <double 2.000000e+00, double 2.000000e+00>
  %36 = fdiv <2 x double> %35, %9
  %37 = bitcast double* %29 to <2 x double>*
  store <2 x double> %36, <2 x double>* %37, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %10, %.prol.loopexit
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %38 = add nsw i32 %11, 1
  %39 = icmp slt i64 %indvars.iv.next12, %7
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  br i1 %39, label %10, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trisolv(i32, [2000 x double]*, double*, double*) #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %4
  %6 = sext i32 %0 to i64
  %sunkaddr17 = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr21 = ptrtoint double* %2 to i64
  br label %7

; <label>:7:                                      ; preds = %.lr.ph3, %._crit_edge
  %indvars.iv11 = phi i64 [ 0, %.lr.ph3 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph3 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv9 = phi i32 [ 0, %.lr.ph3 ], [ %indvars.iv.next10, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  %9 = bitcast double* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  %12 = bitcast double* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = icmp sgt i64 %indvars.iv11, 0
  %14 = bitcast i64 %10 to double
  br i1 %13, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %7
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  %16 = load double, double* %15, align 8
  %17 = load double, double* %2, align 8
  %18 = fmul double %16, %17
  %19 = fsub double %14, %18
  %sunkaddr14 = shl i64 %indvars.iv11, 3
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  store double %19, double* %sunkaddr16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %20 = phi double [ %19, %.prol.preheader ], [ %14, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %21 = icmp eq i32 %indvar, 1
  br i1 %21, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv9 to i64
  %sunkaddr18 = shl i64 %indvars.iv11, 3
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %22 = phi double [ %34, %.lr.ph.new ], [ %20, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %sunkaddr20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %sunkaddr20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %7
  %35 = phi double [ %20, %.prol.loopexit ], [ %14, %7 ], [ %34, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv11
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  %sunkaddr22 = shl i64 %indvars.iv11, 3
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  store double %38, double* %sunkaddr24, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  %39 = icmp slt i64 %indvars.iv.next12, %6
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %39, label %7, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %9 = sext i32 %0 to i64
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %20
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %20 ]
  %11 = phi %struct._IO_FILE* [ %8, %.lr.ph ], [ %22, %20 ]
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %13) #6
  %15 = trunc i64 %indvars.iv to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %10
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %10, %18
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %21 = icmp slt i64 %indvars.iv.next, %9
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %21, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %20
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %.lcssa = phi %struct._IO_FILE* [ %8, %2 ], [ %22, %._crit_edge.loopexit ]
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
