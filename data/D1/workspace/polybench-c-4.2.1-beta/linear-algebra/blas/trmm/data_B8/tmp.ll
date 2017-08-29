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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge26.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge26.us ], [ 0, %.preheader.lr.ph ]
  %5 = icmp sgt i64 %indvars.iv37, 0
  br i1 %5, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv37
  store double 1.000000e+00, double* %6, align 8
  %7 = trunc i64 %indvars.iv37 to i32
  %8 = add i32 %7, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us, %._crit_edge.us.new
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %._crit_edge.us.new ], [ 0, %._crit_edge.us ]
  %9 = trunc i64 %indvars.iv33 to i32
  %10 = sub i32 %8, %9
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv33
  store double %13, double* %14, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %15 = trunc i64 %indvars.iv.next34 to i32
  %16 = sub i32 %8, %15
  %17 = srem i32 %16, 1200
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.200000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next34
  store double %19, double* %20, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next34.1, 1200
  br i1 %exitcond36.1, label %._crit_edge26.us, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %21 = add nuw nsw i64 %indvars.iv, %indvars.iv37
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv37
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv37
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv37, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %33 = trunc i64 %indvars.iv37 to i32
  %34 = srem i32 %33, 1000
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.000000e+03
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 0
  store double %36, double* %37, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %38 = icmp eq i64 %indvars.iv37, 1
  br i1 %38, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge26.us:                                 ; preds = %._crit_edge.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %._crit_edge29, label %.preheader.us

._crit_edge29:                                    ; preds = %._crit_edge26.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader23.lr.ph:
  %broadcast.splatinsert65 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat66 = shufflevector <2 x double> %broadcast.splatinsert65, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %._crit_edge27.us, %.preheader23.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader23.lr.ph ], [ %indvars.iv.next51, %._crit_edge27.us ]
  %indvars.iv40 = phi i64 [ 1, %.preheader23.lr.ph ], [ %indvars.iv.next41.pre-phi, %._crit_edge27.us ]
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %5 = icmp slt i64 %indvars.iv.next51, 1000
  br i1 %5, label %.preheader.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader23.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 2
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %offset.idx
  %7 = bitcast double* %6 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %7, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %8 = fmul <2 x double> %strided.vec, %broadcast.splat66
  %9 = fmul <2 x double> %strided.vec62, %broadcast.splat66
  %10 = fmul <2 x double> %strided.vec63, %broadcast.splat66
  %11 = or i64 %offset.idx, 3
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %11
  %13 = fmul <2 x double> %strided.vec64, %broadcast.splat66
  %14 = getelementptr double, double* %12, i64 -3
  %15 = bitcast double* %14 to <8 x double>*
  %16 = shufflevector <2 x double> %8, <2 x double> %9, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %17 = shufflevector <2 x double> %10, <2 x double> %13, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %16, <4 x double> %17, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %15, align 8
  %index.next = add i64 %index, 2
  %18 = icmp eq i64 %index.next, 300
  br i1 %18, label %._crit_edge27.us.loopexit59, label %vector.body, !llvm.loop !1

.preheader.us.us.preheader:                       ; preds = %.preheader23.us
  %19 = sub nuw nsw i64 1001, %indvars.iv50
  %xtraiter55 = and i64 %19, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv50
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv40, 1
  br label %.preheader.us.us

._crit_edge27.us.loopexit59:                      ; preds = %vector.body
  %.pre61 = add nuw nsw i64 %indvars.iv40, 1
  br label %._crit_edge27.us

._crit_edge27.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %._crit_edge27.us.loopexit59
  %indvars.iv.next41.pre-phi = phi i64 [ %.pre61, %._crit_edge27.us.loopexit59 ], [ %indvars.iv.next43.prol, %._crit_edge27.us.loopexit ]
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond53, label %._crit_edge29, label %.preheader23.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %21 = icmp eq i64 %xtraiter55, 0
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv46
  br i1 %21, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %23 = load double, double* %20, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv46
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %22, align 8
  %28 = fadd double %27, %26
  store double %28, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv42.unr.ph = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader ], [ %indvars.iv40, %.preheader.us.us ]
  %29 = icmp eq i64 %indvars.iv50, 998
  %.pre60 = load double, double* %22, align 8
  br i1 %29, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %30 = phi double [ %.pre60, %.prol.loopexit ], [ %44, %._crit_edge.us.us.loopexit ]
  %31 = fmul double %30, %2
  store double %31, double* %22, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond49, label %._crit_edge27.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %32 = phi double [ %44, %.preheader.us.us.new ], [ %.pre60, %.preheader.us.us.new.preheader ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.preheader.us.us.new ], [ %indvars.iv42.unr.ph, %.preheader.us.us.new.preheader ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv50
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv46
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %22, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next43, i64 %indvars.iv50
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next43, i64 %indvars.iv46
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %22, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next43.1, 1000
  br i1 %exitcond45.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge29:                                    ; preds = %._crit_edge27.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv13 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next14, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond16, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
