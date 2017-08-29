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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br i1 true, label %.preheader42.lr.ph, label %._crit_edge49

.preheader42.lr.ph:                               ; preds = %7
  br i1 true, label %.preheader42.us.preheader, label %.preheader.lr.ph

.preheader42.us.preheader:                        ; preds = %.preheader42.lr.ph
  br label %.preheader42.us

.preheader42.us:                                  ; preds = %._crit_edge52.us, %.preheader42.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.preheader42.us.preheader ], [ %indvars.iv.next81, %._crit_edge52.us ]
  %8 = add i64 %indvars.iv80, 1200
  %9 = trunc i64 %8 to i32
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader42.us
  %indvars.iv69.us = phi i64 [ 0, %.preheader42.us ], [ %indvars.iv.next70.us, %10 ]
  %11 = add nsw i64 %indvars.iv69.us, %indvars.iv80
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 100
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.000000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv69.us
  store double %15, double* %16, align 8
  %17 = sub nsw i64 0, %indvars.iv69.us
  %18 = trunc i64 %17 to i32
  %19 = add i32 %9, %18
  %20 = srem i32 %19, 100
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 1.000000e+03
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv80, i64 %indvars.iv69.us
  store double %22, double* %23, align 8
  %indvars.iv.next70.us = add nuw nsw i64 %indvars.iv69.us, 1
  %exitcond72.us = icmp eq i64 %indvars.iv.next70.us, 1200
  br i1 %exitcond72.us, label %._crit_edge52.us, label %10

._crit_edge52.us:                                 ; preds = %10
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond = icmp eq i64 %indvars.iv.next81, 1000
  br i1 %exitcond, label %.preheader41, label %.preheader42.us

.preheader41:                                     ; preds = %._crit_edge52.us
  br i1 true, label %.preheader.lr.ph, label %._crit_edge49

.preheader.lr.ph:                                 ; preds = %.preheader42.lr.ph, %.preheader41
  br label %.preheader

.loopexit.loopexit:                               ; preds = %.lr.ph46.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit75, %._crit_edge
  %indvars.iv.next86 = add nuw i64 %indvars.iv85, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next79, 1000
  %indvars.iv.next88 = add i3 %indvars.iv87, -1
  br i1 %exitcond68, label %._crit_edge49.loopexit, label %.preheader

.preheader:                                       ; preds = %.loopexit, %.preheader.lr.ph
  %indvars.iv87 = phi i3 [ %indvars.iv.next88, %.loopexit ], [ -1, %.preheader.lr.ph ]
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %.loopexit ], [ 1, %.preheader.lr.ph ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %.loopexit ], [ 0, %.preheader.lr.ph ]
  %24 = zext i3 %indvars.iv87 to i64
  %25 = add i64 %indvars.iv85, %24
  %26 = sub i64 1007, %indvars.iv78
  %27 = sub i64 998, %indvars.iv78
  %28 = and i64 %indvars.iv78, 1
  %lcmp.mod = icmp eq i64 %28, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader
  %29 = trunc i64 %indvars.iv78 to i32
  %30 = srem i32 %29, 100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 0
  store double %32, double* %33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  %34 = icmp eq i64 %indvars.iv78, 0
  br i1 %34, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv.unr.ph, %.preheader.new.preheader ]
  %35 = add nuw nsw i64 %indvars.iv, %indvars.iv78
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = add nuw nsw i64 %indvars.iv.next, %indvars.iv78
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 100
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %38, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fdiv <2 x double> %45, <double 1.000000e+03, double 1.000000e+03>
  %47 = bitcast double* %39 to <2 x double>*
  store <2 x double> %46, <2 x double>* %47, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv85
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %48 = icmp slt i64 %indvars.iv.next79, 1000
  br i1 %48, label %.lr.ph46, label %.loopexit

.lr.ph46:                                         ; preds = %._crit_edge
  %xtraiter76 = and i64 %26, 7
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.prol.loopexit75, label %.prol.preheader74.preheader

.prol.preheader74.preheader:                      ; preds = %.lr.ph46
  br label %.prol.preheader74

.prol.preheader74:                                ; preds = %.prol.preheader74.preheader, %.prol.preheader74
  %indvars.iv59.prol = phi i64 [ %indvars.iv.next60.prol, %.prol.preheader74 ], [ %indvars.iv85, %.prol.preheader74.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader74 ], [ %xtraiter76, %.prol.preheader74.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv59.prol
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit75.loopexit, label %.prol.preheader74, !llvm.loop !1

.prol.loopexit75.loopexit:                        ; preds = %.prol.preheader74
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.prol.loopexit75.loopexit, %.lr.ph46
  %indvars.iv59.unr = phi i64 [ %indvars.iv85, %.lr.ph46 ], [ %25, %.prol.loopexit75.loopexit ]
  %50 = icmp ult i64 %27, 7
  br i1 %50, label %.loopexit, label %.lr.ph46.new.preheader

.lr.ph46.new.preheader:                           ; preds = %.prol.loopexit75
  %51 = sub i64 992, %indvars.iv59.unr
  %52 = lshr i64 %51, 3
  %53 = add nuw nsw i64 %52, 1
  %min.iters.check = icmp ult i64 %53, 2
  br i1 %min.iters.check, label %.lr.ph46.new.preheader84, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph46.new.preheader
  %n.mod.vf = and i64 %53, 1
  %n.vec = sub nsw i64 %53, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %54 = add i64 %indvars.iv59.unr, 8
  %55 = shl nuw i64 %52, 3
  %56 = add i64 %54, %55
  %57 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %56, %57
  br i1 %cmp.zero, label %.lr.ph46.new.preheader84, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %58 = shl i64 %index, 3
  %59 = add i64 %indvars.iv59.unr, %58
  %60 = add nsw i64 %59, 7
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %60
  %62 = getelementptr double, double* %61, i64 -7
  %63 = bitcast double* %62 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %63, align 8
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph46.new.preheader84

.lr.ph46.new.preheader84:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph46.new.preheader
  %indvars.iv59.ph = phi i64 [ %indvars.iv59.unr, %min.iters.checked ], [ %indvars.iv59.unr, %.lr.ph46.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.lr.ph46.new.preheader84, %.lr.ph46.new
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.7, %.lr.ph46.new ], [ %indvars.iv59.ph, %.lr.ph46.new.preheader84 ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv59
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.1
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next60.2 = add nsw i64 %indvars.iv59, 3
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.2
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next60.3 = add nsw i64 %indvars.iv59, 4
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.3
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next60.4 = add nsw i64 %indvars.iv59, 5
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.4
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next60.5 = add nsw i64 %indvars.iv59, 6
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.5
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next60.6 = add nsw i64 %indvars.iv59, 7
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv78, i64 %indvars.iv.next60.6
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next60.7 = add nsw i64 %indvars.iv59, 8
  %exitcond62.7 = icmp eq i64 %indvars.iv.next60.7, 1000
  br i1 %exitcond62.7, label %.loopexit.loopexit, label %.lr.ph46.new, !llvm.loop !6

._crit_edge49.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %7, %.preheader41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader44.lr.ph, label %._crit_edge54

.preheader44.lr.ph:                               ; preds = %7
  br i1 true, label %.preheader44.us.preheader, label %._crit_edge54

.preheader44.us.preheader:                        ; preds = %.preheader44.lr.ph
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert94 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat95 = shufflevector <2 x double> %broadcast.splatinsert94, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge51.us ], [ 0, %.preheader44.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 1200
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 1200
  %9 = icmp sgt i64 %indvars.iv, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv
  br i1 %9, label %.preheader.us.us.preheader, label %.preheader.us59.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us59.preheader:                        ; preds = %.preheader44.us
  br i1 false, label %.preheader.us59.preheader102, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us59.preheader
  br i1 false, label %.preheader.us59.preheader102, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep86
  %bound1 = icmp ult double* %scevgep84, %scevgep82
  %found.conflict = and i1 %bound0, %bound1
  %bound089 = icmp ult double* %scevgep, %10
  %bound190 = icmp ult double* %10, %scevgep82
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx = or i1 %found.conflict, %found.conflict91
  br i1 %conflict.rdx, label %.preheader.us59.preheader102, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 %index
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !8, !noalias !11
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !8, !noalias !11
  %16 = fmul <2 x double> %wide.load, %broadcast.splat95
  %17 = fmul <2 x double> %wide.load93, %broadcast.splat95
  %18 = bitcast double* %11 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %11, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load96, %broadcast.splat99
  %22 = fmul <2 x double> %wide.load97, %broadcast.splat99
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %16, %28
  %31 = fadd <2 x double> %17, %29
  %32 = fadd <2 x double> %broadcast.splat101, %30
  %33 = fadd <2 x double> %broadcast.splat101, %31
  %34 = bitcast double* %12 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %14 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge51.us, label %.preheader.us59.preheader102

.preheader.us59.preheader102:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us59.preheader
  %indvars.iv55.us60.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us59.preheader ], [ 1200, %middle.block ]
  br i1 false, label %.preheader.us59.prol.preheader, label %.preheader.us59.prol.loopexit.unr-lcssa

.preheader.us59.prol.preheader:                   ; preds = %.preheader.us59.preheader102
  br label %.preheader.us59.prol

.preheader.us59.prol:                             ; preds = %.preheader.us59.prol.preheader
  br label %.preheader.us59.prol.loopexit.unr-lcssa

.preheader.us59.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us59.preheader102, %.preheader.us59.prol
  br label %.preheader.us59.prol.loopexit

.preheader.us59.prol.loopexit:                    ; preds = %.preheader.us59.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge51.us.loopexit104, label %.preheader.us59.preheader102.new

.preheader.us59.preheader102.new:                 ; preds = %.preheader.us59.prol.loopexit
  br label %.preheader.us59

.preheader.us59:                                  ; preds = %.preheader.us59, %.preheader.us59.preheader102.new
  %indvars.iv55.us60 = phi i64 [ %indvars.iv55.us60.ph, %.preheader.us59.preheader102.new ], [ %indvars.iv.next56.us72.1, %.preheader.us59 ]
  %.pre.us62 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 %indvars.iv55.us60
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv55.us60
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = load double, double* %.pre.us62, align 8
  %41 = fmul double %40, %2
  %42 = load double, double* %10, align 8
  %43 = fmul double %41, %42
  %44 = fadd double %39, %43
  %45 = fadd double %8, %44
  store double %45, double* %37, align 8
  %indvars.iv.next56.us72 = or i64 %indvars.iv55.us60, 1
  %.pre.us62.1 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 %indvars.iv.next56.us72
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv.next56.us72
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %3
  %49 = load double, double* %.pre.us62.1, align 8
  %50 = fmul double %49, %2
  %51 = load double, double* %10, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %48, %52
  %54 = fadd double %8, %53
  store double %54, double* %46, align 8
  %indvars.iv.next56.us72.1 = add nsw i64 %indvars.iv55.us60, 2
  %exitcond58.us73.1 = icmp eq i64 %indvars.iv.next56.us72.1, 1200
  br i1 %exitcond58.us73.1, label %._crit_edge51.us.loopexit104.unr-lcssa, label %.preheader.us59, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit104.unr-lcssa:           ; preds = %.preheader.us59
  br label %._crit_edge51.us.loopexit104

._crit_edge51.us.loopexit104:                     ; preds = %.preheader.us59.prol.loopexit, %._crit_edge51.us.loopexit104.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit104, %._crit_edge51.us.loopexit, %middle.block
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge54.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv55.us.us = phi i64 [ %indvars.iv.next56.us.us, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv, i64 %indvars.iv55.us.us
  br label %66

._crit_edge.us.us:                                ; preds = %66
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv55.us.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %3
  %59 = load double, double* %55, align 8
  %60 = fmul double %59, %2
  %61 = load double, double* %10, align 8
  %62 = fmul double %60, %61
  %63 = fadd double %58, %62
  %64 = fmul double %79, %2
  %65 = fadd double %64, %63
  store double %65, double* %56, align 8
  %indvars.iv.next56.us.us = add nuw nsw i64 %indvars.iv55.us.us, 1
  %exitcond58.us.us = icmp eq i64 %indvars.iv.next56.us.us, 1200
  br i1 %exitcond58.us.us, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:66:                                     ; preds = %66, %.preheader.us.us
  %indvars.iv.us.us = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.us.us, %66 ]
  %.047.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %79, %66 ]
  %67 = load double, double* %55, align 8
  %68 = fmul double %67, %2
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv.us.us
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.us.us, i64 %indvars.iv55.us.us
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv.us.us, i64 %indvars.iv55.us.us
  %76 = load double, double* %75, align 8
  %77 = load double, double* %69, align 8
  %78 = fmul double %76, %77
  %79 = fadd double %.047.us.us, %78
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv
  br i1 %exitcond.us.us, label %._crit_edge.us.us, label %66

._crit_edge54.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.preheader44.lr.ph, %7
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
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul i64 %indvars.iv, 1000
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add i64 %indvars.iv.us, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
