; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge14.us
  %indvars.iv715.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge14.us ], [ 0, %.preheader.lr.ph ]
  %exitcond9.us = icmp eq i64 %indvars.iv715.us, 0
  br i1 %exitcond9.us, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv715.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.preheader
  %3 = trunc i64 %indvars.iv715.us to i32
  %4 = srem i32 %3, 1000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.000000e+03
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv715.us, i64 0
  store double %6, double* %7, align 8
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol, %.lr.ph.us.preheader
  %indvars.iv10.us.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  %8 = icmp eq i64 %indvars.iv715.us, 1
  br i1 %8, label %._crit_edge.us, label %.lr.ph.us.preheader1

.lr.ph.us.preheader1:                             ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph.us.prol.loopexit, %.preheader.us
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv715.us, i64 %indvars.iv715.us
  store double 1.000000e+00, double* %9, align 8
  %10 = trunc i64 %indvars.iv715.us to i32
  %11 = add i32 %10, 1200
  br label %12

; <label>:12:                                     ; preds = %12, %._crit_edge.us
  %indvars.iv411.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next5.us, %12 ]
  %13 = sub nsw i64 0, %indvars.iv411.us
  %14 = trunc i64 %13 to i32
  %15 = add i32 %11, %14
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.200000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv715.us, i64 %indvars.iv411.us
  store double %18, double* %19, align 8
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv411.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next5.us, 1200
  br i1 %exitcond20, label %._crit_edge14.us, label %12

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader1, %.lr.ph.us
  %indvars.iv10.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph.us ], [ %indvars.iv10.us.unr.ph, %.lr.ph.us.preheader1 ]
  %20 = add nuw nsw i64 %indvars.iv10.us, %indvars.iv715.us
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1000
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.000000e+03
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv715.us, i64 %indvars.iv10.us
  store double %24, double* %25, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv10.us, 1
  %26 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv715.us
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv715.us, i64 %indvars.iv.next.us
  store double %30, double* %31, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv10.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv715.us
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge14.us:                                 ; preds = %12
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv715.us, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond21, label %._crit_edge18, label %.preheader.us

._crit_edge18:                                    ; preds = %._crit_edge14.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader3.lr.ph:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge14.us, %.preheader3.lr.ph
  %indvars.iv815.us = phi i64 [ %indvars.iv.next9.us, %._crit_edge14.us ], [ 0, %.preheader3.lr.ph ]
  %exitcond11.us = icmp eq i64 %indvars.iv815.us, 999
  br i1 %exitcond11.us, label %vector.ph, label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %3 = sub i64 999, %indvars.iv815.us
  %xtraiter = and i64 %3, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %4 = icmp eq i64 %indvars.iv815.us, 998
  %indvars.iv.next512.us.us.prol = add nuw nsw i64 %indvars.iv815.us, 1
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next512.us.us.prol, i64 %indvars.iv815.us
  br label %.preheader.us.us

vector.ph:                                        ; preds = %.preheader3.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 2
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv815.us, i64 %offset.idx
  %7 = bitcast double* %6 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %7, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %8 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %9 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %10 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %11 = or i64 %offset.idx, 3
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv815.us, i64 %11
  %13 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %14 = getelementptr double, double* %12, i64 -3
  %15 = bitcast double* %14 to <8 x double>*
  %16 = shufflevector <2 x double> %8, <2 x double> %9, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %17 = shufflevector <2 x double> %10, <2 x double> %13, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %16, <4 x double> %17, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %15, align 8
  %index.next = add i64 %index, 2
  %18 = icmp eq i64 %index.next, 300
  br i1 %18, label %._crit_edge14.us.loopexit, label %vector.body, !llvm.loop !1

._crit_edge14.us.loopexit:                        ; preds = %vector.body
  br label %._crit_edge14.us

._crit_edge14.us.loopexit6:                       ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit6, %._crit_edge14.us.loopexit
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv815.us, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond34, label %._crit_edge18, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv613.us.us = phi i64 [ %indvars.iv.next7.us.us, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv815.us, i64 %indvars.iv613.us.us
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %20 = load double, double* %5, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next512.us.us.prol, i64 %indvars.iv613.us.us
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = load double, double* %19, align 8
  %25 = fadd double %24, %23
  store double %25, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.next512.us.us.in.unr.ph = phi i64 [ %indvars.iv.next512.us.us.prol, %.prol.preheader ], [ %indvars.iv815.us, %.preheader.us.us ]
  br i1 %4, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv815.us, i64 %indvars.iv613.us.us
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %0
  store double %28, double* %26, align 8
  %indvars.iv.next7.us.us = add nuw nsw i64 %indvars.iv613.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next7.us.us, 1200
  br i1 %exitcond, label %._crit_edge14.us.loopexit6, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv.next512.us.us.in = phi i64 [ %indvars.iv.next512.us.us.1, %.preheader.us.us.new ], [ %indvars.iv.next512.us.us.in.unr.ph, %.preheader.us.us.new.preheader ]
  %indvars.iv.next512.us.us = add nuw nsw i64 %indvars.iv.next512.us.us.in, 1
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next512.us.us, i64 %indvars.iv815.us
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next512.us.us, i64 %indvars.iv613.us.us
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %19, align 8
  %35 = fadd double %34, %33
  store double %35, double* %19, align 8
  %indvars.iv.next512.us.us.1 = add nsw i64 %indvars.iv.next512.us.us.in, 2
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next512.us.us.1, i64 %indvars.iv815.us
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next512.us.us.1, i64 %indvars.iv613.us.us
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %19, align 8
  %42 = fadd double %41, %40
  store double %42, double* %19, align 8
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next512.us.us.1, 999
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge18:                                    ; preds = %._crit_edge14.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv25.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv25.us, 1000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %13 ]
  %7 = add nsw i64 %indvars.iv4.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25.us, i64 %indvars.iv4.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond9, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
