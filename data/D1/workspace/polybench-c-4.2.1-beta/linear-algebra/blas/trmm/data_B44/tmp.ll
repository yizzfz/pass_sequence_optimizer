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
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next51, %._crit_edge32.us ]
  %5 = add nuw i64 %indvars.iv50, 4294967295
  %6 = icmp sgt i64 %indvars.iv50, 0
  br i1 %6, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv50
  store double 1.000000e+00, double* %7, align 8
  %8 = trunc i64 %indvars.iv50 to i32
  %9 = add i32 %8, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new, %._crit_edge.us
  %indvars.iv39 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next40.1, %._crit_edge.us.new ]
  %10 = trunc i64 %indvars.iv39 to i32
  %11 = sub i32 %9, %10
  %12 = srem i32 %11, 1200
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv39
  store double %14, double* %15, align 8
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %16 = trunc i64 %indvars.iv.next40 to i32
  %17 = sub i32 %9, %16
  %18 = srem i32 %17, 1200
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.200000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next40
  store double %20, double* %21, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond.147 = icmp eq i64 %indvars.iv.next40.1, 1200
  br i1 %exitcond.147, label %._crit_edge32.us, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %22 = add nuw nsw i64 %indvars.iv, %indvars.iv50
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1000
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv
  store double %26, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = add nuw nsw i64 %indvars.iv.next, %indvars.iv50
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv.next
  store double %32, double* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter69 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %34 = trunc i64 %indvars.iv50 to i32
  %35 = srem i32 %34, 1000
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 0
  store double %37, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %39 = trunc i64 %5 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge32.us:                                 ; preds = %._crit_edge.us.new
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond, label %._crit_edge35, label %.preheader.us

._crit_edge35:                                    ; preds = %._crit_edge32.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader27.us.preheader:
  %broadcast.splatinsert66 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat67 = shufflevector <2 x double> %broadcast.splatinsert66, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next54, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %5 = icmp slt i64 %indvars.iv.next54, 1000
  br i1 %5, label %.preheader.us.us.preheader, label %vector.ph

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %6 = sub nsw i64 0, %indvars.iv53
  %7 = trunc i64 %6 to i32
  %8 = and i32 %7, 1
  %lcmp.mod48 = icmp eq i32 %8, 0
  %9 = icmp eq i32 %7, -998
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

vector.ph:                                        ; preds = %.preheader27.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %offset.idx
  %12 = bitcast double* %11 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %12, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %13 = fmul <2 x double> %strided.vec, %broadcast.splat67
  %14 = fmul <2 x double> %strided.vec63, %broadcast.splat67
  %15 = fmul <2 x double> %strided.vec64, %broadcast.splat67
  %16 = or i64 %offset.idx, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %16
  %18 = fmul <2 x double> %strided.vec65, %broadcast.splat67
  %19 = getelementptr double, double* %17, i64 -3
  %20 = bitcast double* %19 to <8 x double>*
  %21 = shufflevector <2 x double> %13, <2 x double> %14, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %22 = shufflevector <2 x double> %15, <2 x double> %18, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %21, <4 x double> %22, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %20, align 8
  %index.next = add i64 %index, 2
  %23 = icmp eq i64 %index.next, 300
  br i1 %23, label %..loopexit_crit_edge.us.loopexit90, label %vector.body, !llvm.loop !1

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit90:               ; preds = %vector.body
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit90, %..loopexit_crit_edge.us.loopexit
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1000
  br i1 %exitcond56, label %._crit_edge31, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us.us ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %25 = load double, double* %10, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv50
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %24, align 8
  %30 = fadd double %29, %28
  store double %30, double* %24, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us ]
  %.pre62 = load double, double* %24, align 8
  br i1 %9, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %31 = phi double [ %.pre62, %.prol.loopexit ], [ %45, %._crit_edge.us.us.loopexit ]
  %32 = fmul double %31, %2
  store double %32, double* %24, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %33 = phi double [ %45, %.preheader.us.us.new ], [ %.pre62, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv53
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv50
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %24, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv53
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %24, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31:                                    ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv16, 1000
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge21
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond19, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
