; ModuleID = 'B.ll'
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
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %10, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.lr.ph4.us.new..unr-lcssa_crit_edge, %.preheader.lr.ph
  %indvars.iv25 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next26, %.lr.ph4.us.new..unr-lcssa_crit_edge ]
  %3 = add nuw nsw i64 %indvars.iv25, 4294967295
  %4 = icmp sgt i64 %indvars.iv25, 0
  br i1 %4, label %.lr.ph.us, label %.lr.ph4.us

.lr.ph4.us.new:                                   ; preds = %.lr.ph4.us, %.lr.ph4.us.new
  %indvars.iv14 = phi i64 [ 0, %.lr.ph4.us ], [ %indvars.iv.next15.1, %.lr.ph4.us.new ]
  %5 = trunc i64 %indvars.iv14 to i32
  %6 = sub i32 %38, %5
  %7 = srem i32 %6, 1200
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv14
  store double %9, double* %10, align 8
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %11 = trunc i64 %indvars.iv.next15 to i32
  %12 = sub i32 %38, %11
  %13 = srem i32 %12, 1200
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next15
  store double %15, double* %16, align 8
  %indvars.iv.next15.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond.122 = icmp eq i64 %indvars.iv.next15.1, 1200
  br i1 %exitcond.122, label %.lr.ph4.us.new..unr-lcssa_crit_edge, label %.lr.ph4.us.new

.lr.ph4.us.new..unr-lcssa_crit_edge:              ; preds = %.lr.ph4.us.new
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond, label %._crit_edge8, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %17 = add nuw nsw i64 %indvars.iv, %indvars.iv25
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1000
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.000000e+03
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = add nuw nsw i64 %indvars.iv.next, %indvars.iv25
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1000
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv25
  br i1 %exitcond.1, label %.lr.ph4.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter44 = and i64 %indvars.iv25, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %29 = trunc i64 %indvars.iv25 to i32
  %30 = srem i32 %29, 1000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 0
  store double %32, double* %33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %34 = trunc i64 %3 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %.lr.ph4.us, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph4.us.loopexit:                              ; preds = %.lr.ph.us.new
  br label %.lr.ph4.us

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.loopexit, %.prol.loopexit, %.preheader.us
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  store double 1.000000e+00, double* %36, align 8
  %37 = trunc i64 %indvars.iv25 to i32
  %38 = add i32 %37, 1200
  br label %.lr.ph4.us.new

._crit_edge8:                                     ; preds = %.lr.ph4.us.new..unr-lcssa_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader3.lr.ph:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.lr.ph.us

.loopexit.loopexit:                               ; preds = %.unr-lcssa
  br label %.loopexit

.loopexit.loopexit6:                              ; preds = %vector.body
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit6, %.loopexit.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 1000
  br i1 %exitcond49, label %._crit_edge10, label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.loopexit, %.preheader3.lr.ph
  %indvars.iv46 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next47, %.loopexit ]
  %indvars.iv31 = phi i64 [ 1, %.preheader3.lr.ph ], [ %indvars.iv.next32, %.loopexit ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %3 = icmp slt i64 %indvars.iv.next47, 1000
  br i1 %3, label %.lr.ph.us.us.preheader, label %vector.ph

.lr.ph.us.us.preheader:                           ; preds = %.preheader.lr.ph.us
  %4 = sub nsw i64 0, %indvars.iv46
  %5 = trunc i64 %4 to i32
  %6 = and i64 %indvars.iv46, 1
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv46
  %indvars.iv.next34.prol = add nuw nsw i64 %indvars.iv31, 1
  %8 = icmp eq i64 %6, 0
  %9 = icmp eq i32 %5, -998
  br label %.lr.ph.us.us

vector.ph:                                        ; preds = %.preheader.lr.ph.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 2
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %offset.idx
  %11 = bitcast double* %10 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %11, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %12 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %13 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %14 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %15 = or i64 %offset.idx, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %15
  %17 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %18 = getelementptr double, double* %16, i64 -3
  %19 = bitcast double* %18 to <8 x double>*
  %20 = shufflevector <2 x double> %12, <2 x double> %13, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %21 = shufflevector <2 x double> %14, <2 x double> %17, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %20, <4 x double> %21, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %19, align 8
  %index.next = add i64 %index, 2
  %22 = icmp eq i64 %index.next, 300
  br i1 %22, label %.loopexit.loopexit6, label %vector.body, !llvm.loop !1

.unr-lcssa.loopexit:                              ; preds = %.lr.ph.us.us.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.prol.loopexit, %.unr-lcssa.loopexit
  %23 = phi double [ %.pre54, %.prol.loopexit ], [ %44, %.unr-lcssa.loopexit ]
  %24 = fmul double %23, %0
  store double %24, double* %25, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %.unr-lcssa, %.lr.ph.us.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next44, %.unr-lcssa ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv43
  br i1 %8, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %26 = load double, double* %7, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv43
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %25, align 8
  %31 = fadd double %29, %30
  store double %31, double* %25, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv33.unr.ph = phi i64 [ %indvars.iv.next34.prol, %.prol.preheader ], [ %indvars.iv31, %.lr.ph.us.us ]
  %.pre54 = load double, double* %25, align 8
  br i1 %9, label %.unr-lcssa, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %32 = phi double [ %.pre54, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %44, %.lr.ph.us.us.new ]
  %indvars.iv33 = phi i64 [ %indvars.iv33.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.next34.1, %.lr.ph.us.us.new ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv46
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv43
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %25, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next34, i64 %indvars.iv46
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv43
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %25, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, 1000
  br i1 %exitcond.1, label %.unr-lcssa.loopexit, label %.lr.ph.us.us.new

._crit_edge10:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph.us

; <label>:5:                                      ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge3, label %.lr.ph.us

; <label>:6:                                      ; preds = %.lr.ph.us, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %17, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %5, label %6

.lr.ph.us:                                        ; preds = %5, %.lr.ph.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next8, %5 ]
  %17 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %6

._crit_edge3:                                     ; preds = %5
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
