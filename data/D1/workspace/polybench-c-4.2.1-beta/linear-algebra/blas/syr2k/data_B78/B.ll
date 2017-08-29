; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader37.lr.ph, label %._crit_edge41

.preheader37.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader37.us.preheader, label %.preheader37.lr.ph..preheader.lr.ph_crit_edge

.preheader37.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader37.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader37.us.preheader:                        ; preds = %.preheader37.lr.ph
  %wide.trip.count54 = zext i32 %1 to i64
  %wide.trip.count58 = zext i32 %0 to i64
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  br label %.preheader37.us

.preheader37.us:                                  ; preds = %.preheader37.us.preheader, %._crit_edge44.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge44.us ], [ 0, %.preheader37.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader37.us
  %indvars.iv52 = phi i64 [ 0, %.preheader37.us ], [ %indvars.iv.next53, %14 ]
  %15 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv52
  %21 = add nuw nsw i64 %15, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, %13
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %28, double* %20, align 8
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv52
  store double %29, double* %30, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge44.us, label %14

._crit_edge44.us:                                 ; preds = %14
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %.preheader.lr.ph.loopexit, label %.preheader37.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge44.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader37.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader37.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count58, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv, %indvars.iv48
  %33 = add nuw nsw i64 %32, 3
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %11
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %31

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count.pre-phi
  br i1 %exitcond51, label %._crit_edge41.loopexit, label %.preheader.us

._crit_edge41.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %._crit_edge44

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader35.lr.ph
  %wide.trip.count86 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader35.lr.ph
  %wide.trip.count63 = zext i32 %1 to i64
  %wide.trip.count70 = zext i32 %0 to i64
  %broadcast.splatinsert115 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat116 = shufflevector <2 x double> %broadcast.splatinsert115, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %3, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %3, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr122.ph, %.lr.ph.us.new.preheader.new ], [ %indvars.iv.next.3.1, %.lr.ph.us.new ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %19
  store <2 x double> %25, <2 x double>* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %19
  store <2 x double> %29, <2 x double>* %27, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.3
  %31 = bitcast double* %30 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %31, align 8
  %33 = fmul <2 x double> %32, %21
  store <2 x double> %33, <2 x double>* %31, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1.1
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = fmul <2 x double> %36, %21
  store <2 x double> %37, <2 x double>* %35, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv66
  br i1 %exitcond.3.1, label %.preheader.us46.preheader.loopexit.unr-lcssa, label %.lr.ph.us.new

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph ], [ %indvars.iv56.ph, %scalar.ph.preheader ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv61
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %2
  %41 = load double, double* %53, align 8
  %42 = fmul double %40, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv61
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %2
  %46 = load double, double* %54, align 8
  %47 = fmul double %45, %46
  %48 = fadd double %42, %47
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv56
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv66
  br i1 %exitcond, label %._crit_edge.us49.loopexit, label %scalar.ph, !llvm.loop !1

.preheader.us46:                                  ; preds = %.preheader.us46.preheader, %._crit_edge.us49
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us49 ], [ 0, %.preheader.us46.preheader ]
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv61
  %52 = add nuw nsw i64 %indvars.iv61, 1
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %52
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv61
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %52
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv61
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv61
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us46
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us46 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader.us46
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %54
  %bound1 = icmp ult double* %54, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0102 = icmp ult double* %scevgep, %scevgep95
  %bound1103 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx = or i1 %found.conflict, %found.conflict104
  %bound0105 = icmp ult double* %scevgep, %scevgep99
  %bound1106 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx108 = or i1 %conflict.rdx, %found.conflict107
  %bound0111 = icmp ult double* %scevgep, %53
  %bound1112 = icmp ult double* %53, %scevgep91
  %found.conflict113 = and i1 %bound0111, %bound1112
  %conflict.rdx114 = or i1 %conflict.rdx108, %found.conflict113
  br i1 %conflict.rdx114, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %55 = load double, double* %53, align 8, !alias.scope !4
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = load double, double* %54, align 8, !alias.scope !7
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = or i64 %index, 1
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %61, i64 %indvars.iv61
  %64 = load double, double* %62, align 8, !alias.scope !9
  %65 = load double, double* %63, align 8, !alias.scope !9
  %66 = insertelement <2 x double> undef, double %64, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fmul <2 x double> %67, %broadcast.splat116
  %69 = fmul <2 x double> %68, %57
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv61
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %61, i64 %indvars.iv61
  %72 = load double, double* %70, align 8, !alias.scope !11
  %73 = load double, double* %71, align 8, !alias.scope !11
  %74 = insertelement <2 x double> undef, double %72, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fmul <2 x double> %75, %broadcast.splat116
  %77 = fmul <2 x double> %76, %60
  %78 = fadd <2 x double> %69, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !13, !noalias !15
  %81 = fadd <2 x double> %wide.load, %78
  %82 = bitcast double* %79 to <2 x double>*
  store <2 x double> %81, <2 x double>* %82, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us49, label %scalar.ph.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge40.us
  %indvars.iv118 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next, %._crit_edge40.us ]
  %indvars.iv68 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next69, %._crit_edge40.us ]
  %indvars.iv66 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next67, %._crit_edge40.us ]
  %84 = add nsw i64 %indvars.iv68, -3
  %85 = zext i2 %indvars.iv118 to i64
  %86 = add nuw nsw i64 %85, 4294967295
  %87 = and i64 %86, 4294967295
  %88 = add nuw nsw i64 %87, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 0
  %89 = mul i64 %indvars.iv68, 1201
  %90 = add i64 %89, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %90
  %91 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %92 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter = and i32 %92, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %3
  store double %95, double* %93, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !17

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %88, %.prol.loopexit.loopexit ]
  %96 = icmp ult i64 %indvars.iv68, 3
  br i1 %96, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %97 = sub i64 %84, %indvars.iv.unr
  %98 = lshr i64 %97, 2
  %99 = and i64 %98, 1
  %lcmp.mod120 = icmp eq i64 %99, 0
  br i1 %lcmp.mod120, label %.lr.ph.us.new.prol.preheader, label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.preheader:                     ; preds = %.lr.ph.us.new.preheader
  br label %.lr.ph.us.new.prol

.lr.ph.us.new.prol:                               ; preds = %.lr.ph.us.new.prol.preheader
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.unr
  %101 = bitcast double* %100 to <2 x double>*
  %102 = load <2 x double>, <2 x double>* %101, align 8
  %103 = fmul <2 x double> %102, %17
  store <2 x double> %103, <2 x double>* %101, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1.prol
  %105 = bitcast double* %104 to <2 x double>*
  %106 = load <2 x double>, <2 x double>* %105, align 8
  %107 = fmul <2 x double> %106, %17
  store <2 x double> %107, <2 x double>* %105, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.lr.ph.us.new.prol.loopexit.unr-lcssa

.lr.ph.us.new.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new.prol
  %indvars.iv.unr122.ph = phi i64 [ %indvars.iv.next.3.prol, %.lr.ph.us.new.prol ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  br label %.lr.ph.us.new.prol.loopexit

.lr.ph.us.new.prol.loopexit:                      ; preds = %.lr.ph.us.new.prol.loopexit.unr-lcssa
  %108 = icmp eq i64 %98, 0
  br i1 %108, label %.preheader.us46.preheader.loopexit, label %.lr.ph.us.new.preheader.new

.lr.ph.us.new.preheader.new:                      ; preds = %.lr.ph.us.new.prol.loopexit
  br label %.lr.ph.us.new

.preheader.us46.preheader.loopexit.unr-lcssa:     ; preds = %.lr.ph.us.new
  br label %.preheader.us46.preheader.loopexit

.preheader.us46.preheader.loopexit:               ; preds = %.lr.ph.us.new.prol.loopexit, %.preheader.us46.preheader.loopexit.unr-lcssa
  br label %.preheader.us46.preheader

.preheader.us46.preheader:                        ; preds = %.preheader.us46.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %91, 2
  %n.vec = and i64 %91, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %91, %n.vec
  br label %.preheader.us46

._crit_edge.us49.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge.us49

._crit_edge.us49:                                 ; preds = %._crit_edge.us49.loopexit, %middle.block
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge40.us, label %.preheader.us46

._crit_edge40.us:                                 ; preds = %._crit_edge.us49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  %indvars.iv.next = add i2 %indvars.iv118, 1
  br i1 %exitcond71, label %._crit_edge44.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader34
  %indvars.iv123 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next124, %.preheader34 ]
  %indvars.iv84 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next85, %.preheader34 ]
  %indvars.iv82 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next83, %.preheader34 ]
  %109 = add nsw i64 %indvars.iv84, -3
  %110 = zext i2 %indvars.iv123 to i64
  %111 = add nuw nsw i64 %110, 4294967295
  %112 = and i64 %111, 4294967295
  %113 = add nuw nsw i64 %112, 1
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %114 = trunc i64 %indvars.iv.next85 to i32
  %xtraiter79 = and i32 %114, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.prol.loopexit78, label %.prol.preheader77.preheader

.prol.preheader77.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader77

.prol.preheader77:                                ; preds = %.prol.preheader77.preheader, %.prol.preheader77
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %.prol.preheader77 ], [ 0, %.prol.preheader77.preheader ]
  %prol.iter81 = phi i32 [ %prol.iter81.sub, %.prol.preheader77 ], [ %xtraiter79, %.prol.preheader77.preheader ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72.prol
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %3
  store double %117, double* %115, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter81.sub = add nsw i32 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i32 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.loopexit78.loopexit, label %.prol.preheader77, !llvm.loop !19

.prol.loopexit78.loopexit:                        ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.loopexit78.loopexit, %.lr.ph
  %indvars.iv72.unr = phi i64 [ 0, %.lr.ph ], [ %113, %.prol.loopexit78.loopexit ]
  %118 = icmp ult i64 %indvars.iv84, 3
  br i1 %118, label %.preheader34, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit78
  %119 = sub i64 %109, %indvars.iv72.unr
  %120 = lshr i64 %119, 2
  %121 = and i64 %120, 1
  %lcmp.mod126 = icmp eq i64 %121, 0
  br i1 %lcmp.mod126, label %.lr.ph.new.prol.preheader, label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.preheader:                        ; preds = %.lr.ph.new.preheader
  br label %.lr.ph.new.prol

.lr.ph.new.prol:                                  ; preds = %.lr.ph.new.prol.preheader
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72.unr
  %123 = bitcast double* %122 to <2 x double>*
  %124 = load <2 x double>, <2 x double>* %123, align 8
  %125 = fmul <2 x double> %124, %11
  store <2 x double> %125, <2 x double>* %123, align 8
  %indvars.iv.next73.1.prol = add nsw i64 %indvars.iv72.unr, 2
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.1.prol
  %127 = bitcast double* %126 to <2 x double>*
  %128 = load <2 x double>, <2 x double>* %127, align 8
  %129 = fmul <2 x double> %128, %11
  store <2 x double> %129, <2 x double>* %127, align 8
  %indvars.iv.next73.3.prol = add nsw i64 %indvars.iv72.unr, 4
  br label %.lr.ph.new.prol.loopexit.unr-lcssa

.lr.ph.new.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph.new.preheader, %.lr.ph.new.prol
  %indvars.iv72.unr128.ph = phi i64 [ %indvars.iv.next73.3.prol, %.lr.ph.new.prol ], [ %indvars.iv72.unr, %.lr.ph.new.preheader ]
  br label %.lr.ph.new.prol.loopexit

.lr.ph.new.prol.loopexit:                         ; preds = %.lr.ph.new.prol.loopexit.unr-lcssa
  %130 = icmp eq i64 %120, 0
  br i1 %130, label %.preheader34.loopexit, label %.lr.ph.new.preheader.new

.lr.ph.new.preheader.new:                         ; preds = %.lr.ph.new.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr128.ph, %.lr.ph.new.preheader.new ], [ %indvars.iv.next73.3.1, %.lr.ph.new ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8
  %134 = fmul <2 x double> %133, %13
  store <2 x double> %134, <2 x double>* %132, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.1
  %136 = bitcast double* %135 to <2 x double>*
  %137 = load <2 x double>, <2 x double>* %136, align 8
  %138 = fmul <2 x double> %137, %13
  store <2 x double> %138, <2 x double>* %136, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.3
  %140 = bitcast double* %139 to <2 x double>*
  %141 = load <2 x double>, <2 x double>* %140, align 8
  %142 = fmul <2 x double> %141, %15
  store <2 x double> %142, <2 x double>* %140, align 8
  %indvars.iv.next73.1.1 = add nsw i64 %indvars.iv72, 6
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.1.1
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %144, align 8
  %146 = fmul <2 x double> %145, %15
  store <2 x double> %146, <2 x double>* %144, align 8
  %indvars.iv.next73.3.1 = add nsw i64 %indvars.iv72, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next73.3.1, %indvars.iv82
  br i1 %exitcond76.3.1, label %.preheader34.loopexit.unr-lcssa, label %.lr.ph.new

.preheader34.loopexit.unr-lcssa:                  ; preds = %.lr.ph.new
  br label %.preheader34.loopexit

.preheader34.loopexit:                            ; preds = %.lr.ph.new.prol.loopexit, %.preheader34.loopexit.unr-lcssa
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %.prol.loopexit78
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  %indvars.iv.next124 = add i2 %indvars.iv123, 1
  br i1 %exitcond87, label %._crit_edge44.loopexit117, label %.lr.ph

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44.loopexit117:                        ; preds = %.preheader34
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit117, %._crit_edge44.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12}
!12 = distinct !{!12, !6}
!13 = !{!14}
!14 = distinct !{!14, !6}
!15 = !{!8, !10, !12, !5}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}
