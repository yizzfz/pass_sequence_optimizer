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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %._crit_edge ]
  %indvars.iv3 = phi i64 [ 1, %4 ], [ %indvars.iv.next4, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %7, double* %8, align 8
  %9 = add nuw nsw i64 %indvars.iv5, 2001
  %10 = and i64 %indvars.iv5, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %._crit_edge8.prol.preheader, label %._crit_edge8.prol.loopexit.unr-lcssa

._crit_edge8.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge8.prol

._crit_edge8.prol:                                ; preds = %._crit_edge8.prol.preheader
  %11 = trunc i64 %9 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 2.000000e+00
  %14 = fdiv double %13, 2.000000e+03
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %14, double* %15, align 8
  br label %._crit_edge8.prol.loopexit.unr-lcssa

._crit_edge8.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph, %._crit_edge8.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge8.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge8.prol.loopexit

._crit_edge8.prol.loopexit:                       ; preds = %._crit_edge8.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %indvars.iv5, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge8.prol.loopexit
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge8 ]
  %17 = sub nuw nsw i64 %9, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 2.000000e+00
  %21 = fdiv double %20, 2.000000e+03
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = sub nuw nsw i64 %9, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 2.000000e+00
  %27 = fdiv double %26, 2.000000e+03
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3
  br i1 %exitcond.1, label %._crit_edge.unr-lcssa, label %._crit_edge8

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge8.prol.loopexit, %._crit_edge.unr-lcssa
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 2000
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br i1 %exitcond7, label %29, label %.lr.ph

; <label>:29:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]*, double*, double*) unnamed_addr #0 {
  %sunkaddr4 = ptrtoint double* %2 to i64
  %sunkaddr = ptrtoint double* %2 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %4
  %indvars.iv11 = phi i64 [ 0, %4 ], [ %indvars.iv.next12, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  store double %6, double* %7, align 8
  %8 = icmp sgt i64 %indvars.iv11, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge._crit_edge
  %sunkaddr1 = shl nsw i64 %indvars.iv11, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %xtraiter = and i64 %indvars.iv11, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge14.prol.loopexit.unr-lcssa, label %._crit_edge14.prol.preheader

._crit_edge14.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge14.prol

._crit_edge14.prol:                               ; preds = %._crit_edge14.prol.preheader
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  %10 = load double, double* %9, align 8
  %11 = load double, double* %2, align 8
  %12 = fmul double %10, %11
  %13 = fsub double %6, %12
  store double %13, double* %sunkaddr3, align 8
  br label %._crit_edge14.prol.loopexit.unr-lcssa

._crit_edge14.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge14.prol
  %.lcssa19.unr.ph = phi double [ %13, %._crit_edge14.prol ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge14.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %13, %._crit_edge14.prol ], [ %6, %.lr.ph ]
  br label %._crit_edge14.prol.loopexit

._crit_edge14.prol.loopexit:                      ; preds = %._crit_edge14.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %indvars.iv11, 1
  br i1 %14, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge14.prol.loopexit
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge14 ]
  %15 = phi double [ %.unr.ph, %.lr.ph.new ], [ %27, %._crit_edge14 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %sunkaddr3, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %sunkaddr3, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv11
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge14

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge14
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge14.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa19 = phi double [ %.lcssa19.unr.ph, %._crit_edge14.prol.loopexit ], [ %27, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge._crit_edge
  %.lcssa = phi double [ %6, %._crit_edge._crit_edge ], [ %.lcssa19, %._crit_edge.loopexit ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv11
  %29 = load double, double* %28, align 8
  %30 = fdiv double %.lcssa, %29
  %sunkaddr5 = shl nsw i64 %indvars.iv11, 3
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  store double %30, double* %sunkaddr7, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond13, label %31, label %._crit_edge._crit_edge

; <label>:31:                                     ; preds = %._crit_edge
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
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %8 = phi %struct._IO_FILE* [ %7, %2 ], [ %17, %._crit_edge ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %10) #5
  %12 = trunc i64 %indvars.iv to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %._crit_edge1

; <label>:18:                                     ; preds = %._crit_edge
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
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
