; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [1200 x [1200 x double]]*, align 8
  %10 = alloca [1200 x [1000 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  store i32 1000, i32* %6, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %12 = bitcast [1200 x [1200 x double]]** %9 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %14 = bitcast [1200 x [1000 x double]]** %10 to i8**
  store i8* %13, i8** %14, align 8
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = bitcast i8* %11 to [1200 x double]*
  %18 = bitcast i8* %13 to [1000 x double]*
  call fastcc void @init_array(i32 %15, i32 %16, double* nonnull %7, double* nonnull %8, [1200 x double]* %17, [1000 x double]* %18)
  call void (...) @polybench_timer_start() #4
  %19 = load double, double* %7, align 8
  %20 = load double, double* %8, align 8
  %21 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %22 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %21, i64 0, i64 0
  %23 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %10, align 8
  %24 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %23, i64 0, i64 0
  call fastcc void @kernel_syrk(i32 %15, i32 %16, double %19, double %20, [1200 x double]* %22, [1000 x double]* %24)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = load i32, i32* %3, align 4
  %26 = icmp sgt i32 %25, 42
  br i1 %26, label %27, label %._crit_edge

; <label>:27:                                     ; preds = %2
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %strcmpload = load i8, i8* %29, align 1
  %30 = icmp eq i8 %strcmpload, 0
  br i1 %30, label %31, label %._crit_edge

; <label>:31:                                     ; preds = %27
  %32 = load i32, i32* %5, align 4
  %33 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %34 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %33, i64 0, i64 0
  call fastcc void @print_array(i32 %32, [1200 x double]* %34)
  br label %._crit_edge

._crit_edge:                                      ; preds = %27, %2, %31
  %35 = bitcast [1200 x [1200 x double]]** %9 to i8**
  %36 = load i8*, i8** %35, align 8
  call void @free(i8* %36) #4
  %37 = bitcast [1200 x [1000 x double]]** %10 to i8**
  %38 = load i8*, i8** %37, align 8
  call void @free(i8* %38) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1000 x double]*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [1200 x double]* %4, [1200 x double]** %9, align 8
  store [1000 x double]* %5, [1000 x double]** %10, align 8
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  store i32 0, i32* %11, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader5.lr.ph, label %.preheader4.thread

.preheader4.thread:                               ; preds = %6
  store i32 0, i32* %11, align 4
  br label %.preheader4._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %14 = load i32, i32* %8, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = load i32, i32* %7, align 4
  %17 = sitofp i32 %16 to double
  %18 = load [1000 x double]*, [1000 x double]** %10, align 8
  br i1 %15, label %.preheader5.us.preheader, label %.preheader4

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %.promoted21 = load i32, i32* %11, align 4
  %19 = sext i32 %.promoted21 to i64
  %20 = sext i32 %16 to i64
  %21 = zext i32 %14 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge15.us, %.preheader5.us.preheader
  %indvars.iv34 = phi i64 [ %19, %.preheader5.us.preheader ], [ %indvars.iv.next35, %._crit_edge15.us ]
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader5.us
  %indvars.iv30 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next31, %22 ]
  %23 = mul nsw i64 %indvars.iv34, %indvars.iv30
  %24 = add nsw i64 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %16
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %17
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv34, i64 %indvars.iv30
  store double %28, double* %29, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %21
  br i1 %exitcond, label %._crit_edge15.us, label %22

._crit_edge15.us:                                 ; preds = %22
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %30 = icmp slt i64 %indvars.iv.next35, %20
  br i1 %30, label %.preheader5.us, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %._crit_edge15.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5.lr.ph
  %.pr = load i32, i32* %7, align 4
  store i32 0, i32* %11, align 4
  %31 = icmp sgt i32 %.pr, 0
  br i1 %31, label %.preheader.lr.ph, label %.preheader4._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader4
  %32 = load i32, i32* %7, align 4
  %33 = icmp sgt i32 %32, 0
  %34 = load i32, i32* %8, align 4
  %35 = sitofp i32 %34 to double
  %36 = load [1200 x double]*, [1200 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %33, label %.preheader.us.preheader, label %._crit_edge9.loopexit23

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %37 = sext i32 %.promoted to i64
  %38 = sext i32 %32 to i64
  %39 = zext i32 %32 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv28 = phi i64 [ %37, %.preheader.us.preheader ], [ %indvars.iv.next29, %._crit_edge.us ]
  br label %40

; <label>:40:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %40 ]
  %41 = mul nsw i64 %indvars.iv28, %indvars.iv
  %42 = add nsw i64 %41, 2
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %34
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %35
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %indvars.iv28, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next, %39
  br i1 %exitcond38, label %._crit_edge.us, label %40

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, 1
  %48 = icmp slt i64 %indvars.iv.next29, %38
  br i1 %48, label %.preheader.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  %49 = trunc i64 %indvars.iv.next29 to i32
  br label %._crit_edge9

._crit_edge9.loopexit23:                          ; preds = %.preheader.lr.ph
  %50 = add i32 %.promoted, 1
  %51 = icmp sgt i32 %32, %50
  %smax = select i1 %51, i32 %32, i32 %50
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit23, %._crit_edge9.loopexit
  %.lcssa12 = phi i32 [ %49, %._crit_edge9.loopexit ], [ %smax, %._crit_edge9.loopexit23 ]
  store i32 %.lcssa12, i32* %11, align 4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4, %.preheader4.thread, %._crit_edge9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double %2, double* %9, align 8
  store double %3, double* %10, align 8
  store [1200 x double]* %4, [1200 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %16 = load i32, i32* %8, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load double, double* %9, align 8
  %19 = load [1000 x double]*, [1000 x double]** %12, align 8
  %20 = load [1200 x double]*, [1200 x double]** %11, align 8
  %21 = load i32, i32* %7, align 4
  %22 = load double, double* %10, align 8
  %.promoted = load i32, i32* %13, align 4
  %23 = add i32 %.promoted, 1
  %24 = sext i32 %.promoted to i64
  %25 = sext i32 %21 to i64
  %26 = trunc i32 %23 to i2
  br i1 %17, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat77 = shufflevector <2 x double> %broadcast.splatinsert76, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %27 = zext i32 %16 to i64
  %broadcast.splatinsert101 = insertelement <2 x double> undef, double %22, i32 0
  %broadcast.splat102 = shufflevector <2 x double> %broadcast.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge11.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv68 = phi i2 [ %26, %.preheader5.us.preheader ], [ %indvars.iv.next69, %._crit_edge11.us..preheader5.us_crit_edge ]
  %indvars.iv50 = phi i64 [ %24, %.preheader5.us.preheader ], [ %indvars.iv.next51, %._crit_edge11.us..preheader5.us_crit_edge ]
  %indvars.iv40 = phi i32 [ %23, %.preheader5.us.preheader ], [ %indvars.iv.next41, %._crit_edge11.us..preheader5.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.us.preheader ], [ %indvar.next, %._crit_edge11.us..preheader5.us_crit_edge ]
  %28 = add i32 %23, %indvar
  %29 = zext i32 %28 to i64
  %30 = zext i2 %indvars.iv68 to i64
  %31 = add nuw nsw i64 %30, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = add nuw nsw i64 %32, 1
  %34 = add i32 %23, %indvar
  %35 = add i32 %.promoted, %indvar
  %36 = icmp slt i64 %indvars.iv50, 0
  br i1 %36, label %._crit_edge11.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.preheader5.us
  %37 = add i32 %23, %indvar
  %xtraiter = and i32 %37, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader, %.lr.ph.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.us.prol ], [ %xtraiter, %.lr.ph.us.prol.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv.prol
  %39 = load double, double* %38, align 8
  %40 = fmul double %22, %39
  store double %40, double* %38, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.lr.ph.us.prol.loopexit.loopexit, label %.lr.ph.us.prol, !llvm.loop !1

.lr.ph.us.prol.loopexit.loopexit:                 ; preds = %.lr.ph.us.prol
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.loopexit, %.lr.ph.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.preheader ], [ %33, %.lr.ph.us.prol.loopexit.loopexit ]
  %41 = icmp ult i32 %35, 3
  br i1 %41, label %.preheader.lr.ph.us, label %.lr.ph.us.preheader65

.lr.ph.us.preheader65:                            ; preds = %.lr.ph.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv40 to i64
  %42 = add nsw i64 %29, -4
  %43 = sub nsw i64 %42, %indvars.iv.unr
  %44 = lshr i64 %43, 2
  %45 = add nuw nsw i64 %44, 1
  %min.iters.check81 = icmp ult i64 %45, 2
  br i1 %min.iters.check81, label %.lr.ph.us.preheader104, label %min.iters.checked82

min.iters.checked82:                              ; preds = %.lr.ph.us.preheader65
  %n.mod.vf83 = and i64 %45, 1
  %n.vec84 = sub nsw i64 %45, %n.mod.vf83
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  %46 = add nsw i64 %indvars.iv.unr, 4
  %47 = shl nuw i64 %44, 2
  %48 = add i64 %46, %47
  %49 = shl nuw nsw i64 %n.mod.vf83, 2
  %ind.end90 = sub i64 %48, %49
  br i1 %cmp.zero85, label %.lr.ph.us.preheader104, label %vector.ph86

vector.ph86:                                      ; preds = %min.iters.checked82
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %vector.ph86
  %index87 = phi i64 [ 0, %vector.ph86 ], [ %index.next88, %vector.body78 ]
  %50 = shl i64 %index87, 2
  %51 = add i64 %indvars.iv.unr, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %51
  %53 = bitcast double* %52 to <8 x double>*
  %wide.vec96 = load <8 x double>, <8 x double>* %53, align 8
  %strided.vec97 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec98 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec99 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec100 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %54 = fmul <2 x double> %broadcast.splat102, %strided.vec97
  %55 = fmul <2 x double> %broadcast.splat102, %strided.vec98
  %56 = fmul <2 x double> %broadcast.splat102, %strided.vec99
  %57 = add nsw i64 %51, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %57
  %59 = fmul <2 x double> %broadcast.splat102, %strided.vec100
  %60 = getelementptr double, double* %58, i64 -3
  %61 = bitcast double* %60 to <8 x double>*
  %62 = shufflevector <2 x double> %54, <2 x double> %55, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %63 = shufflevector <2 x double> %56, <2 x double> %59, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec103 = shufflevector <4 x double> %62, <4 x double> %63, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec103, <8 x double>* %61, align 8
  %index.next88 = add i64 %index87, 2
  %64 = icmp eq i64 %index.next88, %n.vec84
  br i1 %64, label %middle.block79, label %vector.body78, !llvm.loop !3

middle.block79:                                   ; preds = %vector.body78
  %cmp.n91 = icmp eq i64 %n.mod.vf83, 0
  br i1 %cmp.n91, label %.preheader.lr.ph.us, label %.lr.ph.us.preheader104

.lr.ph.us.preheader104:                           ; preds = %middle.block79, %min.iters.checked82, %.lr.ph.us.preheader65
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked82 ], [ %indvars.iv.unr, %.lr.ph.us.preheader65 ], [ %ind.end90, %middle.block79 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader104, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader104 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %22, %66
  store double %67, double* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fmul double %22, %69
  store double %70, double* %68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %72 = load double, double* %71, align 8
  %73 = fmul double %22, %72
  store double %73, double* %71, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %75 = load double, double* %74, align 8
  %76 = fmul double %22, %75
  store double %76, double* %74, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.lr.ph.us.loopexit, label %.lr.ph.us, !llvm.loop !6

.preheader.us25.new:                              ; preds = %.preheader.us25.new, %.preheader.us25.new.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.preheader.us25.new ], [ %indvars.iv38.unr.ph, %.preheader.us25.new.preheader ]
  %77 = load double, double* %101, align 8
  %78 = fmul double %18, %77
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv38, i64 %indvars.iv46
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv38
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %82, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %85 = load double, double* %102, align 8
  %86 = fmul double %18, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv.next39, i64 %indvars.iv46
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 %indvars.iv.next39
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  store double %92, double* %90, align 8
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next39.1, %wide.trip.count42.1
  br i1 %exitcond.1, label %._crit_edge.us27.loopexit, label %.preheader.us25.new

.preheader.us25:                                  ; preds = %._crit_edge.us27, %.preheader.us25.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us27 ], [ 0, %.preheader.us25.preheader ]
  br i1 %lcmp.mod44, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us25
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv50, i64 %indvars.iv46
  %94 = load double, double* %93, align 8
  %95 = fmul double %18, %94
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv46
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = load double, double* %106, align 8
  %100 = fadd double %98, %99
  store double %100, double* %106, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us25, %.prol.preheader
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us25 ]
  br i1 %105, label %._crit_edge.us27, label %.preheader.us25.new.preheader

.preheader.us25.new.preheader:                    ; preds = %.prol.loopexit
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv50, i64 %indvars.iv46
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv50, i64 %indvars.iv46
  br label %.preheader.us25.new

._crit_edge.us27.loopexit:                        ; preds = %.preheader.us25.new
  br label %._crit_edge.us27

._crit_edge.us27:                                 ; preds = %._crit_edge.us27.loopexit, %.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next47, %27
  br i1 %exitcond70, label %._crit_edge11.us.loopexit, label %.preheader.us25

.preheader.lr.ph.us.loopexit:                     ; preds = %.lr.ph.us
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.loopexit, %middle.block79, %.lr.ph.us.prol.loopexit
  %103 = icmp slt i64 %indvars.iv50, 0
  br i1 %103, label %._crit_edge11.us, label %.preheader.us25.preheader

.preheader.us25.preheader:                        ; preds = %.preheader.lr.ph.us
  %xtraiter43 = and i32 %34, 1
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  %104 = sub i32 0, %indvar
  %105 = icmp eq i32 %.promoted, %104
  %wide.trip.count42.1 = zext i32 %indvars.iv40 to i64
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv50, i64 0
  br label %.preheader.us25

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us27
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.preheader.lr.ph.us, %.preheader5.us
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %107 = icmp slt i64 %indvars.iv.next51, %25
  br i1 %107, label %._crit_edge11.us..preheader5.us_crit_edge, label %._crit_edge16.loopexit

._crit_edge11.us..preheader5.us_crit_edge:        ; preds = %._crit_edge11.us
  %indvars.iv.next69 = add i2 %indvars.iv68, 1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next41 = add i32 %indvars.iv40, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader4..preheader5_crit_edge
  %indvars.iv71 = phi i2 [ %indvars.iv.next72, %.preheader4..preheader5_crit_edge ], [ %26, %.preheader5.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.preheader4..preheader5_crit_edge ], [ %24, %.preheader5.preheader ]
  %indvar58 = phi i32 [ %indvar.next59, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %.preheader4..preheader5_crit_edge ], [ %23, %.preheader5.preheader ]
  %108 = add i32 %23, %indvar58
  %109 = zext i32 %108 to i64
  %110 = zext i2 %indvars.iv71 to i64
  %111 = add nuw nsw i64 %110, 4294967295
  %112 = and i64 %111, 4294967295
  %113 = add nuw nsw i64 %112, 1
  %114 = add i32 %.promoted, %indvar58
  %115 = icmp slt i64 %indvars.iv63, 0
  br i1 %115, label %.preheader4, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %116 = add i32 %23, %indvar58
  %xtraiter60 = and i32 %116, 3
  %lcmp.mod61 = icmp eq i32 %xtraiter60, 0
  br i1 %lcmp.mod61, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter62 = phi i32 [ %prol.iter62.sub, %.lr.ph.prol ], [ %xtraiter60, %.lr.ph.prol.preheader ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %indvars.iv52.prol
  %118 = load double, double* %117, align 8
  %119 = fmul double %22, %118
  store double %119, double* %117, align 8
  %prol.iter62.sub = add nsw i32 %prol.iter62, -1
  %prol.iter62.cmp = icmp eq i32 %prol.iter62.sub, 0
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  br i1 %prol.iter62.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !8

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv52.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %113, %.lr.ph.prol.loopexit.loopexit ]
  %120 = icmp ult i32 %114, 3
  br i1 %120, label %.preheader4, label %.lr.ph.preheader66

.lr.ph.preheader66:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count56.3 = zext i32 %indvars.iv54 to i64
  %121 = add nsw i64 %109, -4
  %122 = sub nsw i64 %121, %indvars.iv52.unr
  %123 = lshr i64 %122, 2
  %124 = add nuw nsw i64 %123, 1
  %min.iters.check = icmp ult i64 %124, 2
  br i1 %min.iters.check, label %.lr.ph.preheader105, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader66
  %n.mod.vf = and i64 %124, 1
  %n.vec = sub nsw i64 %124, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %125 = add nsw i64 %indvars.iv52.unr, 4
  %126 = shl nuw i64 %123, 2
  %127 = add i64 %125, %126
  %128 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %127, %128
  br i1 %cmp.zero, label %.lr.ph.preheader105, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %129 = shl i64 %index, 2
  %130 = add i64 %indvars.iv52.unr, %129
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %130
  %132 = bitcast double* %131 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %132, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec75 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %133 = fmul <2 x double> %broadcast.splat77, %strided.vec
  %134 = fmul <2 x double> %broadcast.splat77, %strided.vec73
  %135 = fmul <2 x double> %broadcast.splat77, %strided.vec74
  %136 = add nsw i64 %130, 3
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %136
  %138 = fmul <2 x double> %broadcast.splat77, %strided.vec75
  %139 = getelementptr double, double* %137, i64 -3
  %140 = bitcast double* %139 to <8 x double>*
  %141 = shufflevector <2 x double> %133, <2 x double> %134, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %142 = shufflevector <2 x double> %135, <2 x double> %138, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %141, <4 x double> %142, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %140, align 8
  %index.next = add i64 %index, 2
  %143 = icmp eq i64 %index.next, %n.vec
  br i1 %143, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.preheader105

.lr.ph.preheader105:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader66
  %indvars.iv52.ph = phi i64 [ %indvars.iv52.unr, %min.iters.checked ], [ %indvars.iv52.unr, %.lr.ph.preheader66 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader105, %.lr.ph
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %.lr.ph ], [ %indvars.iv52.ph, %.lr.ph.preheader105 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %indvars.iv52
  %145 = load double, double* %144, align 8
  %146 = fmul double %22, %145
  store double %146, double* %144, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %indvars.iv.next53
  %148 = load double, double* %147, align 8
  %149 = fmul double %22, %148
  store double %149, double* %147, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %indvars.iv.next53.1
  %151 = load double, double* %150, align 8
  %152 = fmul double %22, %151
  store double %152, double* %150, align 8
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %indvars.iv63, i64 %indvars.iv.next53.2
  %154 = load double, double* %153, align 8
  %155 = fmul double %22, %154
  store double %155, double* %153, align 8
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next53.3, %wide.trip.count56.3
  br i1 %exitcond57.3, label %.preheader4.loopexit, label %.lr.ph, !llvm.loop !10

.preheader4.loopexit:                             ; preds = %.lr.ph
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.lr.ph.prol.loopexit, %.preheader5
  %indvars.iv.next64 = add nsw i64 %indvars.iv63, 1
  %156 = icmp slt i64 %indvars.iv.next64, %25
  br i1 %156, label %.preheader4..preheader5_crit_edge, label %._crit_edge16.loopexit106

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next72 = add i2 %indvars.iv71, 1
  %indvar.next59 = add nuw i32 %indvar58, 1
  %indvars.iv.next55 = add i32 %indvars.iv54, 1
  br label %.preheader5

._crit_edge16.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge16

._crit_edge16.loopexit106:                        ; preds = %.preheader4
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit106, %._crit_edge16.loopexit
  %.lcssa20.in = phi i64 [ %indvars.iv.next51, %._crit_edge16.loopexit ], [ %indvars.iv.next64, %._crit_edge16.loopexit106 ]
  %.lcssa20 = trunc i64 %.lcssa20.in to i32
  store i32 %.lcssa20, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1200 x double]*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1200 x double]* %1, [1200 x double]** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %2
  %12 = load i32, i32* %3, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = load [1200 x double]*, [1200 x double]** %4, align 8
  %.promoted5 = load i32, i32* %5, align 4
  br i1 %13, label %.preheader.us.preheader, label %._crit_edge4.loopexit9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %15 = sext i32 %.promoted5 to i64
  %16 = sext i32 %12 to i64
  %17 = sext i32 %12 to i64
  %18 = zext i32 %12 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ %15, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %19 = mul nsw i64 %indvars.iv11, %16
  br label %20

; <label>:20:                                     ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %21 = add nsw i64 %19, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge15

; <label>:25:                                     ; preds = %20
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %20, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %indvars.iv11, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %18
  br i1 %exitcond13, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %._crit_edge15
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %31 = icmp slt i64 %indvars.iv.next12, %17
  br i1 %31, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %32 = trunc i64 %indvars.iv.next12 to i32
  br label %._crit_edge4

._crit_edge4.loopexit9:                           ; preds = %.preheader.lr.ph
  %33 = add i32 %.promoted5, 1
  %34 = icmp sgt i32 %12, %33
  %smax = select i1 %34, i32 %12, i32 %33
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit9, %._crit_edge4.loopexit
  %.lcssa6 = phi i32 [ %32, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit9 ]
  store i32 %.lcssa6, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #5
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
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !7, !4, !5}
