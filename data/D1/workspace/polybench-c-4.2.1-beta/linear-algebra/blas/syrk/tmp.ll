; ModuleID = 'B.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %5 to [1200 x double]*
  %12 = bitcast i8* %6 to [1000 x double]*
  call void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %11, [1000 x double]* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %14, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*) #2 {
.preheader5.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit14.us, %.preheader5.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next38, %.loopexit14.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader5.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %6 ], [ 0, %.preheader5.us ]
  %7 = mul nuw nsw i64 %indvars.iv37, %indvars.iv33
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv33
  store double %12, double* %13, align 8
  %exitcond36 = icmp eq i64 %indvars.iv33, 999
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br i1 %exitcond36, label %.loopexit14.us, label %6

.loopexit14.us:                                   ; preds = %6
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond41, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %.loopexit14.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.preheader.us ]
  %15 = mul nuw nsw i64 %indvars.iv31, %indvars.iv
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  store double %20, double* %21, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %14

.loopexit.us:                                     ; preds = %14
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond42, label %.preheader4._crit_edge, label %.preheader.us

.preheader4._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat126 = shufflevector <2 x double> %broadcast.splatinsert125, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.loopexit11.us, %.preheader5.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %.loopexit11.us ], [ 0, %.preheader5.lr.ph ]
  %6 = add i64 %indvars.iv62, 1
  %7 = add i64 %indvars.iv62, -3
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %indvars.iv62, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %10 = mul nuw nsw i64 %indvars.iv62, 1201
  %11 = add nuw nsw i64 %10, 1
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %11
  %12 = add nuw nsw i64 %indvars.iv62, 1
  %min.iters.check109 = icmp ult i64 %9, 4
  br i1 %min.iters.check109, label %.lr.ph.us.preheader127, label %min.iters.checked110

min.iters.checked110:                             ; preds = %.lr.ph.us.preheader
  %n.vec112 = and i64 %9, -4
  %cmp.zero113 = icmp eq i64 %n.vec112, 0
  br i1 %cmp.zero113, label %.lr.ph.us.preheader127, label %vector.ph114

vector.ph114:                                     ; preds = %min.iters.checked110
  %13 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %13, 0
  br i1 %lcmp.mod, label %vector.body106.prol.preheader, label %vector.body106.prol.loopexit.unr-lcssa

vector.body106.prol.preheader:                    ; preds = %vector.ph114
  br label %vector.body106.prol

vector.body106.prol:                              ; preds = %vector.body106.prol.preheader
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load123.prol = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load124.prol = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load123.prol, %broadcast.splat126
  %19 = fmul <2 x double> %wide.load124.prol, %broadcast.splat126
  %20 = bitcast double* %14 to <2 x double>*
  store <2 x double> %18, <2 x double>* %20, align 8
  %21 = bitcast double* %16 to <2 x double>*
  store <2 x double> %19, <2 x double>* %21, align 8
  br label %vector.body106.prol.loopexit.unr-lcssa

vector.body106.prol.loopexit.unr-lcssa:           ; preds = %vector.body106.prol, %vector.ph114
  %index115.unr.ph = phi i64 [ 4, %vector.body106.prol ], [ 0, %vector.ph114 ]
  br label %vector.body106.prol.loopexit

vector.body106.prol.loopexit:                     ; preds = %vector.body106.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %8, 0
  br i1 %22, label %middle.block107, label %vector.ph114.new

vector.ph114.new:                                 ; preds = %vector.body106.prol.loopexit
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106, %vector.ph114.new
  %index115 = phi i64 [ %index115.unr.ph, %vector.ph114.new ], [ %index.next116.1, %vector.body106 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index115
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %26, align 8
  %27 = fmul <2 x double> %wide.load123, %broadcast.splat126
  %28 = fmul <2 x double> %wide.load124, %broadcast.splat126
  %29 = bitcast double* %23 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8
  %30 = bitcast double* %25 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  %index.next116 = add i64 %index115, 4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index.next116
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load123.1 = load <2 x double>, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load124.1 = load <2 x double>, <2 x double>* %34, align 8
  %35 = fmul <2 x double> %wide.load123.1, %broadcast.splat126
  %36 = fmul <2 x double> %wide.load124.1, %broadcast.splat126
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8
  %index.next116.1 = add i64 %index115, 8
  %39 = icmp eq i64 %index.next116.1, %n.vec112
  br i1 %39, label %middle.block107.unr-lcssa, label %vector.body106, !llvm.loop !1

middle.block107.unr-lcssa:                        ; preds = %vector.body106
  br label %middle.block107

middle.block107:                                  ; preds = %middle.block107.unr-lcssa, %vector.body106.prol.loopexit
  %cmp.n118 = icmp eq i64 %9, %n.vec112
  br i1 %cmp.n118, label %.preheader.us25.preheader, label %.lr.ph.us.preheader127

.lr.ph.us.preheader127:                           ; preds = %middle.block107, %min.iters.checked110, %.lr.ph.us.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked110 ], [ 0, %.lr.ph.us.preheader ], [ %n.vec112, %middle.block107 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader127
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader127 ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %3
  store double %42, double* %40, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.preheader.us25.preheader.loopexit, label %.lr.ph.us, !llvm.loop !4

.preheader.us25.preheader.loopexit:               ; preds = %.lr.ph.us
  br label %.preheader.us25.preheader

.preheader.us25.preheader:                        ; preds = %.preheader.us25.preheader.loopexit, %middle.block107
  %min.iters.check76 = icmp ult i64 %12, 4
  %n.vec79 = and i64 %12, -4
  %cmp.zero80 = icmp eq i64 %n.vec79, 0
  %cmp.n97 = icmp eq i64 %12, %n.vec79
  br label %.preheader.us25

.preheader.us25:                                  ; preds = %.loopexit.us29, %.preheader.us25.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit.us29 ], [ 0, %.preheader.us25.preheader ]
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %43 = add nuw nsw i64 %indvars.iv45, 1
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %43
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv45
  br i1 %min.iters.check76, label %scalar.ph75.preheader, label %min.iters.checked77

min.iters.checked77:                              ; preds = %.preheader.us25
  br i1 %cmp.zero80, label %scalar.ph75.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked77
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ult double* %scevgep85, %scevgep83
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %44
  %bound191 = icmp ult double* %44, %scevgep83
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  br i1 %conflict.rdx, label %scalar.ph75.preheader, label %vector.ph93

vector.ph93:                                      ; preds = %vector.memcheck
  %45 = load double, double* %44, align 8, !alias.scope !6
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = insertelement <2 x double> undef, double %45, i32 0
  %48 = fmul <2 x double> %46, %broadcast.splatinsert102
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %47, %broadcast.splatinsert102
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %vector.ph93
  %index94 = phi i64 [ 0, %vector.ph93 ], [ %index.next95, %vector.body73 ]
  %52 = or i64 %index94, 1
  %53 = or i64 %index94, 2
  %54 = or i64 %index94, 3
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index94, i64 %indvars.iv45
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %52, i64 %indvars.iv45
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %53, i64 %indvars.iv45
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %54, i64 %indvars.iv45
  %59 = load double, double* %55, align 8, !alias.scope !9
  %60 = load double, double* %56, align 8, !alias.scope !9
  %61 = load double, double* %57, align 8, !alias.scope !9
  %62 = load double, double* %58, align 8, !alias.scope !9
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = fmul <2 x double> %49, %64
  %68 = fmul <2 x double> %51, %66
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index94
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !11, !noalias !13
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !11, !noalias !13
  %73 = fadd <2 x double> %67, %wide.load104
  %74 = fadd <2 x double> %68, %wide.load105
  %75 = bitcast double* %69 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !11, !noalias !13
  %76 = bitcast double* %71 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !11, !noalias !13
  %index.next95 = add i64 %index94, 4
  %77 = icmp eq i64 %index.next95, %n.vec79
  br i1 %77, label %middle.block74, label %vector.body73, !llvm.loop !14

middle.block74:                                   ; preds = %vector.body73
  br i1 %cmp.n97, label %.loopexit.us29, label %scalar.ph75.preheader

scalar.ph75.preheader:                            ; preds = %middle.block74, %vector.memcheck, %min.iters.checked77, %.preheader.us25
  %indvars.iv39.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked77 ], [ 0, %.preheader.us25 ], [ %n.vec79, %middle.block74 ]
  %78 = sub i64 %6, %indvars.iv39.ph
  %xtraiter128 = and i64 %78, 1
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  br i1 %lcmp.mod129, label %scalar.ph75.prol.loopexit.unr-lcssa, label %scalar.ph75.prol.preheader

scalar.ph75.prol.preheader:                       ; preds = %scalar.ph75.preheader
  br label %scalar.ph75.prol

scalar.ph75.prol:                                 ; preds = %scalar.ph75.prol.preheader
  %79 = load double, double* %44, align 8
  %80 = fmul double %79, %2
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39.ph, i64 %indvars.iv45
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv39.ph
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  store double %86, double* %84, align 8
  %indvars.iv.next40.prol = or i64 %indvars.iv39.ph, 1
  br label %scalar.ph75.prol.loopexit.unr-lcssa

scalar.ph75.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph75.prol, %scalar.ph75.preheader
  %indvars.iv39.unr.ph = phi i64 [ %indvars.iv.next40.prol, %scalar.ph75.prol ], [ %indvars.iv39.ph, %scalar.ph75.preheader ]
  br label %scalar.ph75.prol.loopexit

scalar.ph75.prol.loopexit:                        ; preds = %scalar.ph75.prol.loopexit.unr-lcssa
  %87 = icmp eq i64 %indvars.iv62, %indvars.iv39.ph
  br i1 %87, label %.loopexit.us29.loopexit, label %scalar.ph75.preheader.new

scalar.ph75.preheader.new:                        ; preds = %scalar.ph75.prol.loopexit
  br label %scalar.ph75

scalar.ph75:                                      ; preds = %scalar.ph75, %scalar.ph75.preheader.new
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr.ph, %scalar.ph75.preheader.new ], [ %indvars.iv.next40.1, %scalar.ph75 ]
  %88 = load double, double* %44, align 8
  %89 = fmul double %88, %2
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv45
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv39
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  store double %95, double* %93, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %96 = load double, double* %44, align 8
  %97 = fmul double %96, %2
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next40, i64 %indvars.iv45
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next40
  %102 = load double, double* %101, align 8
  %103 = fadd double %100, %102
  store double %103, double* %101, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next40, %indvars.iv62
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  br i1 %exitcond44.1, label %.loopexit.us29.loopexit.unr-lcssa, label %scalar.ph75, !llvm.loop !15

.loopexit.us29.loopexit.unr-lcssa:                ; preds = %scalar.ph75
  br label %.loopexit.us29.loopexit

.loopexit.us29.loopexit:                          ; preds = %.loopexit.us29.loopexit.unr-lcssa, %scalar.ph75.prol.loopexit
  br label %.loopexit.us29

.loopexit.us29:                                   ; preds = %.loopexit.us29.loopexit, %middle.block74
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond60, label %.loopexit11.us, label %.preheader.us25

.loopexit11.us:                                   ; preds = %.loopexit.us29
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 1200
  br i1 %exitcond64, label %._crit_edge, label %.lr.ph.us.preheader

._crit_edge:                                      ; preds = %.loopexit11.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %11, %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!10, !7}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
