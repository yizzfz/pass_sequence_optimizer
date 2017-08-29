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

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %19 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
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
  br i1 %14, label %.lr.ph51..lr.ph51.split.us_crit_edge, label %.lr.ph51.split.preheader

.lr.ph51..lr.ph51.split.us_crit_edge:             ; preds = %.lr.ph51
  %xtraiter125 = and i32 %1, 1
  %lcmp.mod126 = icmp eq i32 %xtraiter125, 0
  %15 = icmp eq i32 %1, 1
  %sunkaddr64 = ptrtoint double* %5 to i64
  %wide.trip.count121.1 = zext i32 %1 to i64
  %16 = add nsw i64 %wide.trip.count121.1, -2
  %wide.trip.count176 = zext i32 %0 to i64
  br label %.lr.ph51.split.us

.lr.ph51.split.preheader:                         ; preds = %.lr.ph51
  %17 = add i32 %0, -1
  %xtraiter132 = and i32 %0, 3
  %lcmp.mod133 = icmp eq i32 %xtraiter132, 0
  br i1 %lcmp.mod133, label %.lr.ph51.split.prol.loopexit, label %.lr.ph51.split.preheader..lr.ph51.split.prol_crit_edge

.lr.ph51.split.preheader..lr.ph51.split.prol_crit_edge: ; preds = %.lr.ph51.split.preheader
  %18 = fdiv double 0.000000e+00, %2
  %19 = add nsw i32 %xtraiter132, -1
  %20 = zext i32 %19 to i64
  br label %.lr.ph51.split.prol

.lr.ph51.split.prol:                              ; preds = %.lr.ph51.split.prol, %.lr.ph51.split.preheader..lr.ph51.split.prol_crit_edge
  %indvars.iv128.prol = phi i64 [ 0, %.lr.ph51.split.preheader..lr.ph51.split.prol_crit_edge ], [ %indvars.iv.next129.prol, %.lr.ph51.split.prol ]
  %prol.iter = phi i32 [ %xtraiter132, %.lr.ph51.split.preheader..lr.ph51.split.prol_crit_edge ], [ %prol.iter.sub, %.lr.ph51.split.prol ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv128.prol
  store double %18, double* %21, align 8
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph51.split.prol.loopexit.loopexit, label %.lr.ph51.split.prol, !llvm.loop !1

.lr.ph51.split.prol.loopexit.loopexit:            ; preds = %.lr.ph51.split.prol
  %22 = add nuw nsw i64 %20, 1
  br label %.lr.ph51.split.prol.loopexit

.lr.ph51.split.prol.loopexit:                     ; preds = %.lr.ph51.split.prol.loopexit.loopexit, %.lr.ph51.split.preheader
  %indvars.iv128.unr = phi i64 [ 0, %.lr.ph51.split.preheader ], [ %22, %.lr.ph51.split.prol.loopexit.loopexit ]
  %23 = icmp ult i32 %17, 3
  br i1 %23, label %.lr.ph47, label %.lr.ph51.split.prol.loopexit..lr.ph51.split_crit_edge

.lr.ph51.split.prol.loopexit..lr.ph51.split_crit_edge: ; preds = %.lr.ph51.split.prol.loopexit
  %24 = fdiv double 0.000000e+00, %2
  %wide.trip.count130.3 = zext i32 %0 to i64
  %25 = add nsw i64 %wide.trip.count130.3, -4
  %26 = sub nsw i64 %25, %indvars.iv128.unr
  %27 = lshr i64 %26, 2
  %28 = add nuw nsw i64 %27, 1
  %min.iters.check = icmp ult i64 %28, 4
  br i1 %min.iters.check, label %.lr.ph51.split.preheader192, label %min.iters.checked

.lr.ph51.split.preheader192:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph51.split.prol.loopexit..lr.ph51.split_crit_edge
  %indvars.iv128.ph = phi i64 [ %indvars.iv128.unr, %min.iters.checked ], [ %indvars.iv128.unr, %.lr.ph51.split.prol.loopexit..lr.ph51.split_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph51.split

min.iters.checked:                                ; preds = %.lr.ph51.split.prol.loopexit..lr.ph51.split_crit_edge
  %n.mod.vf = and i64 %28, 3
  %n.vec = sub nsw i64 %28, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %29 = shl nuw i64 %27, 2
  %30 = add i64 %indvars.iv128.unr, %29
  %31 = add i64 %30, 4
  %32 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %31, %32
  br i1 %cmp.zero, label %.lr.ph51.split.preheader192, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert150 = insertelement <2 x double> undef, double %24, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert150, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %33 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv128.unr, %33
  %34 = add nsw i64 %offset.idx, 3
  %35 = add i64 %offset.idx, 11
  %36 = getelementptr inbounds double, double* %5, i64 %34
  %37 = getelementptr inbounds double, double* %5, i64 %35
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = getelementptr double, double* %37, i64 -3
  %41 = bitcast double* %40 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %39, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %41, align 8
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph51.split.preheader192

.lr.ph51.split.us:                                ; preds = %._crit_edge.us, %.lr.ph51..lr.ph51.split.us_crit_edge
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge.us ], [ 0, %.lr.ph51..lr.ph51.split.us_crit_edge ]
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv174
  store double 0.000000e+00, double* %43, align 8
  br i1 %lcmp.mod126, label %.prol.loopexit124, label %.prol.preheader123

.prol.preheader123:                               ; preds = %.lr.ph51.split.us
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv174
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, 0.000000e+00
  %sunkaddr61.prol = shl nsw i64 %indvars.iv174, 3
  %sunkaddr62.prol = add i64 %sunkaddr64, %sunkaddr61.prol
  %sunkaddr63.prol = inttoptr i64 %sunkaddr62.prol to double*
  store double %46, double* %sunkaddr63.prol, align 8
  br label %.prol.loopexit124

.prol.loopexit124:                                ; preds = %.lr.ph51.split.us, %.prol.preheader123
  %indvars.iv119.unr.ph = phi i64 [ 1, %.prol.preheader123 ], [ 0, %.lr.ph51.split.us ]
  %.unr127.ph = phi double [ %46, %.prol.preheader123 ], [ 0.000000e+00, %.lr.ph51.split.us ]
  %.lcssa88.unr.ph = phi double [ %46, %.prol.preheader123 ], [ undef, %.lr.ph51.split.us ]
  br i1 %15, label %.prol.loopexit124.._crit_edge.us_crit_edge, label %.prol.loopexit124..lr.ph51.split.us.new_crit_edge

.prol.loopexit124.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit124
  %.pre181 = shl nsw i64 %indvars.iv174, 3
  %.pre182 = add i64 %sunkaddr64, %.pre181
  %.pre183 = inttoptr i64 %.pre182 to double*
  br label %._crit_edge.us

.prol.loopexit124..lr.ph51.split.us.new_crit_edge: ; preds = %.prol.loopexit124
  %sunkaddr61 = shl nsw i64 %indvars.iv174, 3
  %sunkaddr62 = add i64 %sunkaddr64, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %47 = sub nsw i64 %16, %indvars.iv119.unr.ph
  %48 = lshr i64 %47, 1
  %49 = and i64 %48, 1
  %lcmp.mod209 = icmp eq i64 %49, 0
  br i1 %lcmp.mod209, label %.lr.ph51.split.us.new.prol.preheader, label %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa

.lr.ph51.split.us.new.prol.preheader:             ; preds = %.prol.loopexit124..lr.ph51.split.us.new_crit_edge
  br label %.lr.ph51.split.us.new.prol

.lr.ph51.split.us.new.prol:                       ; preds = %.lr.ph51.split.us.new.prol.preheader
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv119.unr.ph, i64 %indvars.iv174
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %.unr127.ph
  store double %52, double* %sunkaddr63, align 8
  %indvars.iv.next120.prol = add nuw nsw i64 %indvars.iv119.unr.ph, 1
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.prol, i64 %indvars.iv174
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %sunkaddr63, align 8
  %indvars.iv.next120.1.prol = or i64 %indvars.iv119.unr.ph, 2
  br label %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa

.lr.ph51.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.prol.loopexit124..lr.ph51.split.us.new_crit_edge, %.lr.ph51.split.us.new.prol
  %.lcssa199.unr.ph = phi double [ %55, %.lr.ph51.split.us.new.prol ], [ undef, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge ]
  %indvars.iv119.unr.ph211 = phi i64 [ %indvars.iv.next120.1.prol, %.lr.ph51.split.us.new.prol ], [ %indvars.iv119.unr.ph, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge ]
  %.unr210.ph = phi double [ %55, %.lr.ph51.split.us.new.prol ], [ %.unr127.ph, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge ]
  br label %.lr.ph51.split.us.new.prol.loopexit

.lr.ph51.split.us.new.prol.loopexit:              ; preds = %.lr.ph51.split.us.new.prol.loopexit.unr-lcssa
  %56 = icmp eq i64 %48, 0
  br i1 %56, label %._crit_edge.us.loopexit, label %.prol.loopexit124..lr.ph51.split.us.new_crit_edge.new

.prol.loopexit124..lr.ph51.split.us.new_crit_edge.new: ; preds = %.lr.ph51.split.us.new.prol.loopexit
  br label %.lr.ph51.split.us.new

.lr.ph51.split.us.new:                            ; preds = %.lr.ph51.split.us.new, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge.new
  %indvars.iv119 = phi i64 [ %indvars.iv119.unr.ph211, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge.new ], [ %indvars.iv.next120.1.1, %.lr.ph51.split.us.new ]
  %57 = phi double [ %.unr210.ph, %.prol.loopexit124..lr.ph51.split.us.new_crit_edge.new ], [ %69, %.lr.ph51.split.us.new ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv119, i64 %indvars.iv174
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %sunkaddr63, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120, i64 %indvars.iv174
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %sunkaddr63, align 8
  %indvars.iv.next120.1 = add nuw nsw i64 %indvars.iv119, 2
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.1, i64 %indvars.iv174
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %sunkaddr63, align 8
  %indvars.iv.next120.1212 = add nsw i64 %indvars.iv119, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next120.1212, i64 %indvars.iv174
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %sunkaddr63, align 8
  %indvars.iv.next120.1.1 = add nsw i64 %indvars.iv119, 4
  %exitcond122.1.1 = icmp eq i64 %indvars.iv.next120.1.1, %wide.trip.count121.1
  br i1 %exitcond122.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph51.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph51.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph51.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.lr.ph51.split.us.new.prol.loopexit ], [ %69, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit124.._crit_edge.us_crit_edge
  %sunkaddr67.pre-phi = phi double* [ %.pre183, %.prol.loopexit124.._crit_edge.us_crit_edge ], [ %sunkaddr63, %._crit_edge.us.loopexit ]
  %.lcssa88 = phi double [ %.lcssa88.unr.ph, %.prol.loopexit124.._crit_edge.us_crit_edge ], [ %.lcssa199, %._crit_edge.us.loopexit ]
  %70 = fdiv double %.lcssa88, %2
  store double %70, double* %sunkaddr67.pre-phi, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, %wide.trip.count176
  br i1 %exitcond177, label %.._crit_edge_crit_edge.loopexit, label %.lr.ph51.split.us

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit193:               ; preds = %.lr.ph51.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit193, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.._crit_edge_crit_edge..lr.ph47_crit_edge, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge

.._crit_edge_crit_edge..lr.ph47_crit_edge:        ; preds = %.._crit_edge_crit_edge
  %.pre = load double*, double** %11, align 8
  %.pre178 = load double, double* %12, align 8
  br label %.lr.ph47

.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge9_crit_edge

.lr.ph47:                                         ; preds = %.._crit_edge_crit_edge..lr.ph47_crit_edge, %.lr.ph51.split.prol.loopexit
  %71 = phi double [ %.pre178, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ 1.000000e-01, %.lr.ph51.split.prol.loopexit ]
  %72 = phi double* [ %.pre, %.._crit_edge_crit_edge..lr.ph47_crit_edge ], [ %6, %.lr.ph51.split.prol.loopexit ]
  br i1 %14, label %.lr.ph47..lr.ph47.split.us_crit_edge, label %.lr.ph47.split.preheader

.lr.ph47..lr.ph47.split.us_crit_edge:             ; preds = %.lr.ph47
  %xtraiter109 = and i32 %1, 1
  %lcmp.mod110 = icmp eq i32 %xtraiter109, 0
  %73 = icmp eq i32 %1, 1
  %sunkaddr68 = ptrtoint double* %5 to i64
  %wide.trip.count105.1 = zext i32 %1 to i64
  %74 = sext i32 %0 to i64
  br label %.lr.ph47.split.us

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter116 = and i32 %0, 1
  %lcmp.mod117 = icmp eq i32 %xtraiter116, 0
  br i1 %lcmp.mod117, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.preheader
  %75 = fdiv double 0.000000e+00, %2
  store double %75, double* %6, align 8
  %76 = load double, double* %72, align 8
  %77 = tail call double @sqrt(double %76) #4
  %78 = fcmp ugt double %77, %71
  %79 = select i1 %78, double %77, double 1.000000e+00
  store double %79, double* %72, align 8
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol
  %indvars.iv112.unr = phi i64 [ 1, %.lr.ph47.split.prol ], [ 0, %.lr.ph47.split.preheader ]
  %.unr118 = phi double* [ %72, %.lr.ph47.split.prol ], [ %6, %.lr.ph47.split.preheader ]
  %80 = icmp eq i32 %0, 1
  br i1 %80, label %._crit_edge.._crit_edge9_crit_edge, label %.lr.ph47.split.prol.loopexit..lr.ph47.split_crit_edge

.lr.ph47.split.prol.loopexit..lr.ph47.split_crit_edge: ; preds = %.lr.ph47.split.prol.loopexit
  %81 = fdiv double 0.000000e+00, %2
  %wide.trip.count114.1 = zext i32 %0 to i64
  br label %.lr.ph47.split

.lr.ph47.split.us:                                ; preds = %._crit_edge45.us, %.lr.ph47..lr.ph47.split.us_crit_edge
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge45.us ], [ 0, %.lr.ph47..lr.ph47.split.us_crit_edge ]
  %82 = phi double* [ %72, %._crit_edge45.us ], [ %6, %.lr.ph47..lr.ph47.split.us_crit_edge ]
  %83 = getelementptr inbounds double, double* %82, i64 %indvars.iv172
  store double 0.000000e+00, double* %83, align 8
  br i1 %lcmp.mod110, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph47.split.us
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv172
  %85 = load double, double* %84, align 8
  %sunkaddr69.prol = shl nsw i64 %indvars.iv172, 3
  %sunkaddr70.prol = add i64 %sunkaddr68, %sunkaddr69.prol
  %sunkaddr71.prol = inttoptr i64 %sunkaddr70.prol to double*
  %86 = load double, double* %sunkaddr71.prol, align 8
  %87 = fsub double %85, %86
  %88 = fmul double %87, %87
  %89 = fadd double %88, 0.000000e+00
  %sunkaddr72.prol = ptrtoint double* %82 to i64
  %sunkaddr74.prol = add i64 %sunkaddr72.prol, %sunkaddr69.prol
  %sunkaddr75.prol = inttoptr i64 %sunkaddr74.prol to double*
  store double %89, double* %sunkaddr75.prol, align 8
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.lr.ph47.split.us, %.prol.preheader107
  %indvars.iv103.unr.ph = phi i64 [ 1, %.prol.preheader107 ], [ 0, %.lr.ph47.split.us ]
  %.unr111.ph = phi double [ %89, %.prol.preheader107 ], [ 0.000000e+00, %.lr.ph47.split.us ]
  %.lcssa87.unr.ph = phi double [ %89, %.prol.preheader107 ], [ undef, %.lr.ph47.split.us ]
  br i1 %73, label %.prol.loopexit108.._crit_edge45.us_crit_edge, label %.prol.loopexit108..lr.ph47.split.us.new_crit_edge

.prol.loopexit108.._crit_edge45.us_crit_edge:     ; preds = %.prol.loopexit108
  %.pre184 = ptrtoint double* %82 to i64
  %.pre185 = shl nsw i64 %indvars.iv172, 3
  %.pre186 = add i64 %.pre184, %.pre185
  %.pre187 = inttoptr i64 %.pre186 to double*
  br label %._crit_edge45.us

.prol.loopexit108..lr.ph47.split.us.new_crit_edge: ; preds = %.prol.loopexit108
  %sunkaddr69 = shl nsw i64 %indvars.iv172, 3
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  %sunkaddr72 = ptrtoint double* %82 to i64
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr69
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  br label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.lr.ph47.split.us.new, %.prol.loopexit108..lr.ph47.split.us.new_crit_edge
  %indvars.iv103 = phi i64 [ %indvars.iv103.unr.ph, %.prol.loopexit108..lr.ph47.split.us.new_crit_edge ], [ %indvars.iv.next104.1, %.lr.ph47.split.us.new ]
  %90 = phi double [ %.unr111.ph, %.prol.loopexit108..lr.ph47.split.us.new_crit_edge ], [ %102, %.lr.ph47.split.us.new ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv103, i64 %indvars.iv172
  %92 = load double, double* %91, align 8
  %93 = load double, double* %sunkaddr71, align 8
  %94 = fsub double %92, %93
  %95 = fmul double %94, %94
  %96 = fadd double %95, %90
  store double %96, double* %sunkaddr75, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next104, i64 %indvars.iv172
  %98 = load double, double* %97, align 8
  %99 = load double, double* %sunkaddr71, align 8
  %100 = fsub double %98, %99
  %101 = fmul double %100, %100
  %102 = fadd double %101, %96
  store double %102, double* %sunkaddr75, align 8
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104.1, %wide.trip.count105.1
  br i1 %exitcond106.1, label %._crit_edge45.us.loopexit, label %.lr.ph47.split.us.new

._crit_edge45.us.loopexit:                        ; preds = %.lr.ph47.split.us.new
  br label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge45.us.loopexit, %.prol.loopexit108.._crit_edge45.us_crit_edge
  %sunkaddr79.pre-phi = phi double* [ %.pre187, %.prol.loopexit108.._crit_edge45.us_crit_edge ], [ %sunkaddr75, %._crit_edge45.us.loopexit ]
  %.lcssa87 = phi double [ %.lcssa87.unr.ph, %.prol.loopexit108.._crit_edge45.us_crit_edge ], [ %102, %._crit_edge45.us.loopexit ]
  %103 = fdiv double %.lcssa87, %2
  store double %103, double* %sunkaddr79.pre-phi, align 8
  %104 = getelementptr inbounds double, double* %72, i64 %indvars.iv172
  %105 = load double, double* %104, align 8
  %106 = tail call double @sqrt(double %105) #4
  %107 = fcmp ugt double %106, %71
  %108 = select i1 %107, double %106, double 1.000000e+00
  store double %108, double* %104, align 8
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172, 1
  %109 = icmp slt i64 %indvars.iv.next173, %74
  br i1 %109, label %.lr.ph47.split.us, label %._crit_edge.._crit_edge9_crit_edge.loopexit

.lr.ph51.split:                                   ; preds = %.lr.ph51.split.preheader192, %.lr.ph51.split
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.3, %.lr.ph51.split ], [ %indvars.iv128.ph, %.lr.ph51.split.preheader192 ]
  %110 = getelementptr inbounds double, double* %5, i64 %indvars.iv128
  store double %24, double* %110, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %111 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129
  store double %24, double* %111, align 8
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129.1
  store double %24, double* %112, align 8
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %113 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next129.2
  store double %24, double* %113, align 8
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %exitcond131.3 = icmp eq i64 %indvars.iv.next129.3, %wide.trip.count130.3
  br i1 %exitcond131.3, label %.._crit_edge_crit_edge.loopexit193, label %.lr.ph51.split, !llvm.loop !6

._crit_edge.._crit_edge9_crit_edge.loopexit:      ; preds = %._crit_edge45.us
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge.loopexit191:   ; preds = %.lr.ph47.split
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge.._crit_edge9_crit_edge.loopexit191, %._crit_edge.._crit_edge9_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge, %.lr.ph47.split.prol.loopexit, %7
  %114 = icmp sgt i32 %1, 0
  br i1 %114, label %._crit_edge9.._crit_edge11_crit_edge.lr.ph, label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge11_crit_edge.lr.ph:       ; preds = %._crit_edge.._crit_edge9_crit_edge
  br i1 %13, label %._crit_edge9.._crit_edge11_crit_edge.lr.ph.._crit_edge9.._crit_edge11_crit_edge.us_crit_edge, label %._crit_edge9.._crit_edge12_crit_edge.thread

._crit_edge9.._crit_edge11_crit_edge.lr.ph.._crit_edge9.._crit_edge11_crit_edge.us_crit_edge: ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %wide.trip.count100 = zext i32 %0 to i64
  %wide.trip.count170 = zext i32 %1 to i64
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge12_crit_edge.thread:      ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %115 = add nsw i32 %0, -1
  br label %._crit_edge12._crit_edge

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge11._crit_edge.us, %._crit_edge9.._crit_edge11_crit_edge.lr.ph.._crit_edge9.._crit_edge11_crit_edge.us_crit_edge
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.lr.ph.._crit_edge9.._crit_edge11_crit_edge.us_crit_edge ]
  %116 = phi [1200 x double]* [ %129, %._crit_edge11._crit_edge.us ], [ %3, %._crit_edge9.._crit_edge11_crit_edge.lr.ph.._crit_edge9.._crit_edge11_crit_edge.us_crit_edge ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv98 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next99, %._crit_edge11.us ]
  %117 = phi [1200 x double]* [ %116, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %129, %._crit_edge11.us ]
  %118 = getelementptr inbounds double, double* %5, i64 %indvars.iv98
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %117, i64 %indvars.iv168, i64 %indvars.iv98
  %121 = load double, double* %120, align 8
  %122 = fsub double %121, %119
  store double %122, double* %120, align 8
  %123 = load double, double* %8, align 8
  %124 = tail call double @sqrt(double %123) #4
  %125 = load double*, double** %11, align 8
  %126 = getelementptr inbounds double, double* %125, i64 %indvars.iv98
  %127 = load double, double* %126, align 8
  %128 = fmul double %124, %127
  %129 = load [1200 x double]*, [1200 x double]** %9, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %129, i64 %indvars.iv168, i64 %indvars.iv98
  %131 = load double, double* %130, align 8
  %132 = fdiv double %131, %128
  store double %132, double* %130, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond171 = icmp eq i64 %indvars.iv.next169, %wide.trip.count170
  br i1 %exitcond171, label %._crit_edge9.._crit_edge12_crit_edge.loopexit, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.prol.loopexit..lr.ph47.split_crit_edge
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr, %.lr.ph47.split.prol.loopexit..lr.ph47.split_crit_edge ], [ %indvars.iv.next113.1, %.lr.ph47.split ]
  %133 = phi double* [ %.unr118, %.lr.ph47.split.prol.loopexit..lr.ph47.split_crit_edge ], [ %72, %.lr.ph47.split ]
  %134 = getelementptr inbounds double, double* %133, i64 %indvars.iv112
  store double %81, double* %134, align 8
  %135 = getelementptr inbounds double, double* %72, i64 %indvars.iv112
  %136 = load double, double* %135, align 8
  %137 = tail call double @sqrt(double %136) #4
  %138 = fcmp ugt double %137, %71
  %139 = select i1 %138, double %137, double 1.000000e+00
  store double %139, double* %135, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %140 = getelementptr inbounds double, double* %72, i64 %indvars.iv.next113
  store double %81, double* %140, align 8
  %141 = tail call double @sqrt(double %81) #4
  %142 = fcmp ugt double %141, %71
  %143 = select i1 %142, double %141, double 1.000000e+00
  store double %143, double* %140, align 8
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113.1, %wide.trip.count114.1
  br i1 %exitcond115.1, label %._crit_edge.._crit_edge9_crit_edge.loopexit191, label %.lr.ph47.split

._crit_edge9.._crit_edge12_crit_edge.loopexit:    ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge12_crit_edge:             ; preds = %._crit_edge9.._crit_edge12_crit_edge.loopexit, %._crit_edge.._crit_edge9_crit_edge
  %144 = add nsw i32 %0, -1
  %145 = icmp sgt i32 %0, 1
  br i1 %145, label %.lr.ph30, label %._crit_edge12._crit_edge

.lr.ph30:                                         ; preds = %._crit_edge9.._crit_edge12_crit_edge
  br i1 %114, label %.lr.ph30..lr.ph30.split.us_crit_edge, label %.lr.ph30.split.preheader

.lr.ph30..lr.ph30.split.us_crit_edge:             ; preds = %.lr.ph30
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %146 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %147 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count166 = zext i32 %144 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %148 = add i32 %0, -2
  %wide.trip.count93.1 = zext i32 %0 to i64
  %149 = add nsw i64 %wide.trip.count93.1, -2
  br label %.lr.ph30.split

.lr.ph30.split.us:                                ; preds = %._crit_edge12.us, %.lr.ph30..lr.ph30.split.us_crit_edge
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %._crit_edge12.us ], [ 0, %.lr.ph30..lr.ph30.split.us_crit_edge ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge12.us ], [ 1, %.lr.ph30..lr.ph30.split.us_crit_edge ]
  %150 = phi [1200 x double]* [ %.lcssa.us, %._crit_edge12.us ], [ %4, %.lr.ph30..lr.ph30.split.us_crit_edge ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %150, i64 %indvars.iv164, i64 %indvars.iv164
  store double 1.000000e+00, double* %151, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %152 = icmp slt i64 %indvars.iv.next165, %147
  br i1 %152, label %.lr.ph.us.us.preheader, label %._crit_edge12.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph30.split.us
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge24.us.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph30.split.us
  %.lcssa.us = phi [1200 x double]* [ %150, %.lr.ph30.split.us ], [ %156, %._crit_edge12.us.loopexit ]
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge12._crit_edge.loopexit, label %.lr.ph30.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge24.us.us
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge24.us.us ], [ %indvars.iv159, %.lr.ph.us.us.preheader ]
  %153 = phi [1200 x double]* [ %156, %._crit_edge24.us.us ], [ %150, %.lr.ph.us.us.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %153, i64 %indvars.iv164, i64 %indvars.iv161
  store double 0.000000e+00, double* %154, align 8
  %155 = load [1200 x double]*, [1200 x double]** %9, align 8
  %156 = load [1200 x double]*, [1200 x double]** %10, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %156, i64 %indvars.iv164, i64 %indvars.iv161
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 0, i64 %indvars.iv164
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 0, i64 %indvars.iv161
  %161 = load double, double* %160, align 8
  %162 = fmul double %159, %161
  %163 = load double, double* %157, align 8
  %164 = fadd double %162, %163
  store double %164, double* %157, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %146, label %.prol.loopexit.._crit_edge24.us.us_crit_edge, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit.._crit_edge24.us.us_crit_edge:     ; preds = %.prol.loopexit
  %.phi.trans.insert = bitcast double* %157 to i64*
  %.pre180 = load i64, i64* %.phi.trans.insert, align 8
  br label %._crit_edge24.us.us

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %.pre179 = load double, double* %157, align 8
  br label %.lr.ph.us.us.new

._crit_edge24.us.us:                              ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, %.prol.loopexit.._crit_edge24.us.us_crit_edge
  %165 = phi i64 [ %.pre180, %.prol.loopexit.._crit_edge24.us.us_crit_edge ], [ %181, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %156, i64 %indvars.iv161, i64 %indvars.iv164
  %167 = bitcast double* %166 to i64*
  store i64 %165, i64* %167, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next162, %wide.trip.count
  br i1 %exitcond163, label %._crit_edge12.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new
  %168 = phi double [ %180, %.lr.ph.us.us.new ], [ %.pre179, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv, i64 %indvars.iv164
  %170 = load double, double* %169, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv, i64 %indvars.iv161
  %172 = load double, double* %171, align 8
  %173 = fmul double %170, %172
  %174 = fadd double %173, %168
  store double %174, double* %157, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv.next, i64 %indvars.iv164
  %176 = load double, double* %175, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %indvars.iv.next, i64 %indvars.iv161
  %178 = load double, double* %177, align 8
  %179 = fmul double %176, %178
  %180 = fadd double %179, %174
  store double %180, double* %157, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %181 = bitcast double %180 to i64
  br label %._crit_edge24.us.us

.lr.ph30.split:                                   ; preds = %._crit_edge12, %.lr.ph30.split.preheader
  %indvar = phi i32 [ 0, %.lr.ph30.split.preheader ], [ %storemerge425, %._crit_edge12 ]
  %indvars.iv89 = phi i64 [ 1, %.lr.ph30.split.preheader ], [ %indvars.iv.next90, %._crit_edge12 ]
  %182 = phi [1200 x double]* [ %4, %.lr.ph30.split.preheader ], [ %.lcssa, %._crit_edge12 ]
  %183 = sext i32 %indvar to i64
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %182, i64 %183, i64 %183
  store double 1.000000e+00, double* %184, align 8
  %storemerge425 = add nuw i32 %indvar, 1
  %185 = icmp slt i32 %storemerge425, %0
  br i1 %185, label %.lr.ph28.split.preheader, label %._crit_edge12

.lr.ph28.split.preheader:                         ; preds = %.lr.ph30.split
  %186 = sub i32 %144, %indvar
  %xtraiter94 = and i32 %186, 1
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph28.split.prol.loopexit, label %.lr.ph28.split.prol

.lr.ph28.split.prol:                              ; preds = %.lr.ph28.split.preheader
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %182, i64 %183, i64 %indvars.iv89
  store double 0.000000e+00, double* %187, align 8
  %188 = load [1200 x double]*, [1200 x double]** %10, align 8
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %188, i64 %183, i64 %indvars.iv89
  %190 = bitcast double* %189 to i64*
  %191 = load i64, i64* %190, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %188, i64 %indvars.iv89, i64 %183
  %193 = bitcast double* %192 to i64*
  store i64 %191, i64* %193, align 8
  %indvars.iv.next92.prol = add nuw nsw i64 %indvars.iv89, 1
  br label %.lr.ph28.split.prol.loopexit

.lr.ph28.split.prol.loopexit:                     ; preds = %.lr.ph28.split.preheader, %.lr.ph28.split.prol
  %indvars.iv91.unr.ph = phi i64 [ %indvars.iv.next92.prol, %.lr.ph28.split.prol ], [ %indvars.iv89, %.lr.ph28.split.preheader ]
  %.unr.ph = phi [1200 x double]* [ %188, %.lr.ph28.split.prol ], [ %182, %.lr.ph28.split.preheader ]
  %.lcssa85.unr.ph = phi [1200 x double]* [ %188, %.lr.ph28.split.prol ], [ undef, %.lr.ph28.split.preheader ]
  %194 = icmp eq i32 %148, %indvar
  br i1 %194, label %._crit_edge12, label %.lr.ph28.split.preheader189

.lr.ph28.split.preheader189:                      ; preds = %.lr.ph28.split.prol.loopexit
  %195 = sub i64 %149, %indvars.iv91.unr.ph
  %196 = lshr i64 %195, 1
  %197 = and i64 %196, 1
  %lcmp.mod202 = icmp eq i64 %197, 0
  br i1 %lcmp.mod202, label %.lr.ph28.split.prol.preheader, label %.lr.ph28.split.prol.loopexit200.unr-lcssa

.lr.ph28.split.prol.preheader:                    ; preds = %.lr.ph28.split.preheader189
  br label %.lr.ph28.split.prol203

.lr.ph28.split.prol203:                           ; preds = %.lr.ph28.split.prol.preheader
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %.unr.ph, i64 %183, i64 %indvars.iv91.unr.ph
  store double 0.000000e+00, double* %198, align 8
  %199 = load [1200 x double]*, [1200 x double]** %10, align 8
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %183, i64 %indvars.iv91.unr.ph
  %201 = bitcast double* %200 to i64*
  %202 = load i64, i64* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %indvars.iv91.unr.ph, i64 %183
  %204 = bitcast double* %203 to i64*
  store i64 %202, i64* %204, align 8
  %indvars.iv.next92.prol204 = add nuw nsw i64 %indvars.iv91.unr.ph, 1
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %183, i64 %indvars.iv.next92.prol204
  store double 0.000000e+00, double* %205, align 8
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %indvars.iv.next92.prol204, i64 %183
  %207 = bitcast double* %206 to i64*
  store i64 0, i64* %207, align 8
  %indvars.iv.next92.1.prol = add nsw i64 %indvars.iv91.unr.ph, 2
  br label %.lr.ph28.split.prol.loopexit200.unr-lcssa

.lr.ph28.split.prol.loopexit200.unr-lcssa:        ; preds = %.lr.ph28.split.preheader189, %.lr.ph28.split.prol203
  %.lcssa196.unr.ph = phi [1200 x double]* [ %199, %.lr.ph28.split.prol203 ], [ undef, %.lr.ph28.split.preheader189 ]
  %indvars.iv91.unr.ph205 = phi i64 [ %indvars.iv.next92.1.prol, %.lr.ph28.split.prol203 ], [ %indvars.iv91.unr.ph, %.lr.ph28.split.preheader189 ]
  %.unr.ph206 = phi [1200 x double]* [ %199, %.lr.ph28.split.prol203 ], [ %.unr.ph, %.lr.ph28.split.preheader189 ]
  br label %.lr.ph28.split.prol.loopexit200

.lr.ph28.split.prol.loopexit200:                  ; preds = %.lr.ph28.split.prol.loopexit200.unr-lcssa
  %208 = icmp eq i64 %196, 0
  br i1 %208, label %._crit_edge12.loopexit, label %.lr.ph28.split.preheader189.new

.lr.ph28.split.preheader189.new:                  ; preds = %.lr.ph28.split.prol.loopexit200
  br label %.lr.ph28.split

.lr.ph28.split:                                   ; preds = %.lr.ph28.split, %.lr.ph28.split.preheader189.new
  %indvars.iv91 = phi i64 [ %indvars.iv91.unr.ph205, %.lr.ph28.split.preheader189.new ], [ %indvars.iv.next92.1.1, %.lr.ph28.split ]
  %209 = phi [1200 x double]* [ %.unr.ph206, %.lr.ph28.split.preheader189.new ], [ %221, %.lr.ph28.split ]
  %210 = getelementptr inbounds [1200 x double], [1200 x double]* %209, i64 %183, i64 %indvars.iv91
  store double 0.000000e+00, double* %210, align 8
  %211 = load [1200 x double]*, [1200 x double]** %10, align 8
  %212 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %183, i64 %indvars.iv91
  %213 = bitcast double* %212 to i64*
  %214 = load i64, i64* %213, align 8
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %indvars.iv91, i64 %183
  %216 = bitcast double* %215 to i64*
  store i64 %214, i64* %216, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %183, i64 %indvars.iv.next92
  store double 0.000000e+00, double* %217, align 8
  %218 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %indvars.iv.next92, i64 %183
  %219 = bitcast double* %218 to i64*
  store i64 0, i64* %219, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %220 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %183, i64 %indvars.iv.next92.1
  store double 0.000000e+00, double* %220, align 8
  %221 = load [1200 x double]*, [1200 x double]** %10, align 8
  %222 = getelementptr inbounds [1200 x double], [1200 x double]* %221, i64 %183, i64 %indvars.iv.next92.1
  %223 = bitcast double* %222 to i64*
  %224 = load i64, i64* %223, align 8
  %225 = getelementptr inbounds [1200 x double], [1200 x double]* %221, i64 %indvars.iv.next92.1, i64 %183
  %226 = bitcast double* %225 to i64*
  store i64 %224, i64* %226, align 8
  %indvars.iv.next92.1207 = add nsw i64 %indvars.iv91, 3
  %227 = getelementptr inbounds [1200 x double], [1200 x double]* %221, i64 %183, i64 %indvars.iv.next92.1207
  store double 0.000000e+00, double* %227, align 8
  %228 = getelementptr inbounds [1200 x double], [1200 x double]* %221, i64 %indvars.iv.next92.1207, i64 %183
  %229 = bitcast double* %228 to i64*
  store i64 0, i64* %229, align 8
  %indvars.iv.next92.1.1 = add nsw i64 %indvars.iv91, 4
  %exitcond.197.1 = icmp eq i64 %indvars.iv.next92.1.1, %wide.trip.count93.1
  br i1 %exitcond.197.1, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph28.split

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph28.split
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph28.split.prol.loopexit200, %._crit_edge12.loopexit.unr-lcssa
  %.lcssa196 = phi [1200 x double]* [ %.lcssa196.unr.ph, %.lr.ph28.split.prol.loopexit200 ], [ %221, %._crit_edge12.loopexit.unr-lcssa ]
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph28.split.prol.loopexit, %.lr.ph30.split
  %.lcssa = phi [1200 x double]* [ %182, %.lr.ph30.split ], [ %.lcssa85.unr.ph, %.lr.ph28.split.prol.loopexit ], [ %.lcssa196, %._crit_edge12.loopexit ]
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond = icmp eq i32 %storemerge425, %144
  br i1 %exitcond, label %._crit_edge12._crit_edge.loopexit190, label %.lr.ph30.split

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge12.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge.loopexit190:             ; preds = %._crit_edge12
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit190, %._crit_edge12._crit_edge.loopexit, %._crit_edge9.._crit_edge12_crit_edge, %._crit_edge9.._crit_edge12_crit_edge.thread
  %230 = phi i32 [ %115, %._crit_edge9.._crit_edge12_crit_edge.thread ], [ %144, %._crit_edge9.._crit_edge12_crit_edge ], [ %144, %._crit_edge12._crit_edge.loopexit ], [ %144, %._crit_edge12._crit_edge.loopexit190 ]
  %.lcssa19 = phi [1200 x double]* [ %4, %._crit_edge9.._crit_edge12_crit_edge.thread ], [ %4, %._crit_edge9.._crit_edge12_crit_edge ], [ %.lcssa.us, %._crit_edge12._crit_edge.loopexit ], [ %.lcssa, %._crit_edge12._crit_edge.loopexit190 ]
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa19, i64 %231, i64 %231
  store double 1.000000e+00, double* %232, align 8
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
  br i1 %7, label %..._crit_edge_crit_edge.us_crit_edge, label %._crit_edge

..._crit_edge_crit_edge.us_crit_edge:             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %..._crit_edge_crit_edge.us_crit_edge
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge._crit_edge.us ], [ 0, %..._crit_edge_crit_edge.us_crit_edge ]
  %8 = trunc i64 %indvars.iv4 to i32
  %9 = mul nsw i32 %8, %0
  %10 = zext i32 %9 to i64
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %._crit_edge2.us._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge2.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, %wide.trip.count
  br i1 %exitcond7, label %._crit_edge.loopexit, label %.._crit_edge_crit_edge.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
