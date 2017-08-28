; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %6 = and i32 %0, 1
  %n.mod.vf = zext i32 %6 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %wide.trip.count
  %scevgep3 = getelementptr double, double* %2, i64 %wide.trip.count
  %bound0 = icmp ugt double* %scevgep3, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind5 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next6, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind5 to <2 x double>
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
  %vec.ind.next6 = add <2 x i32> %vec.ind5, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %6, 0
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, %5
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader2.lr.ph, label %._crit_edge7

.preheader2.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %.preheader2.us.preheader, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader2.lr.ph
  %8 = add i32 %0, -1
  %xtraiter94 = and i32 %0, 7
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.preheader2.prol.loopexit, label %.preheader2.prol.preheader

.preheader2.prol.preheader:                       ; preds = %.preheader2.preheader
  br label %.preheader2.prol

.preheader2.prol:                                 ; preds = %.preheader2.prol, %.preheader2.prol.preheader
  %.016.prol = phi i32 [ %9, %.preheader2.prol ], [ 0, %.preheader2.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader2.prol ], [ %xtraiter94, %.preheader2.prol.preheader ]
  %9 = add nuw nsw i32 %.016.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader2.prol.loopexit.unr-lcssa, label %.preheader2.prol, !llvm.loop !10

.preheader2.prol.loopexit.unr-lcssa:              ; preds = %.preheader2.prol
  br label %.preheader2.prol.loopexit

.preheader2.prol.loopexit:                        ; preds = %.preheader2.preheader, %.preheader2.prol.loopexit.unr-lcssa
  %.016.unr = phi i32 [ 0, %.preheader2.preheader ], [ %9, %.preheader2.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i32 %8, 7
  br i1 %10, label %._crit_edge7.loopexit93, label %.preheader2.preheader.new

.preheader2.preheader.new:                        ; preds = %.preheader2.prol.loopexit
  br label %.preheader2

.preheader2.us.preheader:                         ; preds = %.preheader2.lr.ph
  %11 = add i32 %1, -2
  %12 = add i32 %1, -3
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %12, 0
  %xtraiter12 = and i32 %11, 1
  %lcmp.mod13 = icmp eq i32 %xtraiter12, 0
  %14 = icmp eq i32 %12, 0
  %wide.trip.count11.1 = zext i32 %6 to i64
  %15 = getelementptr inbounds double, double* %3, i64 1
  %16 = getelementptr inbounds double, double* %3, i64 2
  %17 = getelementptr inbounds double, double* %2, i64 1
  %wide.trip.count.1 = zext i32 %6 to i64
  %18 = getelementptr inbounds double, double* %2, i64 1
  %19 = getelementptr inbounds double, double* %2, i64 2
  %20 = getelementptr inbounds double, double* %3, i64 1
  %21 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep30 = getelementptr double, double* %2, i64 2
  %22 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep33 = getelementptr double, double* %3, i64 -1
  %scevgep36 = getelementptr double, double* %3, i64 3
  %23 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep57 = getelementptr double, double* %3, i64 2
  %24 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep60 = getelementptr double, double* %2, i64 -1
  %scevgep63 = getelementptr double, double* %2, i64 3
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %.016.us = phi i32 [ %61, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader2.us
  %25 = load double, double* %2, align 8
  %26 = load double, double* %18, align 8
  %27 = fadd double %25, %26
  %28 = load double, double* %19, align 8
  %29 = fadd double %27, %28
  %30 = fmul double %29, 3.333300e-01
  store double %30, double* %20, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader2.us
  %indvars.iv.unr.ph = phi i64 [ 2, %.prol.preheader ], [ 1, %.preheader2.us ]
  br i1 %13, label %.lr.ph5.us.preheader, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.prol.loopexit
  %31 = sub nsw i64 %23, %indvars.iv.unr.ph
  %32 = lshr i64 %31, 1
  %33 = add nuw i64 %32, 1
  %min.iters.check49 = icmp ult i64 %33, 2
  br i1 %min.iters.check49, label %.preheader2.us.new.preheader92, label %min.iters.checked50

.preheader2.us.new.preheader92:                   ; preds = %middle.block47, %vector.memcheck70, %min.iters.checked50, %.preheader2.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck70 ], [ %indvars.iv.unr.ph, %min.iters.checked50 ], [ %indvars.iv.unr.ph, %.preheader2.us.new.preheader ], [ %ind.end75, %middle.block47 ]
  br label %.preheader2.us.new

min.iters.checked50:                              ; preds = %.preheader2.us.new.preheader
  %n.mod.vf51 = and i64 %33, 1
  %n.vec52 = sub i64 %33, %n.mod.vf51
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  br i1 %cmp.zero53, label %.preheader2.us.new.preheader92, label %vector.memcheck70

vector.memcheck70:                                ; preds = %min.iters.checked50
  %scevgep55 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %34 = sub nsw i64 %24, %indvars.iv.unr.ph
  %35 = and i64 %34, -2
  %36 = add nsw i64 %indvars.iv.unr.ph, %35
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %36
  %scevgep61 = getelementptr double, double* %scevgep60, i64 %indvars.iv.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %36
  %bound066 = icmp ult double* %scevgep55, %scevgep64
  %bound167 = icmp ult double* %scevgep61, %scevgep58
  %memcheck.conflict69 = and i1 %bound066, %bound167
  %37 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %38 = shl nuw i64 %32, 1
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf51, 1
  %ind.end75 = sub i64 %39, %40
  br i1 %memcheck.conflict69, label %.preheader2.us.new.preheader92, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index72 = phi i64 [ %index.next73, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %41 = shl i64 %index72, 1
  %offset.idx77 = or i64 %indvars.iv.unr.ph, %41
  %42 = add nsw i64 %offset.idx77, -1
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec81 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !12
  %strided.vec82 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec83 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fadd <2 x double> %strided.vec82, %strided.vec83
  %46 = add nuw nsw i64 %offset.idx77, 1
  %47 = getelementptr inbounds double, double* %2, i64 %46
  %48 = getelementptr double, double* %47, i64 -1
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec84 = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !12
  %strided.vec86 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = fadd <2 x double> %45, %strided.vec86
  %51 = fmul <2 x double> %50, <double 3.333300e-01, double 3.333300e-01>
  %52 = bitcast double* %47 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !12
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fadd <4 x double> %wide.vec84, %wide.vec87
  %54 = shufflevector <4 x double> %53, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %55 = fadd <2 x double> %54, %strided.vec89
  %56 = fmul <2 x double> %55, <double 3.333300e-01, double 3.333300e-01>
  %57 = getelementptr inbounds double, double* %3, i64 %46
  %58 = getelementptr double, double* %57, i64 -1
  %59 = bitcast double* %58 to <4 x double>*
  %interleaved.vec90 = shufflevector <2 x double> %51, <2 x double> %56, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec90, <4 x double>* %59, align 8, !alias.scope !15, !noalias !12
  %index.next73 = add i64 %index72, 2
  %60 = icmp eq i64 %index.next73, %n.vec52
  br i1 %60, label %middle.block47, label %vector.body46, !llvm.loop !17

middle.block47:                                   ; preds = %vector.body46
  %cmp.n76 = icmp eq i64 %n.mod.vf51, 0
  br i1 %cmp.n76, label %.lr.ph5.us.preheader, label %.preheader2.us.new.preheader92

._crit_edge.us.loopexit:                          ; preds = %.lr.ph5.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph5.us.prol.loopexit
  %61 = add nuw nsw i32 %.016.us, 1
  %exitcond = icmp eq i32 %61, %0
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader2.us

.lr.ph5.us:                                       ; preds = %.lr.ph5.us.preheader91, %.lr.ph5.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %.lr.ph5.us ], [ %indvars.iv9.ph, %.lr.ph5.us.preheader91 ]
  %62 = add nsw i64 %indvars.iv9, -1
  %63 = getelementptr inbounds double, double* %3, i64 %62
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %71 = fmul double %70, 3.333300e-01
  %72 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %78 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.1
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  %81 = fmul double %80, 3.333300e-01
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next10
  store double %81, double* %82, align 8
  %exitcond.115 = icmp eq i64 %indvars.iv.next10.1, %wide.trip.count11.1
  br i1 %exitcond.115, label %._crit_edge.us.loopexit, label %.lr.ph5.us, !llvm.loop !18

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader92, %.preheader2.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader2.us.new ], [ %indvars.iv.ph, %.preheader2.us.new.preheader92 ]
  %83 = add nsw i64 %indvars.iv, -1
  %84 = getelementptr inbounds double, double* %2, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = fmul double %91, 3.333300e-01
  %93 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %92, double* %93, align 8
  %94 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = fadd double %95, %97
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %99 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %100 = load double, double* %99, align 8
  %101 = fadd double %98, %100
  %102 = fmul double %101, 3.333300e-01
  %103 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %102, double* %103, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph5.us.preheader.loopexit, label %.preheader2.us.new, !llvm.loop !19

.lr.ph5.us.preheader.loopexit:                    ; preds = %.preheader2.us.new
  br label %.lr.ph5.us.preheader

.lr.ph5.us.preheader:                             ; preds = %.lr.ph5.us.preheader.loopexit, %.prol.loopexit, %middle.block47
  br i1 %lcmp.mod13, label %.lr.ph5.us.prol.loopexit, label %.lr.ph5.us.prol

.lr.ph5.us.prol:                                  ; preds = %.lr.ph5.us.preheader
  %104 = load double, double* %3, align 8
  %105 = load double, double* %15, align 8
  %106 = fadd double %104, %105
  %107 = load double, double* %16, align 8
  %108 = fadd double %106, %107
  %109 = fmul double %108, 3.333300e-01
  store double %109, double* %17, align 8
  br label %.lr.ph5.us.prol.loopexit

.lr.ph5.us.prol.loopexit:                         ; preds = %.lr.ph5.us.prol, %.lr.ph5.us.preheader
  %indvars.iv9.unr.ph = phi i64 [ 2, %.lr.ph5.us.prol ], [ 1, %.lr.ph5.us.preheader ]
  br i1 %14, label %._crit_edge.us, label %.lr.ph5.us.preheader26

.lr.ph5.us.preheader26:                           ; preds = %.lr.ph5.us.prol.loopexit
  %110 = sub nsw i64 %21, %indvars.iv9.unr.ph
  %111 = lshr i64 %110, 1
  %112 = add nuw i64 %111, 1
  %min.iters.check = icmp ult i64 %112, 2
  br i1 %min.iters.check, label %.lr.ph5.us.preheader91, label %min.iters.checked

.lr.ph5.us.preheader91:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.us.preheader26
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr.ph, %vector.memcheck ], [ %indvars.iv9.unr.ph, %min.iters.checked ], [ %indvars.iv9.unr.ph, %.lr.ph5.us.preheader26 ], [ %ind.end, %middle.block ]
  br label %.lr.ph5.us

min.iters.checked:                                ; preds = %.lr.ph5.us.preheader26
  %n.mod.vf = and i64 %112, 1
  %n.vec = sub i64 %112, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph5.us.preheader91, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv9.unr.ph
  %113 = sub nsw i64 %22, %indvars.iv9.unr.ph
  %114 = and i64 %113, -2
  %115 = add nsw i64 %indvars.iv9.unr.ph, %114
  %scevgep31 = getelementptr double, double* %scevgep30, i64 %115
  %scevgep34 = getelementptr double, double* %scevgep33, i64 %indvars.iv9.unr.ph
  %scevgep37 = getelementptr double, double* %scevgep36, i64 %115
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep34, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  %116 = add nuw nsw i64 %indvars.iv9.unr.ph, 2
  %117 = shl nuw i64 %111, 1
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %118, %119
  br i1 %memcheck.conflict, label %.lr.ph5.us.preheader91, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %120 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv9.unr.ph, %120
  %121 = add nsw i64 %offset.idx, -1
  %122 = getelementptr inbounds double, double* %3, i64 %121
  %123 = bitcast double* %122 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %123, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec39 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %124 = fadd <2 x double> %strided.vec, %strided.vec39
  %125 = add nuw nsw i64 %offset.idx, 1
  %126 = getelementptr inbounds double, double* %3, i64 %125
  %127 = getelementptr double, double* %126, i64 -1
  %128 = bitcast double* %127 to <4 x double>*
  %wide.vec40 = load <4 x double>, <4 x double>* %128, align 8, !alias.scope !20
  %strided.vec42 = shufflevector <4 x double> %wide.vec40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %129 = fadd <2 x double> %124, %strided.vec42
  %130 = fmul <2 x double> %129, <double 3.333300e-01, double 3.333300e-01>
  %131 = bitcast double* %126 to <4 x double>*
  %wide.vec43 = load <4 x double>, <4 x double>* %131, align 8, !alias.scope !20
  %strided.vec45 = shufflevector <4 x double> %wide.vec43, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %132 = fadd <4 x double> %wide.vec40, %wide.vec43
  %133 = shufflevector <4 x double> %132, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %134 = fadd <2 x double> %133, %strided.vec45
  %135 = fmul <2 x double> %134, <double 3.333300e-01, double 3.333300e-01>
  %136 = getelementptr inbounds double, double* %2, i64 %125
  %137 = getelementptr double, double* %136, i64 -1
  %138 = bitcast double* %137 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %130, <2 x double> %135, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %138, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %139 = icmp eq i64 %index.next, %n.vec
  br i1 %139, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph5.us.preheader91

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader.new
  %.016 = phi i32 [ %.016.unr, %.preheader2.preheader.new ], [ %140, %.preheader2 ]
  %140 = add nsw i32 %.016, 8
  %exitcond22.7 = icmp eq i32 %140, %0
  br i1 %exitcond22.7, label %._crit_edge7.loopexit93.unr-lcssa, label %.preheader2

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit93.unr-lcssa:                ; preds = %.preheader2
  br label %._crit_edge7.loopexit93

._crit_edge7.loopexit93:                          ; preds = %.preheader2.prol.loopexit, %._crit_edge7.loopexit93.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit93, %._crit_edge7.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
