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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  store i8* %11, i8** %7, align 8
  %12 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %13 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %15 = bitcast [1200 x double]** %9 to i8**
  store i8* %14, i8** %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %17 = bitcast [1200 x double]** %10 to i8**
  store i8* %16, i8** %17, align 8
  %18 = bitcast i8* %11 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %6, [1200 x double]* %18)
  tail call void (...) @polybench_timer_start() #4
  %19 = load double, double* %6, align 8
  %20 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %8, align 8
  %21 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %20, i64 0, i64 0
  %22 = load [1200 x double]*, [1200 x double]** %9, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 0, i64 0
  %24 = load [1200 x double]*, [1200 x double]** %10, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 0, i64 0
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %19, [1200 x double]* %18, [1200 x double]* %21, double* %23, double* %25)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %26 = load i32, i32* %3, align 4
  %27 = icmp sgt i32 %26, 42
  %28 = bitcast [1200 x [1200 x double]]* %20 to i8*
  %29 = bitcast [1200 x double]* %22 to i8*
  %30 = bitcast [1200 x double]* %24 to i8*
  br i1 %27, label %31, label %._crit_edge

; <label>:31:                                     ; preds = %2
  %32 = load i8**, i8*** %4, align 8
  %33 = load i8*, i8** %32, align 8
  %strcmpload = load i8, i8* %33, align 1
  %34 = icmp eq i8 %strcmpload, 0
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %31
  %36 = load i32, i32* %5, align 4
  tail call fastcc void @print_array(i32 %36, [1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %31, %2, %35
  %37 = load i8*, i8** %7, align 8
  tail call void @free(i8* %37) #4
  tail call void @free(i8* %28) #4
  tail call void @free(i8* %29) #4
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %19, %4
  %indvars.iv5 = phi i64 [ 0, %4 ], [ %indvars.iv.next6, %19 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %..preheader_crit_edge
  %indvars.iv = phi i64 [ 0, %..preheader_crit_edge ], [ %indvars.iv.next.1, %.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = fadd double %6, %10
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.200000e+03
  %17 = fadd double %6, %16
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %.preheader

; <label>:19:                                     ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond7, label %20, label %..preheader_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph61, label %..preheader11_crit_edge.thread

..preheader11_crit_edge.thread:                   ; preds = %7
  br label %.preheader11..preheader10_crit_edge

.lr.ph61:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.lr.ph61.split.us.preheader, label %.lr.ph61.split.preheader

.lr.ph61.split.preheader:                         ; preds = %.lr.ph61
  %11 = fdiv double 0.000000e+00, %2
  %12 = icmp sgt i64 %10, 1
  %smax151 = select i1 %12, i64 %10, i64 1
  %min.iters.check = icmp ult i64 %smax151, 4
  br i1 %min.iters.check, label %.lr.ph61.split.preheader157, label %min.iters.checked

.lr.ph61.split.preheader157:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph61.split.preheader
  %indvars.iv134.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph61.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph61.split

min.iters.checked:                                ; preds = %.lr.ph61.split.preheader
  %n.vec = and i64 %smax151, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph61.split.preheader157, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert153 = insertelement <2 x double> undef, double %11, i32 0
  %broadcast.splat154 = shufflevector <2 x double> %broadcast.splatinsert153, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = add nsw i64 %n.vec, -4
  %14 = lshr exact i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %xtraiter171 = and i64 %15, 7
  %lcmp.mod172 = icmp eq i64 %xtraiter171, 0
  br i1 %lcmp.mod172, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter173 = phi i64 [ %xtraiter171, %vector.body.prol.preheader ], [ %prol.iter173.sub, %vector.body.prol ]
  %16 = getelementptr inbounds double, double* %5, i64 %index.prol
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %19, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter173.sub = add i64 %prol.iter173, -1
  %prol.iter173.cmp = icmp eq i64 %prol.iter173.sub, 0
  br i1 %prol.iter173.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %13, 28
  br i1 %20, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %21 = getelementptr inbounds double, double* %5, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = getelementptr inbounds double, double* %5, i64 %index.next
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %29 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %32, align 8
  %index.next.2 = add i64 %index, 12
  %33 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %36, align 8
  %index.next.3 = add i64 %index, 16
  %37 = getelementptr inbounds double, double* %5, i64 %index.next.3
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %38, align 8
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %40, align 8
  %index.next.4 = add i64 %index, 20
  %41 = getelementptr inbounds double, double* %5, i64 %index.next.4
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %42, align 8
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %44, align 8
  %index.next.5 = add i64 %index, 24
  %45 = getelementptr inbounds double, double* %5, i64 %index.next.5
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %46, align 8
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %48, align 8
  %index.next.6 = add i64 %index, 28
  %49 = getelementptr inbounds double, double* %5, i64 %index.next.6
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %50, align 8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %broadcast.splat154, <2 x double>* %52, align 8
  %index.next.7 = add i64 %index, 32
  %53 = icmp eq i64 %index.next.7, %n.vec
  br i1 %53, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax151, %n.vec
  br i1 %cmp.n, label %..preheader11_crit_edge, label %.lr.ph61.split.preheader157

.lr.ph61.split.us.preheader:                      ; preds = %.lr.ph61
  %wide.trip.count128 = zext i32 %1 to i64
  %54 = add nsw i64 %wide.trip.count128, -1
  %xtraiter167 = and i64 %wide.trip.count128, 3
  %lcmp.mod168 = icmp eq i64 %xtraiter167, 0
  %55 = icmp ult i64 %54, 3
  br label %.lr.ph61.split.us

.lr.ph61.split.us:                                ; preds = %._crit_edge57.us, %.lr.ph61.split.us.preheader
  %indvars.iv130 = phi i64 [ 0, %.lr.ph61.split.us.preheader ], [ %indvars.iv.next131, %._crit_edge57.us ]
  %56 = getelementptr inbounds double, double* %5, i64 %indvars.iv130
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod168, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph61.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %57 = phi double [ 0.000000e+00, %._crit_edge.prol.preheader ], [ %60, %._crit_edge.prol ]
  %indvars.iv126.prol = phi i64 [ 0, %._crit_edge.prol.preheader ], [ %indvars.iv.next127.prol, %._crit_edge.prol ]
  %prol.iter169 = phi i64 [ %xtraiter167, %._crit_edge.prol.preheader ], [ %prol.iter169.sub, %._crit_edge.prol ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv126.prol, i64 %indvars.iv130
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %56, align 8
  %indvars.iv.next127.prol = add nuw nsw i64 %indvars.iv126.prol, 1
  %prol.iter169.sub = add i64 %prol.iter169, -1
  %prol.iter169.cmp = icmp eq i64 %prol.iter169.sub, 0
  br i1 %prol.iter169.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !6

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph61.split.us, %._crit_edge.prol.loopexit.unr-lcssa
  %.lcssa161.unr = phi double [ undef, %.lr.ph61.split.us ], [ %60, %._crit_edge.prol.loopexit.unr-lcssa ]
  %.unr170 = phi double [ 0.000000e+00, %.lr.ph61.split.us ], [ %60, %._crit_edge.prol.loopexit.unr-lcssa ]
  %indvars.iv126.unr = phi i64 [ 0, %.lr.ph61.split.us ], [ %indvars.iv.next127.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  br i1 %55, label %._crit_edge57.us, label %.lr.ph61.split.us.new

.lr.ph61.split.us.new:                            ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph61.split.us.new
  %61 = phi double [ %.unr170, %.lr.ph61.split.us.new ], [ %73, %._crit_edge ]
  %indvars.iv126 = phi i64 [ %indvars.iv126.unr, %.lr.ph61.split.us.new ], [ %indvars.iv.next127.3, %._crit_edge ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv126, i64 %indvars.iv130
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %56, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127, i64 %indvars.iv130
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %56, align 8
  %indvars.iv.next127.1 = add nsw i64 %indvars.iv126, 2
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127.1, i64 %indvars.iv130
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %56, align 8
  %indvars.iv.next127.2 = add nsw i64 %indvars.iv126, 3
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next127.2, i64 %indvars.iv130
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %56, align 8
  %indvars.iv.next127.3 = add nsw i64 %indvars.iv126, 4
  %exitcond129.3 = icmp eq i64 %indvars.iv.next127.3, %wide.trip.count128
  br i1 %exitcond129.3, label %._crit_edge57.us.unr-lcssa, label %._crit_edge

._crit_edge57.us.unr-lcssa:                       ; preds = %._crit_edge
  br label %._crit_edge57.us

._crit_edge57.us:                                 ; preds = %._crit_edge.prol.loopexit, %._crit_edge57.us.unr-lcssa
  %.lcssa161 = phi double [ %.lcssa161.unr, %._crit_edge.prol.loopexit ], [ %73, %._crit_edge57.us.unr-lcssa ]
  %74 = fdiv double %.lcssa161, %2
  store double %74, double* %56, align 8
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, 1
  %75 = icmp slt i64 %indvars.iv.next131, %10
  br i1 %75, label %.lr.ph61.split.us, label %..preheader11_crit_edge.loopexit

..preheader11_crit_edge.loopexit:                 ; preds = %._crit_edge57.us
  br label %..preheader11_crit_edge

..preheader11_crit_edge.loopexit158:              ; preds = %.lr.ph61.split
  br label %..preheader11_crit_edge

..preheader11_crit_edge:                          ; preds = %..preheader11_crit_edge.loopexit158, %..preheader11_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph50, label %..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge

..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge: ; preds = %..preheader11_crit_edge
  br label %.preheader11..preheader10_crit_edge

.lr.ph50:                                         ; preds = %..preheader11_crit_edge
  br i1 %9, label %.lr.ph50.split.us.preheader, label %.lr.ph50.split.preheader

.lr.ph50.split.preheader:                         ; preds = %.lr.ph50
  %76 = fdiv double 0.000000e+00, %2
  br label %.lr.ph50.split

.lr.ph50.split.us.preheader:                      ; preds = %.lr.ph50
  %77 = sext i32 %1 to i64
  %xtraiter164 = and i64 %77, 1
  %lcmp.mod165 = icmp eq i64 %xtraiter164, 0
  %78 = icmp eq i32 %1, 1
  br label %.lr.ph50.split.us

.lr.ph50.split.us:                                ; preds = %.preheader11.us, %.lr.ph50.split.us.preheader
  %indvars.iv120 = phi i64 [ 0, %.lr.ph50.split.us.preheader ], [ %indvars.iv.next121, %.preheader11.us ]
  %79 = getelementptr inbounds double, double* %6, i64 %indvars.iv120
  store double 0.000000e+00, double* %79, align 8
  %80 = getelementptr inbounds double, double* %5, i64 %indvars.iv120
  br i1 %lcmp.mod165, label %._crit_edge139.prol.loopexit.unr-lcssa, label %._crit_edge139.prol.preheader

._crit_edge139.prol.preheader:                    ; preds = %.lr.ph50.split.us
  br label %._crit_edge139.prol

._crit_edge139.prol:                              ; preds = %._crit_edge139.prol.preheader
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv120
  %82 = load double, double* %81, align 8
  %83 = load double, double* %80, align 8
  %84 = fsub double %82, %83
  %85 = fmul double %84, %84
  %86 = fadd double %85, 0.000000e+00
  store double %86, double* %79, align 8
  br label %._crit_edge139.prol.loopexit.unr-lcssa

._crit_edge139.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph50.split.us, %._crit_edge139.prol
  %.unr166.ph = phi double [ %86, %._crit_edge139.prol ], [ 0.000000e+00, %.lr.ph50.split.us ]
  %indvars.iv117.unr.ph = phi i64 [ 1, %._crit_edge139.prol ], [ 0, %.lr.ph50.split.us ]
  %.lcssa160.unr.ph = phi double [ %86, %._crit_edge139.prol ], [ undef, %.lr.ph50.split.us ]
  br label %._crit_edge139.prol.loopexit

._crit_edge139.prol.loopexit:                     ; preds = %._crit_edge139.prol.loopexit.unr-lcssa
  br i1 %78, label %._crit_edge47.us, label %.lr.ph50.split.us.new

.lr.ph50.split.us.new:                            ; preds = %._crit_edge139.prol.loopexit
  br label %._crit_edge139

; <label>:87:                                     ; preds = %._crit_edge47.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge47.us, %87
  %88 = phi double [ %105, %87 ], [ 1.000000e+00, %._crit_edge47.us ]
  store double %88, double* %79, align 8
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %89 = icmp slt i64 %indvars.iv.next121, %10
  br i1 %89, label %.lr.ph50.split.us, label %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit

._crit_edge139:                                   ; preds = %._crit_edge139, %.lr.ph50.split.us.new
  %90 = phi double [ %.unr166.ph, %.lr.ph50.split.us.new ], [ %102, %._crit_edge139 ]
  %indvars.iv117 = phi i64 [ %indvars.iv117.unr.ph, %.lr.ph50.split.us.new ], [ %indvars.iv.next118.1, %._crit_edge139 ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv117, i64 %indvars.iv120
  %92 = load double, double* %91, align 8
  %93 = load double, double* %80, align 8
  %94 = fsub double %92, %93
  %95 = fmul double %94, %94
  %96 = fadd double %95, %90
  store double %96, double* %79, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next118, i64 %indvars.iv120
  %98 = load double, double* %97, align 8
  %99 = load double, double* %80, align 8
  %100 = fsub double %98, %99
  %101 = fmul double %100, %100
  %102 = fadd double %101, %96
  store double %102, double* %79, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %103 = icmp slt i64 %indvars.iv.next118.1, %77
  br i1 %103, label %._crit_edge139, label %._crit_edge47.us.unr-lcssa

._crit_edge47.us.unr-lcssa:                       ; preds = %._crit_edge139
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %._crit_edge139.prol.loopexit, %._crit_edge47.us.unr-lcssa
  %.lcssa160 = phi double [ %.lcssa160.unr.ph, %._crit_edge139.prol.loopexit ], [ %102, %._crit_edge47.us.unr-lcssa ]
  %104 = fdiv double %.lcssa160, %2
  store double %104, double* %79, align 8
  %105 = tail call double @sqrt(double %104) #4
  store double %105, double* %79, align 8
  %106 = fcmp ugt double %105, 1.000000e-01
  br i1 %106, label %87, label %.preheader11.us

.lr.ph61.split:                                   ; preds = %.lr.ph61.split.preheader157, %.lr.ph61.split
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %.lr.ph61.split ], [ %indvars.iv134.ph, %.lr.ph61.split.preheader157 ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv134
  store double %11, double* %107, align 8
  %indvars.iv.next135 = add nsw i64 %indvars.iv134, 1
  %108 = icmp slt i64 %indvars.iv.next135, %10
  br i1 %108, label %.lr.ph61.split, label %..preheader11_crit_edge.loopexit158, !llvm.loop !7

.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit: ; preds = %.preheader11.us
  br label %.preheader11..preheader11..preheader10_crit_edge_crit_edge

.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit156: ; preds = %.preheader11
  br label %.preheader11..preheader11..preheader10_crit_edge_crit_edge

.preheader11..preheader11..preheader10_crit_edge_crit_edge: ; preds = %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit156, %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit
  br label %.preheader11..preheader10_crit_edge

.preheader11..preheader10_crit_edge:              ; preds = %..preheader11_crit_edge..preheader11..preheader10_crit_edge_crit_edge, %..preheader11_crit_edge.thread, %.preheader11..preheader11..preheader10_crit_edge_crit_edge
  %109 = icmp sgt i32 %1, 0
  br i1 %109, label %.preheader10..preheader9_crit_edge.lr.ph, label %.preheader10..preheader_crit_edge

.preheader10..preheader9_crit_edge.lr.ph:         ; preds = %.preheader11..preheader10_crit_edge
  br i1 %8, label %.preheader10..preheader9_crit_edge.us.preheader, label %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit67

.preheader10..preheader9_crit_edge.us.preheader:  ; preds = %.preheader10..preheader9_crit_edge.lr.ph
  %110 = sext i32 %0 to i64
  %111 = sext i32 %1 to i64
  br label %.preheader10..preheader9_crit_edge.us

.preheader10..preheader9_crit_edge.us:            ; preds = %.preheader9._crit_edge.us, %.preheader10..preheader9_crit_edge.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader10..preheader9_crit_edge.us.preheader ], [ %indvars.iv.next116, %.preheader9._crit_edge.us ]
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us, %.preheader10..preheader9_crit_edge.us
  %indvars.iv113 = phi i64 [ 0, %.preheader10..preheader9_crit_edge.us ], [ %indvars.iv.next114, %.preheader9.us ]
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv113
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv115, i64 %indvars.iv113
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %117 = tail call double @sqrt(double %2) #4
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv113
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = load double, double* %114, align 8
  %122 = fdiv double %121, %120
  store double %122, double* %114, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %123 = icmp slt i64 %indvars.iv.next114, %110
  br i1 %123, label %.preheader9.us, label %.preheader9._crit_edge.us

.preheader9._crit_edge.us:                        ; preds = %.preheader9.us
  %indvars.iv.next116 = add nsw i64 %indvars.iv115, 1
  %124 = icmp slt i64 %indvars.iv.next116, %111
  br i1 %124, label %.preheader10..preheader9_crit_edge.us, label %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit

.lr.ph50.split:                                   ; preds = %.preheader11, %.lr.ph50.split.preheader
  %indvars.iv123 = phi i64 [ 0, %.lr.ph50.split.preheader ], [ %indvars.iv.next124, %.preheader11 ]
  %125 = getelementptr inbounds double, double* %6, i64 %indvars.iv123
  store double %76, double* %125, align 8
  %126 = tail call double @sqrt(double %76) #4
  store double %126, double* %125, align 8
  %127 = fcmp ugt double %126, 1.000000e-01
  br i1 %127, label %128, label %.preheader11

; <label>:128:                                    ; preds = %.lr.ph50.split
  br label %.preheader11

.preheader11:                                     ; preds = %.lr.ph50.split, %128
  %129 = phi double [ %126, %128 ], [ 1.000000e+00, %.lr.ph50.split ]
  store double %129, double* %125, align 8
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %130 = icmp slt i64 %indvars.iv.next124, %10
  br i1 %130, label %.lr.ph50.split, label %.preheader11..preheader11..preheader10_crit_edge_crit_edge.loopexit156

.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit: ; preds = %.preheader9._crit_edge.us
  br label %.preheader10..preheader10..preheader_crit_edge_crit_edge

.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit67: ; preds = %.preheader10..preheader9_crit_edge.lr.ph
  br label %.preheader10..preheader10..preheader_crit_edge_crit_edge

.preheader10..preheader10..preheader_crit_edge_crit_edge: ; preds = %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit67, %.preheader10..preheader10..preheader_crit_edge_crit_edge.loopexit
  br label %.preheader10..preheader_crit_edge

.preheader10..preheader_crit_edge:                ; preds = %.preheader11..preheader10_crit_edge, %.preheader10..preheader10..preheader_crit_edge_crit_edge
  %131 = icmp sgt i32 %0, 1
  br i1 %131, label %.lr.ph22, label %.preheader10..preheader_crit_edge..preheader10..preheader_crit_edge._crit_edge_crit_edge

.preheader10..preheader_crit_edge..preheader10..preheader_crit_edge._crit_edge_crit_edge: ; preds = %.preheader10..preheader_crit_edge
  %.pre = add nsw i32 %0, -1
  br label %.preheader10..preheader_crit_edge._crit_edge

.lr.ph22:                                         ; preds = %.preheader10..preheader_crit_edge
  %132 = add nsw i32 %0, -1
  br i1 %109, label %.lr.ph22.split.us.preheader, label %.lr.ph22.split.preheader

.lr.ph22.split.preheader:                         ; preds = %.lr.ph22
  %133 = sext i32 %132 to i64
  %134 = sext i32 %0 to i64
  %135 = add i32 %0, 3
  %136 = zext i32 %135 to i64
  %137 = add i32 %0, -2
  %138 = zext i32 %137 to i64
  br label %.lr.ph22.split

.lr.ph22.split.us.preheader:                      ; preds = %.lr.ph22
  %139 = sext i32 %0 to i64
  %140 = sext i32 %132 to i64
  %wide.trip.count = zext i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %141 = icmp eq i32 %1, 1
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %.preheader.us..lr.ph22.split.us_crit_edge, %.lr.ph22.split.us.preheader
  %indvars.iv94 = phi i64 [ 0, %.lr.ph22.split.us.preheader ], [ %indvars.iv.next95, %.preheader.us..lr.ph22.split.us_crit_edge ]
  %indvars.iv84 = phi i64 [ 1, %.lr.ph22.split.us.preheader ], [ %indvars.iv.next85, %.preheader.us..lr.ph22.split.us_crit_edge ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv94, i64 %indvars.iv94
  store double 1.000000e+00, double* %142, align 8
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  %143 = icmp slt i64 %indvars.iv.next95, %139
  br i1 %143, label %.lr.ph.us.us.preheader, label %.preheader.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph22.split.us
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv94
  br label %.lr.ph.us.us

.preheader.us.loopexit:                           ; preds = %._crit_edge13.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.lr.ph22.split.us
  %145 = icmp slt i64 %indvars.iv.next95, %140
  br i1 %145, label %.preheader.us..lr.ph22.split.us_crit_edge, label %.preheader._crit_edge.loopexit

.preheader.us..lr.ph22.split.us_crit_edge:        ; preds = %.preheader.us
  %indvars.iv.next85 = add nsw i64 %indvars.iv84, 1
  br label %.lr.ph22.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge13.us.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge13.us.us ], [ %indvars.iv84, %.lr.ph.us.us.preheader ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv94, i64 %indvars.iv86
  store double 0.000000e+00, double* %146, align 8
  br i1 %lcmp.mod, label %._crit_edge140.prol.loopexit.unr-lcssa, label %._crit_edge140.prol.preheader

._crit_edge140.prol.preheader:                    ; preds = %.lr.ph.us.us
  br label %._crit_edge140.prol

._crit_edge140.prol:                              ; preds = %._crit_edge140.prol.preheader
  %147 = load double, double* %144, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv86
  %149 = load double, double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fadd double %150, 0.000000e+00
  store double %151, double* %146, align 8
  %152 = bitcast double %151 to i64
  br label %._crit_edge140.prol.loopexit.unr-lcssa

._crit_edge140.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.us, %._crit_edge140.prol
  %.lcssa.unr.ph = phi i64 [ %152, %._crit_edge140.prol ], [ undef, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %151, %._crit_edge140.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge140.prol ], [ 0, %.lr.ph.us.us ]
  br label %._crit_edge140.prol.loopexit

._crit_edge140.prol.loopexit:                     ; preds = %._crit_edge140.prol.loopexit.unr-lcssa
  br i1 %141, label %._crit_edge13.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge140.prol.loopexit
  br label %._crit_edge140

._crit_edge13.us.us.unr-lcssa:                    ; preds = %._crit_edge140
  %153 = bitcast double %168 to i64
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge140.prol.loopexit, %._crit_edge13.us.us.unr-lcssa
  %.lcssa = phi i64 [ %.lcssa.unr.ph, %._crit_edge140.prol.loopexit ], [ %153, %._crit_edge13.us.us.unr-lcssa ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv86, i64 %indvars.iv94
  %155 = bitcast double* %154 to i64*
  store i64 %.lcssa, i64* %155, align 8
  %indvars.iv.next87 = add nsw i64 %indvars.iv86, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next87 to i32
  %exitcond92 = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond92, label %.preheader.us.loopexit, label %.lr.ph.us.us

._crit_edge140:                                   ; preds = %._crit_edge140, %.lr.ph.us.us.new
  %156 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %168, %._crit_edge140 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge140 ]
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv94
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv86
  %160 = load double, double* %159, align 8
  %161 = fmul double %158, %160
  %162 = fadd double %161, %156
  store double %162, double* %146, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv94
  %164 = load double, double* %163, align 8
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv86
  %166 = load double, double* %165, align 8
  %167 = fmul double %164, %166
  %168 = fadd double %167, %162
  store double %168, double* %146, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge13.us.us.unr-lcssa, label %._crit_edge140

.lr.ph22.split:                                   ; preds = %.preheader..lr.ph22.split_crit_edge, %.lr.ph22.split.preheader
  %indvars.iv109 = phi i64 [ 0, %.lr.ph22.split.preheader ], [ %indvars.iv.next110, %.preheader..lr.ph22.split_crit_edge ]
  %indvars.iv98 = phi i64 [ 1, %.lr.ph22.split.preheader ], [ %indvars.iv.next99, %.preheader..lr.ph22.split_crit_edge ]
  %169 = sub i64 %138, %indvars.iv109
  %170 = trunc i64 %169 to i32
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %171, align 8
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, 1
  %172 = icmp slt i64 %indvars.iv.next110, %134
  br i1 %172, label %.lr.ph17.preheader, label %.preheader

.lr.ph17.preheader:                               ; preds = %.lr.ph22.split
  %173 = sub i64 %136, %indvars.iv109
  %174 = trunc i64 %173 to i32
  %xtraiter162 = and i32 %174, 3
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  br i1 %lcmp.mod163, label %.lr.ph17.prol.loopexit, label %.lr.ph17.prol.preheader

.lr.ph17.prol.preheader:                          ; preds = %.lr.ph17.preheader
  br label %.lr.ph17.prol

.lr.ph17.prol:                                    ; preds = %.lr.ph17.prol, %.lr.ph17.prol.preheader
  %indvars.iv100.prol = phi i64 [ %indvars.iv.next101.prol, %.lr.ph17.prol ], [ %indvars.iv98, %.lr.ph17.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph17.prol ], [ %xtraiter162, %.lr.ph17.prol.preheader ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv100.prol
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100.prol, i64 %indvars.iv109
  %177 = bitcast double* %176 to i64*
  store i64 0, i64* %177, align 8
  %indvars.iv.next101.prol = add nsw i64 %indvars.iv100.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph17.prol.loopexit.unr-lcssa, label %.lr.ph17.prol, !llvm.loop !9

.lr.ph17.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph17.prol
  br label %.lr.ph17.prol.loopexit

.lr.ph17.prol.loopexit:                           ; preds = %.lr.ph17.preheader, %.lr.ph17.prol.loopexit.unr-lcssa
  %indvars.iv100.unr = phi i64 [ %indvars.iv98, %.lr.ph17.preheader ], [ %indvars.iv.next101.prol, %.lr.ph17.prol.loopexit.unr-lcssa ]
  %178 = icmp ult i32 %170, 3
  br i1 %178, label %.preheader.loopexit, label %.lr.ph17.preheader.new

.lr.ph17.preheader.new:                           ; preds = %.lr.ph17.prol.loopexit
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %.lr.ph17, %.lr.ph17.preheader.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr, %.lr.ph17.preheader.new ], [ %indvars.iv.next101.3, %.lr.ph17 ]
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv100
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv109
  %181 = bitcast double* %180 to i64*
  store i64 0, i64* %181, align 8
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv.next101
  store double 0.000000e+00, double* %182, align 8
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv109
  %184 = bitcast double* %183 to i64*
  store i64 0, i64* %184, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv.next101.1
  store double 0.000000e+00, double* %185, align 8
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101.1, i64 %indvars.iv109
  %187 = bitcast double* %186 to i64*
  store i64 0, i64* %187, align 8
  %indvars.iv.next101.2 = add nsw i64 %indvars.iv100, 3
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv109, i64 %indvars.iv.next101.2
  store double 0.000000e+00, double* %188, align 8
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101.2, i64 %indvars.iv109
  %190 = bitcast double* %189 to i64*
  store i64 0, i64* %190, align 8
  %indvars.iv.next101.3 = add nsw i64 %indvars.iv100, 4
  %lftr.wideiv106.3 = trunc i64 %indvars.iv.next101.3 to i32
  %exitcond107.3 = icmp eq i32 %lftr.wideiv106.3, %0
  br i1 %exitcond107.3, label %.preheader.loopexit.unr-lcssa, label %.lr.ph17

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph17
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph17.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph22.split
  %191 = icmp slt i64 %indvars.iv.next110, %133
  br i1 %191, label %.preheader..lr.ph22.split_crit_edge, label %.preheader._crit_edge.loopexit155

.preheader..lr.ph22.split_crit_edge:              ; preds = %.preheader
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  br label %.lr.ph22.split

.preheader._crit_edge.loopexit:                   ; preds = %.preheader.us
  br label %.preheader._crit_edge

.preheader._crit_edge.loopexit155:                ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit155, %.preheader._crit_edge.loopexit
  br label %.preheader10..preheader_crit_edge._crit_edge

.preheader10..preheader_crit_edge._crit_edge:     ; preds = %.preheader10..preheader_crit_edge..preheader10..preheader_crit_edge._crit_edge_crit_edge, %.preheader._crit_edge
  %.pre-phi = phi i32 [ %.pre, %.preheader10..preheader_crit_edge..preheader10..preheader_crit_edge._crit_edge_crit_edge ], [ %132, %.preheader._crit_edge ]
  %192 = sext i32 %.pre-phi to i64
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %192, i64 %192
  store double 1.000000e+00, double* %193, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %..preheader_crit_edge.lr.ph, label %._crit_edge

..preheader_crit_edge.lr.ph:                      ; preds = %2
  br i1 true, label %..preheader_crit_edge.us.preheader, label %._crit_edge3.loopexit7

..preheader_crit_edge.us.preheader:               ; preds = %..preheader_crit_edge.lr.ph
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %.preheader._crit_edge.us, %..preheader_crit_edge.us.preheader
  %indvars.iv9 = phi i64 [ 0, %..preheader_crit_edge.us.preheader ], [ %indvars.iv.next10, %.preheader._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv9
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us, %..preheader_crit_edge.us
  %indvars.iv = phi i64 [ 0, %..preheader_crit_edge.us ], [ %indvars.iv.next, %.preheader.us ]
  %10 = add nsw i64 %9, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.preheader.us

; <label>:14:                                     ; preds = %.preheader.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %20 = icmp slt i64 %indvars.iv.next10, %8
  br i1 %20, label %..preheader_crit_edge.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %.preheader._crit_edge.us
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %..preheader_crit_edge.lr.ph
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
