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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double*, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %20
  %storemerge2 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %3 = sitofp i32 %storemerge2 to double
  %4 = sext i32 %storemerge2 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %4
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %4
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %21 = add nsw i32 %storemerge2, 1
  %22 = icmp slt i32 %21, 1400
  br i1 %22, label %._crit_edge, label %23

; <label>:23:                                     ; preds = %20
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
  br i1 %13, label %.lr.ph55, label %._crit_edge10

.lr.ph55:                                         ; preds = %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph55.split.us.preheader, label %.lr.ph55.split.preheader

.lr.ph55.split.us.preheader:                      ; preds = %.lr.ph55
  %xtraiter129 = and i32 %1, 1
  %lcmp.mod130 = icmp eq i32 %xtraiter129, 0
  %15 = icmp eq i32 %1, 1
  %sunkaddr68 = ptrtoint double* %5 to i64
  %wide.trip.count125.1 = zext i32 %1 to i64
  %16 = add nsw i64 %wide.trip.count125.1, -2
  br label %.lr.ph55.split.us

.lr.ph55.split.preheader:                         ; preds = %.lr.ph55
  %17 = add i32 %0, -1
  %xtraiter136 = and i32 %0, 3
  %lcmp.mod137 = icmp eq i32 %xtraiter136, 0
  br i1 %lcmp.mod137, label %.lr.ph55.split.prol.loopexit, label %.lr.ph55.split.prol.preheader

.lr.ph55.split.prol.preheader:                    ; preds = %.lr.ph55.split.preheader
  %18 = fdiv double 0.000000e+00, %2
  br label %.lr.ph55.split.prol

.lr.ph55.split.prol:                              ; preds = %.lr.ph55.split.prol.preheader, %.lr.ph55.split.prol
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.lr.ph55.split.prol ], [ 0, %.lr.ph55.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph55.split.prol ], [ %xtraiter136, %.lr.ph55.split.prol.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv132.prol
  store double %18, double* %19, align 8
  %indvars.iv.next133.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph55.split.prol.loopexit.loopexit, label %.lr.ph55.split.prol, !llvm.loop !1

.lr.ph55.split.prol.loopexit.loopexit:            ; preds = %.lr.ph55.split.prol
  br label %.lr.ph55.split.prol.loopexit

.lr.ph55.split.prol.loopexit:                     ; preds = %.lr.ph55.split.prol.loopexit.loopexit, %.lr.ph55.split.preheader
  %indvars.iv132.unr = phi i64 [ 0, %.lr.ph55.split.preheader ], [ %indvars.iv.next133.prol, %.lr.ph55.split.prol.loopexit.loopexit ]
  %20 = icmp ult i32 %17, 3
  br i1 %20, label %.lr.ph49, label %.lr.ph55.split.preheader143

.lr.ph55.split.preheader143:                      ; preds = %.lr.ph55.split.prol.loopexit
  %21 = fdiv double 0.000000e+00, %2
  %wide.trip.count134.3 = zext i32 %0 to i64
  %22 = add nsw i64 %wide.trip.count134.3, -4
  %23 = sub i64 %22, %indvars.iv132.unr
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %min.iters.check = icmp ult i64 %25, 4
  br i1 %min.iters.check, label %.lr.ph55.split.preheader183, label %min.iters.checked

.lr.ph55.split.preheader183:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph55.split.preheader143
  %indvars.iv132.ph = phi i64 [ %indvars.iv132.unr, %min.iters.checked ], [ %indvars.iv132.unr, %.lr.ph55.split.preheader143 ], [ %ind.end, %middle.block ]
  br label %.lr.ph55.split

min.iters.checked:                                ; preds = %.lr.ph55.split.preheader143
  %n.mod.vf = and i64 %25, 3
  %n.vec = sub nsw i64 %25, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %26 = shl nuw i64 %24, 2
  %27 = add i64 %indvars.iv132.unr, %26
  %28 = add i64 %27, 4
  %29 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %28, %29
  br i1 %cmp.zero, label %.lr.ph55.split.preheader183, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert160 = insertelement <2 x double> undef, double %21, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert160, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %30 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv132.unr, %30
  %31 = add nsw i64 %offset.idx, 3
  %32 = add i64 %offset.idx, 11
  %33 = getelementptr inbounds double, double* %5, i64 %31
  %34 = getelementptr inbounds double, double* %5, i64 %32
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = getelementptr double, double* %34, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %38, align 8
  %index.next = add i64 %index, 4
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge9, label %.lr.ph55.split.preheader183

.lr.ph55.split.us:                                ; preds = %.lr.ph55.split.us.preheader, %._crit_edge52.us
  %40 = phi i32 [ %70, %._crit_edge52.us ], [ 0, %.lr.ph55.split.us.preheader ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double* %5, i64 %41
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod130, label %.prol.loopexit128, label %.prol.preheader127

.prol.preheader127:                               ; preds = %.lr.ph55.split.us
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %41
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, 0.000000e+00
  %sunkaddr65.prol = shl nsw i64 %41, 3
  %sunkaddr66.prol = add i64 %sunkaddr68, %sunkaddr65.prol
  %sunkaddr67.prol = inttoptr i64 %sunkaddr66.prol to double*
  store double %45, double* %sunkaddr67.prol, align 8
  br label %.prol.loopexit128

.prol.loopexit128:                                ; preds = %.prol.preheader127, %.lr.ph55.split.us
  %indvars.iv123.unr.ph = phi i64 [ 1, %.prol.preheader127 ], [ 0, %.lr.ph55.split.us ]
  %.unr131.ph = phi double [ %45, %.prol.preheader127 ], [ 0.000000e+00, %.lr.ph55.split.us ]
  %.lcssa92.unr.ph = phi double [ %45, %.prol.preheader127 ], [ undef, %.lr.ph55.split.us ]
  br i1 %15, label %.prol.loopexit128.._crit_edge52.us_crit_edge, label %.lr.ph55.split.us.new.preheader

.prol.loopexit128.._crit_edge52.us_crit_edge:     ; preds = %.prol.loopexit128
  %.pre172 = shl nsw i64 %41, 3
  %.pre173 = add i64 %sunkaddr68, %.pre172
  %.pre174 = inttoptr i64 %.pre173 to double*
  br label %._crit_edge52.us

.lr.ph55.split.us.new.preheader:                  ; preds = %.prol.loopexit128
  %sunkaddr65 = shl nsw i64 %41, 3
  %sunkaddr66 = add i64 %sunkaddr68, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  %46 = sub nsw i64 %16, %indvars.iv123.unr.ph
  %47 = lshr i64 %46, 1
  %48 = and i64 %47, 1
  %lcmp.mod200 = icmp eq i64 %48, 0
  br i1 %lcmp.mod200, label %.lr.ph55.split.us.new.prol.preheader, label %.lr.ph55.split.us.new.prol.loopexit.unr-lcssa

.lr.ph55.split.us.new.prol.preheader:             ; preds = %.lr.ph55.split.us.new.preheader
  br label %.lr.ph55.split.us.new.prol

.lr.ph55.split.us.new.prol:                       ; preds = %.lr.ph55.split.us.new.prol.preheader
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123.unr.ph, i64 %41
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %.unr131.ph
  store double %51, double* %sunkaddr67, align 8
  %indvars.iv.next124.prol = add nuw nsw i64 %indvars.iv123.unr.ph, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124.prol, i64 %41
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %sunkaddr67, align 8
  %indvars.iv.next124.1.prol = or i64 %indvars.iv123.unr.ph, 2
  br label %.lr.ph55.split.us.new.prol.loopexit.unr-lcssa

.lr.ph55.split.us.new.prol.loopexit.unr-lcssa:    ; preds = %.lr.ph55.split.us.new.preheader, %.lr.ph55.split.us.new.prol
  %.lcssa190.unr.ph = phi double [ %54, %.lr.ph55.split.us.new.prol ], [ undef, %.lr.ph55.split.us.new.preheader ]
  %indvars.iv123.unr.ph202 = phi i64 [ %indvars.iv.next124.1.prol, %.lr.ph55.split.us.new.prol ], [ %indvars.iv123.unr.ph, %.lr.ph55.split.us.new.preheader ]
  %.unr201.ph = phi double [ %54, %.lr.ph55.split.us.new.prol ], [ %.unr131.ph, %.lr.ph55.split.us.new.preheader ]
  br label %.lr.ph55.split.us.new.prol.loopexit

.lr.ph55.split.us.new.prol.loopexit:              ; preds = %.lr.ph55.split.us.new.prol.loopexit.unr-lcssa
  %55 = icmp eq i64 %47, 0
  br i1 %55, label %._crit_edge52.us.loopexit, label %.lr.ph55.split.us.new.preheader.new

.lr.ph55.split.us.new.preheader.new:              ; preds = %.lr.ph55.split.us.new.prol.loopexit
  br label %.lr.ph55.split.us.new

.lr.ph55.split.us.new:                            ; preds = %.lr.ph55.split.us.new, %.lr.ph55.split.us.new.preheader.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph202, %.lr.ph55.split.us.new.preheader.new ], [ %indvars.iv.next124.1.1, %.lr.ph55.split.us.new ]
  %56 = phi double [ %.unr201.ph, %.lr.ph55.split.us.new.preheader.new ], [ %68, %.lr.ph55.split.us.new ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %41
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %sunkaddr67, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124, i64 %41
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %sunkaddr67, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124.1, i64 %41
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %sunkaddr67, align 8
  %indvars.iv.next124.1203 = add nsw i64 %indvars.iv123, 3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next124.1203, i64 %41
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %sunkaddr67, align 8
  %indvars.iv.next124.1.1 = add nsw i64 %indvars.iv123, 4
  %exitcond126.1.1 = icmp eq i64 %indvars.iv.next124.1.1, %wide.trip.count125.1
  br i1 %exitcond126.1.1, label %._crit_edge52.us.loopexit.unr-lcssa, label %.lr.ph55.split.us.new

._crit_edge52.us.loopexit.unr-lcssa:              ; preds = %.lr.ph55.split.us.new
  br label %._crit_edge52.us.loopexit

._crit_edge52.us.loopexit:                        ; preds = %.lr.ph55.split.us.new.prol.loopexit, %._crit_edge52.us.loopexit.unr-lcssa
  %.lcssa190 = phi double [ %.lcssa190.unr.ph, %.lr.ph55.split.us.new.prol.loopexit ], [ %68, %._crit_edge52.us.loopexit.unr-lcssa ]
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit, %.prol.loopexit128.._crit_edge52.us_crit_edge
  %sunkaddr71.pre-phi = phi double* [ %.pre174, %.prol.loopexit128.._crit_edge52.us_crit_edge ], [ %sunkaddr67, %._crit_edge52.us.loopexit ]
  %.lcssa92 = phi double [ %.lcssa92.unr.ph, %.prol.loopexit128.._crit_edge52.us_crit_edge ], [ %.lcssa190, %._crit_edge52.us.loopexit ]
  %69 = fdiv double %.lcssa92, %2
  store double %69, double* %sunkaddr71.pre-phi, align 8
  %70 = add nsw i32 %40, 1
  %71 = icmp slt i32 %70, %0
  br i1 %71, label %.lr.ph55.split.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge52.us
  br label %._crit_edge9

._crit_edge9.loopexit184:                         ; preds = %.lr.ph55.split
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit184, %._crit_edge9.loopexit, %middle.block
  br i1 true, label %._crit_edge9..lr.ph49_crit_edge, label %._crit_edge9.._crit_edge10_crit_edge

._crit_edge9..lr.ph49_crit_edge:                  ; preds = %._crit_edge9
  %.pre = load double*, double** %11, align 8
  %.pre169 = load double, double* %12, align 8
  br label %.lr.ph49

._crit_edge9.._crit_edge10_crit_edge:             ; preds = %._crit_edge9
  br label %._crit_edge10

.lr.ph49:                                         ; preds = %._crit_edge9..lr.ph49_crit_edge, %.lr.ph55.split.prol.loopexit
  %72 = phi double [ %.pre169, %._crit_edge9..lr.ph49_crit_edge ], [ 1.000000e-01, %.lr.ph55.split.prol.loopexit ]
  %73 = phi double* [ %.pre, %._crit_edge9..lr.ph49_crit_edge ], [ %6, %.lr.ph55.split.prol.loopexit ]
  br i1 %14, label %.lr.ph49.split.us.preheader, label %.lr.ph49.split.preheader

.lr.ph49.split.us.preheader:                      ; preds = %.lr.ph49
  %xtraiter113 = and i32 %1, 1
  %lcmp.mod114 = icmp eq i32 %xtraiter113, 0
  %74 = icmp eq i32 %1, 1
  %sunkaddr72 = ptrtoint double* %5 to i64
  %wide.trip.count109.1 = zext i32 %1 to i64
  br label %.lr.ph49.split.us

.lr.ph49.split.preheader:                         ; preds = %.lr.ph49
  %xtraiter120 = and i32 %0, 1
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.lr.ph49.split.prol.loopexit, label %.lr.ph49.split.prol

.lr.ph49.split.prol:                              ; preds = %.lr.ph49.split.preheader
  %75 = fdiv double 0.000000e+00, %2
  store double %75, double* %6, align 8
  %76 = load double, double* %73, align 8
  %77 = tail call double @sqrt(double %76) #4
  %78 = fcmp ugt double %77, %72
  %79 = select i1 %78, double %77, double 1.000000e+00
  store double %79, double* %73, align 8
  br label %.lr.ph49.split.prol.loopexit

.lr.ph49.split.prol.loopexit:                     ; preds = %.lr.ph49.split.preheader, %.lr.ph49.split.prol
  %indvars.iv116.unr = phi i64 [ 0, %.lr.ph49.split.preheader ], [ 1, %.lr.ph49.split.prol ]
  %.unr122 = phi double* [ %6, %.lr.ph49.split.preheader ], [ %73, %.lr.ph49.split.prol ]
  %80 = icmp eq i32 %0, 1
  br i1 %80, label %._crit_edge10, label %.lr.ph49.split.preheader141

.lr.ph49.split.preheader141:                      ; preds = %.lr.ph49.split.prol.loopexit
  %81 = fdiv double 0.000000e+00, %2
  %wide.trip.count118.1 = zext i32 %0 to i64
  br label %.lr.ph49.split

.lr.ph49.split.us:                                ; preds = %.lr.ph49.split.us.preheader, %._crit_edge47.us
  %82 = phi i32 [ %111, %._crit_edge47.us ], [ 0, %.lr.ph49.split.us.preheader ]
  %83 = phi double* [ %73, %._crit_edge47.us ], [ %6, %.lr.ph49.split.us.preheader ]
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds double, double* %83, i64 %84
  store double 0.000000e+00, double* %85, align 8
  br i1 %lcmp.mod114, label %.prol.loopexit112, label %.prol.preheader111

.prol.preheader111:                               ; preds = %.lr.ph49.split.us
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %84
  %87 = load double, double* %86, align 8
  %sunkaddr73.prol = shl nsw i64 %84, 3
  %sunkaddr74.prol = add i64 %sunkaddr72, %sunkaddr73.prol
  %sunkaddr75.prol = inttoptr i64 %sunkaddr74.prol to double*
  %88 = load double, double* %sunkaddr75.prol, align 8
  %89 = fsub double %87, %88
  %90 = fmul double %89, %89
  %91 = fadd double %90, 0.000000e+00
  %sunkaddr76.prol = ptrtoint double* %83 to i64
  %sunkaddr78.prol = add i64 %sunkaddr76.prol, %sunkaddr73.prol
  %sunkaddr79.prol = inttoptr i64 %sunkaddr78.prol to double*
  store double %91, double* %sunkaddr79.prol, align 8
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.prol.preheader111, %.lr.ph49.split.us
  %indvars.iv107.unr.ph = phi i64 [ 1, %.prol.preheader111 ], [ 0, %.lr.ph49.split.us ]
  %.unr115.ph = phi double [ %91, %.prol.preheader111 ], [ 0.000000e+00, %.lr.ph49.split.us ]
  %.lcssa91.unr.ph = phi double [ %91, %.prol.preheader111 ], [ undef, %.lr.ph49.split.us ]
  br i1 %74, label %.prol.loopexit112.._crit_edge47.us_crit_edge, label %.lr.ph49.split.us.new.preheader

.prol.loopexit112.._crit_edge47.us_crit_edge:     ; preds = %.prol.loopexit112
  %.pre175 = ptrtoint double* %83 to i64
  %.pre176 = shl nsw i64 %84, 3
  %.pre177 = add i64 %.pre175, %.pre176
  %.pre178 = inttoptr i64 %.pre177 to double*
  br label %._crit_edge47.us

.lr.ph49.split.us.new.preheader:                  ; preds = %.prol.loopexit112
  %sunkaddr73 = shl nsw i64 %84, 3
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %sunkaddr76 = ptrtoint double* %83 to i64
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr73
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %.lr.ph49.split.us.new

.lr.ph49.split.us.new:                            ; preds = %.lr.ph49.split.us.new.preheader, %.lr.ph49.split.us.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.lr.ph49.split.us.new ], [ %indvars.iv107.unr.ph, %.lr.ph49.split.us.new.preheader ]
  %92 = phi double [ %104, %.lr.ph49.split.us.new ], [ %.unr115.ph, %.lr.ph49.split.us.new.preheader ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv107, i64 %84
  %94 = load double, double* %93, align 8
  %95 = load double, double* %sunkaddr75, align 8
  %96 = fsub double %94, %95
  %97 = fmul double %96, %96
  %98 = fadd double %97, %92
  store double %98, double* %sunkaddr79, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next108, i64 %84
  %100 = load double, double* %99, align 8
  %101 = load double, double* %sunkaddr75, align 8
  %102 = fsub double %100, %101
  %103 = fmul double %102, %102
  %104 = fadd double %103, %98
  store double %104, double* %sunkaddr79, align 8
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next108.1, %wide.trip.count109.1
  br i1 %exitcond110.1, label %._crit_edge47.us.loopexit, label %.lr.ph49.split.us.new

._crit_edge47.us.loopexit:                        ; preds = %.lr.ph49.split.us.new
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %._crit_edge47.us.loopexit, %.prol.loopexit112.._crit_edge47.us_crit_edge
  %sunkaddr83.pre-phi = phi double* [ %.pre178, %.prol.loopexit112.._crit_edge47.us_crit_edge ], [ %sunkaddr79, %._crit_edge47.us.loopexit ]
  %.lcssa91 = phi double [ %.lcssa91.unr.ph, %.prol.loopexit112.._crit_edge47.us_crit_edge ], [ %104, %._crit_edge47.us.loopexit ]
  %105 = fdiv double %.lcssa91, %2
  store double %105, double* %sunkaddr83.pre-phi, align 8
  %106 = getelementptr inbounds double, double* %73, i64 %84
  %107 = load double, double* %106, align 8
  %108 = tail call double @sqrt(double %107) #4
  %109 = fcmp ugt double %108, %72
  %110 = select i1 %109, double %108, double 1.000000e+00
  store double %110, double* %106, align 8
  %111 = add nsw i32 %82, 1
  %112 = icmp slt i32 %111, %0
  br i1 %112, label %.lr.ph49.split.us, label %._crit_edge10.loopexit

.lr.ph55.split:                                   ; preds = %.lr.ph55.split.preheader183, %.lr.ph55.split
  %indvars.iv132 = phi i64 [ %indvars.iv.next133.3, %.lr.ph55.split ], [ %indvars.iv132.ph, %.lr.ph55.split.preheader183 ]
  %113 = getelementptr inbounds double, double* %5, i64 %indvars.iv132
  store double %21, double* %113, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %114 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next133
  store double %21, double* %114, align 8
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %115 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next133.1
  store double %21, double* %115, align 8
  %indvars.iv.next133.2 = add nsw i64 %indvars.iv132, 3
  %116 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next133.2
  store double %21, double* %116, align 8
  %indvars.iv.next133.3 = add nsw i64 %indvars.iv132, 4
  %exitcond135.3 = icmp eq i64 %indvars.iv.next133.3, %wide.trip.count134.3
  br i1 %exitcond135.3, label %._crit_edge9.loopexit184, label %.lr.ph55.split, !llvm.loop !6

._crit_edge10.loopexit:                           ; preds = %._crit_edge47.us
  br label %._crit_edge10

._crit_edge10.loopexit182:                        ; preds = %.lr.ph49.split
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit182, %._crit_edge10.loopexit, %._crit_edge9.._crit_edge10_crit_edge, %7, %.lr.ph49.split.prol.loopexit
  %117 = icmp sgt i32 %1, 0
  br i1 %117, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge10
  br i1 %13, label %._crit_edge11.us.preheader, label %._crit_edge12.thread

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  %wide.trip.count104 = zext i32 %0 to i64
  br label %._crit_edge11.us

._crit_edge12.thread:                             ; preds = %._crit_edge11.lr.ph
  %118 = add nsw i32 %0, -1
  br label %._crit_edge31

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge42.us
  %storemerge244.us = phi i32 [ %138, %._crit_edge42.us ], [ 0, %._crit_edge11.us.preheader ]
  %119 = phi [1200 x double]* [ %134, %._crit_edge42.us ], [ %3, %._crit_edge11.us.preheader ]
  %120 = sext i32 %storemerge244.us to i64
  br label %121

; <label>:121:                                    ; preds = %121, %._crit_edge11.us
  %indvars.iv102 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next103, %121 ]
  %122 = phi [1200 x double]* [ %119, %._crit_edge11.us ], [ %134, %121 ]
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv102
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %122, i64 %120, i64 %indvars.iv102
  %126 = load double, double* %125, align 8
  %127 = fsub double %126, %124
  store double %127, double* %125, align 8
  %128 = load double, double* %8, align 8
  %129 = tail call double @sqrt(double %128) #4
  %130 = load double*, double** %11, align 8
  %131 = getelementptr inbounds double, double* %130, i64 %indvars.iv102
  %132 = load double, double* %131, align 8
  %133 = fmul double %129, %132
  %134 = load [1200 x double]*, [1200 x double]** %9, align 8
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %120, i64 %indvars.iv102
  %136 = load double, double* %135, align 8
  %137 = fdiv double %136, %133
  store double %137, double* %135, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  br i1 %exitcond105, label %._crit_edge42.us, label %121

._crit_edge42.us:                                 ; preds = %121
  %138 = add nsw i32 %storemerge244.us, 1
  %139 = icmp slt i32 %138, %1
  br i1 %139, label %._crit_edge11.us, label %._crit_edge12.loopexit

.lr.ph49.split:                                   ; preds = %.lr.ph49.split.preheader141, %.lr.ph49.split
  %indvars.iv116 = phi i64 [ %indvars.iv.next117.1, %.lr.ph49.split ], [ %indvars.iv116.unr, %.lr.ph49.split.preheader141 ]
  %140 = phi double* [ %73, %.lr.ph49.split ], [ %.unr122, %.lr.ph49.split.preheader141 ]
  %141 = getelementptr inbounds double, double* %140, i64 %indvars.iv116
  store double %81, double* %141, align 8
  %142 = getelementptr inbounds double, double* %73, i64 %indvars.iv116
  %143 = load double, double* %142, align 8
  %144 = tail call double @sqrt(double %143) #4
  %145 = fcmp ugt double %144, %72
  %146 = select i1 %145, double %144, double 1.000000e+00
  store double %146, double* %142, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %147 = getelementptr inbounds double, double* %73, i64 %indvars.iv.next117
  store double %81, double* %147, align 8
  %148 = tail call double @sqrt(double %81) #4
  %149 = fcmp ugt double %148, %72
  %150 = select i1 %149, double %148, double 1.000000e+00
  store double %150, double* %147, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %exitcond119.1 = icmp eq i64 %indvars.iv.next117.1, %wide.trip.count118.1
  br i1 %exitcond119.1, label %._crit_edge10.loopexit182, label %.lr.ph49.split

._crit_edge12.loopexit:                           ; preds = %._crit_edge42.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge10
  %151 = add nsw i32 %0, -1
  %152 = icmp sgt i32 %0, 1
  br i1 %152, label %.lr.ph30, label %._crit_edge31

.lr.ph30:                                         ; preds = %._crit_edge12
  br i1 %117, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %153 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %154 = add i32 %0, -2
  %wide.trip.count97.1 = zext i32 %0 to i64
  %155 = add nsw i64 %wide.trip.count97.1, -2
  br label %.lr.ph30.split

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge29.us-lcssa.us.us
  %156 = phi i32 [ %storemerge425.us, %._crit_edge29.us-lcssa.us.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %157 = phi [1200 x double]* [ %.lcssa.us, %._crit_edge29.us-lcssa.us.us ], [ %4, %.lr.ph30.split.us.preheader ]
  %158 = sext i32 %156 to i64
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %158, i64 %158
  store double 1.000000e+00, double* %159, align 8
  %storemerge425.us = add nsw i32 %156, 1
  %160 = icmp slt i32 %storemerge425.us, %0
  br i1 %160, label %.lr.ph.us.us.preheader, label %._crit_edge29.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph30.split.us
  br label %.lr.ph.us.us

._crit_edge29.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge24.us.us
  br label %._crit_edge29.us-lcssa.us.us

._crit_edge29.us-lcssa.us.us:                     ; preds = %._crit_edge29.us-lcssa.us.us.loopexit, %.lr.ph30.split.us
  %.lcssa.us = phi [1200 x double]* [ %157, %.lr.ph30.split.us ], [ %166, %._crit_edge29.us-lcssa.us.us.loopexit ]
  %161 = icmp slt i32 %storemerge425.us, %151
  br i1 %161, label %.lr.ph30.split.us, label %._crit_edge31.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge24.us.us
  %storemerge426.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge24.us.us ], [ %storemerge425.us, %.lr.ph.us.us.preheader ]
  %162 = phi [1200 x double]* [ %166, %._crit_edge24.us.us ], [ %157, %.lr.ph.us.us.preheader ]
  %163 = sext i32 %storemerge426.us.us to i64
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %162, i64 %158, i64 %163
  store double 0.000000e+00, double* %164, align 8
  %165 = load [1200 x double]*, [1200 x double]** %9, align 8
  %166 = load [1200 x double]*, [1200 x double]** %10, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %166, i64 %158, i64 %163
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 0, i64 %158
  %169 = load double, double* %168, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 0, i64 %163
  %171 = load double, double* %170, align 8
  %172 = fmul double %169, %171
  %173 = load double, double* %167, align 8
  %174 = fadd double %172, %173
  store double %174, double* %167, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %153, label %.prol.loopexit.._crit_edge24.us.us_crit_edge, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit.._crit_edge24.us.us_crit_edge:     ; preds = %.prol.loopexit
  %.phi.trans.insert = bitcast double* %167 to i64*
  %.pre171 = load i64, i64* %.phi.trans.insert, align 8
  br label %._crit_edge24.us.us

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %.pre170 = load double, double* %167, align 8
  br label %.lr.ph.us.us.new

._crit_edge24.us.us:                              ; preds = %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, %.prol.loopexit.._crit_edge24.us.us_crit_edge
  %175 = phi i64 [ %.pre171, %.prol.loopexit.._crit_edge24.us.us_crit_edge ], [ %192, %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %166, i64 %163, i64 %158
  %177 = bitcast double* %176 to i64*
  store i64 %175, i64* %177, align 8
  %storemerge4.us.us = add nsw i32 %storemerge426.us.us, 1
  %178 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %178, label %.lr.ph.us.us, label %._crit_edge29.us-lcssa.us.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new
  %179 = phi double [ %191, %.lr.ph.us.us.new ], [ %.pre170, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %indvars.iv, i64 %158
  %181 = load double, double* %180, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %indvars.iv, i64 %163
  %183 = load double, double* %182, align 8
  %184 = fmul double %181, %183
  %185 = fadd double %184, %179
  store double %185, double* %167, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %indvars.iv.next, i64 %158
  %187 = load double, double* %186, align 8
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %indvars.iv.next, i64 %163
  %189 = load double, double* %188, align 8
  %190 = fmul double %187, %189
  %191 = fadd double %190, %185
  store double %191, double* %167, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge, label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge24.us.us_crit_edge:   ; preds = %.lr.ph.us.us.new
  %192 = bitcast double %191 to i64
  br label %._crit_edge24.us.us

.lr.ph30.split:                                   ; preds = %._crit_edge29, %.lr.ph30.split.preheader
  %indvar = phi i32 [ 0, %.lr.ph30.split.preheader ], [ %storemerge425, %._crit_edge29 ]
  %indvars.iv93 = phi i64 [ 1, %.lr.ph30.split.preheader ], [ %indvars.iv.next94, %._crit_edge29 ]
  %193 = phi [1200 x double]* [ %4, %.lr.ph30.split.preheader ], [ %.lcssa, %._crit_edge29 ]
  %194 = sext i32 %indvar to i64
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %193, i64 %194, i64 %194
  store double 1.000000e+00, double* %195, align 8
  %storemerge425 = add nuw i32 %indvar, 1
  %196 = icmp slt i32 %storemerge425, %0
  br i1 %196, label %.lr.ph28.split.preheader, label %._crit_edge29

.lr.ph28.split.preheader:                         ; preds = %.lr.ph30.split
  %197 = sub i32 %151, %indvar
  %xtraiter98 = and i32 %197, 1
  %lcmp.mod99 = icmp eq i32 %xtraiter98, 0
  br i1 %lcmp.mod99, label %.lr.ph28.split.prol.loopexit, label %.lr.ph28.split.prol

.lr.ph28.split.prol:                              ; preds = %.lr.ph28.split.preheader
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %193, i64 %194, i64 %indvars.iv93
  store double 0.000000e+00, double* %198, align 8
  %199 = load [1200 x double]*, [1200 x double]** %10, align 8
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %194, i64 %indvars.iv93
  %201 = bitcast double* %200 to i64*
  %202 = load i64, i64* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %199, i64 %indvars.iv93, i64 %194
  %204 = bitcast double* %203 to i64*
  store i64 %202, i64* %204, align 8
  %indvars.iv.next96.prol = add nuw nsw i64 %indvars.iv93, 1
  br label %.lr.ph28.split.prol.loopexit

.lr.ph28.split.prol.loopexit:                     ; preds = %.lr.ph28.split.prol, %.lr.ph28.split.preheader
  %indvars.iv95.unr.ph = phi i64 [ %indvars.iv.next96.prol, %.lr.ph28.split.prol ], [ %indvars.iv93, %.lr.ph28.split.preheader ]
  %.unr.ph = phi [1200 x double]* [ %199, %.lr.ph28.split.prol ], [ %193, %.lr.ph28.split.preheader ]
  %.lcssa89.unr.ph = phi [1200 x double]* [ %199, %.lr.ph28.split.prol ], [ undef, %.lr.ph28.split.preheader ]
  %205 = icmp eq i32 %154, %indvar
  br i1 %205, label %._crit_edge29, label %.lr.ph28.split.preheader180

.lr.ph28.split.preheader180:                      ; preds = %.lr.ph28.split.prol.loopexit
  %206 = sub i64 %155, %indvars.iv95.unr.ph
  %207 = lshr i64 %206, 1
  %208 = and i64 %207, 1
  %lcmp.mod193 = icmp eq i64 %208, 0
  br i1 %lcmp.mod193, label %.lr.ph28.split.prol.preheader, label %.lr.ph28.split.prol.loopexit191.unr-lcssa

.lr.ph28.split.prol.preheader:                    ; preds = %.lr.ph28.split.preheader180
  br label %.lr.ph28.split.prol194

.lr.ph28.split.prol194:                           ; preds = %.lr.ph28.split.prol.preheader
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %.unr.ph, i64 %194, i64 %indvars.iv95.unr.ph
  store double 0.000000e+00, double* %209, align 8
  %210 = load [1200 x double]*, [1200 x double]** %10, align 8
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %210, i64 %194, i64 %indvars.iv95.unr.ph
  %212 = bitcast double* %211 to i64*
  %213 = load i64, i64* %212, align 8
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %210, i64 %indvars.iv95.unr.ph, i64 %194
  %215 = bitcast double* %214 to i64*
  store i64 %213, i64* %215, align 8
  %indvars.iv.next96.prol195 = add nuw nsw i64 %indvars.iv95.unr.ph, 1
  %216 = getelementptr inbounds [1200 x double], [1200 x double]* %210, i64 %194, i64 %indvars.iv.next96.prol195
  store double 0.000000e+00, double* %216, align 8
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %210, i64 %indvars.iv.next96.prol195, i64 %194
  %218 = bitcast double* %217 to i64*
  store i64 0, i64* %218, align 8
  %indvars.iv.next96.1.prol = add nsw i64 %indvars.iv95.unr.ph, 2
  br label %.lr.ph28.split.prol.loopexit191.unr-lcssa

.lr.ph28.split.prol.loopexit191.unr-lcssa:        ; preds = %.lr.ph28.split.preheader180, %.lr.ph28.split.prol194
  %.lcssa187.unr.ph = phi [1200 x double]* [ %210, %.lr.ph28.split.prol194 ], [ undef, %.lr.ph28.split.preheader180 ]
  %indvars.iv95.unr.ph196 = phi i64 [ %indvars.iv.next96.1.prol, %.lr.ph28.split.prol194 ], [ %indvars.iv95.unr.ph, %.lr.ph28.split.preheader180 ]
  %.unr.ph197 = phi [1200 x double]* [ %210, %.lr.ph28.split.prol194 ], [ %.unr.ph, %.lr.ph28.split.preheader180 ]
  br label %.lr.ph28.split.prol.loopexit191

.lr.ph28.split.prol.loopexit191:                  ; preds = %.lr.ph28.split.prol.loopexit191.unr-lcssa
  %219 = icmp eq i64 %207, 0
  br i1 %219, label %._crit_edge29.loopexit, label %.lr.ph28.split.preheader180.new

.lr.ph28.split.preheader180.new:                  ; preds = %.lr.ph28.split.prol.loopexit191
  br label %.lr.ph28.split

.lr.ph28.split:                                   ; preds = %.lr.ph28.split, %.lr.ph28.split.preheader180.new
  %indvars.iv95 = phi i64 [ %indvars.iv95.unr.ph196, %.lr.ph28.split.preheader180.new ], [ %indvars.iv.next96.1.1, %.lr.ph28.split ]
  %220 = phi [1200 x double]* [ %.unr.ph197, %.lr.ph28.split.preheader180.new ], [ %232, %.lr.ph28.split ]
  %221 = getelementptr inbounds [1200 x double], [1200 x double]* %220, i64 %194, i64 %indvars.iv95
  store double 0.000000e+00, double* %221, align 8
  %222 = load [1200 x double]*, [1200 x double]** %10, align 8
  %223 = getelementptr inbounds [1200 x double], [1200 x double]* %222, i64 %194, i64 %indvars.iv95
  %224 = bitcast double* %223 to i64*
  %225 = load i64, i64* %224, align 8
  %226 = getelementptr inbounds [1200 x double], [1200 x double]* %222, i64 %indvars.iv95, i64 %194
  %227 = bitcast double* %226 to i64*
  store i64 %225, i64* %227, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %228 = getelementptr inbounds [1200 x double], [1200 x double]* %222, i64 %194, i64 %indvars.iv.next96
  store double 0.000000e+00, double* %228, align 8
  %229 = getelementptr inbounds [1200 x double], [1200 x double]* %222, i64 %indvars.iv.next96, i64 %194
  %230 = bitcast double* %229 to i64*
  store i64 0, i64* %230, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %231 = getelementptr inbounds [1200 x double], [1200 x double]* %222, i64 %194, i64 %indvars.iv.next96.1
  store double 0.000000e+00, double* %231, align 8
  %232 = load [1200 x double]*, [1200 x double]** %10, align 8
  %233 = getelementptr inbounds [1200 x double], [1200 x double]* %232, i64 %194, i64 %indvars.iv.next96.1
  %234 = bitcast double* %233 to i64*
  %235 = load i64, i64* %234, align 8
  %236 = getelementptr inbounds [1200 x double], [1200 x double]* %232, i64 %indvars.iv.next96.1, i64 %194
  %237 = bitcast double* %236 to i64*
  store i64 %235, i64* %237, align 8
  %indvars.iv.next96.1198 = add nsw i64 %indvars.iv95, 3
  %238 = getelementptr inbounds [1200 x double], [1200 x double]* %232, i64 %194, i64 %indvars.iv.next96.1198
  store double 0.000000e+00, double* %238, align 8
  %239 = getelementptr inbounds [1200 x double], [1200 x double]* %232, i64 %indvars.iv.next96.1198, i64 %194
  %240 = bitcast double* %239 to i64*
  store i64 0, i64* %240, align 8
  %indvars.iv.next96.1.1 = add nsw i64 %indvars.iv95, 4
  %exitcond.1101.1 = icmp eq i64 %indvars.iv.next96.1.1, %wide.trip.count97.1
  br i1 %exitcond.1101.1, label %._crit_edge29.loopexit.unr-lcssa, label %.lr.ph28.split

._crit_edge29.loopexit.unr-lcssa:                 ; preds = %.lr.ph28.split
  br label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %.lr.ph28.split.prol.loopexit191, %._crit_edge29.loopexit.unr-lcssa
  %.lcssa187 = phi [1200 x double]* [ %.lcssa187.unr.ph, %.lr.ph28.split.prol.loopexit191 ], [ %232, %._crit_edge29.loopexit.unr-lcssa ]
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.lr.ph28.split.prol.loopexit, %.lr.ph30.split
  %.lcssa = phi [1200 x double]* [ %193, %.lr.ph30.split ], [ %.lcssa89.unr.ph, %.lr.ph28.split.prol.loopexit ], [ %.lcssa187, %._crit_edge29.loopexit ]
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i32 %storemerge425, %151
  br i1 %exitcond, label %._crit_edge31.loopexit181, label %.lr.ph30.split

._crit_edge31.loopexit:                           ; preds = %._crit_edge29.us-lcssa.us.us
  br label %._crit_edge31

._crit_edge31.loopexit181:                        ; preds = %._crit_edge29
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit181, %._crit_edge31.loopexit, %._crit_edge12.thread, %._crit_edge12
  %241 = phi i32 [ %151, %._crit_edge12 ], [ %118, %._crit_edge12.thread ], [ %151, %._crit_edge31.loopexit ], [ %151, %._crit_edge31.loopexit181 ]
  %.lcssa19 = phi [1200 x double]* [ %4, %._crit_edge12 ], [ %4, %._crit_edge12.thread ], [ %.lcssa.us, %._crit_edge31.loopexit ], [ %.lcssa, %._crit_edge31.loopexit181 ]
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [1200 x double], [1200 x double]* %.lcssa19, i64 %242, i64 %242
  store double 1.000000e+00, double* %243, align 8
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
  br i1 %7, label %._crit_edge2.us.preheader, label %._crit_edge5

._crit_edge2.us.preheader:                        ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us.preheader, %._crit_edge3.us
  %storemerge4.us = phi i32 [ %22, %._crit_edge3.us ], [ 0, %._crit_edge2.us.preheader ]
  %8 = mul nsw i32 %storemerge4.us, %0
  %9 = sext i32 %storemerge4.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %11

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %22 = add nsw i32 %storemerge4.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %._crit_edge2.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
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
