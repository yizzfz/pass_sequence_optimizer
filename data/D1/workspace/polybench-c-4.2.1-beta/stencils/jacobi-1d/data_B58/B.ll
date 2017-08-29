; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep2 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep2, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind4 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next5, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %17 = insertelement <2 x double> undef, double %5, i32 0
  %18 = insertelement <2 x double> %17, double %5, i32 1
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = insertelement <2 x double> %22, double %20, i32 1
  %24 = fadd <2 x double> %23, <double 2.000000e+00, double 3.000000e+00>
  %25 = fdiv <2 x double> %24, %18
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %21, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %6
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %._crit_edge8

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge8

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %8 = sext i32 %6 to i64
  %9 = add nsw i64 %8, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep32 = getelementptr double, double* %2, i64 %8
  %10 = add nsw i64 %8, 1
  %scevgep34 = getelementptr double, double* %3, i64 %10
  %11 = add nsw i64 %8, -1
  %scevgep51 = getelementptr double, double* %3, i64 1
  %scevgep53 = getelementptr double, double* %3, i64 %8
  %12 = add nsw i64 %8, 1
  %scevgep55 = getelementptr double, double* %2, i64 %12
  %13 = add nsw i64 %8, -1
  %14 = add nsw i64 %8, -1
  %min.iters.check45 = icmp ult i64 %11, 4
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ugt double* %scevgep32, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  %n.vec48 = and i64 %11, -4
  %cmp.zero49 = icmp eq i64 %n.vec48, 0
  %bound057 = icmp ult double* %scevgep51, %scevgep55
  %bound158 = icmp ugt double* %scevgep53, %2
  %memcheck.conflict60 = and i1 %bound057, %bound158
  %ind.end66 = or i64 %n.vec48, 1
  %cmp.n67 = icmp eq i64 %11, %n.vec48
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge5.us, %._crit_edge.us.preheader
  %15 = phi i32 [ %54, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %min.iters.check45, label %scalar.ph44.preheader, label %min.iters.checked46

scalar.ph44.preheader:                            ; preds = %middle.block43, %vector.memcheck61, %min.iters.checked46, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck61 ], [ 1, %min.iters.checked46 ], [ 1, %._crit_edge.us ], [ %ind.end66, %middle.block43 ]
  %16 = sub nsw i64 %8, %indvars.iv.ph
  %xtraiter = and i64 %16, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %scalar.ph44.prol.loopexit.unr-lcssa, label %scalar.ph44.prol.preheader

scalar.ph44.prol.preheader:                       ; preds = %scalar.ph44.preheader
  br label %scalar.ph44.prol

scalar.ph44.prol:                                 ; preds = %scalar.ph44.prol.preheader
  %17 = add nsw i64 %indvars.iv.ph, -1
  %18 = getelementptr inbounds double, double* %2, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.ph
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.prol
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  %26 = fmul double %25, 3.333300e-01
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv.ph
  store double %26, double* %27, align 8
  br label %scalar.ph44.prol.loopexit.unr-lcssa

scalar.ph44.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph44.preheader, %scalar.ph44.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %scalar.ph44.prol ], [ %indvars.iv.ph, %scalar.ph44.preheader ]
  br label %scalar.ph44.prol.loopexit

scalar.ph44.prol.loopexit:                        ; preds = %scalar.ph44.prol.loopexit.unr-lcssa
  %28 = icmp eq i64 %13, %indvars.iv.ph
  br i1 %28, label %.lr.ph4.us.preheader.loopexit, label %scalar.ph44.preheader.new

scalar.ph44.preheader.new:                        ; preds = %scalar.ph44.prol.loopexit
  br label %scalar.ph44

min.iters.checked46:                              ; preds = %._crit_edge.us
  br i1 %cmp.zero49, label %scalar.ph44.preheader, label %vector.memcheck61

vector.memcheck61:                                ; preds = %min.iters.checked46
  br i1 %memcheck.conflict60, label %scalar.ph44.preheader, label %vector.body42.preheader

vector.body42.preheader:                          ; preds = %vector.memcheck61
  br label %vector.body42

vector.body42:                                    ; preds = %vector.body42.preheader, %vector.body42
  %index63 = phi i64 [ %index.next64, %vector.body42 ], [ 0, %vector.body42.preheader ]
  %offset.idx68 = or i64 %index63, 1
  %29 = add nsw i64 %offset.idx68, -1
  %30 = getelementptr inbounds double, double* %2, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !10
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !10
  %34 = getelementptr inbounds double, double* %2, i64 %offset.idx68
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !10
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !10
  %38 = fadd <2 x double> %wide.load73, %wide.load75
  %39 = fadd <2 x double> %wide.load74, %wide.load76
  %40 = add nuw nsw i64 %offset.idx68, 1
  %41 = getelementptr inbounds double, double* %2, i64 %40
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !10
  %45 = fadd <2 x double> %38, %wide.load77
  %46 = fadd <2 x double> %39, %wide.load78
  %47 = fmul <2 x double> %45, <double 3.333300e-01, double 3.333300e-01>
  %48 = fmul <2 x double> %46, <double 3.333300e-01, double 3.333300e-01>
  %49 = getelementptr inbounds double, double* %3, i64 %offset.idx68
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %47, <2 x double>* %50, align 8, !alias.scope !13, !noalias !10
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> %48, <2 x double>* %52, align 8, !alias.scope !13, !noalias !10
  %index.next64 = add i64 %index63, 4
  %53 = icmp eq i64 %index.next64, %n.vec48
  br i1 %53, label %middle.block43, label %vector.body42, !llvm.loop !15

middle.block43:                                   ; preds = %vector.body42
  br i1 %cmp.n67, label %.lr.ph4.us.preheader, label %scalar.ph44.preheader

._crit_edge5.us.loopexit.unr-lcssa:               ; preds = %.lr.ph4.us
  br label %._crit_edge5.us.loopexit

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us.prol.loopexit, %._crit_edge5.us.loopexit.unr-lcssa
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %54 = add nuw nsw i32 %15, 1
  %exitcond30 = icmp eq i32 %54, %0
  br i1 %exitcond30, label %._crit_edge8.loopexit, label %._crit_edge.us

.lr.ph4.us:                                       ; preds = %.lr.ph4.us, %.lr.ph4.us.preheader79.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph4.us.preheader79.new ], [ %indvars.iv.next26.1, %.lr.ph4.us ]
  %55 = add nsw i64 %indvars.iv25, -1
  %56 = getelementptr inbounds double, double* %3, i64 %55
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 3.333300e-01
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %64, double* %65, align 8
  %66 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %71 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26.1
  %72 = load double, double* %71, align 8
  %73 = fadd double %70, %72
  %74 = fmul double %73, 3.333300e-01
  %75 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next26
  store double %74, double* %75, align 8
  %exitcond29.1 = icmp eq i64 %indvars.iv.next26.1, %8
  br i1 %exitcond29.1, label %._crit_edge5.us.loopexit.unr-lcssa, label %.lr.ph4.us, !llvm.loop !16

scalar.ph44:                                      ; preds = %scalar.ph44, %scalar.ph44.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %scalar.ph44.preheader.new ], [ %indvars.iv.next.1, %scalar.ph44 ]
  %76 = add nsw i64 %indvars.iv, -1
  %77 = getelementptr inbounds double, double* %2, i64 %76
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = fmul double %84, 3.333300e-01
  %86 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  %95 = fmul double %94, 3.333300e-01
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %95, double* %96, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %8
  br i1 %exitcond.1, label %.lr.ph4.us.preheader.loopexit.unr-lcssa, label %scalar.ph44, !llvm.loop !17

.lr.ph4.us.preheader.loopexit.unr-lcssa:          ; preds = %scalar.ph44
  br label %.lr.ph4.us.preheader.loopexit

.lr.ph4.us.preheader.loopexit:                    ; preds = %scalar.ph44.prol.loopexit, %.lr.ph4.us.preheader.loopexit.unr-lcssa
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block43
  br i1 %min.iters.check, label %.lr.ph4.us.preheader79, label %min.iters.checked

.lr.ph4.us.preheader79:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end, %middle.block ]
  %97 = sub nsw i64 %8, %indvars.iv25.ph
  %xtraiter80 = and i64 %97, 1
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod81, label %.lr.ph4.us.prol.loopexit.unr-lcssa, label %.lr.ph4.us.prol.preheader

.lr.ph4.us.prol.preheader:                        ; preds = %.lr.ph4.us.preheader79
  br label %.lr.ph4.us.prol

.lr.ph4.us.prol:                                  ; preds = %.lr.ph4.us.prol.preheader
  %98 = add nsw i64 %indvars.iv25.ph, -1
  %99 = getelementptr inbounds double, double* %3, i64 %98
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv25.ph
  %102 = load double, double* %101, align 8
  %103 = fadd double %100, %102
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.ph, 1
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26.prol
  %105 = load double, double* %104, align 8
  %106 = fadd double %103, %105
  %107 = fmul double %106, 3.333300e-01
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv25.ph
  store double %107, double* %108, align 8
  br label %.lr.ph4.us.prol.loopexit.unr-lcssa

.lr.ph4.us.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph4.us.preheader79, %.lr.ph4.us.prol
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph4.us.prol ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader79 ]
  br label %.lr.ph4.us.prol.loopexit

.lr.ph4.us.prol.loopexit:                         ; preds = %.lr.ph4.us.prol.loopexit.unr-lcssa
  %109 = icmp eq i64 %14, %indvars.iv25.ph
  br i1 %109, label %._crit_edge5.us.loopexit, label %.lr.ph4.us.preheader79.new

.lr.ph4.us.preheader79.new:                       ; preds = %.lr.ph4.us.prol.loopexit
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  br i1 %cmp.zero, label %.lr.ph4.us.preheader79, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader79, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %110 = add nsw i64 %offset.idx, -1
  %111 = getelementptr inbounds double, double* %3, i64 %110
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !18
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !18
  %115 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !18
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !18
  %119 = fadd <2 x double> %wide.load, %wide.load38
  %120 = fadd <2 x double> %wide.load37, %wide.load39
  %121 = add nuw nsw i64 %offset.idx, 1
  %122 = getelementptr inbounds double, double* %3, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !18
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !18
  %126 = fadd <2 x double> %119, %wide.load40
  %127 = fadd <2 x double> %120, %wide.load41
  %128 = fmul <2 x double> %126, <double 3.333300e-01, double 3.333300e-01>
  %129 = fmul <2 x double> %127, <double 3.333300e-01, double 3.333300e-01>
  %130 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %131 = bitcast double* %130 to <2 x double>*
  store <2 x double> %128, <2 x double>* %131, align 8, !alias.scope !21, !noalias !18
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x double>*
  store <2 x double> %129, <2 x double>* %133, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %134 = icmp eq i64 %index.next, %n.vec
  br i1 %134, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge5.us, label %.lr.ph4.us.preheader79

._crit_edge8.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge2

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond, label %._crit_edge2.loopexit, label %9

._crit_edge2.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
