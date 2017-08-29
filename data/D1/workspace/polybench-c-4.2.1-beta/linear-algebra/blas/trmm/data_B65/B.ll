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

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge33.us, %._crit_edge.lr.ph
  %indvars.iv51 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next52, %._crit_edge33.us ]
  %3 = add nuw i64 %indvars.iv51, 4294967295
  %4 = icmp sgt i64 %indvars.iv51, 0
  br i1 %4, label %.lr.ph.us, label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %.lr.ph.us.new
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %.prol.loopexit, %._crit_edge.us
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %5, align 8
  %6 = trunc i64 %indvars.iv51 to i32
  %7 = add i32 %6, 1200
  br label %._crit_edge29.us.new

._crit_edge29.us.new:                             ; preds = %._crit_edge29.us.new, %._crit_edge29.us
  %indvars.iv40 = phi i64 [ 0, %._crit_edge29.us ], [ %indvars.iv.next41.1, %._crit_edge29.us.new ]
  %8 = trunc i64 %indvars.iv40 to i32
  %9 = sub i32 %7, %8
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv51, i64 %indvars.iv40
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %13 = trunc i64 %indvars.iv.next41 to i32
  %14 = sub i32 %7, %13
  %15 = srem i32 %14, 1200
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond.148 = icmp eq i64 %indvars.iv.next41.1, 1200
  br i1 %exitcond.148, label %._crit_edge33.us, label %._crit_edge29.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %21 = add nuw nsw i64 %indvars.iv, %indvars.iv51
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1000
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = add nuw nsw i64 %indvars.iv.next, %indvars.iv51
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1000
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.000000e+03, double 1.000000e+03>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %._crit_edge29.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge.us
  %xtraiter70 = and i64 %indvars.iv51, 1
  %lcmp.mod = icmp eq i64 %xtraiter70, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %34 = trunc i64 %indvars.iv51 to i32
  %35 = srem i32 %34, 1000
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv51, i64 0
  store double %37, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %39 = trunc i64 %3 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge29.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge33.us:                                 ; preds = %._crit_edge29.us.new
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond, label %._crit_edge36, label %._crit_edge.us

._crit_edge36:                                    ; preds = %._crit_edge33.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
._crit_edge.us.preheader:
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv55 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next56, %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge ]
  %indvars.iv44 = phi i64 [ 1, %._crit_edge.us.preheader ], [ %indvars.iv.next45, %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %3 = icmp slt i64 %indvars.iv.next56, 1000
  br i1 %3, label %._crit_edge27.us.us.preheader, label %._crit_edge27.us34.preheader62

._crit_edge27.us.us.preheader:                    ; preds = %._crit_edge.us
  %4 = sub nsw i64 0, %indvars.iv55
  %5 = trunc i64 %4 to i32
  %6 = and i32 %5, 1
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv55
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv44, 1
  %8 = icmp eq i32 %6, 0
  %9 = icmp eq i32 %5, -998
  br label %._crit_edge27.us.us

._crit_edge27.us34.preheader62:                   ; preds = %._crit_edge.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %._crit_edge27.us34.preheader62
  %index = phi i64 [ 0, %._crit_edge27.us34.preheader62 ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %10 = shl i64 %index, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv55, i64 %10
  %12 = bitcast double* %11 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %12, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %13 = fmul <2 x double> %strided.vec, %broadcast.splat70
  %14 = fmul <2 x double> %strided.vec66, %broadcast.splat70
  %15 = fmul <2 x double> %strided.vec67, %broadcast.splat70
  %16 = or i64 %10, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv55, i64 %16
  %18 = fmul <2 x double> %strided.vec68, %broadcast.splat70
  %19 = getelementptr double, double* %17, i64 -3
  %20 = bitcast double* %19 to <8 x double>*
  %21 = shufflevector <2 x double> %13, <2 x double> %14, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %22 = shufflevector <2 x double> %15, <2 x double> %18, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %21, <4 x double> %22, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %20, align 8
  %23 = or i64 %index, 1
  %24 = icmp eq i64 %23, 299
  br i1 %24, label %.._crit_edge28_crit_edge.us.loopexit1, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %index.next = add i64 %index, 2
  br label %vector.body

.._crit_edge28_crit_edge.us.loopexit:             ; preds = %._crit_edge30.us.us
  br label %.._crit_edge28_crit_edge.us

.._crit_edge28_crit_edge.us.loopexit1:            ; preds = %vector.body
  br label %.._crit_edge28_crit_edge.us

.._crit_edge28_crit_edge.us:                      ; preds = %.._crit_edge28_crit_edge.us.loopexit1, %.._crit_edge28_crit_edge.us.loopexit
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %._crit_edge33, label %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge

.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge: ; preds = %.._crit_edge28_crit_edge.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %._crit_edge.us

._crit_edge27.us.us:                              ; preds = %._crit_edge30.us.us, %._crit_edge27.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %._crit_edge27.us.us.preheader ], [ %indvars.iv.next53, %._crit_edge30.us.us ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv55, i64 %indvars.iv52
  br i1 %8, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %._crit_edge27.us.us
  %26 = load double, double* %7, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv52
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %25, align 8
  %31 = fadd double %30, %29
  store double %31, double* %25, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge27.us.us, %.prol.preheader
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader ], [ %indvars.iv44, %._crit_edge27.us.us ]
  %.pre64 = load double, double* %25, align 8
  br i1 %9, label %._crit_edge30.us.us, label %._crit_edge27.us.us.new.preheader

._crit_edge27.us.us.new.preheader:                ; preds = %.prol.loopexit
  br label %._crit_edge27.us.us.new

._crit_edge30.us.us.loopexit:                     ; preds = %._crit_edge27.us.us.new
  br label %._crit_edge30.us.us

._crit_edge30.us.us:                              ; preds = %._crit_edge30.us.us.loopexit, %.prol.loopexit
  %32 = phi double [ %.pre64, %.prol.loopexit ], [ %46, %._crit_edge30.us.us.loopexit ]
  %33 = fmul double %32, %0
  store double %33, double* %25, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond, label %.._crit_edge28_crit_edge.us.loopexit, label %._crit_edge27.us.us

._crit_edge27.us.us.new:                          ; preds = %._crit_edge27.us.us.new.preheader, %._crit_edge27.us.us.new
  %34 = phi double [ %46, %._crit_edge27.us.us.new ], [ %.pre64, %._crit_edge27.us.us.new.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %._crit_edge27.us.us.new ], [ %indvars.iv46.unr.ph, %._crit_edge27.us.us.new.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv55
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv52
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %25, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv55
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next47, i64 %indvars.iv52
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %25, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, 1000
  br i1 %exitcond.1, label %._crit_edge30.us.us.loopexit, label %._crit_edge27.us.us.new

._crit_edge33:                                    ; preds = %.._crit_edge28_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge14.us, %._crit_edge.us.preheader
  %indvars.iv18 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next19, %._crit_edge14.us ]
  %5 = mul nsw i64 %indvars.iv18, 1000
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge12.us

; <label>:10:                                     ; preds = %._crit_edge12.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge14.us, label %._crit_edge12.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond21, label %._crit_edge16, label %._crit_edge.us

._crit_edge16:                                    ; preds = %._crit_edge14.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
