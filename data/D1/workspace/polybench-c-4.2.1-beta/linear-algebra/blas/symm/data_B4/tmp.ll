; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader36.lr.ph, label %._crit_edge42

.preheader36.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader36.us.preheader, label %.preheader34.lr.ph

.preheader36.us.preheader:                        ; preds = %.preheader36.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count68 = zext i32 %0 to i64
  br label %.preheader36.us

.preheader36.us:                                  ; preds = %._crit_edge45.us, %.preheader36.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.preheader36.us.preheader ], [ %indvars.iv.next67, %._crit_edge45.us ]
  %12 = add i64 %indvars.iv66, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75, %.preheader36.us
  %indvars.iv63 = phi i64 [ 0, %.preheader36.us ], [ %indvars.iv.next64, %._crit_edge75 ]
  %14 = add nuw nsw i64 %indvars.iv63, %indvars.iv66
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv63
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv63 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv63
  store double %24, double* %25, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, %wide.trip.count
  br i1 %exitcond65, label %._crit_edge45.us, label %._crit_edge75

._crit_edge45.us:                                 ; preds = %._crit_edge75
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader35, label %.preheader36.us

.preheader35:                                     ; preds = %._crit_edge45.us
  br i1 %8, label %.preheader34.lr.ph, label %._crit_edge42

.preheader34.lr.ph:                               ; preds = %.preheader35, %.preheader36.lr.ph
  %26 = sitofp i32 %0 to double
  %27 = sext i32 %0 to i64
  %28 = zext i32 %0 to i64
  %29 = add nuw nsw i64 %28, 7
  %30 = add nsw i64 %28, -2
  %31 = add nsw i64 %28, -8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader34.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader34.lr.ph ], [ %34, %._crit_edge ]
  %indvars.iv57 = phi i64 [ 1, %.preheader34.lr.ph ], [ %indvars.iv.next58, %._crit_edge ]
  %32 = sub i64 %29, %indvars.iv59
  %33 = sub i64 %30, %indvars.iv59
  %34 = add i64 %indvars.iv59, 1
  %xtraiter = and i64 %34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %35 = trunc i64 %indvars.iv59 to i32
  %36 = srem i32 %35, 100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %26
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 0
  store double %38, double* %39, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %40 = icmp eq i64 %indvars.iv59, 0
  br i1 %40, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit.unr-lcssa
  %41 = icmp slt i64 %34, %27
  br i1 %41, label %.lr.ph40, label %._crit_edge

.lr.ph40:                                         ; preds = %.preheader
  %xtraiter73 = and i64 %32, 7
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %.prol.loopexit72, label %.prol.preheader71.preheader

.prol.preheader71.preheader:                      ; preds = %.lr.ph40
  br label %.prol.preheader71

.prol.preheader71:                                ; preds = %.prol.preheader71.preheader, %.prol.preheader71
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.prol.preheader71 ], [ %indvars.iv57, %.prol.preheader71.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader71 ], [ %xtraiter73, %.prol.preheader71.preheader ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv53.prol
  store double -9.990000e+02, double* %42, align 8
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit72.loopexit, label %.prol.preheader71, !llvm.loop !1

.prol.loopexit72.loopexit:                        ; preds = %.prol.preheader71
  br label %.prol.loopexit72

.prol.loopexit72:                                 ; preds = %.prol.loopexit72.loopexit, %.lr.ph40
  %indvars.iv53.unr = phi i64 [ %indvars.iv57, %.lr.ph40 ], [ %indvars.iv.next54.prol, %.prol.loopexit72.loopexit ]
  %43 = icmp ult i64 %33, 7
  br i1 %43, label %._crit_edge, label %.lr.ph40.new.preheader

.lr.ph40.new.preheader:                           ; preds = %.prol.loopexit72
  %44 = sub i64 %31, %indvars.iv53.unr
  %45 = lshr i64 %44, 3
  %46 = add nuw nsw i64 %45, 1
  %min.iters.check = icmp ult i64 %46, 2
  br i1 %min.iters.check, label %.lr.ph40.new.preheader80, label %min.iters.checked

.lr.ph40.new.preheader80:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph40.new.preheader
  %indvars.iv53.ph = phi i64 [ %indvars.iv53.unr, %min.iters.checked ], [ %indvars.iv53.unr, %.lr.ph40.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph40.new

min.iters.checked:                                ; preds = %.lr.ph40.new.preheader
  %n.mod.vf = and i64 %46, 1
  %n.vec = sub nsw i64 %46, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %47 = add i64 %indvars.iv53.unr, 8
  %48 = shl nuw i64 %45, 3
  %49 = add i64 %47, %48
  %50 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %49, %50
  br i1 %cmp.zero, label %.lr.ph40.new.preheader80, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = shl i64 %index, 3
  %52 = add i64 %indvars.iv53.unr, %51
  %53 = add nsw i64 %52, 7
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %53
  %55 = getelementptr double, double* %54, i64 -7
  %56 = bitcast double* %55 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %56, align 8
  %index.next = add i64 %index, 2
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph40.new.preheader80

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %58 = add nuw nsw i64 %indvars.iv, %indvars.iv59
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 100
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %26
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv
  store double %62, double* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = add nuw nsw i64 %indvars.iv.next, %indvars.iv59
  %65 = trunc i64 %64 to i32
  %66 = srem i32 %65, 100
  %67 = sitofp i32 %66 to double
  %68 = fdiv double %67, %26
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next
  store double %68, double* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv57
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph40.new:                                     ; preds = %.lr.ph40.new.preheader80, %.lr.ph40.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.7, %.lr.ph40.new ], [ %indvars.iv53.ph, %.lr.ph40.new.preheader80 ]
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv53
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.1
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.2
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.3
  store double -9.990000e+02, double* %74, align 8
  %indvars.iv.next54.4 = add nsw i64 %indvars.iv53, 5
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.4
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next54.5 = add nsw i64 %indvars.iv53, 6
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.5
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next54.6 = add nsw i64 %indvars.iv53, 7
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv59, i64 %indvars.iv.next54.6
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond56.7 = icmp eq i64 %indvars.iv.next54.7, %28
  br i1 %exitcond56.7, label %._crit_edge.loopexit, label %.lr.ph40.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph40.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit72, %.preheader
  %exitcond62 = icmp eq i64 %34, %28
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br i1 %exitcond62, label %._crit_edge42.loopexit, label %.lr.ph

._crit_edge42.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader38.us.preheader, label %._crit_edge49

.preheader38.us.preheader:                        ; preds = %7
  %wide.trip.count78 = zext i32 %0 to i64
  %wide.trip.count74 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count74, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count74, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert96 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat97 = shufflevector <2 x double> %broadcast.splatinsert96, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader38.us

.preheader38.us:                                  ; preds = %._crit_edge45.us, %.preheader38.us.preheader
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge45.us ], [ 0, %.preheader38.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 0
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %wide.trip.count74
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %wide.trip.count74
  %13 = icmp sgt i64 %indvars.iv76, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv76, i64 %indvars.iv76
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us55.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader38.us
  br label %.preheader.us.us

.preheader.us55.preheader:                        ; preds = %.preheader38.us
  br i1 %min.iters.check, label %.preheader.us55.preheader104, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us55.preheader
  br i1 %cmp.zero, label %.preheader.us55.preheader104, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep88
  %bound1 = icmp ult double* %scevgep86, %scevgep84
  %found.conflict = and i1 %bound0, %bound1
  %bound091 = icmp ult double* %scevgep, %14
  %bound192 = icmp ult double* %14, %scevgep84
  %found.conflict93 = and i1 %bound091, %bound192
  %conflict.rdx = or i1 %found.conflict, %found.conflict93
  br i1 %conflict.rdx, label %.preheader.us55.preheader104, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !8, !noalias !11
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !8, !noalias !11
  %19 = fmul <2 x double> %wide.load, %broadcast.splat97
  %20 = fmul <2 x double> %wide.load95, %broadcast.splat97
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !14
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !14
  %25 = fmul <2 x double> %wide.load98, %broadcast.splat101
  %26 = fmul <2 x double> %wide.load99, %broadcast.splat101
  %27 = load double, double* %14, align 8, !alias.scope !15
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x double> undef, double %27, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = fmul <2 x double> %25, %29
  %33 = fmul <2 x double> %26, %31
  %34 = fadd <2 x double> %19, %32
  %35 = fadd <2 x double> %20, %33
  %36 = fadd <2 x double> %broadcast.splat103, %34
  %37 = fadd <2 x double> %broadcast.splat103, %35
  %38 = bitcast double* %15 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !8, !noalias !11
  %39 = bitcast double* %17 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge45.us, label %.preheader.us55.preheader104

.preheader.us55.preheader104:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us55.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us55.preheader ], [ %n.vec, %middle.block ]
  %41 = sub nsw i64 %wide.trip.count74, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us55.prol.loopexit.unr-lcssa, label %.preheader.us55.prol.preheader

.preheader.us55.prol.preheader:                   ; preds = %.preheader.us55.preheader104
  br label %.preheader.us55.prol

.preheader.us55.prol:                             ; preds = %.preheader.us55.prol.preheader
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv.ph
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %2
  %48 = load double, double* %14, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %44, %49
  %51 = fadd double %10, %50
  store double %51, double* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us55.prol.loopexit.unr-lcssa

.preheader.us55.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us55.preheader104, %.preheader.us55.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us55.prol ], [ %indvars.iv.ph, %.preheader.us55.preheader104 ]
  br label %.preheader.us55.prol.loopexit

.preheader.us55.prol.loopexit:                    ; preds = %.preheader.us55.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge45.us.loopexit105, label %.preheader.us55.preheader104.new

.preheader.us55.preheader104.new:                 ; preds = %.preheader.us55.prol.loopexit
  br label %.preheader.us55

.preheader.us55:                                  ; preds = %.preheader.us55, %.preheader.us55.preheader104.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us55.preheader104.new ], [ %indvars.iv.next.1, %.preheader.us55 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %14, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fadd double %10, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %14, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %10, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge45.us.loopexit105.unr-lcssa, label %.preheader.us55, !llvm.loop !17

._crit_edge45.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge45.us

._crit_edge45.us.loopexit105.unr-lcssa:           ; preds = %.preheader.us55
  br label %._crit_edge45.us.loopexit105

._crit_edge45.us.loopexit105:                     ; preds = %.preheader.us55.prol.loopexit, %._crit_edge45.us.loopexit105.unr-lcssa
  br label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge45.us.loopexit105, %._crit_edge45.us.loopexit, %middle.block
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond79, label %._crit_edge49.loopexit, label %.preheader38.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv76, i64 %indvars.iv72
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvars.iv72
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = load double, double* %73, align 8
  %78 = fmul double %77, %2
  %79 = load double, double* %14, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %76, %80
  %82 = fmul double %96, %2
  %83 = fadd double %82, %81
  store double %83, double* %74, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge45.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv66 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next67, %._crit_edge ]
  %.040.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %96, %._crit_edge ]
  %84 = load double, double* %73, align 8
  %85 = fmul double %84, %2
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv76, i64 %indvars.iv66
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv72
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv72
  %93 = load double, double* %92, align 8
  %94 = load double, double* %86, align 8
  %95 = fmul double %93, %94
  %96 = fadd double %.040.us.us, %95
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, %indvars.iv76
  br i1 %exitcond71, label %._crit_edge.us.us, label %._crit_edge

._crit_edge49.loopexit:                           ; preds = %._crit_edge45.us
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv13, %10
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge18
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
