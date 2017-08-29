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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %20
  %3 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %4 = sitofp i32 %3 to double
  %5 = sext i32 %3 to i64
  %6 = insertelement <2 x double> undef, double %4, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv, %5
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %5
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %7, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %._crit_edge
  %21 = add nsw i32 %3, 1
  %22 = icmp slt i32 %21, 1400
  br i1 %22, label %.._crit_edge_crit_edge, label %23

; <label>:23:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph50, label %._crit_edge.._crit_edge4_crit_edge

.lr.ph50:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph50.split.us.preheader, label %.lr.ph50..lr.ph50.split_crit_edge.preheader

.lr.ph50.split.us.preheader:                      ; preds = %.lr.ph50
  %xtraiter126 = and i32 %1, 1
  %lcmp.mod127 = icmp eq i32 %xtraiter126, 0
  %10 = icmp eq i32 %1, 1
  %sunkaddr62 = ptrtoint double* %5 to i64
  %wide.trip.count122.1 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count122.1, -2
  br label %.lr.ph50.split.us

.lr.ph50..lr.ph50.split_crit_edge.preheader:      ; preds = %.lr.ph50
  %12 = add i32 %0, -1
  %xtraiter133 = and i32 %0, 3
  %lcmp.mod134 = icmp eq i32 %xtraiter133, 0
  br i1 %lcmp.mod134, label %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit, label %.lr.ph50..lr.ph50.split_crit_edge.prol.preheader

.lr.ph50..lr.ph50.split_crit_edge.prol.preheader: ; preds = %.lr.ph50..lr.ph50.split_crit_edge.preheader
  %13 = fdiv double 0.000000e+00, %2
  br label %.lr.ph50..lr.ph50.split_crit_edge.prol

.lr.ph50..lr.ph50.split_crit_edge.prol:           ; preds = %.lr.ph50..lr.ph50.split_crit_edge.prol.preheader, %.lr.ph50..lr.ph50.split_crit_edge.prol
  %indvars.iv129.prol = phi i64 [ %indvars.iv.next130.prol, %.lr.ph50..lr.ph50.split_crit_edge.prol ], [ 0, %.lr.ph50..lr.ph50.split_crit_edge.prol.preheader ]
  %prol.iter135 = phi i32 [ %prol.iter135.sub, %.lr.ph50..lr.ph50.split_crit_edge.prol ], [ %xtraiter133, %.lr.ph50..lr.ph50.split_crit_edge.prol.preheader ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv129.prol
  store double %13, double* %14, align 8
  %indvars.iv.next130.prol = add nuw nsw i64 %indvars.iv129.prol, 1
  %prol.iter135.sub = add i32 %prol.iter135, -1
  %prol.iter135.cmp = icmp eq i32 %prol.iter135.sub, 0
  br i1 %prol.iter135.cmp, label %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit.loopexit, label %.lr.ph50..lr.ph50.split_crit_edge.prol, !llvm.loop !1

.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit.loopexit: ; preds = %.lr.ph50..lr.ph50.split_crit_edge.prol
  br label %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit

.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit:  ; preds = %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit.loopexit, %.lr.ph50..lr.ph50.split_crit_edge.preheader
  %indvars.iv129.unr = phi i64 [ 0, %.lr.ph50..lr.ph50.split_crit_edge.preheader ], [ %indvars.iv.next130.prol, %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %12, 3
  br i1 %15, label %.lr.ph43, label %.lr.ph50..lr.ph50.split_crit_edge.preheader140

.lr.ph50..lr.ph50.split_crit_edge.preheader140:   ; preds = %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count131.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count131.3, -4
  %18 = sub i64 %17, %indvars.iv129.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph50..lr.ph50.split_crit_edge.preheader170, label %min.iters.checked

.lr.ph50..lr.ph50.split_crit_edge.preheader170:   ; preds = %middle.block, %min.iters.checked, %.lr.ph50..lr.ph50.split_crit_edge.preheader140
  %indvars.iv129.ph = phi i64 [ %indvars.iv129.unr, %min.iters.checked ], [ %indvars.iv129.unr, %.lr.ph50..lr.ph50.split_crit_edge.preheader140 ], [ %ind.end, %middle.block ]
  br label %.lr.ph50..lr.ph50.split_crit_edge

min.iters.checked:                                ; preds = %.lr.ph50..lr.ph50.split_crit_edge.preheader140
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv129.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph50..lr.ph50.split_crit_edge.preheader170, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert153 = insertelement <2 x double> undef, double %16, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert153, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv129.unr, %25
  %26 = add nsw i64 %offset.idx, 3
  %27 = add i64 %offset.idx, 11
  %28 = getelementptr inbounds double, double* %5, i64 %26
  %29 = getelementptr inbounds double, double* %5, i64 %27
  %30 = getelementptr double, double* %28, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  %32 = getelementptr double, double* %29, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  %index.next = add i64 %index, 4
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph50..lr.ph50.split_crit_edge.preheader170

.lr.ph50.split.us:                                ; preds = %.lr.ph50.split.us.preheader, %._crit_edge46.us
  %storemerge48.us = phi i32 [ %64, %._crit_edge46.us ], [ 0, %.lr.ph50.split.us.preheader ]
  %35 = sext i32 %storemerge48.us to i64
  %36 = getelementptr inbounds double, double* %5, i64 %35
  store double 0.000000e+00, double* %36, align 8
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.lr.ph50.split.us
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %35
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, 0.000000e+00
  %sunkaddr59.prol = shl nsw i64 %35, 3
  %sunkaddr60.prol = add i64 %sunkaddr62, %sunkaddr59.prol
  %sunkaddr61.prol = inttoptr i64 %sunkaddr60.prol to double*
  store double %39, double* %sunkaddr61.prol, align 8
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.lr.ph50.split.us
  %indvars.iv120.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.lr.ph50.split.us ]
  %.unr128.ph = phi double [ %39, %.prol.preheader124 ], [ 0.000000e+00, %.lr.ph50.split.us ]
  %.lcssa83.unr.ph = phi double [ %39, %.prol.preheader124 ], [ undef, %.lr.ph50.split.us ]
  br i1 %10, label %.prol.loopexit125.._crit_edge46.us_crit_edge, label %.lr.ph50.split.us.new.preheader

.prol.loopexit125.._crit_edge46.us_crit_edge:     ; preds = %.prol.loopexit125
  %.pre = shl nsw i64 %35, 3
  %.pre162 = add i64 %sunkaddr62, %.pre
  %.pre163 = inttoptr i64 %.pre162 to double*
  br label %._crit_edge46.us

.lr.ph50.split.us.new.preheader:                  ; preds = %.prol.loopexit125
  %sunkaddr59 = shl nsw i64 %35, 3
  %sunkaddr60 = add i64 %sunkaddr62, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  %40 = sub nsw i64 %11, %indvars.iv120.unr.ph
  %41 = lshr i64 %40, 1
  %42 = and i64 %41, 1
  %lcmp.mod176 = icmp eq i64 %42, 0
  br i1 %lcmp.mod176, label %.lr.ph50.split.us.new.prol.preheader, label %.lr.ph50.split.us.new.prol.loopexit.unr-lcssa

.lr.ph50.split.us.new.prol.preheader:             ; preds = %.lr.ph50.split.us.new.preheader
  br label %.lr.ph50.split.us.new.prol

.lr.ph50.split.us.new.prol:                       ; preds = %.lr.ph50.split.us.new.prol.preheader
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv120.unr.ph, i64 %35
  %44 = load double, double* %43, align 8
  %45 = fadd double %.unr128.ph, %44
  store double %45, double* %sunkaddr61, align 8
  %indvars.iv.next121.prol = add nuw nsw i64 %indvars.iv120.unr.ph, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next121.prol, i64 %35
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  store double %48, double* %sunkaddr61, align 8
  %indvars.iv.next121.1.prol = or i64 %indvars.iv120.unr.ph, 2
  br label %.lr.ph50.split.us.new.prol.loopexit.unr-lcssa

.lr.ph50.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.lr.ph50.split.us.new.preheader, %.lr.ph50.split.us.new.prol
  %.lcssa174.unr.ph = phi double [ %48, %.lr.ph50.split.us.new.prol ], [ undef, %.lr.ph50.split.us.new.preheader ]
  %indvars.iv120.unr.ph177 = phi i64 [ %indvars.iv.next121.1.prol, %.lr.ph50.split.us.new.prol ], [ %indvars.iv120.unr.ph, %.lr.ph50.split.us.new.preheader ]
  %.unr.ph178 = phi double [ %48, %.lr.ph50.split.us.new.prol ], [ %.unr128.ph, %.lr.ph50.split.us.new.preheader ]
  br label %.lr.ph50.split.us.new.prol.loopexit

.lr.ph50.split.us.new.prol.loopexit:              ; preds = %.lr.ph50.split.us.new.prol.loopexit.unr-lcssa
  %49 = icmp eq i64 %41, 0
  br i1 %49, label %._crit_edge46.us.loopexit, label %.lr.ph50.split.us.new.preheader.new

.lr.ph50.split.us.new.preheader.new:              ; preds = %.lr.ph50.split.us.new.prol.loopexit
  br label %.lr.ph50.split.us.new

.lr.ph50.split.us.new:                            ; preds = %.lr.ph50.split.us.new, %.lr.ph50.split.us.new.preheader.new
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr.ph177, %.lr.ph50.split.us.new.preheader.new ], [ %indvars.iv.next121.1.1, %.lr.ph50.split.us.new ]
  %50 = phi double [ %.unr.ph178, %.lr.ph50.split.us.new.preheader.new ], [ %62, %.lr.ph50.split.us.new ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv120, i64 %35
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  store double %53, double* %sunkaddr61, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next121, i64 %35
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  store double %56, double* %sunkaddr61, align 8
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next121.1, i64 %35
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  store double %59, double* %sunkaddr61, align 8
  %indvars.iv.next121.1179 = add nsw i64 %indvars.iv120, 3
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next121.1179, i64 %35
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  store double %62, double* %sunkaddr61, align 8
  %indvars.iv.next121.1.1 = add nsw i64 %indvars.iv120, 4
  %exitcond123.1.1 = icmp eq i64 %indvars.iv.next121.1.1, %wide.trip.count122.1
  br i1 %exitcond123.1.1, label %._crit_edge46.us.loopexit.unr-lcssa, label %.lr.ph50.split.us.new

._crit_edge46.us.loopexit.unr-lcssa:              ; preds = %.lr.ph50.split.us.new
  br label %._crit_edge46.us.loopexit

._crit_edge46.us.loopexit:                        ; preds = %.lr.ph50.split.us.new.prol.loopexit, %._crit_edge46.us.loopexit.unr-lcssa
  %.lcssa174 = phi double [ %.lcssa174.unr.ph, %.lr.ph50.split.us.new.prol.loopexit ], [ %62, %._crit_edge46.us.loopexit.unr-lcssa ]
  br label %._crit_edge46.us

._crit_edge46.us:                                 ; preds = %._crit_edge46.us.loopexit, %.prol.loopexit125.._crit_edge46.us_crit_edge
  %sunkaddr65.pre-phi = phi double* [ %.pre163, %.prol.loopexit125.._crit_edge46.us_crit_edge ], [ %sunkaddr61, %._crit_edge46.us.loopexit ]
  %.lcssa83 = phi double [ %.lcssa83.unr.ph, %.prol.loopexit125.._crit_edge46.us_crit_edge ], [ %.lcssa174, %._crit_edge46.us.loopexit ]
  %63 = fdiv double %.lcssa83, %2
  store double %63, double* %sunkaddr65.pre-phi, align 8
  %64 = add nsw i32 %storemerge48.us, 1
  %65 = icmp slt i32 %64, %0
  br i1 %65, label %.lr.ph50.split.us, label %.._crit_edge_crit_edge.loopexit

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge46.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit171:               ; preds = %.lr.ph50..lr.ph50.split_crit_edge
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit171, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph43, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge4_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge4_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge4_crit_edge

.lr.ph43:                                         ; preds = %.lr.ph50..lr.ph50.split_crit_edge.prol.loopexit, %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph43.split.us.preheader, label %.lr.ph43..lr.ph43.split_crit_edge.preheader

.lr.ph43.split.us.preheader:                      ; preds = %.lr.ph43
  %xtraiter111 = and i32 %1, 1
  %lcmp.mod112 = icmp eq i32 %xtraiter111, 0
  %66 = icmp eq i32 %1, 1
  %sunkaddr74 = ptrtoint double* %6 to i64
  %sunkaddr66 = ptrtoint double* %5 to i64
  %wide.trip.count107.1 = zext i32 %1 to i64
  br label %.lr.ph43.split.us

.lr.ph43..lr.ph43.split_crit_edge.preheader:      ; preds = %.lr.ph43
  %xtraiter118 = and i32 %0, 1
  %lcmp.mod119 = icmp eq i32 %xtraiter118, 0
  br i1 %lcmp.mod119, label %.lr.ph43..lr.ph43.split_crit_edge.prol.loopexit, label %.lr.ph43..lr.ph43.split_crit_edge.prol

.lr.ph43..lr.ph43.split_crit_edge.prol:           ; preds = %.lr.ph43..lr.ph43.split_crit_edge.preheader
  %67 = fdiv double 0.000000e+00, %2
  store double %67, double* %6, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ugt double %68, 1.000000e-01
  %..prol = select i1 %69, double %68, double 1.000000e+00
  store double %..prol, double* %6, align 8
  br label %.lr.ph43..lr.ph43.split_crit_edge.prol.loopexit

.lr.ph43..lr.ph43.split_crit_edge.prol.loopexit:  ; preds = %.lr.ph43..lr.ph43.split_crit_edge.preheader, %.lr.ph43..lr.ph43.split_crit_edge.prol
  %indvars.iv114.unr = phi i64 [ 0, %.lr.ph43..lr.ph43.split_crit_edge.preheader ], [ 1, %.lr.ph43..lr.ph43.split_crit_edge.prol ]
  %70 = icmp eq i32 %0, 1
  br i1 %70, label %._crit_edge.._crit_edge4_crit_edge, label %.lr.ph43..lr.ph43.split_crit_edge.preheader138

.lr.ph43..lr.ph43.split_crit_edge.preheader138:   ; preds = %.lr.ph43..lr.ph43.split_crit_edge.prol.loopexit
  %71 = fdiv double 0.000000e+00, %2
  %wide.trip.count116.1 = zext i32 %0 to i64
  br label %.lr.ph43..lr.ph43.split_crit_edge

.lr.ph43.split.us:                                ; preds = %.lr.ph43.split.us.preheader, %._crit_edge40.us
  %storemerge142.us = phi i32 [ %96, %._crit_edge40.us ], [ 0, %.lr.ph43.split.us.preheader ]
  %72 = sext i32 %storemerge142.us to i64
  %73 = getelementptr inbounds double, double* %6, i64 %72
  store double 0.000000e+00, double* %73, align 8
  br i1 %lcmp.mod112, label %.prol.loopexit110, label %.prol.preheader109

.prol.preheader109:                               ; preds = %.lr.ph43.split.us
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %72
  %75 = load double, double* %74, align 8
  %sunkaddr67.prol = shl nsw i64 %72, 3
  %sunkaddr68.prol = add i64 %sunkaddr66, %sunkaddr67.prol
  %sunkaddr69.prol = inttoptr i64 %sunkaddr68.prol to double*
  %76 = load double, double* %sunkaddr69.prol, align 8
  %77 = fsub double %75, %76
  %78 = fmul double %77, %77
  %79 = fadd double %78, 0.000000e+00
  %sunkaddr72.prol = add i64 %sunkaddr74, %sunkaddr67.prol
  %sunkaddr73.prol = inttoptr i64 %sunkaddr72.prol to double*
  store double %79, double* %sunkaddr73.prol, align 8
  br label %.prol.loopexit110

.prol.loopexit110:                                ; preds = %.prol.preheader109, %.lr.ph43.split.us
  %indvars.iv105.unr.ph = phi i64 [ 1, %.prol.preheader109 ], [ 0, %.lr.ph43.split.us ]
  %.unr113.ph = phi double [ %79, %.prol.preheader109 ], [ 0.000000e+00, %.lr.ph43.split.us ]
  %.lcssa82.unr.ph = phi double [ %79, %.prol.preheader109 ], [ undef, %.lr.ph43.split.us ]
  br i1 %66, label %.prol.loopexit110.._crit_edge40.us_crit_edge, label %.lr.ph43.split.us.new.preheader

.prol.loopexit110.._crit_edge40.us_crit_edge:     ; preds = %.prol.loopexit110
  %.pre164 = shl nsw i64 %72, 3
  %.pre165 = add i64 %sunkaddr74, %.pre164
  %.pre166 = inttoptr i64 %.pre165 to double*
  br label %._crit_edge40.us

.lr.ph43.split.us.new.preheader:                  ; preds = %.prol.loopexit110
  %sunkaddr67 = shl nsw i64 %72, 3
  %sunkaddr68 = add i64 %sunkaddr66, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %sunkaddr72 = add i64 %sunkaddr74, %sunkaddr67
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %.lr.ph43.split.us.new

.lr.ph43.split.us.new:                            ; preds = %.lr.ph43.split.us.new.preheader, %.lr.ph43.split.us.new
  %indvars.iv105 = phi i64 [ %indvars.iv.next106.1, %.lr.ph43.split.us.new ], [ %indvars.iv105.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %80 = phi double [ %92, %.lr.ph43.split.us.new ], [ %.unr113.ph, %.lr.ph43.split.us.new.preheader ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv105, i64 %72
  %82 = load double, double* %81, align 8
  %83 = load double, double* %sunkaddr69, align 8
  %84 = fsub double %82, %83
  %85 = fmul double %84, %84
  %86 = fadd double %80, %85
  store double %86, double* %sunkaddr73, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next106, i64 %72
  %88 = load double, double* %87, align 8
  %89 = load double, double* %sunkaddr69, align 8
  %90 = fsub double %88, %89
  %91 = fmul double %90, %90
  %92 = fadd double %86, %91
  store double %92, double* %sunkaddr73, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next106.1, %wide.trip.count107.1
  br i1 %exitcond108.1, label %._crit_edge40.us.loopexit, label %.lr.ph43.split.us.new

._crit_edge40.us.loopexit:                        ; preds = %.lr.ph43.split.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit110.._crit_edge40.us_crit_edge
  %sunkaddr77.pre-phi = phi double* [ %.pre166, %.prol.loopexit110.._crit_edge40.us_crit_edge ], [ %sunkaddr73, %._crit_edge40.us.loopexit ]
  %.lcssa82 = phi double [ %.lcssa82.unr.ph, %.prol.loopexit110.._crit_edge40.us_crit_edge ], [ %92, %._crit_edge40.us.loopexit ]
  %93 = fdiv double %.lcssa82, %2
  store double %93, double* %sunkaddr77.pre-phi, align 8
  %94 = tail call double @sqrt(double %93) #4
  %95 = fcmp ugt double %94, 1.000000e-01
  %..us = select i1 %95, double %94, double 1.000000e+00
  store double %..us, double* %sunkaddr77.pre-phi, align 8
  %96 = add nsw i32 %storemerge142.us, 1
  %97 = icmp slt i32 %96, %0
  br i1 %97, label %.lr.ph43.split.us, label %._crit_edge.._crit_edge4_crit_edge.loopexit

.lr.ph50..lr.ph50.split_crit_edge:                ; preds = %.lr.ph50..lr.ph50.split_crit_edge.preheader170, %.lr.ph50..lr.ph50.split_crit_edge
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.3, %.lr.ph50..lr.ph50.split_crit_edge ], [ %indvars.iv129.ph, %.lr.ph50..lr.ph50.split_crit_edge.preheader170 ]
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv129
  store double %16, double* %98, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %99 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next130
  store double %16, double* %99, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next130.1
  store double %16, double* %100, align 8
  %indvars.iv.next130.2 = add nsw i64 %indvars.iv129, 3
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next130.2
  store double %16, double* %101, align 8
  %indvars.iv.next130.3 = add nsw i64 %indvars.iv129, 4
  %exitcond132.3 = icmp eq i64 %indvars.iv.next130.3, %wide.trip.count131.3
  br i1 %exitcond132.3, label %.._crit_edge_crit_edge.loopexit171, label %.lr.ph50..lr.ph50.split_crit_edge, !llvm.loop !6

._crit_edge.._crit_edge4_crit_edge.loopexit:      ; preds = %._crit_edge40.us
  br label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge.loopexit169:   ; preds = %.lr.ph43..lr.ph43.split_crit_edge
  br label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge.._crit_edge4_crit_edge.loopexit169, %._crit_edge.._crit_edge4_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge4_crit_edge_crit_edge, %.lr.ph43..lr.ph43.split_crit_edge.prol.loopexit, %7
  %102 = icmp sgt i32 %1, 0
  br i1 %102, label %._crit_edge4.._crit_edge5_crit_edge.lr.ph, label %._crit_edge4.._crit_edge6_crit_edge

._crit_edge4.._crit_edge5_crit_edge.lr.ph:        ; preds = %._crit_edge.._crit_edge4_crit_edge
  br i1 %8, label %._crit_edge4.._crit_edge5_crit_edge.us.preheader, label %._crit_edge4.._crit_edge6_crit_edge.thread

._crit_edge4.._crit_edge5_crit_edge.us.preheader: ; preds = %._crit_edge4.._crit_edge5_crit_edge.lr.ph
  %wide.trip.count102 = zext i32 %0 to i64
  br label %._crit_edge4.._crit_edge5_crit_edge.us

._crit_edge4.._crit_edge6_crit_edge.thread:       ; preds = %._crit_edge4.._crit_edge5_crit_edge.lr.ph
  %103 = add nsw i32 %0, -1
  br label %._crit_edge6._crit_edge

._crit_edge4.._crit_edge5_crit_edge.us:           ; preds = %._crit_edge4.._crit_edge5_crit_edge.us.preheader, %._crit_edge5._crit_edge.us
  %104 = phi i32 [ %117, %._crit_edge5._crit_edge.us ], [ 0, %._crit_edge4.._crit_edge5_crit_edge.us.preheader ]
  %105 = sext i32 %104 to i64
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us, %._crit_edge4.._crit_edge5_crit_edge.us
  %indvars.iv100 = phi i64 [ 0, %._crit_edge4.._crit_edge5_crit_edge.us ], [ %indvars.iv.next101, %._crit_edge5.us ]
  %106 = getelementptr inbounds double, double* %5, i64 %indvars.iv100
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %105, i64 %indvars.iv100
  %109 = load double, double* %108, align 8
  %110 = fsub double %109, %107
  store double %110, double* %108, align 8
  %111 = tail call double @sqrt(double %2) #4
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv100
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = load double, double* %108, align 8
  %116 = fdiv double %115, %114
  store double %116, double* %108, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, %wide.trip.count102
  br i1 %exitcond103, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us

._crit_edge5._crit_edge.us:                       ; preds = %._crit_edge5.us
  %117 = add nsw i32 %104, 1
  %118 = icmp slt i32 %117, %1
  br i1 %118, label %._crit_edge4.._crit_edge5_crit_edge.us, label %._crit_edge4.._crit_edge6_crit_edge.loopexit

.lr.ph43..lr.ph43.split_crit_edge:                ; preds = %.lr.ph43..lr.ph43.split_crit_edge.preheader138, %.lr.ph43..lr.ph43.split_crit_edge
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %.lr.ph43..lr.ph43.split_crit_edge ], [ %indvars.iv114.unr, %.lr.ph43..lr.ph43.split_crit_edge.preheader138 ]
  %119 = getelementptr inbounds double, double* %6, i64 %indvars.iv114
  store double %71, double* %119, align 8
  %120 = tail call double @sqrt(double %71) #4
  %121 = fcmp ugt double %120, 1.000000e-01
  %. = select i1 %121, double %120, double 1.000000e+00
  store double %., double* %119, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %122 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next115
  store double %71, double* %122, align 8
  %123 = tail call double @sqrt(double %71) #4
  %124 = fcmp ugt double %123, 1.000000e-01
  %..1 = select i1 %124, double %123, double 1.000000e+00
  store double %..1, double* %122, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, %wide.trip.count116.1
  br i1 %exitcond117.1, label %._crit_edge.._crit_edge4_crit_edge.loopexit169, label %.lr.ph43..lr.ph43.split_crit_edge

._crit_edge4.._crit_edge6_crit_edge.loopexit:     ; preds = %._crit_edge5._crit_edge.us
  br label %._crit_edge4.._crit_edge6_crit_edge

._crit_edge4.._crit_edge6_crit_edge:              ; preds = %._crit_edge4.._crit_edge6_crit_edge.loopexit, %._crit_edge.._crit_edge4_crit_edge
  %125 = add nsw i32 %0, -1
  %126 = icmp sgt i32 %0, 1
  br i1 %126, label %.lr.ph28, label %._crit_edge6._crit_edge

.lr.ph28:                                         ; preds = %._crit_edge4.._crit_edge6_crit_edge
  br i1 %102, label %.lr.ph28.split.us.preheader, label %.lr.ph28..lr.ph28.split_crit_edge.preheader

.lr.ph28..lr.ph28.split_crit_edge.preheader:      ; preds = %.lr.ph28
  %127 = zext i32 %125 to i64
  %128 = add i32 %0, -2
  %129 = zext i32 %128 to i64
  %130 = sext i32 %0 to i64
  %wide.trip.count91.3 = zext i32 %0 to i64
  br label %.lr.ph28..lr.ph28.split_crit_edge

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %131 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %132 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count86 = zext i32 %125 to i64
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.._crit_edge6_crit_edge.us, %.lr.ph28.split.us.preheader
  %indvars.iv84 = phi i64 [ 0, %.lr.ph28.split.us.preheader ], [ %indvars.iv.next85, %.._crit_edge6_crit_edge.us ]
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv84
  store double 1.000000e+00, double* %133, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %134 = icmp slt i64 %indvars.iv.next85, %131
  br i1 %134, label %.lr.ph.us.us.preheader, label %.._crit_edge6_crit_edge.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph28.split.us
  %135 = trunc i64 %indvars.iv.next85 to i32
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv84
  br label %.lr.ph.us.us

.._crit_edge6_crit_edge.us.loopexit:              ; preds = %._crit_edge23.us.us
  br label %.._crit_edge6_crit_edge.us

.._crit_edge6_crit_edge.us:                       ; preds = %.._crit_edge6_crit_edge.us.loopexit, %.lr.ph28.split.us
  %exitcond = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond, label %._crit_edge6._crit_edge.loopexit, label %.lr.ph28.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge23.us.us
  %storemerge225.us.us = phi i32 [ %145, %._crit_edge23.us.us ], [ %135, %.lr.ph.us.us.preheader ]
  %137 = sext i32 %storemerge225.us.us to i64
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %137
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %136, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %137
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fadd double %142, 0.000000e+00
  store double %143, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %143, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %143, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %132, label %._crit_edge23.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge23.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge23.us.us

._crit_edge23.us.us:                              ; preds = %._crit_edge23.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %159, %._crit_edge23.us.us.loopexit ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %137, i64 %indvars.iv84
  store double %.lcssa, double* %144, align 8
  %145 = add nsw i32 %storemerge225.us.us, 1
  %146 = icmp slt i32 %145, %0
  br i1 %146, label %.lr.ph.us.us, label %.._crit_edge6_crit_edge.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %147 = phi double [ %159, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv84
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %137
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = fadd double %147, %152
  store double %153, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv84
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %137
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge23.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph28..lr.ph28.split_crit_edge:                ; preds = %.._crit_edge6_crit_edge, %.lr.ph28..lr.ph28.split_crit_edge.preheader
  %indvars.iv96 = phi i64 [ 0, %.lr.ph28..lr.ph28.split_crit_edge.preheader ], [ %indvars.iv.next97, %.._crit_edge6_crit_edge ]
  %indvars.iv87 = phi i64 [ 1, %.lr.ph28..lr.ph28.split_crit_edge.preheader ], [ %indvars.iv.next88, %.._crit_edge6_crit_edge ]
  %160 = sub i64 %129, %indvars.iv96
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %162, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %163 = icmp slt i64 %indvars.iv.next97, %130
  br i1 %163, label %.lr.ph27..lr.ph27.split_crit_edge.preheader, label %.._crit_edge6_crit_edge

.lr.ph27..lr.ph27.split_crit_edge.preheader:      ; preds = %.lr.ph28..lr.ph28.split_crit_edge
  %164 = sub i64 %127, %indvars.iv96
  %165 = trunc i64 %164 to i32
  %xtraiter94 = and i32 %165, 3
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit, label %.lr.ph27..lr.ph27.split_crit_edge.prol.preheader

.lr.ph27..lr.ph27.split_crit_edge.prol.preheader: ; preds = %.lr.ph27..lr.ph27.split_crit_edge.preheader
  br label %.lr.ph27..lr.ph27.split_crit_edge.prol

.lr.ph27..lr.ph27.split_crit_edge.prol:           ; preds = %.lr.ph27..lr.ph27.split_crit_edge.prol.preheader, %.lr.ph27..lr.ph27.split_crit_edge.prol
  %indvars.iv89.prol = phi i64 [ %indvars.iv.next90.prol, %.lr.ph27..lr.ph27.split_crit_edge.prol ], [ %indvars.iv87, %.lr.ph27..lr.ph27.split_crit_edge.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph27..lr.ph27.split_crit_edge.prol ], [ %xtraiter94, %.lr.ph27..lr.ph27.split_crit_edge.prol.preheader ]
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv89.prol
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89.prol, i64 %indvars.iv96
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next90.prol = add nuw nsw i64 %indvars.iv89.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit.loopexit, label %.lr.ph27..lr.ph27.split_crit_edge.prol, !llvm.loop !8

.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit.loopexit: ; preds = %.lr.ph27..lr.ph27.split_crit_edge.prol
  br label %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit

.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit:  ; preds = %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit.loopexit, %.lr.ph27..lr.ph27.split_crit_edge.preheader
  %indvars.iv89.unr = phi i64 [ %indvars.iv87, %.lr.ph27..lr.ph27.split_crit_edge.preheader ], [ %indvars.iv.next90.prol, %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit.loopexit ]
  %169 = icmp ult i32 %161, 3
  br i1 %169, label %.._crit_edge6_crit_edge, label %.lr.ph27..lr.ph27.split_crit_edge.preheader167

.lr.ph27..lr.ph27.split_crit_edge.preheader167:   ; preds = %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit
  br label %.lr.ph27..lr.ph27.split_crit_edge

.._crit_edge6_crit_edge.loopexit:                 ; preds = %.lr.ph27..lr.ph27.split_crit_edge
  br label %.._crit_edge6_crit_edge

.._crit_edge6_crit_edge:                          ; preds = %.._crit_edge6_crit_edge.loopexit, %.lr.ph27..lr.ph27.split_crit_edge.prol.loopexit, %.lr.ph28..lr.ph28.split_crit_edge
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, %127
  br i1 %exitcond99, label %._crit_edge6._crit_edge.loopexit168, label %.lr.ph28..lr.ph28.split_crit_edge

.lr.ph27..lr.ph27.split_crit_edge:                ; preds = %.lr.ph27..lr.ph27.split_crit_edge.preheader167, %.lr.ph27..lr.ph27.split_crit_edge
  %indvars.iv89 = phi i64 [ %indvars.iv.next90.3, %.lr.ph27..lr.ph27.split_crit_edge ], [ %indvars.iv89.unr, %.lr.ph27..lr.ph27.split_crit_edge.preheader167 ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv89
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv89, i64 %indvars.iv96
  %172 = bitcast double* %171 to i64*
  store i64 0, i64* %172, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv.next90
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next90, i64 %indvars.iv96
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv.next90.1
  store double 0.000000e+00, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next90.1, i64 %indvars.iv96
  %178 = bitcast double* %177 to i64*
  store i64 0, i64* %178, align 8
  %indvars.iv.next90.2 = add nsw i64 %indvars.iv89, 3
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv.next90.2
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next90.2, i64 %indvars.iv96
  %181 = bitcast double* %180 to i64*
  store i64 0, i64* %181, align 8
  %indvars.iv.next90.3 = add nsw i64 %indvars.iv89, 4
  %exitcond92.3 = icmp eq i64 %indvars.iv.next90.3, %wide.trip.count91.3
  br i1 %exitcond92.3, label %.._crit_edge6_crit_edge.loopexit, label %.lr.ph27..lr.ph27.split_crit_edge

._crit_edge6._crit_edge.loopexit:                 ; preds = %.._crit_edge6_crit_edge.us
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge.loopexit168:              ; preds = %.._crit_edge6_crit_edge
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge:                          ; preds = %._crit_edge6._crit_edge.loopexit168, %._crit_edge6._crit_edge.loopexit, %._crit_edge4.._crit_edge6_crit_edge.thread, %._crit_edge4.._crit_edge6_crit_edge
  %182 = phi i32 [ %103, %._crit_edge4.._crit_edge6_crit_edge.thread ], [ %125, %._crit_edge4.._crit_edge6_crit_edge ], [ %125, %._crit_edge6._crit_edge.loopexit ], [ %125, %._crit_edge6._crit_edge.loopexit168 ]
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %183, i64 %183
  store double 1.000000e+00, double* %184, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.._crit_edge1_crit_edge.us.preheader, label %._crit_edge2

.._crit_edge1_crit_edge.us.preheader:             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge1_crit_edge.us

.._crit_edge1_crit_edge.us:                       ; preds = %.._crit_edge1_crit_edge.us.preheader, %._crit_edge1._crit_edge.us
  %8 = phi i32 [ %23, %._crit_edge1._crit_edge.us ], [ 0, %.._crit_edge1_crit_edge.us.preheader ]
  %9 = mul nsw i32 %8, %0
  %10 = sext i32 %8 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %._crit_edge.us, %.._crit_edge1_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge1_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %13 = add i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %10, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge1._crit_edge.us, label %12

._crit_edge1._crit_edge.us:                       ; preds = %._crit_edge.us
  %23 = add nsw i32 %8, 1
  %24 = icmp slt i32 %23, %0
  br i1 %24, label %.._crit_edge1_crit_edge.us, label %._crit_edge2.loopexit

._crit_edge2.loopexit:                            ; preds = %._crit_edge1._crit_edge.us
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
!8 = distinct !{!8, !2}
