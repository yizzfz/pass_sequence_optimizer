; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %4
  %indvars.iv3 = phi i64 [ 0, %4 ], [ %indvars.iv.next4, %.._crit_edge_crit_edge ]
  %5 = trunc i64 %indvars.iv3 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge5 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %._crit_edge5

._crit_edge5:                                     ; preds = %9
  br label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %23, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %22
  br label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %6, double** %11, align 8
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph57, label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %7
  br label %._crit_edge9

.lr.ph57:                                         ; preds = %7
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.lr.ph57.split.us.preheader, label %.lr.ph57.split.preheader

.lr.ph57.split.preheader:                         ; preds = %.lr.ph57
  %14 = add i32 %0, -1
  %xtraiter134 = and i32 %0, 3
  %lcmp.mod135 = icmp eq i32 %xtraiter134, 0
  br i1 %lcmp.mod135, label %.lr.ph57.split.preheader..lr.ph57.split.prol.loopexit_crit_edge, label %.lr.ph57.split.prol.preheader

.lr.ph57.split.preheader..lr.ph57.split.prol.loopexit_crit_edge: ; preds = %.lr.ph57.split.preheader
  br label %.lr.ph57.split.prol.loopexit

.lr.ph57.split.prol.preheader:                    ; preds = %.lr.ph57.split.preheader
  %15 = fdiv double 0.000000e+00, %2
  br label %.lr.ph57.split.prol

.lr.ph57.split.prol:                              ; preds = %.lr.ph57.split.prol..lr.ph57.split.prol_crit_edge, %.lr.ph57.split.prol.preheader
  %indvars.iv130.prol = phi i64 [ %indvars.iv.next131.prol, %.lr.ph57.split.prol..lr.ph57.split.prol_crit_edge ], [ 0, %.lr.ph57.split.prol.preheader ]
  %prol.iter136 = phi i32 [ %prol.iter136.sub, %.lr.ph57.split.prol..lr.ph57.split.prol_crit_edge ], [ %xtraiter134, %.lr.ph57.split.prol.preheader ]
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv130.prol
  store double %15, double* %16, align 8
  %indvars.iv.next131.prol = add nuw nsw i64 %indvars.iv130.prol, 1
  %prol.iter136.sub = add i32 %prol.iter136, -1
  %prol.iter136.cmp = icmp eq i32 %prol.iter136.sub, 0
  br i1 %prol.iter136.cmp, label %.lr.ph57.split.prol.loopexit.loopexit, label %.lr.ph57.split.prol..lr.ph57.split.prol_crit_edge, !llvm.loop !1

.lr.ph57.split.prol..lr.ph57.split.prol_crit_edge: ; preds = %.lr.ph57.split.prol
  br label %.lr.ph57.split.prol

.lr.ph57.split.prol.loopexit.loopexit:            ; preds = %.lr.ph57.split.prol
  br label %.lr.ph57.split.prol.loopexit

.lr.ph57.split.prol.loopexit:                     ; preds = %.lr.ph57.split.preheader..lr.ph57.split.prol.loopexit_crit_edge, %.lr.ph57.split.prol.loopexit.loopexit
  %indvars.iv130.unr = phi i64 [ 0, %.lr.ph57.split.preheader..lr.ph57.split.prol.loopexit_crit_edge ], [ %indvars.iv.next131.prol, %.lr.ph57.split.prol.loopexit.loopexit ]
  %17 = icmp ult i32 %14, 3
  br i1 %17, label %.lr.ph57.split.prol.loopexit..lr.ph50_crit_edge, label %.lr.ph57.split.preheader142

.lr.ph57.split.prol.loopexit..lr.ph50_crit_edge:  ; preds = %.lr.ph57.split.prol.loopexit
  br label %.lr.ph50

.lr.ph57.split.preheader142:                      ; preds = %.lr.ph57.split.prol.loopexit
  %18 = fdiv double 0.000000e+00, %2
  %wide.trip.count132.3 = zext i32 %0 to i64
  %19 = add nsw i64 %wide.trip.count132.3, -4
  %20 = sub i64 %19, %indvars.iv130.unr
  %21 = lshr i64 %20, 2
  %22 = add nuw nsw i64 %21, 1
  %min.iters.check = icmp ult i64 %22, 4
  br i1 %min.iters.check, label %.lr.ph57.split.preheader142..lr.ph57.split.preheader175_crit_edge, label %min.iters.checked

.lr.ph57.split.preheader142..lr.ph57.split.preheader175_crit_edge: ; preds = %.lr.ph57.split.preheader142
  br label %.lr.ph57.split.preheader175

.lr.ph57.split.preheader175:                      ; preds = %middle.block..lr.ph57.split.preheader175_crit_edge, %min.iters.checked..lr.ph57.split.preheader175_crit_edge, %.lr.ph57.split.preheader142..lr.ph57.split.preheader175_crit_edge
  %indvars.iv130.ph = phi i64 [ %indvars.iv130.unr, %min.iters.checked..lr.ph57.split.preheader175_crit_edge ], [ %indvars.iv130.unr, %.lr.ph57.split.preheader142..lr.ph57.split.preheader175_crit_edge ], [ %ind.end, %middle.block..lr.ph57.split.preheader175_crit_edge ]
  br label %.lr.ph57.split

min.iters.checked:                                ; preds = %.lr.ph57.split.preheader142
  %n.mod.vf = and i64 %22, 3
  %n.vec = sub nsw i64 %22, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = shl nuw i64 %21, 2
  %24 = add i64 %indvars.iv130.unr, %23
  %25 = add i64 %24, 4
  %26 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %25, %26
  br i1 %cmp.zero, label %min.iters.checked..lr.ph57.split.preheader175_crit_edge, label %vector.ph

min.iters.checked..lr.ph57.split.preheader175_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph57.split.preheader175

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert161 = insertelement <2 x double> undef, double %18, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert161, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %27 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv130.unr, %27
  %28 = add nsw i64 %offset.idx, 3
  %29 = add i64 %offset.idx, 11
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = getelementptr double, double* %31, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge_crit_edge, label %middle.block..lr.ph57.split.preheader175_crit_edge

middle.block..lr.ph57.split.preheader175_crit_edge: ; preds = %middle.block
  br label %.lr.ph57.split.preheader175

middle.block.._crit_edge_crit_edge:               ; preds = %middle.block
  br label %._crit_edge

.lr.ph57.split.us.preheader:                      ; preds = %.lr.ph57
  %37 = add i32 %1, -1
  %xtraiter123 = and i32 %1, 3
  %lcmp.mod124 = icmp eq i32 %xtraiter123, 0
  %38 = icmp ult i32 %37, 3
  %wide.trip.count128 = zext i32 %0 to i64
  %wide.trip.count119.3 = zext i32 %1 to i64
  br label %.lr.ph57.split.us

.lr.ph57.split.us:                                ; preds = %._crit_edge53.us..lr.ph57.split.us_crit_edge, %.lr.ph57.split.us.preheader
  %indvars.iv126 = phi i64 [ 0, %.lr.ph57.split.us.preheader ], [ %indvars.iv.next127, %._crit_edge53.us..lr.ph57.split.us_crit_edge ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv126
  store double 0.000000e+00, double* %39, align 8
  br i1 %lcmp.mod124, label %.lr.ph57.split.us..prol.loopexit122_crit_edge, label %.prol.preheader121.preheader

.lr.ph57.split.us..prol.loopexit122_crit_edge:    ; preds = %.lr.ph57.split.us
  br label %.prol.loopexit122

.prol.preheader121.preheader:                     ; preds = %.lr.ph57.split.us
  br label %.prol.preheader121

.prol.preheader121:                               ; preds = %.prol.preheader121..prol.preheader121_crit_edge, %.prol.preheader121.preheader
  %indvars.iv117.prol = phi i64 [ %indvars.iv.next118.prol, %.prol.preheader121..prol.preheader121_crit_edge ], [ 0, %.prol.preheader121.preheader ]
  %40 = phi double [ %43, %.prol.preheader121..prol.preheader121_crit_edge ], [ 0.000000e+00, %.prol.preheader121.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader121..prol.preheader121_crit_edge ], [ %xtraiter123, %.prol.preheader121.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117.prol, i64 %indvars.iv126
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  store double %43, double* %39, align 8
  %indvars.iv.next118.prol = add nuw nsw i64 %indvars.iv117.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit122.loopexit, label %.prol.preheader121..prol.preheader121_crit_edge, !llvm.loop !6

.prol.preheader121..prol.preheader121_crit_edge:  ; preds = %.prol.preheader121
  br label %.prol.preheader121

.prol.loopexit122.loopexit:                       ; preds = %.prol.preheader121
  br label %.prol.loopexit122

.prol.loopexit122:                                ; preds = %.lr.ph57.split.us..prol.loopexit122_crit_edge, %.prol.loopexit122.loopexit
  %indvars.iv117.unr = phi i64 [ 0, %.lr.ph57.split.us..prol.loopexit122_crit_edge ], [ %indvars.iv.next118.prol, %.prol.loopexit122.loopexit ]
  %.unr125 = phi double [ 0.000000e+00, %.lr.ph57.split.us..prol.loopexit122_crit_edge ], [ %43, %.prol.loopexit122.loopexit ]
  %.lcssa66.unr = phi double [ undef, %.lr.ph57.split.us..prol.loopexit122_crit_edge ], [ %43, %.prol.loopexit122.loopexit ]
  br i1 %38, label %.prol.loopexit122.._crit_edge53.us_crit_edge, label %.lr.ph57.split.us.new.preheader

.prol.loopexit122.._crit_edge53.us_crit_edge:     ; preds = %.prol.loopexit122
  br label %._crit_edge53.us

.lr.ph57.split.us.new.preheader:                  ; preds = %.prol.loopexit122
  br label %.lr.ph57.split.us.new

.lr.ph57.split.us.new:                            ; preds = %.lr.ph57.split.us.new..lr.ph57.split.us.new_crit_edge, %.lr.ph57.split.us.new.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.3, %.lr.ph57.split.us.new..lr.ph57.split.us.new_crit_edge ], [ %indvars.iv117.unr, %.lr.ph57.split.us.new.preheader ]
  %44 = phi double [ %56, %.lr.ph57.split.us.new..lr.ph57.split.us.new_crit_edge ], [ %.unr125, %.lr.ph57.split.us.new.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv126
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  store double %47, double* %39, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118, i64 %indvars.iv126
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  store double %50, double* %39, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118.1, i64 %indvars.iv126
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  store double %53, double* %39, align 8
  %indvars.iv.next118.2 = add nsw i64 %indvars.iv117, 3
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118.2, i64 %indvars.iv126
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  store double %56, double* %39, align 8
  %indvars.iv.next118.3 = add nsw i64 %indvars.iv117, 4
  %exitcond120.3 = icmp eq i64 %indvars.iv.next118.3, %wide.trip.count119.3
  br i1 %exitcond120.3, label %._crit_edge53.us.loopexit, label %.lr.ph57.split.us.new..lr.ph57.split.us.new_crit_edge

.lr.ph57.split.us.new..lr.ph57.split.us.new_crit_edge: ; preds = %.lr.ph57.split.us.new
  br label %.lr.ph57.split.us.new

._crit_edge53.us.loopexit:                        ; preds = %.lr.ph57.split.us.new
  br label %._crit_edge53.us

._crit_edge53.us:                                 ; preds = %.prol.loopexit122.._crit_edge53.us_crit_edge, %._crit_edge53.us.loopexit
  %.lcssa66 = phi double [ %.lcssa66.unr, %.prol.loopexit122.._crit_edge53.us_crit_edge ], [ %56, %._crit_edge53.us.loopexit ]
  %57 = fdiv double %.lcssa66, %2
  store double %57, double* %39, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next127, %wide.trip.count128
  br i1 %exitcond129, label %._crit_edge.loopexit, label %._crit_edge53.us..lr.ph57.split.us_crit_edge

._crit_edge53.us..lr.ph57.split.us_crit_edge:     ; preds = %._crit_edge53.us
  br label %.lr.ph57.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge53.us
  br label %._crit_edge

._crit_edge.loopexit176:                          ; preds = %.lr.ph57.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %middle.block.._crit_edge_crit_edge, %._crit_edge.loopexit176, %._crit_edge.loopexit
  br i1 true, label %._crit_edge..lr.ph50_crit_edge, label %._crit_edge.._crit_edge9_crit_edge

._crit_edge..lr.ph50_crit_edge:                   ; preds = %._crit_edge
  br label %.lr.ph50

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge9

.lr.ph50:                                         ; preds = %._crit_edge..lr.ph50_crit_edge, %.lr.ph57.split.prol.loopexit..lr.ph50_crit_edge
  br i1 %13, label %.lr.ph50.split.us.preheader, label %.lr.ph50.split.preheader

.lr.ph50.split.us.preheader:                      ; preds = %.lr.ph50
  %xtraiter103 = and i32 %1, 1
  %lcmp.mod104 = icmp eq i32 %xtraiter103, 0
  %58 = icmp eq i32 %1, 1
  %wide.trip.count108 = zext i32 %0 to i64
  %wide.trip.count99.1 = zext i32 %1 to i64
  br label %.lr.ph50.split.us

.lr.ph50.split.preheader:                         ; preds = %.lr.ph50
  %xtraiter114 = and i32 %0, 1
  %lcmp.mod115 = icmp eq i32 %xtraiter114, 0
  br i1 %lcmp.mod115, label %.lr.ph50.split.preheader..lr.ph50.split.prol.loopexit_crit_edge, label %.lr.ph50.split.prol

.lr.ph50.split.preheader..lr.ph50.split.prol.loopexit_crit_edge: ; preds = %.lr.ph50.split.preheader
  br label %.lr.ph50.split.prol.loopexit

.lr.ph50.split.prol:                              ; preds = %.lr.ph50.split.preheader
  %59 = fdiv double 0.000000e+00, %2
  store double %59, double* %6, align 8
  %60 = tail call double @sqrt(double %59) #4
  %61 = fcmp ugt double %60, 1.000000e-01
  %62 = select i1 %61, double %60, double 1.000000e+00
  store double %62, double* %6, align 8
  br label %.lr.ph50.split.prol.loopexit

.lr.ph50.split.prol.loopexit:                     ; preds = %.lr.ph50.split.preheader..lr.ph50.split.prol.loopexit_crit_edge, %.lr.ph50.split.prol
  %indvars.iv110.unr = phi i64 [ 0, %.lr.ph50.split.preheader..lr.ph50.split.prol.loopexit_crit_edge ], [ 1, %.lr.ph50.split.prol ]
  %63 = icmp eq i32 %0, 1
  br i1 %63, label %.lr.ph50.split.prol.loopexit.._crit_edge9_crit_edge, label %.lr.ph50.split.preheader140

.lr.ph50.split.prol.loopexit.._crit_edge9_crit_edge: ; preds = %.lr.ph50.split.prol.loopexit
  br label %._crit_edge9

.lr.ph50.split.preheader140:                      ; preds = %.lr.ph50.split.prol.loopexit
  %64 = fdiv double 0.000000e+00, %2
  %wide.trip.count112.1 = zext i32 %0 to i64
  br label %.lr.ph50.split

.lr.ph50.split.us:                                ; preds = %._crit_edge47.us..lr.ph50.split.us_crit_edge, %.lr.ph50.split.us.preheader
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge47.us..lr.ph50.split.us_crit_edge ], [ 0, %.lr.ph50.split.us.preheader ]
  %65 = getelementptr inbounds double, double* %6, i64 %indvars.iv106
  store double 0.000000e+00, double* %65, align 8
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv106
  br i1 %lcmp.mod104, label %.lr.ph50.split.us..prol.loopexit102_crit_edge, label %.prol.preheader101

.lr.ph50.split.us..prol.loopexit102_crit_edge:    ; preds = %.lr.ph50.split.us
  br label %.prol.loopexit102

.prol.preheader101:                               ; preds = %.lr.ph50.split.us
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv106
  %68 = load double, double* %67, align 8
  %69 = load double, double* %66, align 8
  %70 = fsub double %68, %69
  %71 = fmul double %70, %70
  %72 = fadd double %71, 0.000000e+00
  store double %72, double* %65, align 8
  br label %.prol.loopexit102

.prol.loopexit102:                                ; preds = %.lr.ph50.split.us..prol.loopexit102_crit_edge, %.prol.preheader101
  %indvars.iv97.unr.ph = phi i64 [ 1, %.prol.preheader101 ], [ 0, %.lr.ph50.split.us..prol.loopexit102_crit_edge ]
  %.unr105.ph = phi double [ %72, %.prol.preheader101 ], [ 0.000000e+00, %.lr.ph50.split.us..prol.loopexit102_crit_edge ]
  %.lcssa65.unr.ph = phi double [ %72, %.prol.preheader101 ], [ undef, %.lr.ph50.split.us..prol.loopexit102_crit_edge ]
  br i1 %58, label %.prol.loopexit102.._crit_edge47.us_crit_edge, label %.lr.ph50.split.us.new.preheader

.prol.loopexit102.._crit_edge47.us_crit_edge:     ; preds = %.prol.loopexit102
  br label %._crit_edge47.us

.lr.ph50.split.us.new.preheader:                  ; preds = %.prol.loopexit102
  br label %.lr.ph50.split.us.new

.lr.ph50.split.us.new:                            ; preds = %.lr.ph50.split.us.new..lr.ph50.split.us.new_crit_edge, %.lr.ph50.split.us.new.preheader
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %.lr.ph50.split.us.new..lr.ph50.split.us.new_crit_edge ], [ %indvars.iv97.unr.ph, %.lr.ph50.split.us.new.preheader ]
  %73 = phi double [ %85, %.lr.ph50.split.us.new..lr.ph50.split.us.new_crit_edge ], [ %.unr105.ph, %.lr.ph50.split.us.new.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv97, i64 %indvars.iv106
  %75 = load double, double* %74, align 8
  %76 = load double, double* %66, align 8
  %77 = fsub double %75, %76
  %78 = fmul double %77, %77
  %79 = fadd double %73, %78
  store double %79, double* %65, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next98, i64 %indvars.iv106
  %81 = load double, double* %80, align 8
  %82 = load double, double* %66, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %79, %84
  store double %85, double* %65, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98.1, %wide.trip.count99.1
  br i1 %exitcond100.1, label %._crit_edge47.us.loopexit, label %.lr.ph50.split.us.new..lr.ph50.split.us.new_crit_edge

.lr.ph50.split.us.new..lr.ph50.split.us.new_crit_edge: ; preds = %.lr.ph50.split.us.new
  br label %.lr.ph50.split.us.new

._crit_edge47.us.loopexit:                        ; preds = %.lr.ph50.split.us.new
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %.prol.loopexit102.._crit_edge47.us_crit_edge, %._crit_edge47.us.loopexit
  %.lcssa65 = phi double [ %.lcssa65.unr.ph, %.prol.loopexit102.._crit_edge47.us_crit_edge ], [ %85, %._crit_edge47.us.loopexit ]
  %86 = fdiv double %.lcssa65, %2
  store double %86, double* %65, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ugt double %87, 1.000000e-01
  %89 = select i1 %88, double %87, double 1.000000e+00
  store double %89, double* %65, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, %wide.trip.count108
  br i1 %exitcond109, label %._crit_edge9.loopexit, label %._crit_edge47.us..lr.ph50.split.us_crit_edge

._crit_edge47.us..lr.ph50.split.us_crit_edge:     ; preds = %._crit_edge47.us
  br label %.lr.ph50.split.us

.lr.ph57.split:                                   ; preds = %.lr.ph57.split..lr.ph57.split_crit_edge, %.lr.ph57.split.preheader175
  %indvars.iv130 = phi i64 [ %indvars.iv.next131.3, %.lr.ph57.split..lr.ph57.split_crit_edge ], [ %indvars.iv130.ph, %.lr.ph57.split.preheader175 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  store double %18, double* %90, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next131
  store double %18, double* %91, align 8
  %indvars.iv.next131.1 = add nsw i64 %indvars.iv130, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next131.1
  store double %18, double* %92, align 8
  %indvars.iv.next131.2 = add nsw i64 %indvars.iv130, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next131.2
  store double %18, double* %93, align 8
  %indvars.iv.next131.3 = add nsw i64 %indvars.iv130, 4
  %exitcond133.3 = icmp eq i64 %indvars.iv.next131.3, %wide.trip.count132.3
  br i1 %exitcond133.3, label %._crit_edge.loopexit176, label %.lr.ph57.split..lr.ph57.split_crit_edge, !llvm.loop !7

.lr.ph57.split..lr.ph57.split_crit_edge:          ; preds = %.lr.ph57.split
  br label %.lr.ph57.split

._crit_edge9.loopexit:                            ; preds = %._crit_edge47.us
  br label %._crit_edge9

._crit_edge9.loopexit174:                         ; preds = %.lr.ph50.split
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.lr.ph50.split.prol.loopexit.._crit_edge9_crit_edge, %.._crit_edge9_crit_edge, %._crit_edge9.loopexit174, %._crit_edge9.loopexit, %._crit_edge.._crit_edge9_crit_edge
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge10.lr.ph, label %._crit_edge9.._crit_edge11_crit_edge

._crit_edge9.._crit_edge11_crit_edge:             ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  br i1 %12, label %._crit_edge10.us.preheader, label %._crit_edge11.thread

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %wide.trip.count90 = zext i32 %0 to i64
  %wide.trip.count94 = zext i32 %1 to i64
  br label %._crit_edge10.us

._crit_edge11.thread:                             ; preds = %._crit_edge10.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge31

._crit_edge10.us:                                 ; preds = %._crit_edge42.us.._crit_edge10.us_crit_edge, %._crit_edge10.us.preheader
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge42.us.._crit_edge10.us_crit_edge ], [ 0, %._crit_edge10.us.preheader ]
  %96 = phi [1200 x double]* [ %110, %._crit_edge42.us.._crit_edge10.us_crit_edge ], [ %3, %._crit_edge10.us.preheader ]
  br label %97

; <label>:97:                                     ; preds = %._crit_edge199, %._crit_edge10.us
  %indvars.iv88 = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next89, %._crit_edge199 ]
  %98 = phi [1200 x double]* [ %96, %._crit_edge10.us ], [ %110, %._crit_edge199 ]
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv88
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %98, i64 %indvars.iv92, i64 %indvars.iv88
  %102 = load double, double* %101, align 8
  %103 = fsub double %102, %100
  store double %103, double* %101, align 8
  %104 = load double, double* %8, align 8
  %105 = tail call double @sqrt(double %104) #4
  %106 = load double*, double** %11, align 8
  %107 = getelementptr inbounds double, double* %106, i64 %indvars.iv88
  %108 = load double, double* %107, align 8
  %109 = fmul double %105, %108
  %110 = load [1200 x double]*, [1200 x double]** %9, align 8
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %110, i64 %indvars.iv92, i64 %indvars.iv88
  %112 = load double, double* %111, align 8
  %113 = fdiv double %112, %109
  store double %113, double* %111, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %._crit_edge42.us, label %._crit_edge199

._crit_edge199:                                   ; preds = %97
  br label %97

._crit_edge42.us:                                 ; preds = %97
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, %wide.trip.count94
  br i1 %exitcond95, label %._crit_edge11.loopexit, label %._crit_edge42.us.._crit_edge10.us_crit_edge

._crit_edge42.us.._crit_edge10.us_crit_edge:      ; preds = %._crit_edge42.us
  br label %._crit_edge10.us

.lr.ph50.split:                                   ; preds = %.lr.ph50.split..lr.ph50.split_crit_edge, %.lr.ph50.split.preheader140
  %indvars.iv110 = phi i64 [ %indvars.iv.next111.1, %.lr.ph50.split..lr.ph50.split_crit_edge ], [ %indvars.iv110.unr, %.lr.ph50.split.preheader140 ]
  %114 = getelementptr inbounds double, double* %6, i64 %indvars.iv110
  store double %64, double* %114, align 8
  %115 = tail call double @sqrt(double %64) #4
  %116 = fcmp ugt double %115, 1.000000e-01
  %117 = select i1 %116, double %115, double 1.000000e+00
  store double %117, double* %114, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next111
  store double %64, double* %118, align 8
  %119 = tail call double @sqrt(double %64) #4
  %120 = fcmp ugt double %119, 1.000000e-01
  %121 = select i1 %120, double %119, double 1.000000e+00
  store double %121, double* %118, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %exitcond113.1 = icmp eq i64 %indvars.iv.next111.1, %wide.trip.count112.1
  br i1 %exitcond113.1, label %._crit_edge9.loopexit174, label %.lr.ph50.split..lr.ph50.split_crit_edge

.lr.ph50.split..lr.ph50.split_crit_edge:          ; preds = %.lr.ph50.split
  br label %.lr.ph50.split

._crit_edge11.loopexit:                           ; preds = %._crit_edge42.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge9.._crit_edge11_crit_edge, %._crit_edge11.loopexit
  %122 = add nsw i32 %0, -1
  %123 = icmp sgt i32 %0, 1
  br i1 %123, label %.lr.ph30, label %._crit_edge11.._crit_edge31_crit_edge

._crit_edge11.._crit_edge31_crit_edge:            ; preds = %._crit_edge11
  br label %._crit_edge31

.lr.ph30:                                         ; preds = %._crit_edge11
  br i1 %94, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %124 = add i32 %0, -2
  %125 = sext i32 %0 to i64
  %wide.trip.count80.1 = zext i32 %0 to i64
  %wide.trip.count86 = zext i32 %122 to i64
  %126 = add nsw i64 %wide.trip.count80.1, -2
  br label %.lr.ph30.split

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %127 = sext i32 %0 to i64
  %wide.trip.count74 = zext i32 %122 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %128 = icmp eq i32 %1, 1
  %wide.trip.count71 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge, %.lr.ph30.split.us.preheader
  %indvars.iv72 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next73, %._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge ]
  %indvars.iv67 = phi i64 [ 1, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next68, %._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge ]
  %129 = phi [1200 x double]* [ %4, %.lr.ph30.split.us.preheader ], [ %.lcssa.us, %._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge ]
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %129, i64 %indvars.iv72, i64 %indvars.iv72
  store double 1.000000e+00, double* %130, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %131 = icmp slt i64 %indvars.iv.next73, %127
  br i1 %131, label %.lr.ph.us.us.preheader, label %.lr.ph30.split.us.._crit_edge28.us-lcssa.us.us_crit_edge

.lr.ph30.split.us.._crit_edge28.us-lcssa.us.us_crit_edge: ; preds = %.lr.ph30.split.us
  br label %._crit_edge28.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph30.split.us
  br label %.lr.ph.us.us

._crit_edge28.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge23.us.us
  br label %._crit_edge28.us-lcssa.us.us

._crit_edge28.us-lcssa.us.us:                     ; preds = %.lr.ph30.split.us.._crit_edge28.us-lcssa.us.us_crit_edge, %._crit_edge28.us-lcssa.us.us.loopexit
  %.lcssa.us = phi [1200 x double]* [ %129, %.lr.ph30.split.us.._crit_edge28.us-lcssa.us.us_crit_edge ], [ %135, %._crit_edge28.us-lcssa.us.us.loopexit ]
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge31.loopexit, label %._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge

._crit_edge28.us-lcssa.us.us..lr.ph30.split.us_crit_edge: ; preds = %._crit_edge28.us-lcssa.us.us
  br label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge23.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge23.us.us..lr.ph.us.us_crit_edge ], [ %indvars.iv67, %.lr.ph.us.us.preheader ]
  %132 = phi [1200 x double]* [ %135, %._crit_edge23.us.us..lr.ph.us.us_crit_edge ], [ %129, %.lr.ph.us.us.preheader ]
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %132, i64 %indvars.iv72, i64 %indvars.iv69
  store double 0.000000e+00, double* %133, align 8
  %134 = load [1200 x double]*, [1200 x double]** %9, align 8
  %135 = load [1200 x double]*, [1200 x double]** %10, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %135, i64 %indvars.iv72, i64 %indvars.iv69
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 0, i64 %indvars.iv72
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 0, i64 %indvars.iv69
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = load double, double* %136, align 8
  %143 = fadd double %141, %142
  store double %143, double* %136, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %128, label %.prol.loopexit.._crit_edge23.us.us_crit_edge, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit.._crit_edge23.us.us_crit_edge:     ; preds = %.prol.loopexit
  %.phi.trans.insert = bitcast double* %136 to i64*
  %.pre170 = load i64, i64* %.phi.trans.insert, align 8
  br label %._crit_edge23.us.us

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %.pre = load double, double* %136, align 8
  br label %.lr.ph.us.us.new

._crit_edge23.us.us:                              ; preds = %.lr.ph.us.us.new.._crit_edge23.us.us_crit_edge, %.prol.loopexit.._crit_edge23.us.us_crit_edge
  %144 = phi i64 [ %.pre170, %.prol.loopexit.._crit_edge23.us.us_crit_edge ], [ %160, %.lr.ph.us.us.new.._crit_edge23.us.us_crit_edge ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %135, i64 %indvars.iv69, i64 %indvars.iv72
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond, label %._crit_edge28.us-lcssa.us.us.loopexit, label %._crit_edge23.us.us..lr.ph.us.us_crit_edge

._crit_edge23.us.us..lr.ph.us.us_crit_edge:       ; preds = %._crit_edge23.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %147 = phi double [ %159, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.pre, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %indvars.iv, i64 %indvars.iv72
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %indvars.iv, i64 %indvars.iv69
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = fadd double %152, %147
  store double %153, double* %136, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %indvars.iv.next, i64 %indvars.iv72
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %indvars.iv.next, i64 %indvars.iv69
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %158, %153
  store double %159, double* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge23.us.us_crit_edge, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge23.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %160 = bitcast double %159 to i64
  br label %._crit_edge23.us.us

.lr.ph30.split:                                   ; preds = %._crit_edge28..lr.ph30.split_crit_edge, %.lr.ph30.split.preheader
  %indvars.iv84 = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %indvars.iv.next85, %._crit_edge28..lr.ph30.split_crit_edge ]
  %indvars.iv76 = phi i64 [ 1, %.lr.ph30.split.preheader ], [ %indvars.iv.next77, %._crit_edge28..lr.ph30.split_crit_edge ]
  %161 = phi [1200 x double]* [ %4, %.lr.ph30.split.preheader ], [ %.lcssa, %._crit_edge28..lr.ph30.split_crit_edge ]
  %162 = sub nsw i64 0, %indvars.iv84
  %163 = trunc i64 %162 to i32
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %161, i64 %indvars.iv84, i64 %indvars.iv84
  store double 1.000000e+00, double* %164, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %165 = icmp slt i64 %indvars.iv.next85, %125
  br i1 %165, label %.lr.ph27.split.preheader, label %.lr.ph30.split.._crit_edge28_crit_edge

.lr.ph30.split.._crit_edge28_crit_edge:           ; preds = %.lr.ph30.split
  br label %._crit_edge28

.lr.ph27.split.preheader:                         ; preds = %.lr.ph30.split
  %166 = add i32 %122, %163
  %xtraiter82 = and i32 %166, 1
  %lcmp.mod83 = icmp eq i32 %xtraiter82, 0
  br i1 %lcmp.mod83, label %.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge, label %.lr.ph27.split.prol

.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge: ; preds = %.lr.ph27.split.preheader
  br label %.lr.ph27.split.prol.loopexit

.lr.ph27.split.prol:                              ; preds = %.lr.ph27.split.preheader
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %161, i64 %indvars.iv84, i64 %indvars.iv76
  store double 0.000000e+00, double* %167, align 8
  %168 = load [1200 x double]*, [1200 x double]** %10, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %168, i64 %indvars.iv84, i64 %indvars.iv76
  %170 = bitcast double* %169 to i64*
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %168, i64 %indvars.iv76, i64 %indvars.iv84
  %173 = bitcast double* %172 to i64*
  store i64 %171, i64* %173, align 8
  %indvars.iv.next79.prol = add nuw nsw i64 %indvars.iv76, 1
  br label %.lr.ph27.split.prol.loopexit

.lr.ph27.split.prol.loopexit:                     ; preds = %.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge, %.lr.ph27.split.prol
  %indvars.iv78.unr.ph = phi i64 [ %indvars.iv.next79.prol, %.lr.ph27.split.prol ], [ %indvars.iv76, %.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge ]
  %.unr.ph = phi [1200 x double]* [ %168, %.lr.ph27.split.prol ], [ %161, %.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge ]
  %.lcssa63.unr.ph = phi [1200 x double]* [ %168, %.lr.ph27.split.prol ], [ undef, %.lr.ph27.split.preheader..lr.ph27.split.prol.loopexit_crit_edge ]
  %174 = sub i32 0, %163
  %175 = icmp eq i32 %124, %174
  br i1 %175, label %.lr.ph27.split.prol.loopexit.._crit_edge28_crit_edge, label %.lr.ph27.split.preheader172

.lr.ph27.split.prol.loopexit.._crit_edge28_crit_edge: ; preds = %.lr.ph27.split.prol.loopexit
  br label %._crit_edge28

.lr.ph27.split.preheader172:                      ; preds = %.lr.ph27.split.prol.loopexit
  %176 = sub i64 %126, %indvars.iv78.unr.ph
  %177 = lshr i64 %176, 1
  %178 = and i64 %177, 1
  %lcmp.mod186 = icmp eq i64 %178, 0
  br i1 %lcmp.mod186, label %.lr.ph27.split.prol.preheader, label %.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge

.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge: ; preds = %.lr.ph27.split.preheader172
  br label %.lr.ph27.split.prol.loopexit184.unr-lcssa

.lr.ph27.split.prol.preheader:                    ; preds = %.lr.ph27.split.preheader172
  br label %.lr.ph27.split.prol187

.lr.ph27.split.prol187:                           ; preds = %.lr.ph27.split.prol.preheader
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %.unr.ph, i64 %indvars.iv84, i64 %indvars.iv78.unr.ph
  store double 0.000000e+00, double* %179, align 8
  %180 = load [1200 x double]*, [1200 x double]** %10, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %180, i64 %indvars.iv84, i64 %indvars.iv78.unr.ph
  %182 = bitcast double* %181 to i64*
  %183 = load i64, i64* %182, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %180, i64 %indvars.iv78.unr.ph, i64 %indvars.iv84
  %185 = bitcast double* %184 to i64*
  store i64 %183, i64* %185, align 8
  %indvars.iv.next79.prol188 = add nuw nsw i64 %indvars.iv78.unr.ph, 1
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %180, i64 %indvars.iv84, i64 %indvars.iv.next79.prol188
  store double 0.000000e+00, double* %186, align 8
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %180, i64 %indvars.iv.next79.prol188, i64 %indvars.iv84
  %188 = bitcast double* %187 to i64*
  store i64 0, i64* %188, align 8
  %indvars.iv.next79.1.prol = add nsw i64 %indvars.iv78.unr.ph, 2
  br label %.lr.ph27.split.prol.loopexit184.unr-lcssa

.lr.ph27.split.prol.loopexit184.unr-lcssa:        ; preds = %.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge, %.lr.ph27.split.prol187
  %.lcssa179.unr.ph = phi [1200 x double]* [ %180, %.lr.ph27.split.prol187 ], [ undef, %.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge ]
  %indvars.iv78.unr.ph189 = phi i64 [ %indvars.iv.next79.1.prol, %.lr.ph27.split.prol187 ], [ %indvars.iv78.unr.ph, %.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge ]
  %.unr.ph190 = phi [1200 x double]* [ %180, %.lr.ph27.split.prol187 ], [ %.unr.ph, %.lr.ph27.split.preheader172..lr.ph27.split.prol.loopexit184.unr-lcssa_crit_edge ]
  br label %.lr.ph27.split.prol.loopexit184

.lr.ph27.split.prol.loopexit184:                  ; preds = %.lr.ph27.split.prol.loopexit184.unr-lcssa
  %189 = icmp eq i64 %177, 0
  br i1 %189, label %.lr.ph27.split.prol.loopexit184.._crit_edge28.loopexit_crit_edge, label %.lr.ph27.split.preheader172.new

.lr.ph27.split.prol.loopexit184.._crit_edge28.loopexit_crit_edge: ; preds = %.lr.ph27.split.prol.loopexit184
  br label %._crit_edge28.loopexit

.lr.ph27.split.preheader172.new:                  ; preds = %.lr.ph27.split.prol.loopexit184
  br label %.lr.ph27.split

.lr.ph27.split:                                   ; preds = %.lr.ph27.split..lr.ph27.split_crit_edge, %.lr.ph27.split.preheader172.new
  %indvars.iv78 = phi i64 [ %indvars.iv78.unr.ph189, %.lr.ph27.split.preheader172.new ], [ %indvars.iv.next79.1.1, %.lr.ph27.split..lr.ph27.split_crit_edge ]
  %190 = phi [1200 x double]* [ %.unr.ph190, %.lr.ph27.split.preheader172.new ], [ %202, %.lr.ph27.split..lr.ph27.split_crit_edge ]
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %190, i64 %indvars.iv84, i64 %indvars.iv78
  store double 0.000000e+00, double* %191, align 8
  %192 = load [1200 x double]*, [1200 x double]** %10, align 8
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %192, i64 %indvars.iv84, i64 %indvars.iv78
  %194 = bitcast double* %193 to i64*
  %195 = load i64, i64* %194, align 8
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %192, i64 %indvars.iv78, i64 %indvars.iv84
  %197 = bitcast double* %196 to i64*
  store i64 %195, i64* %197, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %192, i64 %indvars.iv84, i64 %indvars.iv.next79
  store double 0.000000e+00, double* %198, align 8
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %192, i64 %indvars.iv.next79, i64 %indvars.iv84
  %200 = bitcast double* %199 to i64*
  store i64 0, i64* %200, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %192, i64 %indvars.iv84, i64 %indvars.iv.next79.1
  store double 0.000000e+00, double* %201, align 8
  %202 = load [1200 x double]*, [1200 x double]** %10, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %202, i64 %indvars.iv84, i64 %indvars.iv.next79.1
  %204 = bitcast double* %203 to i64*
  %205 = load i64, i64* %204, align 8
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %202, i64 %indvars.iv.next79.1, i64 %indvars.iv84
  %207 = bitcast double* %206 to i64*
  store i64 %205, i64* %207, align 8
  %indvars.iv.next79.1191 = add nsw i64 %indvars.iv78, 3
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %202, i64 %indvars.iv84, i64 %indvars.iv.next79.1191
  store double 0.000000e+00, double* %208, align 8
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %202, i64 %indvars.iv.next79.1191, i64 %indvars.iv84
  %210 = bitcast double* %209 to i64*
  store i64 0, i64* %210, align 8
  %indvars.iv.next79.1.1 = add nsw i64 %indvars.iv78, 4
  %exitcond81.1.1 = icmp eq i64 %indvars.iv.next79.1.1, %wide.trip.count80.1
  br i1 %exitcond81.1.1, label %._crit_edge28.loopexit.unr-lcssa, label %.lr.ph27.split..lr.ph27.split_crit_edge

.lr.ph27.split..lr.ph27.split_crit_edge:          ; preds = %.lr.ph27.split
  br label %.lr.ph27.split

._crit_edge28.loopexit.unr-lcssa:                 ; preds = %.lr.ph27.split
  br label %._crit_edge28.loopexit

._crit_edge28.loopexit:                           ; preds = %.lr.ph27.split.prol.loopexit184.._crit_edge28.loopexit_crit_edge, %._crit_edge28.loopexit.unr-lcssa
  %.lcssa179 = phi [1200 x double]* [ %.lcssa179.unr.ph, %.lr.ph27.split.prol.loopexit184.._crit_edge28.loopexit_crit_edge ], [ %202, %._crit_edge28.loopexit.unr-lcssa ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %.lr.ph27.split.prol.loopexit.._crit_edge28_crit_edge, %.lr.ph30.split.._crit_edge28_crit_edge, %._crit_edge28.loopexit
  %.lcssa = phi [1200 x double]* [ %161, %.lr.ph30.split.._crit_edge28_crit_edge ], [ %.lcssa63.unr.ph, %.lr.ph27.split.prol.loopexit.._crit_edge28_crit_edge ], [ %.lcssa179, %._crit_edge28.loopexit ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %._crit_edge31.loopexit173, label %._crit_edge28..lr.ph30.split_crit_edge

._crit_edge28..lr.ph30.split_crit_edge:           ; preds = %._crit_edge28
  br label %.lr.ph30.split

._crit_edge31.loopexit:                           ; preds = %._crit_edge28.us-lcssa.us.us
  br label %._crit_edge31

._crit_edge31.loopexit173:                        ; preds = %._crit_edge28
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge11.._crit_edge31_crit_edge, %._crit_edge31.loopexit173, %._crit_edge31.loopexit, %._crit_edge11.thread
  %211 = phi i32 [ %122, %._crit_edge11.._crit_edge31_crit_edge ], [ %95, %._crit_edge11.thread ], [ %122, %._crit_edge31.loopexit ], [ %122, %._crit_edge31.loopexit173 ]
  %.lcssa18 = phi [1200 x double]* [ %4, %._crit_edge11.._crit_edge31_crit_edge ], [ %4, %._crit_edge11.thread ], [ %.lcssa.us, %._crit_edge31.loopexit ], [ %.lcssa, %._crit_edge31.loopexit173 ]
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa18, i64 %212, i64 %212
  store double 1.000000e+00, double* %213, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %2
  br label %._crit_edge5

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv6 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next7, %._crit_edge3.us.._crit_edge.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us._crit_edge ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge2.us_crit_edge

.._crit_edge2.us_crit_edge:                       ; preds = %10
  br label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %.._crit_edge2.us_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us
  br label %10

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %._crit_edge3.us.._crit_edge.us_crit_edge

._crit_edge3.us.._crit_edge.us_crit_edge:         ; preds = %._crit_edge3.us
  br label %._crit_edge.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %._crit_edge5.loopexit
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
