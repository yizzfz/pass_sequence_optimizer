; ModuleID = 'B.ll'
source_filename = "gemm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge20

.._crit_edge_crit_edge20:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1100 x double]*
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %.._crit_edge_crit_edge20, %.._crit_edge_crit_edge
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
.preheader43.lr.ph:
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %._crit_edge55.us..preheader43.us_crit_edge, %.preheader43.lr.ph
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge55.us..preheader43.us_crit_edge ], [ 0, %.preheader43.lr.ph ]
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.preheader43.us
  %indvars.iv75 = phi i64 [ 0, %.preheader43.us ], [ %indvars.iv.next76, %._crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv75, %indvars.iv79
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv79, i64 %indvars.iv75
  store double %14, double* %15, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1100
  br i1 %exitcond78, label %._crit_edge55.us, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %8

._crit_edge55.us:                                 ; preds = %8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 1000
  br i1 %exitcond82, label %._crit_edge55.us..preheader41.us_crit_edge, label %._crit_edge55.us..preheader43.us_crit_edge

._crit_edge55.us..preheader43.us_crit_edge:       ; preds = %._crit_edge55.us
  br label %.preheader43.us

._crit_edge55.us..preheader41.us_crit_edge:       ; preds = %._crit_edge55.us
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge50.us..preheader41.us_crit_edge, %._crit_edge55.us..preheader41.us_crit_edge
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge50.us..preheader41.us_crit_edge ], [ 0, %._crit_edge55.us..preheader41.us_crit_edge ]
  br label %.preheader41.us.new

.preheader41.us.new:                              ; preds = %.preheader41.us.new..preheader41.us.new_crit_edge, %.preheader41.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %.preheader41.us.new..preheader41.us.new_crit_edge ], [ 0, %.preheader41.us ]
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %16 = mul nuw nsw i64 %indvars.iv.next67, %indvars.iv70
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1200
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv66
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %21 = mul nuw nsw i64 %indvars.iv.next67.1, %indvars.iv70
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.200000e+03, double 1.200000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67.1, 1200
  br i1 %exitcond69.1, label %._crit_edge50.us, label %.preheader41.us.new..preheader41.us.new_crit_edge

.preheader41.us.new..preheader41.us.new_crit_edge: ; preds = %.preheader41.us.new
  br label %.preheader41.us.new

._crit_edge50.us:                                 ; preds = %.preheader41.us.new
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 1000
  br i1 %exitcond73, label %._crit_edge50.us..preheader.us_crit_edge, label %._crit_edge50.us..preheader41.us_crit_edge

._crit_edge50.us..preheader41.us_crit_edge:       ; preds = %._crit_edge50.us
  br label %.preheader41.us

._crit_edge50.us..preheader.us_crit_edge:         ; preds = %._crit_edge50.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge50.us..preheader.us_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %._crit_edge50.us..preheader.us_crit_edge ]
  br label %29

; <label>:29:                                     ; preds = %._crit_edge85, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge85 ]
  %30 = add nuw nsw i64 %indvars.iv, 2
  %31 = mul nuw nsw i64 %30, %indvars.iv61
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.100000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv61, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge85

._crit_edge85:                                    ; preds = %29
  br label %29

._crit_edge.us:                                   ; preds = %29
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond64, label %._crit_edge47, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge47:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
.preheader28.lr.ph:
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = insertelement <2 x double> undef, double %4, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge33.us..preheader28.us_crit_edge, %.preheader28.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader28.lr.ph ], [ %indvars.iv.next58, %._crit_edge33.us..preheader28.us_crit_edge ]
  br label %.preheader28.us.new

._crit_edge33.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond60, label %._crit_edge35, label %._crit_edge33.us..preheader28.us_crit_edge

._crit_edge33.us..preheader28.us_crit_edge:       ; preds = %._crit_edge33.us
  br label %.preheader28.us

.preheader28.us.new:                              ; preds = %.preheader28.us.new..preheader28.us.new_crit_edge, %.preheader28.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader28.us.new..preheader28.us.new_crit_edge ], [ 0, %.preheader28.us ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv
  %13 = bitcast double* %12 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %15 = fmul <2 x double> %14, %9
  %16 = bitcast double* %12 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %18 = bitcast double* %17 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %20 = fmul <2 x double> %19, %11
  %21 = bitcast double* %17 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond.3, label %.preheader28.us.new..preheader.us.us_crit_edge, label %.preheader28.us.new..preheader28.us.new_crit_edge

.preheader28.us.new..preheader28.us.new_crit_edge: ; preds = %.preheader28.us.new
  br label %.preheader28.us.new

.preheader28.us.new..preheader.us.us_crit_edge:   ; preds = %.preheader28.us.new
  %scevgep84 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 0
  %scevgep87 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 1100
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader28.us.new..preheader.us.us_crit_edge
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader28.us.new..preheader.us.us_crit_edge ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv54
  %scevgep90 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 0
  %scevgep93 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 1100
  %bound0 = icmp ult double* %scevgep84, %22
  %bound1 = icmp ult double* %22, %scevgep87
  %found.conflict = and i1 %bound0, %bound1
  %bound096 = icmp ult double* %scevgep84, %scevgep93
  %bound197 = icmp ult double* %scevgep90, %scevgep87
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx = or i1 %found.conflict, %found.conflict98
  br i1 %conflict.rdx, label %.preheader.us.us..preheader.us.us.new_crit_edge, label %vector.ph

.preheader.us.us..preheader.us.us.new_crit_edge:  ; preds = %.preheader.us.us
  br label %.preheader.us.us.new.preheader

vector.ph:                                        ; preds = %.preheader.us.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %23 = shl i64 %index, 1
  %24 = load double, double* %22, align 8, !alias.scope !1
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = fmul <2 x double> %25, %broadcast.splatinsert99
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 %23
  %29 = bitcast double* %28 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec101 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fmul <2 x double> %27, %strided.vec
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %23
  %32 = bitcast double* %31 to <4 x double>*
  %wide.vec102 = load <4 x double>, <4 x double>* %32, align 8, !alias.scope !6, !noalias !8
  %strided.vec103 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec104 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %33 = fadd <2 x double> %strided.vec103, %30
  %34 = or i64 %23, 1
  %35 = load double, double* %22, align 8, !alias.scope !1
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = fmul <2 x double> %36, %broadcast.splatinsert99
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = fmul <2 x double> %38, %strided.vec101
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %34
  %41 = fadd <2 x double> %strided.vec104, %39
  %42 = getelementptr double, double* %40, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %33, <2 x double> %41, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %44 = icmp eq i64 %index.next, 550
  br i1 %44, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 true, label %middle.block.._crit_edge.us.us_crit_edge, label %middle.block..preheader.us.us.new_crit_edge

middle.block..preheader.us.us.new_crit_edge:      ; preds = %middle.block
  br label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %middle.block..preheader.us.us.new_crit_edge, %.preheader.us.us..preheader.us.us.new_crit_edge
  %indvars.iv46.ph = phi i64 [ 0, %.preheader.us.us..preheader.us.us.new_crit_edge ], [ 1100, %middle.block..preheader.us.us.new_crit_edge ]
  br label %.preheader.us.us.new

middle.block.._crit_edge.us.us_crit_edge:         ; preds = %middle.block
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new.._crit_edge.us.us_crit_edge, %middle.block.._crit_edge.us.us_crit_edge
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond, label %._crit_edge33.us, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv46.ph, %.preheader.us.us.new.preheader ]
  %45 = load double, double* %22, align 8
  %46 = fmul double %45, %3
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 %indvars.iv46
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv46
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %53 = load double, double* %22, align 8
  %54 = fmul double %53, %3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 %indvars.iv.next47
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv.next47
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, 1100
  br i1 %exitcond.1, label %.preheader.us.us.new.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new..preheader.us.us.new_crit_edge, !llvm.loop !12

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

.preheader.us.us.new.._crit_edge.us.us_crit_edge: ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge35:                                    ; preds = %._crit_edge33.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge12.us..preheader.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv16, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %8
  br label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %.._crit_edge.us_crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %8

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond19, label %._crit_edge14, label %._crit_edge12.us..preheader.us_crit_edge

._crit_edge12.us..preheader.us_crit_edge:         ; preds = %._crit_edge12.us
  br label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
