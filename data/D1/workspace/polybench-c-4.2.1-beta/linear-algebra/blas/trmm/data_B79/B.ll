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
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(double %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
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

.preheader.us:                                    ; preds = %._crit_edge5.us, %.preheader.lr.ph
  %indvars.iv51 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next52, %._crit_edge5.us ]
  %3 = trunc i64 %indvars.iv51 to i32
  %4 = icmp sgt i64 %indvars.iv51, 0
  br i1 %4, label %.lr.ph.us, label %._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %5 = and i32 %3, 1
  %lcmp.mod = icmp eq i32 %5, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %6 = trunc i64 %indvars.iv51 to i32
  %7 = srem i32 %6, 1000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 0
  store double %9, double* %10, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %11 = icmp eq i32 %3, 1
  br i1 %11, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %12 = add nsw i64 %indvars.iv, %indvars.iv51
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = add nsw i64 %indvars.iv.next, %indvars.iv51
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1000
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 1.000000e+03
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond33.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %24, align 8
  %25 = trunc i64 %indvars.iv51 to i32
  %26 = add i32 %25, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new, %._crit_edge.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next18.1, %._crit_edge.us.new ]
  %27 = trunc i64 %indvars.iv17 to i32
  %28 = sub i32 %26, %27
  %29 = srem i32 %28, 1200
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.200000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv51, i64 %indvars.iv17
  store double %31, double* %32, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %33 = trunc i64 %indvars.iv.next18 to i32
  %34 = sub i32 %26, %33
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv51, i64 %indvars.iv.next18
  store double %37, double* %38, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge5.us, label %._crit_edge.us.new

._crit_edge5.us:                                  ; preds = %._crit_edge.us.new
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge5.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader3.lr.ph:
  %broadcast.splatinsert63 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat64 = shufflevector <2 x double> %broadcast.splatinsert63, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.lr.ph
  %indvar = phi i32 [ 0, %.preheader3.lr.ph ], [ %indvar.next, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv46 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next47, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv33 = phi i64 [ 1, %.preheader3.lr.ph ], [ %indvars.iv.next34.pre-phi, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %3 = icmp slt i64 %indvars.iv.next47, 1000
  br i1 %3, label %.preheader.us.us.preheader, label %vector.ph

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %4 = sub i32 1001, %indvar
  %xtraiter50 = and i32 %4, 1
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv46
  %indvars.iv.next36.prol = add nsw i64 %indvars.iv33, 1
  %6 = icmp eq i32 %xtraiter50, 0
  %7 = icmp eq i32 %indvar, 998
  br label %.preheader.us.us

vector.ph:                                        ; preds = %.preheader3.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %8 = shl i64 %index, 2
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %8
  %10 = bitcast double* %9 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %10, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %11 = fmul <2 x double> %strided.vec, %broadcast.splat64
  %12 = fmul <2 x double> %strided.vec60, %broadcast.splat64
  %13 = fmul <2 x double> %strided.vec61, %broadcast.splat64
  %14 = or i64 %8, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %14
  %16 = fmul <2 x double> %strided.vec62, %broadcast.splat64
  %17 = getelementptr double, double* %15, i64 -3
  %18 = bitcast double* %17 to <8 x double>*
  %19 = shufflevector <2 x double> %11, <2 x double> %12, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %20 = shufflevector <2 x double> %13, <2 x double> %16, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %19, <4 x double> %20, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %18, align 8
  %index.next = add i64 %index, 2
  %21 = icmp eq i64 %index.next, 300
  br i1 %21, label %._crit_edge6.us.loopexit30, label %vector.body, !llvm.loop !1

._crit_edge6.us.loopexit30:                       ; preds = %vector.body
  %.pre58 = add nsw i64 %indvars.iv33, 1
  br label %._crit_edge6.us

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %._crit_edge6.us.loopexit30
  %indvars.iv.next34.pre-phi = phi i64 [ %.pre58, %._crit_edge6.us.loopexit30 ], [ %indvars.iv.next36.prol, %._crit_edge6.us.loopexit ]
  %exitcond59 = icmp eq i64 %indvars.iv.next47, 1000
  br i1 %exitcond59, label %._crit_edge10, label %._crit_edge6.us..preheader3.us_crit_edge

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv42 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next43, %._crit_edge.us.us ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %23 = load double, double* %5, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv42
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %22, align 8
  %28 = fadd double %26, %27
  store double %28, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %.prol.preheader ], [ %indvars.iv33, %.preheader.us.us ]
  %.pre57 = load double, double* %22, align 8
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %29 = phi double [ %.pre57, %.prol.loopexit ], [ %43, %._crit_edge.us.us.loopexit ]
  %30 = fmul double %29, %0
  store double %30, double* %22, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 1200
  br i1 %exitcond, label %._crit_edge6.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %31 = phi double [ %43, %.preheader.us.us.new ], [ %.pre57, %.preheader.us.us.new.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us.us.new ], [ %indvars.iv35.unr.ph, %.preheader.us.us.new.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv35, i64 %indvars.iv46
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv35, i64 %indvars.iv42
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %36, %31
  store double %37, double* %22, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next36, i64 %indvars.iv46
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next36, i64 %indvars.iv42
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, %37
  store double %43, double* %22, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next36.1 to i32
  %exitcond41.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond41.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge10:                                    ; preds = %._crit_edge6.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge2.us, %.preheader.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next11, %._crit_edge2.us ]
  %5 = mul nsw i64 %indvars.iv10, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond12, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge2.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
