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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %16 = icmp sgt i32 %0, 42
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %18, align 1
  %19 = icmp eq i8 %strcmpload, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %21)
  br label %22

; <label>:22:                                     ; preds = %17, %20, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader41.lr.ph, label %._crit_edge45

.preheader41.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %0 to double
  br i1 %9, label %.preheader41.us.preheader, label %.preheader39.lr.ph

.preheader41.us.preheader:                        ; preds = %.preheader41.lr.ph
  %12 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count75 = zext i32 %0 to i64
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge48.us, %.preheader41.us.preheader
  %indvars.iv73 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next74, %._crit_edge48.us ]
  %13 = add i64 %indvars.iv73, %12
  %14 = trunc i64 %13 to i32
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader41.us
  %indvars.iv70 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next71, %15 ]
  %16 = add nuw nsw i64 %indvars.iv70, %indvars.iv73
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv70
  store double %20, double* %21, align 8
  %22 = trunc i64 %indvars.iv70 to i32
  %23 = sub i32 %14, %22
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %11
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv73, i64 %indvars.iv70
  store double %26, double* %27, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next71, %wide.trip.count
  br i1 %exitcond72, label %._crit_edge48.us, label %15

._crit_edge48.us:                                 ; preds = %15
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader40, label %.preheader41.us

.preheader40:                                     ; preds = %._crit_edge48.us
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %.preheader39.lr.ph, label %._crit_edge45

.preheader39.lr.ph:                               ; preds = %.preheader41.lr.ph, %.preheader40
  %29 = sitofp i32 %0 to double
  %30 = add i32 %0, 7
  %31 = add i32 %0, -2
  %32 = sext i32 %0 to i64
  %wide.trip.count58.7 = zext i32 %0 to i64
  %wide.trip.count69 = zext i32 %0 to i64
  %33 = insertelement <2 x double> undef, double %29, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = add nsw i64 %wide.trip.count58.7, -8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader39.lr.ph, %._crit_edge
  %indvars.iv67 = phi i64 [ 0, %.preheader39.lr.ph ], [ %indvars.iv.next68, %._crit_edge ]
  %indvars.iv65 = phi i64 [ 1, %.preheader39.lr.ph ], [ %indvars.iv.next66, %._crit_edge ]
  %36 = sub nsw i64 0, %indvars.iv67
  %37 = trunc i64 %36 to i32
  %38 = add i32 %30, %37
  %39 = trunc i64 %36 to i32
  %40 = add i32 %31, %39
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %xtraiter78 = and i64 %indvars.iv.next68, 1
  %lcmp.mod = icmp eq i64 %xtraiter78, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %41 = trunc i64 %indvars.iv67 to i32
  %42 = srem i32 %41, 100
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %29
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 0
  store double %44, double* %45, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %46 = icmp eq i64 %indvars.iv67, 0
  br i1 %46, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit
  %47 = icmp slt i64 %indvars.iv.next68, %32
  br i1 %47, label %.lr.ph43, label %._crit_edge

.lr.ph43:                                         ; preds = %.preheader
  %xtraiter61 = and i32 %38, 7
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.prol.loopexit60, label %.prol.preheader59.preheader

.prol.preheader59.preheader:                      ; preds = %.lr.ph43
  br label %.prol.preheader59

.prol.preheader59:                                ; preds = %.prol.preheader59.preheader, %.prol.preheader59
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.prol.preheader59 ], [ %indvars.iv65, %.prol.preheader59.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader59 ], [ %xtraiter61, %.prol.preheader59.preheader ]
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv56.prol
  store double -9.990000e+02, double* %48, align 8
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit60.loopexit, label %.prol.preheader59, !llvm.loop !1

.prol.loopexit60.loopexit:                        ; preds = %.prol.preheader59
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.prol.loopexit60.loopexit, %.lr.ph43
  %indvars.iv56.unr = phi i64 [ %indvars.iv65, %.lr.ph43 ], [ %indvars.iv.next57.prol, %.prol.loopexit60.loopexit ]
  %49 = icmp ult i32 %40, 7
  br i1 %49, label %._crit_edge, label %.lr.ph43.new.preheader

.lr.ph43.new.preheader:                           ; preds = %.prol.loopexit60
  %50 = sub i64 %35, %indvars.iv56.unr
  %51 = lshr i64 %50, 3
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check = icmp ult i64 %52, 2
  br i1 %min.iters.check, label %.lr.ph43.new.preheader80, label %min.iters.checked

.lr.ph43.new.preheader80:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph43.new.preheader
  %indvars.iv56.ph = phi i64 [ %indvars.iv56.unr, %min.iters.checked ], [ %indvars.iv56.unr, %.lr.ph43.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph43.new

min.iters.checked:                                ; preds = %.lr.ph43.new.preheader
  %n.mod.vf = and i64 %52, 1
  %n.vec = sub nsw i64 %52, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %53 = add i64 %indvars.iv56.unr, 8
  %54 = shl nuw i64 %51, 3
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %55, %56
  br i1 %cmp.zero, label %.lr.ph43.new.preheader80, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = shl i64 %index, 3
  %58 = add i64 %indvars.iv56.unr, %57
  %59 = add nsw i64 %58, 7
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %59
  %61 = getelementptr double, double* %60, i64 -7
  %62 = bitcast double* %61 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %62, align 8
  %index.next = add i64 %index, 2
  %63 = icmp eq i64 %index.next, %n.vec
  br i1 %63, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph43.new.preheader80

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %64 = add nuw nsw i64 %indvars.iv, %indvars.iv67
  %65 = trunc i64 %64 to i32
  %66 = srem i32 %65, 100
  %67 = sitofp i32 %66 to double
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = add nuw nsw i64 %indvars.iv.next, %indvars.iv67
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, 100
  %72 = sitofp i32 %71 to double
  %73 = insertelement <2 x double> undef, double %67, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = fdiv <2 x double> %74, %34
  %76 = bitcast double* %68 to <2 x double>*
  store <2 x double> %75, <2 x double>* %76, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv65
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph43.new:                                     ; preds = %.lr.ph43.new.preheader80, %.lr.ph43.new
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.7, %.lr.ph43.new ], [ %indvars.iv56.ph, %.lr.ph43.new.preheader80 ]
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv56
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.1
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next57.2 = add nsw i64 %indvars.iv56, 3
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.2
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next57.3 = add nsw i64 %indvars.iv56, 4
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.3
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next57.4 = add nsw i64 %indvars.iv56, 5
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.4
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next57.5 = add nsw i64 %indvars.iv56, 6
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.5
  store double -9.990000e+02, double* %83, align 8
  %indvars.iv.next57.6 = add nsw i64 %indvars.iv56, 7
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv.next57.6
  store double -9.990000e+02, double* %84, align 8
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next57.7, %wide.trip.count58.7
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph43.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph43.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit60, %.preheader
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond, label %._crit_edge45.loopexit, label %.lr.ph

._crit_edge45.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %7, %.preheader40
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader44.lr.ph, label %._crit_edge55

.preheader44.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %wide.trip.count65 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count69 = zext i32 %0 to i64
  %11 = add nsw i64 %wide.trip.count65, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count65, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.lr.ph
  %indvars.iv67 = phi i64 [ 0, %.preheader44.lr.ph ], [ %indvars.iv.next68, %._crit_edge51 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %wide.trip.count65
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 0
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %wide.trip.count65
  br i1 %9, label %.preheader.lr.ph, label %._crit_edge51

.preheader.lr.ph:                                 ; preds = %.preheader44
  %13 = icmp sgt i64 %indvars.iv67, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv67
  br i1 %13, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br i1 %min.iters.check, label %.preheader.preheader94, label %min.iters.checked

.preheader.preheader94:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.preheader ], [ %n.vec, %middle.block ]
  %15 = sub nsw i64 %wide.trip.count65, %indvars.iv.ph
  %xtraiter = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader94
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.ph
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv.ph
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %14, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %18, %23
  %25 = fadd double %10, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.ph
  store double %25, double* %26, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.preheader94, %.preheader.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ %indvars.iv.ph, %.preheader.preheader94 ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %27, label %._crit_edge51.loopexit95, label %.preheader.preheader94.new

.preheader.preheader94.new:                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

min.iters.checked:                                ; preds = %.preheader.preheader
  br i1 %cmp.zero, label %.preheader.preheader94, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %14
  %bound182 = icmp ult double* %14, %scevgep74
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  br i1 %conflict.rdx, label %.preheader.preheader94, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %28 = load double, double* %14, align 8, !alias.scope !8
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %index
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %37 = fmul <2 x double> %wide.load, %broadcast.splat87
  %38 = fmul <2 x double> %wide.load85, %broadcast.splat87
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !15
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !15
  %43 = fmul <2 x double> %wide.load88, %broadcast.splat91
  %44 = fmul <2 x double> %wide.load89, %broadcast.splat91
  %45 = fmul <2 x double> %43, %30
  %46 = fmul <2 x double> %44, %32
  %47 = fadd <2 x double> %37, %45
  %48 = fadd <2 x double> %38, %46
  %49 = fadd <2 x double> %broadcast.splat93, %47
  %50 = fadd <2 x double> %broadcast.splat93, %48
  %51 = bitcast double* %33 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !11, !noalias !13
  %52 = bitcast double* %35 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %53 = icmp eq i64 %index.next, %n.vec
  br i1 %53, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51, label %.preheader.preheader94

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv63
  br label %55

; <label>:55:                                     ; preds = %55, %.preheader.us
  %indvars.iv57 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next58, %55 ]
  %.047.us = phi double [ 0.000000e+00, %.preheader.us ], [ %69, %55 ]
  %56 = load double, double* %54, align 8
  %57 = fmul double %56, %2
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv57
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv63
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv63
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv57
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %.047.us, %68
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %indvars.iv67
  br i1 %exitcond62, label %._crit_edge.us, label %55

._crit_edge.us:                                   ; preds = %55
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %3
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv63
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %2
  %76 = load double, double* %14, align 8
  %77 = fmul double %75, %76
  %78 = fadd double %72, %77
  %79 = fmul double %69, %2
  %80 = fadd double %79, %78
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  store double %80, double* %81, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge51.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader94.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.preheader94.new ], [ %indvars.iv.next.1, %.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %3
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %2
  %88 = load double, double* %14, align 8
  %89 = fmul double %87, %88
  %90 = fadd double %84, %89
  %91 = fadd double %10, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv
  store double %91, double* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.next
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, %2
  %99 = load double, double* %14, align 8
  %100 = fmul double %98, %99
  %101 = fadd double %95, %100
  %102 = fadd double %10, %101
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.next
  store double %102, double* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge51.loopexit95.unr-lcssa, label %.preheader, !llvm.loop !17

._crit_edge51.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge51

._crit_edge51.loopexit95.unr-lcssa:               ; preds = %.preheader
  br label %._crit_edge51.loopexit95

._crit_edge51.loopexit95:                         ; preds = %.preheader.prol.loopexit, %._crit_edge51.loopexit95.unr-lcssa
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit95, %._crit_edge51.loopexit, %middle.block, %.preheader44
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge55.loopexit, label %.preheader44

._crit_edge55.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
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
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv15, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
