; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader7.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit19.us, %.preheader7.lr.ph
  %indvars.iv49 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next50, %.loopexit19.us ]
  %7 = add nuw nsw i64 %indvars.iv49, 1200
  %8 = trunc i64 %7 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader7.us
  %indvars.iv47 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next48, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv49, %indvars.iv47
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv47
  store double %13, double* %14, align 8
  %15 = trunc i64 %indvars.iv47 to i32
  %16 = sub i32 %8, %15
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv47
  store double %19, double* %20, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond52, label %.loopexit19.us, label %._crit_edge

.loopexit19.us:                                   ; preds = %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next50, 1000
  br i1 %exitcond53, label %.preheader5.preheader, label %.preheader7.us

.preheader5.preheader:                            ; preds = %.loopexit19.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %.loopexit..preheader5_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.loopexit..preheader5_crit_edge ], [ 1, %.preheader5.preheader ]
  %indvars.iv37 = phi i32 [ %indvars.iv.next38, %.loopexit..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %21 = and i64 %indvars.iv45, 4294967295
  %22 = shl i64 %indvars.iv45, 32
  %sext = add i64 %22, 4294967296
  %23 = ashr exact i64 %sext, 32
  %24 = sub nsw i64 1000, %23
  %sext55 = shl i64 %indvars.iv39, 32
  %25 = ashr exact i64 %sext55, 32
  %26 = icmp slt i64 %indvars.iv45, 0
  br i1 %26, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv37 to i64
  %27 = and i64 %indvars.iv45, 1
  %lcmp.mod = icmp eq i64 %27, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %28 = trunc i64 %indvars.iv45 to i32
  %29 = srem i32 %28, 100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 0
  store double %31, double* %32, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %21, 0
  br i1 %33, label %.preheader.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader5
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  %34 = icmp slt i64 %indvars.iv.next46, 1000
  br i1 %34, label %.lr.ph12.preheader, label %.preheader6._crit_edge

.lr.ph12.preheader:                               ; preds = %.preheader
  %min.iters.check = icmp ult i64 %24, 4
  br i1 %min.iters.check, label %.lr.ph12.preheader56, label %min.iters.checked

.lr.ph12.preheader56:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph12.preheader
  %indvars.iv41.ph = phi i64 [ %25, %min.iters.checked ], [ %25, %.lr.ph12.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph12

min.iters.checked:                                ; preds = %.lr.ph12.preheader
  %n.vec = and i64 %24, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %25, %n.vec
  br i1 %cmp.zero, label %.lr.ph12.preheader56, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %35 = add nsw i64 %n.vec, -4
  %36 = lshr exact i64 %35, 2
  %37 = add nuw nsw i64 %36, 1
  %xtraiter57 = and i64 %37, 3
  %lcmp.mod58 = icmp eq i64 %xtraiter57, 0
  br i1 %lcmp.mod58, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter57, %vector.body.prol.preheader ]
  %offset.idx.prol = add i64 %25, %index.prol
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %offset.idx.prol
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %41, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %42 = icmp ult i64 %35, 12
  br i1 %42, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %25, %index
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %offset.idx
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %46, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %25, %index.next
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %offset.idx.1
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %50, align 8
  %index.next.1 = add i64 %index, 8
  %offset.idx.2 = add i64 %25, %index.next.1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %offset.idx.2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %54, align 8
  %index.next.2 = add i64 %index, 12
  %offset.idx.3 = add i64 %25, %index.next.2
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %offset.idx.3
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %58, align 8
  %index.next.3 = add i64 %index, 16
  %59 = icmp eq i64 %index.next.3, %n.vec
  br i1 %59, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %24, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.lr.ph12.preheader56

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %60 = add nsw i64 %indvars.iv45, %indvars.iv
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 100
  %63 = sitofp i32 %62 to double
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = add nsw i64 %indvars.iv45, %indvars.iv.next
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, 100
  %68 = sitofp i32 %67 to double
  %69 = insertelement <2 x double> undef, double %63, i32 0
  %70 = insertelement <2 x double> %69, double %68, i32 1
  %71 = fdiv <2 x double> %70, <double 1.000000e+03, double 1.000000e+03>
  %72 = bitcast double* %64 to <2 x double>*
  store <2 x double> %71, <2 x double>* %72, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph

.lr.ph12:                                         ; preds = %.lr.ph12.preheader56, %.lr.ph12
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %.lr.ph12 ], [ %indvars.iv41.ph, %.lr.ph12.preheader56 ]
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv41
  store double -9.990000e+02, double* %73, align 8
  %exitcond44 = icmp eq i64 %indvars.iv41, 999
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  br i1 %exitcond44, label %.loopexit.loopexit, label %.lr.ph12, !llvm.loop !6

.loopexit.loopexit:                               ; preds = %.lr.ph12
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  %74 = icmp slt i64 %indvars.iv.next46, 1000
  br i1 %74, label %.loopexit..preheader5_crit_edge, label %.preheader6._crit_edge

.loopexit..preheader5_crit_edge:                  ; preds = %.loopexit
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  %indvars.iv.next40 = add nsw i64 %25, 1
  br label %.preheader5

.preheader6._crit_edge:                           ; preds = %.preheader, %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %.loopexit7, %.preheader.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.loopexit7 ], [ 0, %.preheader.lr.ph ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.loopexit7 ], [ 4294967295, %.preheader.lr.ph ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 0
  %8 = add nuw nsw i64 %indvars.iv35, 1
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = and i64 %indvars.iv31, 4294967295
  %10 = icmp sgt i64 %indvars.iv35, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv35
  br i1 %10, label %.lr.ph4.split.us.preheader, label %vector.memcheck

.lr.ph4.split.us.preheader:                       ; preds = %.preheader
  br label %.lr.ph4.split.us

vector.memcheck:                                  ; preds = %.preheader
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep48 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep50
  %bound1 = icmp ult double* %scevgep48, %scevgep46
  %found.conflict = and i1 %bound0, %bound1
  %bound053 = icmp ult double* %scevgep, %11
  %bound154 = icmp ult double* %11, %scevgep46
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx = or i1 %found.conflict, %found.conflict55
  br i1 %conflict.rdx, label %.lr.ph4.split.preheader, label %vector.ph

.lr.ph4.split.preheader:                          ; preds = %vector.memcheck
  br label %.lr.ph4.split

vector.ph:                                        ; preds = %vector.memcheck
  %12 = load double, double* %11, align 8, !alias.scope !8
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %12, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !11, !noalias !13
  %21 = fmul <2 x double> %wide.load, %broadcast.splat59
  %22 = fmul <2 x double> %wide.load57, %broadcast.splat59
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !15
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !15
  %27 = fmul <2 x double> %wide.load60, %broadcast.splat63
  %28 = fmul <2 x double> %wide.load61, %broadcast.splat63
  %29 = fmul <2 x double> %27, %14
  %30 = fmul <2 x double> %28, %16
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %22, %30
  %33 = fadd <2 x double> %31, %broadcast.splat65
  %34 = fadd <2 x double> %32, %broadcast.splat65
  %35 = bitcast double* %17 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %36 = bitcast double* %19 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %index.next = add nuw nsw i64 %index, 4
  %37 = icmp eq i64 %index.next, 1200
  br i1 %37, label %.loopexit7.loopexit67, label %vector.body, !llvm.loop !16

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %.loopexit.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %.loopexit.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv33
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph4.split.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %39 ], [ 0, %.lr.ph4.split.us ]
  %40 = phi double [ %53, %39 ], [ 0.000000e+00, %.lr.ph4.split.us ]
  %41 = load double, double* %38, align 8
  %42 = fmul double %41, %2
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv29
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv33
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  store double %48, double* %46, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv29, i64 %indvars.iv33
  %50 = load double, double* %49, align 8
  %51 = load double, double* %43, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %40, %52
  %exitcond = icmp eq i64 %indvars.iv29, %9
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  br i1 %exitcond, label %.loopexit.us, label %39

.loopexit.us:                                     ; preds = %39
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv33
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = load double, double* %38, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %11, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %56, %60
  %62 = fmul double %53, %2
  %63 = fadd double %61, %62
  store double %63, double* %54, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond41, label %.loopexit7.loopexit, label %.lr.ph4.split.us

.lr.ph4.split:                                    ; preds = %.lr.ph4.split, %.lr.ph4.split.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.preheader ], [ %indvars.iv.next.1, %.lr.ph4.split ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv
  %65 = bitcast double* %64 to <2 x double>*
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %11, align 8
  %70 = fmul double %68, %69
  %indvars.iv.next = or i64 %indvars.iv, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv.next
  %72 = load <2 x double>, <2 x double>* %65, align 8
  %73 = insertelement <2 x double> undef, double %3, i32 0
  %74 = insertelement <2 x double> %73, double %3, i32 1
  %75 = fmul <2 x double> %72, %74
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fadd double %76, %70
  %79 = fadd double %78, %7
  store double %79, double* %64, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv.next
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %11, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %77, %84
  %86 = fadd double %85, %7
  store double %86, double* %71, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond40.1, label %.loopexit7.loopexit66, label %.lr.ph4.split, !llvm.loop !17

.loopexit7.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit7

.loopexit7.loopexit66:                            ; preds = %.lr.ph4.split
  br label %.loopexit7

.loopexit7.loopexit67:                            ; preds = %vector.body
  br label %.loopexit7

.loopexit7:                                       ; preds = %.loopexit7.loopexit67, %.loopexit7.loopexit66, %.loopexit7.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %indvars.iv.next32 = add nuw nsw i64 %9, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next36, 1000
  br i1 %exitcond43, label %._crit_edge, label %.preheader

._crit_edge:                                      ; preds = %.loopexit7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
