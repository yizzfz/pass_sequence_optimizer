; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge11

.preheader5.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.lr.ph..preheader3.lr.ph_crit_edge

.preheader5.lr.ph..preheader3.lr.ph_crit_edge:    ; preds = %.preheader5.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader3.lr.ph

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next36, %._crit_edge14.us ]
  %12 = add i64 %indvars.iv35, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40, %.preheader5.us
  %indvars.iv32 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next33, %._crit_edge40 ]
  %14 = add nuw nsw i64 %indvars.iv32, %indvars.iv35
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv35, i64 %indvars.iv32
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv32 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv32
  store double %24, double* %25, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, %11
  br i1 %exitcond34, label %._crit_edge14.us, label %._crit_edge40

._crit_edge14.us:                                 ; preds = %._crit_edge40
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %.preheader4, label %.preheader5.us

.preheader4:                                      ; preds = %._crit_edge14.us
  br i1 true, label %.preheader3.lr.ph, label %.preheader4.._crit_edge11_crit_edge

.preheader4.._crit_edge11_crit_edge:              ; preds = %.preheader4
  br label %._crit_edge11

.preheader3.lr.ph:                                ; preds = %.preheader5.lr.ph..preheader3.lr.ph_crit_edge, %.preheader4
  %wide.trip.count30.pre-phi = phi i64 [ %.pre, %.preheader5.lr.ph..preheader3.lr.ph_crit_edge ], [ %wide.trip.count37, %.preheader4 ]
  %26 = sext i32 %0 to i64
  %27 = add nsw i64 %wide.trip.count30.pre-phi, -1
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader3.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i64 [ 1, %.preheader3.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %28 = sub i64 %27, %indvars.iv28
  %29 = add i64 %28, -4
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %32 = and i64 %indvars.iv28, 1
  %lcmp.mod = icmp eq i64 %32, 0
  br i1 %lcmp.mod, label %._crit_edge41.prol.preheader, label %._crit_edge41.prol.loopexit.unr-lcssa

._crit_edge41.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge41.prol

._crit_edge41.prol:                               ; preds = %._crit_edge41.prol.preheader
  %33 = trunc i64 %indvars.iv28 to i32
  %34 = srem i32 %33, 100
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %10
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 0
  store double %36, double* %37, align 8
  br label %._crit_edge41.prol.loopexit.unr-lcssa

._crit_edge41.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge41.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge41.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge41.prol.loopexit

._crit_edge41.prol.loopexit:                      ; preds = %._crit_edge41.prol.loopexit.unr-lcssa
  %38 = icmp eq i64 %indvars.iv28, 0
  br i1 %38, label %.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge41.prol.loopexit
  br label %._crit_edge41

.preheader.unr-lcssa:                             ; preds = %._crit_edge41
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge41.prol.loopexit, %.preheader.unr-lcssa
  %39 = sub i64 %27, %indvars.iv28
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %40 = icmp slt i64 %indvars.iv.next29, %26
  br i1 %40, label %.lr.ph9.preheader, label %._crit_edge

.lr.ph9.preheader:                                ; preds = %.preheader
  %min.iters.check = icmp ult i64 %39, 4
  br i1 %min.iters.check, label %.lr.ph9.preheader45, label %min.iters.checked

.lr.ph9.preheader45:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph9.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv26, %min.iters.checked ], [ %indvars.iv26, %.lr.ph9.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9

min.iters.checked:                                ; preds = %.lr.ph9.preheader
  %n.vec = and i64 %39, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv26, %n.vec
  br i1 %cmp.zero, label %.lr.ph9.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter46 = and i64 %31, 3
  %lcmp.mod47 = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod47, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter46, %vector.body.prol.preheader ]
  %offset.idx.prol = add i64 %indvars.iv26, %index.prol
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %offset.idx.prol
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %42, align 8
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %44, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %45 = icmp ult i64 %29, 12
  br i1 %45, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %indvars.iv26, %index
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %offset.idx
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %47, align 8
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %49, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %indvars.iv26, %index.next
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %offset.idx.1
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %51, align 8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %53, align 8
  %index.next.1 = add i64 %index, 8
  %offset.idx.2 = add i64 %indvars.iv26, %index.next.1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %offset.idx.2
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %55, align 8
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %57, align 8
  %index.next.2 = add i64 %index, 12
  %offset.idx.3 = add i64 %indvars.iv26, %index.next.2
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %offset.idx.3
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %61, align 8
  %index.next.3 = add i64 %index, 16
  %62 = icmp eq i64 %index.next.3, %n.vec
  br i1 %62, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %39, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph9.preheader45

._crit_edge41:                                    ; preds = %._crit_edge41, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge41 ]
  %63 = add nuw nsw i64 %indvars.iv, %indvars.iv28
  %64 = trunc i64 %63 to i32
  %65 = srem i32 %64, 100
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %10
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv
  store double %67, double* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = add nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, 100
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %72, %10
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %73, double* %74, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv26
  br i1 %exitcond.1, label %.preheader.unr-lcssa, label %._crit_edge41

.lr.ph9:                                          ; preds = %.lr.ph9.preheader45, %.lr.ph9
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %.lr.ph9 ], [ %indvars.iv22.ph, %.lr.ph9.preheader45 ]
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv22
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count30.pre-phi
  br i1 %exitcond25, label %._crit_edge.loopexit, label %.lr.ph9, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph9
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.preheader
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30.pre-phi
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br i1 %exitcond31, label %._crit_edge11.loopexit, label %.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.preheader4.._crit_edge11_crit_edge, %._crit_edge11.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader4.us.preheader, label %._crit_edge16

.preheader4.us.preheader:                         ; preds = %7
  %wide.trip.count45 = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %11 = add nsw i64 %wide.trip.count41, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count41, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert63 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat64 = shufflevector <2 x double> %broadcast.splatinsert63, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge12.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge12.us ], [ 0, %.preheader4.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %wide.trip.count41
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 0
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %wide.trip.count41
  %13 = icmp sgt i64 %indvars.iv43, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv43
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us17.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader4.us
  br label %.preheader.us.us

.preheader.us17.preheader:                        ; preds = %.preheader4.us
  br i1 %min.iters.check, label %.preheader.us17.preheader71, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us17.preheader
  br i1 %cmp.zero, label %.preheader.us17.preheader71, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound058 = icmp ult double* %scevgep, %14
  %bound159 = icmp ult double* %14, %scevgep51
  %found.conflict60 = and i1 %bound058, %bound159
  %conflict.rdx = or i1 %found.conflict, %found.conflict60
  br i1 %conflict.rdx, label %.preheader.us17.preheader71, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %14, align 8, !alias.scope !8
  %15 = insertelement <2 x double> undef, double %.pre, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !11, !noalias !13
  %21 = fmul <2 x double> %wide.load, %broadcast.splat64
  %22 = fmul <2 x double> %wide.load62, %broadcast.splat64
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !15
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !15
  %27 = fmul <2 x double> %wide.load65, %broadcast.splat68
  %28 = fmul <2 x double> %wide.load66, %broadcast.splat68
  %29 = fmul <2 x double> %27, %16
  %30 = fmul <2 x double> %28, %16
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %22, %30
  %33 = fadd <2 x double> %broadcast.splat70, %31
  %34 = fadd <2 x double> %broadcast.splat70, %32
  store <2 x double> %33, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %34, <2 x double>* %20, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge12.us, label %.preheader.us17.preheader71

.preheader.us17.preheader71:                      ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us17.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us17.preheader ], [ %n.vec, %middle.block ]
  %36 = sub nsw i64 %wide.trip.count41, %indvars.iv.ph
  %xtraiter = and i64 %36, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us17.prol.loopexit.unr-lcssa, label %.preheader.us17.prol.preheader

.preheader.us17.prol.preheader:                   ; preds = %.preheader.us17.preheader71
  br label %.preheader.us17.prol

.preheader.us17.prol:                             ; preds = %.preheader.us17.prol.preheader
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv.ph
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv.ph
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %14, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  %46 = fadd double %10, %45
  store double %46, double* %37, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us17.prol.loopexit.unr-lcssa

.preheader.us17.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us17.preheader71, %.preheader.us17.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us17.prol ], [ %indvars.iv.ph, %.preheader.us17.preheader71 ]
  br label %.preheader.us17.prol.loopexit

.preheader.us17.prol.loopexit:                    ; preds = %.preheader.us17.prol.loopexit.unr-lcssa
  %47 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %47, label %._crit_edge12.us.loopexit72, label %.preheader.us17.preheader71.new

.preheader.us17.preheader71.new:                  ; preds = %.preheader.us17.prol.loopexit
  br label %.preheader.us17

.preheader.us17:                                  ; preds = %.preheader.us17, %.preheader.us17.preheader71.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us17.preheader71.new ], [ %indvars.iv.next.1, %.preheader.us17 ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %2
  %54 = load double, double* %14, align 8
  %55 = fmul double %53, %54
  %56 = fadd double %50, %55
  %57 = fadd double %10, %56
  store double %57, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %2
  %64 = load double, double* %14, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %60, %65
  %67 = fadd double %10, %66
  store double %67, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count41
  br i1 %exitcond.1, label %._crit_edge12.us.loopexit72.unr-lcssa, label %.preheader.us17, !llvm.loop !17

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge12.us

._crit_edge12.us.loopexit72.unr-lcssa:            ; preds = %.preheader.us17
  br label %._crit_edge12.us.loopexit72

._crit_edge12.us.loopexit72:                      ; preds = %.preheader.us17.prol.loopexit, %._crit_edge12.us.loopexit72.unr-lcssa
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit72, %._crit_edge12.us.loopexit, %middle.block
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge16.loopexit, label %.preheader4.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv39
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv39
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %3
  %72 = load double, double* %68, align 8
  %73 = fmul double %72, %2
  %74 = load double, double* %14, align 8
  %75 = fmul double %73, %74
  %76 = fadd double %71, %75
  %77 = fmul double %91, %2
  %78 = fadd double %77, %76
  store double %78, double* %69, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge12.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next34, %._crit_edge ]
  %.08.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %91, %._crit_edge ]
  %79 = load double, double* %68, align 8
  %80 = fmul double %79, %2
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv33
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv39
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv39
  %88 = load double, double* %87, align 8
  %89 = load double, double* %81, align 8
  %90 = fmul double %88, %89
  %91 = fadd double %.08.us.us, %90
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv43
  br i1 %exitcond38, label %._crit_edge.us.us, label %._crit_edge

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
