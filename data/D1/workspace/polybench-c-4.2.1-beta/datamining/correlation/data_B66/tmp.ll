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
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %19
  %storemerge2 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %storemerge2 to double
  %4 = sext i32 %storemerge2 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %20 = add nsw i32 %storemerge2, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %8 = alloca double, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double, align 8
  store double %2, double* %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store double* %6, double** %11, align 8
  store double 1.000000e-01, double* %12, align 8
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph51, label %._crit_edge.._crit_edge9_crit_edge

.lr.ph51:                                         ; preds = %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph51.split.us.preheader, label %.lr.ph51.split.preheader

.lr.ph51.split.us.preheader:                      ; preds = %.lr.ph51
  %xtraiter125 = and i32 %1, 1
  %wide.trip.count121.1 = zext i32 %1 to i64
  %15 = add nsw i64 %wide.trip.count121.1, -2
  %16 = icmp eq i32 %xtraiter125, 0
  %.pre192 = ptrtoint double* %5 to i64
  %17 = icmp eq i32 %1, 1
  %18 = ptrtoint double* %5 to i64
  br label %.lr.ph51.split.us

.lr.ph51.split.preheader:                         ; preds = %.lr.ph51
  %19 = add i32 %0, -1
  %xtraiter132 = and i32 %0, 3
  %lcmp.mod133 = icmp eq i32 %xtraiter132, 0
  br i1 %lcmp.mod133, label %.lr.ph51.split.prol.loopexit, label %.lr.ph51.split.prol.preheader

.lr.ph51.split.prol.preheader:                    ; preds = %.lr.ph51.split.preheader
  %20 = fdiv double 0.000000e+00, %2
  br label %.lr.ph51.split.prol

.lr.ph51.split.prol:                              ; preds = %.lr.ph51.split.prol.preheader, %.lr.ph51.split.prol
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.lr.ph51.split.prol ], [ 0, %.lr.ph51.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph51.split.prol ], [ %xtraiter132, %.lr.ph51.split.prol.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv128.prol
  store double %20, double* %21, align 8
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph51.split.prol.loopexit.loopexit, label %.lr.ph51.split.prol, !llvm.loop !1

.lr.ph51.split.prol.loopexit.loopexit:            ; preds = %.lr.ph51.split.prol
  br label %.lr.ph51.split.prol.loopexit

.lr.ph51.split.prol.loopexit:                     ; preds = %.lr.ph51.split.prol.loopexit.loopexit, %.lr.ph51.split.preheader
  %indvars.iv128.unr = phi i64 [ 0, %.lr.ph51.split.preheader ], [ %indvars.iv.next129.prol, %.lr.ph51.split.prol.loopexit.loopexit ]
  %22 = icmp ult i32 %19, 3
  br i1 %22, label %.lr.ph47, label %.lr.ph51.split.preheader139

.lr.ph51.split.preheader139:                      ; preds = %.lr.ph51.split.prol.loopexit
  %23 = fdiv double 0.000000e+00, %2
  %wide.trip.count130.3 = zext i32 %0 to i64
  %24 = add nsw i64 %wide.trip.count130.3, -4
  %25 = sub i64 %24, %indvars.iv128.unr
  %26 = lshr i64 %25, 2
  %27 = add nuw nsw i64 %26, 1
  %min.iters.check = icmp ult i64 %27, 4
  br i1 %min.iters.check, label %.lr.ph51.split.preheader198, label %min.iters.checked

.lr.ph51.split.preheader198:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph51.split.preheader139
  %indvars.iv128.ph = phi i64 [ %indvars.iv128.unr, %min.iters.checked ], [ %indvars.iv128.unr, %.lr.ph51.split.preheader139 ], [ %ind.end, %middle.block ]
  br label %.lr.ph51.split

min.iters.checked:                                ; preds = %.lr.ph51.split.preheader139
  %n.mod.vf = and i64 %27, 3
  %n.vec = sub nsw i64 %27, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %28 = shl nuw i64 %26, 2
  %29 = add i64 %indvars.iv128.unr, %28
  %30 = add i64 %29, 4
  %31 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %30, %31
  br i1 %cmp.zero, label %.lr.ph51.split.preheader198, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert187 = insertelement <2 x double> undef, double %23, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert187, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %32 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv128.unr, %32
  %33 = add nsw i64 %offset.idx, 3
  %34 = add i64 %offset.idx, 11
  %35 = getelementptr inbounds double, double* %5, i64 %33
  %36 = getelementptr inbounds double, double* %5, i64 %34
  %37 = getelementptr double, double* %35, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  %39 = getelementptr double, double* %36, i64 -3
  %40 = bitcast double* %39 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %38, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %40, align 8
  %index.next = add i64 %index, 4
  %41 = icmp eq i64 %index.next, %n.vec
  br i1 %41, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge..lr.ph47_crit_edge, label %.lr.ph51.split.preheader198

.lr.ph51.split.us:                                ; preds = %.lr.ph51.split.us.preheader, %._crit_edge.us
  %42 = phi i32 [ %75, %._crit_edge.us ], [ 0, %.lr.ph51.split.us.preheader ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double* %5, i64 %43
  store double 0.000000e+00, double* %44, align 8
  br i1 %16, label %.lr.ph51.split.us..prol.loopexit124_crit_edge, label %.prol.preheader123

.lr.ph51.split.us..prol.loopexit124_crit_edge:    ; preds = %.lr.ph51.split.us
  %.pre193 = shl nsw i64 %43, 3
  %.pre194 = add i64 %.pre192, %.pre193
  br label %.prol.loopexit124

.prol.preheader123:                               ; preds = %.lr.ph51.split.us
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %43
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, 0.000000e+00
  %sunkaddr61.prol = shl nsw i64 %43, 3
  %sunkaddr62.prol = add i64 %18, %sunkaddr61.prol
  %sunkaddr63.prol = inttoptr i64 %sunkaddr62.prol to double*
  store double %47, double* %sunkaddr63.prol, align 8
  br label %.prol.loopexit124

.prol.loopexit124:                                ; preds = %.lr.ph51.split.us..prol.loopexit124_crit_edge, %.prol.preheader123
  %.pre160.pre-phi = phi i64 [ %.pre194, %.lr.ph51.split.us..prol.loopexit124_crit_edge ], [ %sunkaddr62.prol, %.prol.preheader123 ]
  %indvars.iv119.unr.ph = phi i64 [ 0, %.lr.ph51.split.us..prol.loopexit124_crit_edge ], [ 1, %.prol.preheader123 ]
  %.unr127.ph = phi double [ 0.000000e+00, %.lr.ph51.split.us..prol.loopexit124_crit_edge ], [ %47, %.prol.preheader123 ]
  %.lcssa88.unr.ph = phi double [ undef, %.lr.ph51.split.us..prol.loopexit124_crit_edge ], [ %47, %.prol.preheader123 ]
  br i1 %17, label %.prol.loopexit124.._crit_edge.us_crit_edge, label %.lr.ph51.split.us.new.preheader

.lr.ph51.split.us.new.preheader:                  ; preds = %.prol.loopexit124
  %48 = sub nsw i64 %15, %indvars.iv119.unr.ph
  %49 = lshr i64 %48, 1
  %50 = and i64 %49, 1
  %lcmp.mod215 = icmp eq i64 %50, 0
  br i1 %lcmp.mod215, label %.lr.ph51.split.us.new.prol.preheader, label %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa

.lr.ph51.split.us.new.prol.preheader:             ; preds = %.lr.ph51.split.us.new.preheader
  br label %.lr.ph51.split.us.new.prol

.lr.ph51.split.us.new.prol:                       ; preds = %.lr.ph51.split.us.new.prol.preheader
  %51 = inttoptr i64 %.pre160.pre-phi to double*
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv119.unr.ph, i64 %43
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %.unr127.ph
  store double %54, double* %51, align 8
  %indvars.iv.next120.prol = add nuw nsw i64 %indvars.iv119.unr.ph, 1
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.prol, i64 %43
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %51, align 8
  %indvars.iv.next120.1.prol = or i64 %indvars.iv119.unr.ph, 2
  br label %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa

.lr.ph51.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.lr.ph51.split.us.new.preheader, %.lr.ph51.split.us.new.prol
  %.lcssa206.unr.ph = phi double* [ %51, %.lr.ph51.split.us.new.prol ], [ undef, %.lr.ph51.split.us.new.preheader ]
  %.lcssa205.unr.ph = phi double [ %57, %.lr.ph51.split.us.new.prol ], [ undef, %.lr.ph51.split.us.new.preheader ]
  %indvars.iv119.unr.ph217 = phi i64 [ %indvars.iv.next120.1.prol, %.lr.ph51.split.us.new.prol ], [ %indvars.iv119.unr.ph, %.lr.ph51.split.us.new.preheader ]
  %.unr216.ph = phi double [ %57, %.lr.ph51.split.us.new.prol ], [ %.unr127.ph, %.lr.ph51.split.us.new.preheader ]
  br label %.lr.ph51.split.us.new.prol.loopexit

.lr.ph51.split.us.new.prol.loopexit:              ; preds = %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa
  %58 = icmp eq i64 %49, 0
  br i1 %58, label %._crit_edge.us.loopexit, label %.lr.ph51.split.us.new.preheader.new

.lr.ph51.split.us.new.preheader.new:              ; preds = %.lr.ph51.split.us.new.prol.loopexit
  %59 = inttoptr i64 %.pre160.pre-phi to double*
  %60 = inttoptr i64 %.pre160.pre-phi to double*
  br label %.lr.ph51.split.us.new

.prol.loopexit124.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit124
  %.pre161 = inttoptr i64 %.pre160.pre-phi to double*
  br label %._crit_edge.us

.lr.ph51.split.us.new:                            ; preds = %.lr.ph51.split.us.new, %.lr.ph51.split.us.new.preheader.new
  %indvars.iv119 = phi i64 [ %indvars.iv119.unr.ph217, %.lr.ph51.split.us.new.preheader.new ], [ %indvars.iv.next120.1.1, %.lr.ph51.split.us.new ]
  %61 = phi double [ %.unr216.ph, %.lr.ph51.split.us.new.preheader.new ], [ %73, %.lr.ph51.split.us.new ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv119, i64 %43
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %59, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120, i64 %43
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %59, align 8
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.1, i64 %43
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %60, align 8
  %indvars.iv.next120.1218 = add nsw i64 %indvars.iv119, 3
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.1218, i64 %43
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %60, align 8
  %indvars.iv.next120.1.1 = add nsw i64 %indvars.iv119, 4
  %exitcond122.1.1 = icmp eq i64 %indvars.iv.next120.1.1, %wide.trip.count121.1
  br i1 %exitcond122.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph51.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph51.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph51.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa206 = phi double* [ %.lcssa206.unr.ph, %.lr.ph51.split.us.new.prol.loopexit ], [ %60, %._crit_edge.us.loopexit.unr-lcssa ]
  %.lcssa205 = phi double [ %.lcssa205.unr.ph, %.lr.ph51.split.us.new.prol.loopexit ], [ %73, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit124.._crit_edge.us_crit_edge
  %sunkaddr67.pre-phi = phi double* [ %.pre161, %.prol.loopexit124.._crit_edge.us_crit_edge ], [ %.lcssa206, %._crit_edge.us.loopexit ]
  %.lcssa88 = phi double [ %.lcssa88.unr.ph, %.prol.loopexit124.._crit_edge.us_crit_edge ], [ %.lcssa205, %._crit_edge.us.loopexit ]
  %74 = fdiv double %.lcssa88, %2
  store double %74, double* %sunkaddr67.pre-phi, align 8
  %75 = add nsw i32 %42, 1
  %76 = icmp slt i32 %75, %0
  br i1 %76, label %.lr.ph51.split.us, label %._crit_edge.us..._crit_edge_crit_edge..lr.ph47_crit_edge_crit_edge

._crit_edge.us..._crit_edge_crit_edge..lr.ph47_crit_edge_crit_edge: ; preds = %._crit_edge.us
  %.pre.pre = load double*, double** %11, align 8
  %.pre155.pre = load double, double* %12, align 8
  br label %.._crit_edge_crit_edge..lr.ph47_crit_edge

.._crit_edge_crit_edge..lr.ph47_crit_edge.loopexit: ; preds = %.lr.ph51.split
  br label %.._crit_edge_crit_edge..lr.ph47_crit_edge

.._crit_edge_crit_edge..lr.ph47_crit_edge:        ; preds = %.._crit_edge_crit_edge..lr.ph47_crit_edge.loopexit, %._crit_edge.us..._crit_edge_crit_edge..lr.ph47_crit_edge_crit_edge, %middle.block
  %.pre155 = phi double [ %.pre155.pre, %._crit_edge.us..._crit_edge_crit_edge..lr.ph47_crit_edge_crit_edge ], [ 1.000000e-01, %middle.block ], [ 1.000000e-01, %.._crit_edge_crit_edge..lr.ph47_crit_edge.loopexit ]
  %.pre = phi double* [ %.pre.pre, %._crit_edge.us..._crit_edge_crit_edge..lr.ph47_crit_edge_crit_edge ], [ %6, %middle.block ], [ %6, %.._crit_edge_crit_edge..lr.ph47_crit_edge.loopexit ]
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.._crit_edge_crit_edge..lr.ph47_crit_edge, %.lr.ph51.split.prol.loopexit
  %77 = phi double [ %.pre155, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ 1.000000e-01, %.lr.ph51.split.prol.loopexit ]
  %78 = phi double* [ %.pre, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ %6, %.lr.ph51.split.prol.loopexit ]
  br i1 %14, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %xtraiter109 = and i32 %1, 1
  %wide.trip.count105.1 = zext i32 %1 to i64
  %79 = icmp eq i32 %xtraiter109, 0
  %80 = icmp eq i32 %1, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %81 = ptrtoint double* %5 to i64
  br label %.lr.ph47.split.us

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter116 = and i32 %0, 1
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  br i1 %lcmp.mod117, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.preheader
  %82 = fdiv double 0.000000e+00, %2
  store double %82, double* %6, align 8
  %83 = load double, double* %78, align 8
  %84 = tail call double @sqrt(double %83) #4
  %85 = fcmp ugt double %84, %77
  %86 = select i1 %85, double %84, double 1.000000e+00
  store double %86, double* %78, align 8
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol
  %indvars.iv112.unr = phi i64 [ 0, %.lr.ph47.split.preheader ], [ 1, %.lr.ph47.split.prol ]
  %.unr118 = phi double* [ %6, %.lr.ph47.split.preheader ], [ %78, %.lr.ph47.split.prol ]
  %87 = icmp eq i32 %0, 1
  br i1 %87, label %._crit_edge.._crit_edge9_crit_edge, label %.lr.ph47.split.preheader137

.lr.ph47.split.preheader137:                      ; preds = %.lr.ph47.split.prol.loopexit
  %88 = fdiv double 0.000000e+00, %2
  %wide.trip.count114.1 = zext i32 %0 to i64
  br label %.lr.ph47.split

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge45.us
  %89 = phi i32 [ %119, %._crit_edge45.us ], [ 0, %.lr.ph47.split.us.preheader ]
  %90 = phi double* [ %78, %._crit_edge45.us ], [ %6, %.lr.ph47.split.us.preheader ]
  %91 = sext i32 %89 to i64
  %92 = getelementptr inbounds double, double* %90, i64 %91
  store double 0.000000e+00, double* %92, align 8
  br i1 %79, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph47.split.us
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %91
  %94 = load double, double* %93, align 8
  %sunkaddr69.prol = shl nsw i64 %91, 3
  %sunkaddr70.prol = add i64 %81, %sunkaddr69.prol
  %sunkaddr71.prol = inttoptr i64 %sunkaddr70.prol to double*
  %95 = load double, double* %sunkaddr71.prol, align 8
  %96 = fsub double %94, %95
  %97 = fmul double %96, %96
  %98 = fadd double %97, 0.000000e+00
  %sunkaddr72.prol = ptrtoint double* %90 to i64
  %sunkaddr74.prol = add i64 %sunkaddr72.prol, %sunkaddr69.prol
  %sunkaddr75.prol = inttoptr i64 %sunkaddr74.prol to double*
  store double %98, double* %sunkaddr75.prol, align 8
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.prol.preheader107, %.lr.ph47.split.us
  %indvars.iv103.unr.ph = phi i64 [ 1, %.prol.preheader107 ], [ 0, %.lr.ph47.split.us ]
  %.unr111.ph = phi double [ %98, %.prol.preheader107 ], [ 0.000000e+00, %.lr.ph47.split.us ]
  %.lcssa87.unr.ph = phi double [ %98, %.prol.preheader107 ], [ undef, %.lr.ph47.split.us ]
  br i1 %80, label %.prol.loopexit108.._crit_edge45.us_crit_edge, label %.lr.ph47.split.us.new.preheader

.prol.loopexit108.._crit_edge45.us_crit_edge:     ; preds = %.prol.loopexit108
  %.pre162 = ptrtoint double* %90 to i64
  %.pre163 = shl nsw i64 %91, 3
  %.pre164 = add i64 %.pre162, %.pre163
  %.pre165 = inttoptr i64 %.pre164 to double*
  br label %._crit_edge45.us

.lr.ph47.split.us.new.preheader:                  ; preds = %.prol.loopexit108
  %sunkaddr69 = shl nsw i64 %91, 3
  %sunkaddr72 = ptrtoint double* %90 to i64
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr69
  %99 = inttoptr i64 %sunkaddr74 to double*
  %sunkaddr173 = add i64 %sunkaddr, %sunkaddr69
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  br label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.lr.ph47.split.us.new.preheader, %.lr.ph47.split.us.new
  %indvars.iv103 = phi i64 [ %indvars.iv.next104.1, %.lr.ph47.split.us.new ], [ %indvars.iv103.unr.ph, %.lr.ph47.split.us.new.preheader ]
  %100 = phi double [ %112, %.lr.ph47.split.us.new ], [ %.unr111.ph, %.lr.ph47.split.us.new.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv103, i64 %91
  %102 = load double, double* %101, align 8
  %103 = load double, double* %sunkaddr174, align 8
  %104 = fsub double %102, %103
  %105 = fmul double %104, %104
  %106 = fadd double %105, %100
  store double %106, double* %99, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next104, i64 %91
  %108 = load double, double* %107, align 8
  %109 = load double, double* %sunkaddr174, align 8
  %110 = fsub double %108, %109
  %111 = fmul double %110, %110
  %112 = fadd double %111, %106
  store double %112, double* %99, align 8
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104.1, %wide.trip.count105.1
  br i1 %exitcond106.1, label %._crit_edge45.us.loopexit, label %.lr.ph47.split.us.new

._crit_edge45.us.loopexit:                        ; preds = %.lr.ph47.split.us.new
  br label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge45.us.loopexit, %.prol.loopexit108.._crit_edge45.us_crit_edge
  %sunkaddr79.pre-phi = phi double* [ %.pre165, %.prol.loopexit108.._crit_edge45.us_crit_edge ], [ %99, %._crit_edge45.us.loopexit ]
  %.lcssa87 = phi double [ %.lcssa87.unr.ph, %.prol.loopexit108.._crit_edge45.us_crit_edge ], [ %112, %._crit_edge45.us.loopexit ]
  %113 = fdiv double %.lcssa87, %2
  store double %113, double* %sunkaddr79.pre-phi, align 8
  %114 = getelementptr inbounds double, double* %78, i64 %91
  %115 = load double, double* %114, align 8
  %116 = tail call double @sqrt(double %115) #4
  %117 = fcmp ugt double %116, %77
  %118 = select i1 %117, double %116, double 1.000000e+00
  store double %118, double* %114, align 8
  %119 = add nsw i32 %89, 1
  %120 = icmp slt i32 %119, %0
  br i1 %120, label %.lr.ph47.split.us, label %._crit_edge.._crit_edge9_crit_edge.loopexit

.lr.ph51.split:                                   ; preds = %.lr.ph51.split.preheader198, %.lr.ph51.split
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.3, %.lr.ph51.split ], [ %indvars.iv128.ph, %.lr.ph51.split.preheader198 ]
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv128
  store double %23, double* %121, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %122 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129
  store double %23, double* %122, align 8
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129.1
  store double %23, double* %123, align 8
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129.2
  store double %23, double* %124, align 8
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %exitcond131.3 = icmp eq i64 %indvars.iv.next129.3, %wide.trip.count130.3
  br i1 %exitcond131.3, label %.._crit_edge_crit_edge..lr.ph47_crit_edge.loopexit, label %.lr.ph51.split, !llvm.loop !6

._crit_edge.._crit_edge9_crit_edge.loopexit:      ; preds = %._crit_edge45.us
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge.loopexit197:   ; preds = %.lr.ph47.split
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge.._crit_edge9_crit_edge.loopexit197, %._crit_edge.._crit_edge9_crit_edge.loopexit, %7, %.lr.ph47.split.prol.loopexit
  %125 = icmp sgt i32 %1, 0
  br i1 %125, label %._crit_edge9.._crit_edge11_crit_edge.lr.ph, label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge11_crit_edge.lr.ph:       ; preds = %._crit_edge.._crit_edge9_crit_edge
  br i1 %13, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %._crit_edge9.._crit_edge12_crit_edge.thread

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %wide.trip.count100 = zext i32 %0 to i64
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge12_crit_edge.thread:      ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %126 = add nsw i32 %0, -1
  br label %._crit_edge12._crit_edge

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %storemerge242.us = phi i32 [ %145, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %127 = phi [1200 x double]* [ %141, %._crit_edge11._crit_edge.us ], [ %3, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %128 = sext i32 %storemerge242.us to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv98 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next99, %._crit_edge11.us ]
  %129 = phi [1200 x double]* [ %127, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %141, %._crit_edge11.us ]
  %130 = getelementptr inbounds double, double* %5, i64 %indvars.iv98
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %129, i64 %128, i64 %indvars.iv98
  %133 = load double, double* %132, align 8
  %134 = fsub double %133, %131
  store double %134, double* %132, align 8
  %135 = load double, double* %8, align 8
  %136 = tail call double @sqrt(double %135) #4
  %137 = load double*, double** %11, align 8
  %138 = getelementptr inbounds double, double* %137, i64 %indvars.iv98
  %139 = load double, double* %138, align 8
  %140 = fmul double %136, %139
  %141 = load [1200 x double]*, [1200 x double]** %9, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %141, i64 %128, i64 %indvars.iv98
  %143 = load double, double* %142, align 8
  %144 = fdiv double %143, %140
  store double %144, double* %142, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %145 = add nsw i32 %storemerge242.us, 1
  %146 = icmp slt i32 %145, %1
  br i1 %146, label %._crit_edge9.._crit_edge11_crit_edge.us, label %._crit_edge9.._crit_edge12_crit_edge.loopexit

.lr.ph47.split:                                   ; preds = %.lr.ph47.split.preheader137, %.lr.ph47.split
  %indvars.iv112 = phi i64 [ %indvars.iv.next113.1, %.lr.ph47.split ], [ %indvars.iv112.unr, %.lr.ph47.split.preheader137 ]
  %147 = phi double* [ %78, %.lr.ph47.split ], [ %.unr118, %.lr.ph47.split.preheader137 ]
  %148 = getelementptr inbounds double, double* %147, i64 %indvars.iv112
  store double %88, double* %148, align 8
  %149 = getelementptr inbounds double, double* %78, i64 %indvars.iv112
  %150 = load double, double* %149, align 8
  %151 = tail call double @sqrt(double %150) #4
  %152 = fcmp ugt double %151, %77
  %153 = select i1 %152, double %151, double 1.000000e+00
  store double %153, double* %149, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %154 = getelementptr inbounds double, double* %78, i64 %indvars.iv.next113
  store double %88, double* %154, align 8
  %155 = tail call double @sqrt(double %88) #4
  %156 = fcmp ugt double %155, %77
  %157 = select i1 %156, double %155, double 1.000000e+00
  store double %157, double* %154, align 8
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113.1, %wide.trip.count114.1
  br i1 %exitcond115.1, label %._crit_edge.._crit_edge9_crit_edge.loopexit197, label %.lr.ph47.split

._crit_edge9.._crit_edge12_crit_edge.loopexit:    ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge12_crit_edge:             ; preds = %._crit_edge9.._crit_edge12_crit_edge.loopexit, %._crit_edge.._crit_edge9_crit_edge
  %158 = add nsw i32 %0, -1
  %159 = icmp sgt i32 %0, 1
  br i1 %159, label %.lr.ph30, label %._crit_edge12._crit_edge

.lr.ph30:                                         ; preds = %._crit_edge9.._crit_edge12_crit_edge
  br i1 %125, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %xtraiter = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %160 = icmp eq i32 %xtraiter, 0
  %161 = icmp eq i32 %1, 1
  br label %.lr.ph30.split.us

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %162 = add i32 %0, -2
  %wide.trip.count93.1 = zext i32 %0 to i64
  %163 = add nsw i64 %wide.trip.count93.1, -2
  br label %.lr.ph30.split

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge12.us
  %164 = phi i32 [ %storemerge425.us, %._crit_edge12.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %165 = phi [1200 x double]* [ %.lcssa.us, %._crit_edge12.us ], [ %4, %.lr.ph30.split.us.preheader ]
  %166 = sext i32 %164 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
  %storemerge425.us = add nsw i32 %164, 1
  %168 = icmp slt i32 %storemerge425.us, %0
  br i1 %168, label %.lr.ph.us.us.preheader, label %._crit_edge12.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph30.split.us
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge24.us.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph30.split.us
  %.lcssa.us = phi [1200 x double]* [ %165, %.lr.ph30.split.us ], [ %174, %._crit_edge12.us.loopexit ]
  %169 = icmp slt i32 %storemerge425.us, %158
  br i1 %169, label %.lr.ph30.split.us, label %._crit_edge12._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge24.us.us
  %storemerge426.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge24.us.us ], [ %storemerge425.us, %.lr.ph.us.us.preheader ]
  %170 = phi [1200 x double]* [ %174, %._crit_edge24.us.us ], [ %165, %.lr.ph.us.us.preheader ]
  %171 = sext i32 %storemerge426.us.us to i64
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %170, i64 %166, i64 %171
  store double 0.000000e+00, double* %172, align 8
  %173 = load [1200 x double]*, [1200 x double]** %9, align 8
  %174 = load [1200 x double]*, [1200 x double]** %10, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %174, i64 %166, i64 %171
  br i1 %160, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 0, i64 %166
  %177 = load double, double* %176, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 0, i64 %171
  %179 = load double, double* %178, align 8
  %180 = fmul double %177, %179
  %181 = load double, double* %175, align 8
  %182 = fadd double %180, %181
  store double %182, double* %175, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %161, label %.prol.loopexit.._crit_edge24.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge24.us.us_crit_edge:     ; preds = %.prol.loopexit
  %.phi.trans.insert = bitcast double* %175 to i64*
  %.pre157 = load i64, i64* %.phi.trans.insert, align 8
  br label %._crit_edge24.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %.pre156 = load double, double* %175, align 8
  br label %.lr.ph.us.us.new

._crit_edge24.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %183 = bitcast double %200 to i64
  br label %._crit_edge24.us.us

._crit_edge24.us.us:                              ; preds = %._crit_edge24.us.us.loopexit, %.prol.loopexit.._crit_edge24.us.us_crit_edge
  %184 = phi i64 [ %.pre157, %.prol.loopexit.._crit_edge24.us.us_crit_edge ], [ %183, %._crit_edge24.us.us.loopexit ]
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %174, i64 %171, i64 %166
  %186 = bitcast double* %185 to i64*
  store i64 %184, i64* %186, align 8
  %storemerge4.us.us = add nsw i32 %storemerge426.us.us, 1
  %187 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %187, label %.lr.ph.us.us, label %._crit_edge12.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %188 = phi double [ %200, %.lr.ph.us.us.new ], [ %.pre156, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %indvars.iv, i64 %166
  %190 = load double, double* %189, align 8
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %indvars.iv, i64 %171
  %192 = load double, double* %191, align 8
  %193 = fmul double %190, %192
  %194 = fadd double %193, %188
  store double %194, double* %175, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %indvars.iv.next, i64 %166
  %196 = load double, double* %195, align 8
  %197 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %indvars.iv.next, i64 %171
  %198 = load double, double* %197, align 8
  %199 = fmul double %196, %198
  %200 = fadd double %199, %194
  store double %200, double* %175, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge24.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph30.split:                                   ; preds = %._crit_edge12, %.lr.ph30.split.preheader
  %indvar = phi i32 [ 0, %.lr.ph30.split.preheader ], [ %storemerge425, %._crit_edge12 ]
  %indvars.iv89 = phi i64 [ 1, %.lr.ph30.split.preheader ], [ %indvars.iv.next90, %._crit_edge12 ]
  %201 = phi [1200 x double]* [ %4, %.lr.ph30.split.preheader ], [ %.lcssa, %._crit_edge12 ]
  %202 = sext i32 %indvar to i64
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %201, i64 %202, i64 %202
  store double 1.000000e+00, double* %203, align 8
  %storemerge425 = add nuw i32 %indvar, 1
  %204 = icmp slt i32 %storemerge425, %0
  br i1 %204, label %.lr.ph28.split.preheader, label %._crit_edge12

.lr.ph28.split.preheader:                         ; preds = %.lr.ph30.split
  %205 = sub i32 %158, %indvar
  %xtraiter94 = and i32 %205, 1
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph28.split.prol.loopexit, label %.lr.ph28.split.prol

.lr.ph28.split.prol:                              ; preds = %.lr.ph28.split.preheader
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %201, i64 %202, i64 %indvars.iv89
  store double 0.000000e+00, double* %206, align 8
  %207 = load [1200 x double]*, [1200 x double]** %10, align 8
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %207, i64 %202, i64 %indvars.iv89
  %209 = bitcast double* %208 to i64*
  %210 = load i64, i64* %209, align 8
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %207, i64 %indvars.iv89, i64 %202
  %212 = bitcast double* %211 to i64*
  store i64 %210, i64* %212, align 8
  %indvars.iv.next92.prol = add nuw nsw i64 %indvars.iv89, 1
  br label %.lr.ph28.split.prol.loopexit

.lr.ph28.split.prol.loopexit:                     ; preds = %.lr.ph28.split.prol, %.lr.ph28.split.preheader
  %indvars.iv91.unr.ph = phi i64 [ %indvars.iv.next92.prol, %.lr.ph28.split.prol ], [ %indvars.iv89, %.lr.ph28.split.preheader ]
  %.unr.ph = phi [1200 x double]* [ %207, %.lr.ph28.split.prol ], [ %201, %.lr.ph28.split.preheader ]
  %.lcssa85.unr.ph = phi [1200 x double]* [ %207, %.lr.ph28.split.prol ], [ undef, %.lr.ph28.split.preheader ]
  %213 = icmp eq i32 %162, %indvar
  br i1 %213, label %._crit_edge12, label %.lr.ph28.split.preheader195

.lr.ph28.split.preheader195:                      ; preds = %.lr.ph28.split.prol.loopexit
  %214 = sub i64 %163, %indvars.iv91.unr.ph
  %215 = lshr i64 %214, 1
  %216 = and i64 %215, 1
  %lcmp.mod = icmp eq i64 %216, 0
  br i1 %lcmp.mod, label %.lr.ph28.split.prol.preheader, label %.lr.ph28.split.prol.loopexit207.unr-lcssa

.lr.ph28.split.prol.preheader:                    ; preds = %.lr.ph28.split.preheader195
  br label %.lr.ph28.split.prol209

.lr.ph28.split.prol209:                           ; preds = %.lr.ph28.split.prol.preheader
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %.unr.ph, i64 %202, i64 %indvars.iv91.unr.ph
  store double 0.000000e+00, double* %217, align 8
  %218 = load [1200 x double]*, [1200 x double]** %10, align 8
  %219 = getelementptr inbounds [1200 x double], [1200 x double]* %218, i64 %202, i64 %indvars.iv91.unr.ph
  %220 = bitcast double* %219 to i64*
  %221 = load i64, i64* %220, align 8
  %222 = getelementptr inbounds [1200 x double], [1200 x double]* %218, i64 %indvars.iv91.unr.ph, i64 %202
  %223 = bitcast double* %222 to i64*
  store i64 %221, i64* %223, align 8
  %indvars.iv.next92.prol210 = add nuw nsw i64 %indvars.iv91.unr.ph, 1
  %224 = getelementptr inbounds [1200 x double], [1200 x double]* %218, i64 %202, i64 %indvars.iv.next92.prol210
  store double 0.000000e+00, double* %224, align 8
  %225 = getelementptr inbounds [1200 x double], [1200 x double]* %218, i64 %indvars.iv.next92.prol210, i64 %202
  %226 = bitcast double* %225 to i64*
  store i64 0, i64* %226, align 8
  %indvars.iv.next92.1.prol = add nsw i64 %indvars.iv91.unr.ph, 2
  br label %.lr.ph28.split.prol.loopexit207.unr-lcssa

.lr.ph28.split.prol.loopexit207.unr-lcssa:        ; preds = %.lr.ph28.split.preheader195, %.lr.ph28.split.prol209
  %.lcssa201.unr.ph = phi [1200 x double]* [ %218, %.lr.ph28.split.prol209 ], [ undef, %.lr.ph28.split.preheader195 ]
  %indvars.iv91.unr.ph211 = phi i64 [ %indvars.iv.next92.1.prol, %.lr.ph28.split.prol209 ], [ %indvars.iv91.unr.ph, %.lr.ph28.split.preheader195 ]
  %.unr.ph212 = phi [1200 x double]* [ %218, %.lr.ph28.split.prol209 ], [ %.unr.ph, %.lr.ph28.split.preheader195 ]
  br label %.lr.ph28.split.prol.loopexit207

.lr.ph28.split.prol.loopexit207:                  ; preds = %.lr.ph28.split.prol.loopexit207.unr-lcssa
  %227 = icmp eq i64 %215, 0
  br i1 %227, label %._crit_edge12.loopexit, label %.lr.ph28.split.preheader195.new

.lr.ph28.split.preheader195.new:                  ; preds = %.lr.ph28.split.prol.loopexit207
  br label %.lr.ph28.split

.lr.ph28.split:                                   ; preds = %.lr.ph28.split, %.lr.ph28.split.preheader195.new
  %indvars.iv91 = phi i64 [ %indvars.iv91.unr.ph211, %.lr.ph28.split.preheader195.new ], [ %indvars.iv.next92.1.1, %.lr.ph28.split ]
  %228 = phi [1200 x double]* [ %.unr.ph212, %.lr.ph28.split.preheader195.new ], [ %240, %.lr.ph28.split ]
  %229 = getelementptr inbounds [1200 x double], [1200 x double]* %228, i64 %202, i64 %indvars.iv91
  store double 0.000000e+00, double* %229, align 8
  %230 = load [1200 x double]*, [1200 x double]** %10, align 8
  %231 = getelementptr inbounds [1200 x double], [1200 x double]* %230, i64 %202, i64 %indvars.iv91
  %232 = bitcast double* %231 to i64*
  %233 = load i64, i64* %232, align 8
  %234 = getelementptr inbounds [1200 x double], [1200 x double]* %230, i64 %indvars.iv91, i64 %202
  %235 = bitcast double* %234 to i64*
  store i64 %233, i64* %235, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %236 = getelementptr inbounds [1200 x double], [1200 x double]* %230, i64 %202, i64 %indvars.iv.next92
  store double 0.000000e+00, double* %236, align 8
  %237 = getelementptr inbounds [1200 x double], [1200 x double]* %230, i64 %indvars.iv.next92, i64 %202
  %238 = bitcast double* %237 to i64*
  store i64 0, i64* %238, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %239 = getelementptr inbounds [1200 x double], [1200 x double]* %230, i64 %202, i64 %indvars.iv.next92.1
  store double 0.000000e+00, double* %239, align 8
  %240 = load [1200 x double]*, [1200 x double]** %10, align 8
  %241 = getelementptr inbounds [1200 x double], [1200 x double]* %240, i64 %202, i64 %indvars.iv.next92.1
  %242 = bitcast double* %241 to i64*
  %243 = load i64, i64* %242, align 8
  %244 = getelementptr inbounds [1200 x double], [1200 x double]* %240, i64 %indvars.iv.next92.1, i64 %202
  %245 = bitcast double* %244 to i64*
  store i64 %243, i64* %245, align 8
  %indvars.iv.next92.1213 = add nsw i64 %indvars.iv91, 3
  %246 = getelementptr inbounds [1200 x double], [1200 x double]* %240, i64 %202, i64 %indvars.iv.next92.1213
  store double 0.000000e+00, double* %246, align 8
  %247 = getelementptr inbounds [1200 x double], [1200 x double]* %240, i64 %indvars.iv.next92.1213, i64 %202
  %248 = bitcast double* %247 to i64*
  store i64 0, i64* %248, align 8
  %indvars.iv.next92.1.1 = add nsw i64 %indvars.iv91, 4
  %exitcond.197.1 = icmp eq i64 %indvars.iv.next92.1.1, %wide.trip.count93.1
  br i1 %exitcond.197.1, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph28.split

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph28.split
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph28.split.prol.loopexit207, %._crit_edge12.loopexit.unr-lcssa
  %.lcssa201 = phi [1200 x double]* [ %.lcssa201.unr.ph, %.lr.ph28.split.prol.loopexit207 ], [ %240, %._crit_edge12.loopexit.unr-lcssa ]
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph28.split.prol.loopexit, %.lr.ph30.split
  %.lcssa = phi [1200 x double]* [ %201, %.lr.ph30.split ], [ %.lcssa85.unr.ph, %.lr.ph28.split.prol.loopexit ], [ %.lcssa201, %._crit_edge12.loopexit ]
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond = icmp eq i32 %storemerge425, %158
  br i1 %exitcond, label %._crit_edge12._crit_edge.loopexit196, label %.lr.ph30.split

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge12.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge.loopexit196:             ; preds = %._crit_edge12
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit196, %._crit_edge12._crit_edge.loopexit, %._crit_edge9.._crit_edge12_crit_edge.thread, %._crit_edge9.._crit_edge12_crit_edge
  %249 = phi i32 [ %158, %._crit_edge9.._crit_edge12_crit_edge ], [ %126, %._crit_edge9.._crit_edge12_crit_edge.thread ], [ %158, %._crit_edge12._crit_edge.loopexit ], [ %158, %._crit_edge12._crit_edge.loopexit196 ]
  %.lcssa19 = phi [1200 x double]* [ %4, %._crit_edge9.._crit_edge12_crit_edge ], [ %4, %._crit_edge9.._crit_edge12_crit_edge.thread ], [ %.lcssa.us, %._crit_edge12._crit_edge.loopexit ], [ %.lcssa, %._crit_edge12._crit_edge.loopexit196 ]
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa19, i64 %250, i64 %250
  store double 1.000000e+00, double* %251, align 8
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
  br i1 %7, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.._crit_edge_crit_edge.us.preheader, %._crit_edge._crit_edge.us
  %storemerge3.us = phi i32 [ %22, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %8 = mul nsw i32 %storemerge3.us, %0
  %9 = sext i32 %storemerge3.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %12 = add i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge2.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %11

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %22 = add nsw i32 %storemerge3.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.._crit_edge_crit_edge.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
