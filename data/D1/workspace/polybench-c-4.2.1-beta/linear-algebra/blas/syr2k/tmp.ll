; ModuleID = 'B.ll'
source_filename = "syr2k.c"
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
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1000 x double]*
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %15, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.preheader5.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit14.us, %.preheader5.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next36, %.loopexit14.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader5.us
  %indvars.iv33 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next34, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv35, %indvars.iv33
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv33
  %13 = add nuw nsw i64 %7, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.000000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %12, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv33
  store double %21, double* %22, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond39, label %.loopexit14.us, label %._crit_edge

.loopexit14.us:                                   ; preds = %._crit_edge
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond40, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %.loopexit14.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %23 ], [ 0, %.preheader.us ]
  %24 = mul nuw nsw i64 %indvars.iv31, %indvars.iv
  %25 = add nuw nsw i64 %24, 3
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1200
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 1.000000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  store double %29, double* %30, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %23

.loopexit.us:                                     ; preds = %23
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond41, label %.preheader4._crit_edge, label %.preheader.us

.preheader4._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert115 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat116 = shufflevector <2 x double> %broadcast.splatinsert115, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.loopexit11.us, %.preheader5.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %.loopexit11.us ], [ 0, %.preheader5.lr.ph ]
  %7 = add i64 %indvars.iv62, -3
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %indvars.iv62, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %10 = mul nuw nsw i64 %indvars.iv62, 1201
  %11 = add nuw nsw i64 %10, 1
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %11
  %12 = add nuw nsw i64 %indvars.iv62, 1
  %min.iters.check121 = icmp ult i64 %9, 4
  br i1 %min.iters.check121, label %.lr.ph.us.preheader139, label %min.iters.checked122

min.iters.checked122:                             ; preds = %.lr.ph.us.preheader
  %n.vec124 = and i64 %9, -4
  %cmp.zero125 = icmp eq i64 %n.vec124, 0
  br i1 %cmp.zero125, label %.lr.ph.us.preheader139, label %vector.ph126

vector.ph126:                                     ; preds = %min.iters.checked122
  %13 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %13, 0
  br i1 %lcmp.mod, label %vector.body118.prol.preheader, label %vector.body118.prol.loopexit.unr-lcssa

vector.body118.prol.preheader:                    ; preds = %vector.ph126
  br label %vector.body118.prol

vector.body118.prol:                              ; preds = %vector.body118.prol.preheader
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load135.prol = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load136.prol = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load135.prol, %broadcast.splat138
  %19 = fmul <2 x double> %wide.load136.prol, %broadcast.splat138
  %20 = bitcast double* %14 to <2 x double>*
  store <2 x double> %18, <2 x double>* %20, align 8
  %21 = bitcast double* %16 to <2 x double>*
  store <2 x double> %19, <2 x double>* %21, align 8
  br label %vector.body118.prol.loopexit.unr-lcssa

vector.body118.prol.loopexit.unr-lcssa:           ; preds = %vector.body118.prol, %vector.ph126
  %index127.unr.ph = phi i64 [ 4, %vector.body118.prol ], [ 0, %vector.ph126 ]
  br label %vector.body118.prol.loopexit

vector.body118.prol.loopexit:                     ; preds = %vector.body118.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %8, 0
  br i1 %22, label %middle.block119, label %vector.ph126.new

vector.ph126.new:                                 ; preds = %vector.body118.prol.loopexit
  br label %vector.body118

vector.body118:                                   ; preds = %vector.body118, %vector.ph126.new
  %index127 = phi i64 [ %index127.unr.ph, %vector.ph126.new ], [ %index.next128.1, %vector.body118 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index127
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %26, align 8
  %27 = fmul <2 x double> %wide.load135, %broadcast.splat138
  %28 = fmul <2 x double> %wide.load136, %broadcast.splat138
  %29 = bitcast double* %23 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8
  %30 = bitcast double* %25 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  %index.next128 = add i64 %index127, 4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index.next128
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load135.1 = load <2 x double>, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load136.1 = load <2 x double>, <2 x double>* %34, align 8
  %35 = fmul <2 x double> %wide.load135.1, %broadcast.splat138
  %36 = fmul <2 x double> %wide.load136.1, %broadcast.splat138
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8
  %index.next128.1 = add i64 %index127, 8
  %39 = icmp eq i64 %index.next128.1, %n.vec124
  br i1 %39, label %middle.block119.unr-lcssa, label %vector.body118, !llvm.loop !1

middle.block119.unr-lcssa:                        ; preds = %vector.body118
  br label %middle.block119

middle.block119:                                  ; preds = %middle.block119.unr-lcssa, %vector.body118.prol.loopexit
  %cmp.n130 = icmp eq i64 %9, %n.vec124
  br i1 %cmp.n130, label %.preheader.us25.preheader, label %.lr.ph.us.preheader139

.lr.ph.us.preheader139:                           ; preds = %middle.block119, %min.iters.checked122, %.lr.ph.us.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked122 ], [ 0, %.lr.ph.us.preheader ], [ %n.vec124, %middle.block119 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader139
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader139 ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %3
  store double %42, double* %40, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.preheader.us25.preheader.loopexit, label %.lr.ph.us, !llvm.loop !4

.preheader.us25.preheader.loopexit:               ; preds = %.lr.ph.us
  br label %.preheader.us25.preheader

.preheader.us25.preheader:                        ; preds = %.preheader.us25.preheader.loopexit, %middle.block119
  %min.iters.check76 = icmp ult i64 %12, 2
  %n.vec79 = and i64 %12, -2
  %cmp.zero80 = icmp eq i64 %n.vec79, 0
  %cmp.n111 = icmp eq i64 %12, %n.vec79
  br label %.preheader.us25

.preheader.us25:                                  ; preds = %.loopexit.us29, %.preheader.us25.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit.us29 ], [ 0, %.preheader.us25.preheader ]
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %43 = add nuw nsw i64 %indvars.iv45, 1
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %43
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv45
  %scevgep91 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv62, i64 %43
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv45
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv45
  br i1 %min.iters.check76, label %scalar.ph75.preheader, label %min.iters.checked77

min.iters.checked77:                              ; preds = %.preheader.us25
  br i1 %cmp.zero80, label %scalar.ph75.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked77
  %bound0 = icmp ult double* %scevgep, %45
  %bound1 = icmp ult double* %45, %scevgep83
  %found.conflict = and i1 %bound0, %bound1
  %bound094 = icmp ult double* %scevgep, %scevgep87
  %bound195 = icmp ult double* %scevgep85, %scevgep83
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx = or i1 %found.conflict, %found.conflict96
  %bound097 = icmp ult double* %scevgep, %scevgep91
  %bound198 = icmp ult double* %scevgep89, %scevgep83
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx100 = or i1 %conflict.rdx, %found.conflict99
  %bound0103 = icmp ult double* %scevgep, %44
  %bound1104 = icmp ult double* %44, %scevgep83
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx106 = or i1 %conflict.rdx100, %found.conflict105
  br i1 %conflict.rdx106, label %scalar.ph75.preheader, label %vector.ph107

vector.ph107:                                     ; preds = %vector.memcheck
  %46 = load double, double* %44, align 8, !alias.scope !6
  %47 = insertelement <2 x double> undef, double %46, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = load double, double* %45, align 8, !alias.scope !9
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %vector.ph107
  %index108 = phi i64 [ 0, %vector.ph107 ], [ %index.next109, %vector.body73 ]
  %52 = or i64 %index108, 1
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index108, i64 %indvars.iv45
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %52, i64 %indvars.iv45
  %55 = load double, double* %53, align 8, !alias.scope !11
  %56 = load double, double* %54, align 8, !alias.scope !11
  %57 = insertelement <2 x double> undef, double %55, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  %59 = fmul <2 x double> %58, %broadcast.splat116
  %60 = fmul <2 x double> %59, %48
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index108, i64 %indvars.iv45
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %52, i64 %indvars.iv45
  %63 = load double, double* %61, align 8, !alias.scope !13
  %64 = load double, double* %62, align 8, !alias.scope !13
  %65 = insertelement <2 x double> undef, double %63, i32 0
  %66 = insertelement <2 x double> %65, double %64, i32 1
  %67 = fmul <2 x double> %66, %broadcast.splat116
  %68 = fmul <2 x double> %67, %51
  %69 = fadd <2 x double> %60, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index108
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !15, !noalias !17
  %72 = fadd <2 x double> %wide.load117, %69
  %73 = bitcast double* %70 to <2 x double>*
  store <2 x double> %72, <2 x double>* %73, align 8, !alias.scope !15, !noalias !17
  %index.next109 = add i64 %index108, 2
  %74 = icmp eq i64 %index.next109, %n.vec79
  br i1 %74, label %middle.block74, label %vector.body73, !llvm.loop !18

middle.block74:                                   ; preds = %vector.body73
  br i1 %cmp.n111, label %.loopexit.us29, label %scalar.ph75.preheader

scalar.ph75.preheader:                            ; preds = %middle.block74, %vector.memcheck, %min.iters.checked77, %.preheader.us25
  %indvars.iv39.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked77 ], [ 0, %.preheader.us25 ], [ %n.vec79, %middle.block74 ]
  br label %scalar.ph75

scalar.ph75:                                      ; preds = %scalar.ph75, %scalar.ph75.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %scalar.ph75 ], [ %indvars.iv39.ph, %scalar.ph75.preheader ]
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv45
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %2
  %78 = load double, double* %44, align 8
  %79 = fmul double %77, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv45
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %45, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %79, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv39
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %exitcond44 = icmp eq i64 %indvars.iv39, %indvars.iv62
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  br i1 %exitcond44, label %.loopexit.us29.loopexit, label %scalar.ph75, !llvm.loop !19

.loopexit.us29.loopexit:                          ; preds = %scalar.ph75
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
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !2, !3}
!19 = distinct !{!19, !2, !3}
