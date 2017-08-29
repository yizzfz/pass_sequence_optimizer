; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge16

._crit_edge16:                                    ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge16, %._crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader28.lr.ph, label %.._crit_edge32_crit_edge

.._crit_edge32_crit_edge:                         ; preds = %7
  br label %._crit_edge32

.preheader28.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader28.us.preheader, label %.preheader28.lr.ph..preheader.lr.ph_crit_edge

.preheader28.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader28.lr.ph
  br label %.preheader.lr.ph

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  %10 = sitofp i32 %1 to double
  %11 = sitofp i32 %0 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> %12, double %10, i32 1
  %wide.trip.count45 = zext i32 %1 to i64
  %wide.trip.count49 = zext i32 %0 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us..preheader28.us_crit_edge, %.preheader28.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge35.us..preheader28.us_crit_edge ], [ 0, %.preheader28.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %._crit_edge ]
  %15 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv43
  %21 = add nuw nsw i64 %15, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, %13
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %28, double* %20, align 8
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv47, i64 %indvars.iv43
  store double %29, double* %30, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge35.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  br label %14

._crit_edge35.us:                                 ; preds = %14
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %.preheader27, label %._crit_edge35.us..preheader28.us_crit_edge

._crit_edge35.us..preheader28.us_crit_edge:       ; preds = %._crit_edge35.us
  br label %.preheader28.us

.preheader27:                                     ; preds = %._crit_edge35.us
  %31 = icmp sgt i32 %0, 0
  br i1 %31, label %.preheader27..preheader.lr.ph_crit_edge, label %.preheader27.._crit_edge32_crit_edge

.preheader27.._crit_edge32_crit_edge:             ; preds = %.preheader27
  br label %._crit_edge32

.preheader27..preheader.lr.ph_crit_edge:          ; preds = %.preheader27
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader27..preheader.lr.ph_crit_edge, %.preheader28.lr.ph..preheader.lr.ph_crit_edge
  %32 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br label %33

; <label>:33:                                     ; preds = %._crit_edge53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge53 ]
  %34 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %35 = add nuw nsw i64 %34, 3
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %32
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge53

._crit_edge53:                                    ; preds = %33
  br label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge.us.._crit_edge32_crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us.._crit_edge32_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge.us.._crit_edge32_crit_edge, %.preheader27.._crit_edge32_crit_edge, %.._crit_edge32_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader32.lr.ph, label %.._crit_edge41_crit_edge

.._crit_edge41_crit_edge:                         ; preds = %7
  br label %._crit_edge41

.preheader32.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader32.lr.ph
  %wide.trip.count83 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader32.lr.ph
  %wide.trip.count60 = zext i32 %1 to i64
  %wide.trip.count67 = zext i32 %0 to i64
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert112 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat113 = shufflevector <2 x double> %broadcast.splatinsert112, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge, %.lr.ph.us.new..lr.ph.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %19 = bitcast double* %18 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %21 = fmul <2 x double> %20, %15
  %22 = bitcast double* %18 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, %17
  %27 = bitcast double* %23 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.lr.ph.us.new..preheader.us43_crit_edge, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us.new..preheader.us43_crit_edge:          ; preds = %.lr.ph.us.new
  br label %.preheader.us43.preheader

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph.scalar.ph_crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv53.ph, %scalar.ph.preheader ]
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv58
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %2
  %31 = load double, double* %43, align 8
  %32 = fmul double %30, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv53, i64 %indvars.iv58
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %2
  %36 = load double, double* %44, align 8
  %37 = fmul double %35, %36
  %38 = fadd double %32, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv53
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, %38
  store double %41, double* %39, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond = icmp eq i64 %indvars.iv.next54, %indvars.iv63
  br i1 %exitcond, label %scalar.ph.._crit_edge.us46_crit_edge, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !1

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

scalar.ph.._crit_edge.us46_crit_edge:             ; preds = %scalar.ph
  br label %._crit_edge.us46

.preheader.us43:                                  ; preds = %.preheader.us43.preheader, %._crit_edge.us46..preheader.us43_crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge.us46..preheader.us43_crit_edge ], [ 0, %.preheader.us43.preheader ]
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv58
  %42 = add i64 %indvars.iv58, 1
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %42
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv58
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv65, i64 %42
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv58
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv58
  br i1 %min.iters.check, label %.preheader.us43.scalar.ph_crit_edge, label %min.iters.checked

.preheader.us43.scalar.ph_crit_edge:              ; preds = %.preheader.us43
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader.us43
  br i1 %cmp.zero, label %min.iters.checked.scalar.ph_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph_crit_edge:            ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %44
  %bound1 = icmp ult double* %44, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %scevgep92
  %bound1100 = icmp ult double* %scevgep90, %scevgep88
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  %bound0102 = icmp ult double* %scevgep, %scevgep96
  %bound1103 = icmp ult double* %scevgep94, %scevgep88
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx105 = or i1 %conflict.rdx, %found.conflict104
  %bound0108 = icmp ult double* %scevgep, %43
  %bound1109 = icmp ult double* %43, %scevgep88
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx111 = or i1 %conflict.rdx105, %found.conflict110
  br i1 %conflict.rdx111, label %vector.memcheck.scalar.ph_crit_edge, label %vector.ph

vector.memcheck.scalar.ph_crit_edge:              ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %45 = or i64 %index, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv58
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %45, i64 %indvars.iv58
  %48 = load double, double* %46, align 8, !alias.scope !4
  %49 = load double, double* %47, align 8, !alias.scope !4
  %50 = insertelement <2 x double> undef, double %48, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %51, %broadcast.splat113
  %53 = load double, double* %43, align 8, !alias.scope !7
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = fmul <2 x double> %52, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv58
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %45, i64 %indvars.iv58
  %59 = load double, double* %57, align 8, !alias.scope !9
  %60 = load double, double* %58, align 8, !alias.scope !9
  %61 = insertelement <2 x double> undef, double %59, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fmul <2 x double> %62, %broadcast.splat113
  %64 = load double, double* %44, align 8, !alias.scope !11
  %65 = insertelement <2 x double> undef, double %64, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = fmul <2 x double> %63, %66
  %68 = fadd <2 x double> %56, %67
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %index
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  %71 = fadd <2 x double> %wide.load, %68
  %72 = bitcast double* %69 to <2 x double>*
  store <2 x double> %71, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge.us46_crit_edge, label %middle.block.scalar.ph_crit_edge

middle.block.scalar.ph_crit_edge:                 ; preds = %middle.block
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us43.scalar.ph_crit_edge, %min.iters.checked.scalar.ph_crit_edge, %vector.memcheck.scalar.ph_crit_edge, %middle.block.scalar.ph_crit_edge
  %indvars.iv53.ph = phi i64 [ 0, %vector.memcheck.scalar.ph_crit_edge ], [ 0, %min.iters.checked.scalar.ph_crit_edge ], [ 0, %.preheader.us43.scalar.ph_crit_edge ], [ %n.vec, %middle.block.scalar.ph_crit_edge ]
  br label %scalar.ph

middle.block.._crit_edge.us46_crit_edge:          ; preds = %middle.block
  br label %._crit_edge.us46

.lr.ph.us:                                        ; preds = %._crit_edge37.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge37.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge37.us..lr.ph.us_crit_edge ], [ 1, %.lr.ph.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  %74 = mul i64 %indvars.iv65, 1201
  %75 = add i64 %74, 1
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %75
  %76 = add i64 %indvars.iv65, 1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %77 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter = and i32 %77, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.lr.ph.us..prol.preheader_crit_edge

.lr.ph.us..prol.preheader_crit_edge:              ; preds = %.lr.ph.us
  br label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph.us..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.lr.ph.us..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph.us..prol.preheader_crit_edge ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.prol
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %3
  store double %80, double* %78, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !17

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader..prol.loopexit_crit_edge, %.lr.ph.us..prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.preheader..prol.loopexit_crit_edge ]
  %81 = icmp ult i64 %indvars.iv65, 3
  br i1 %81, label %.prol.loopexit..preheader.us43_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.prol.loopexit..preheader.us43_crit_edge:         ; preds = %.prol.loopexit
  br label %.preheader.us43.preheader

.preheader.us43.preheader:                        ; preds = %.lr.ph.us.new..preheader.us43_crit_edge, %.prol.loopexit..preheader.us43_crit_edge
  %min.iters.check = icmp ult i64 %76, 2
  %n.vec = and i64 %76, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %76, %n.vec
  br label %.preheader.us43

._crit_edge.us46:                                 ; preds = %middle.block.._crit_edge.us46_crit_edge, %scalar.ph.._crit_edge.us46_crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge37.us, label %._crit_edge.us46..preheader.us43_crit_edge

._crit_edge.us46..preheader.us43_crit_edge:       ; preds = %._crit_edge.us46
  br label %.preheader.us43

._crit_edge37.us:                                 ; preds = %._crit_edge.us46
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge37.us.._crit_edge41_crit_edge, label %._crit_edge37.us..lr.ph.us_crit_edge

._crit_edge37.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge37.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %.lr.ph.us

._crit_edge37.us.._crit_edge41_crit_edge:         ; preds = %._crit_edge37.us
  br label %._crit_edge41

.lr.ph:                                           ; preds = %.preheader31..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %.preheader31..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %.preheader31..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %82 = trunc i64 %indvars.iv.next82 to i32
  %xtraiter76 = and i32 %82, 3
  %lcmp.mod77 = icmp eq i32 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.lr.ph..prol.loopexit75_crit_edge, label %.lr.ph..prol.preheader74_crit_edge

.lr.ph..prol.preheader74_crit_edge:               ; preds = %.lr.ph
  br label %.prol.preheader74

.lr.ph..prol.loopexit75_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit75

.prol.preheader74:                                ; preds = %.prol.preheader74..prol.preheader74_crit_edge, %.lr.ph..prol.preheader74_crit_edge
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.prol.preheader74..prol.preheader74_crit_edge ], [ 0, %.lr.ph..prol.preheader74_crit_edge ]
  %prol.iter78 = phi i32 [ %prol.iter78.sub, %.prol.preheader74..prol.preheader74_crit_edge ], [ %xtraiter76, %.lr.ph..prol.preheader74_crit_edge ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv69.prol
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, %3
  store double %85, double* %83, align 8
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter78.sub = add i32 %prol.iter78, -1
  %prol.iter78.cmp = icmp eq i32 %prol.iter78.sub, 0
  br i1 %prol.iter78.cmp, label %.prol.preheader74..prol.loopexit75_crit_edge, label %.prol.preheader74..prol.preheader74_crit_edge, !llvm.loop !19

.prol.preheader74..prol.preheader74_crit_edge:    ; preds = %.prol.preheader74
  br label %.prol.preheader74

.prol.preheader74..prol.loopexit75_crit_edge:     ; preds = %.prol.preheader74
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.prol.preheader74..prol.loopexit75_crit_edge, %.lr.ph..prol.loopexit75_crit_edge
  %indvars.iv69.unr = phi i64 [ 0, %.lr.ph..prol.loopexit75_crit_edge ], [ %indvars.iv.next70.prol, %.prol.preheader74..prol.loopexit75_crit_edge ]
  %86 = icmp ult i64 %indvars.iv81, 3
  br i1 %86, label %.prol.loopexit75..preheader31_crit_edge, label %.prol.loopexit75..lr.ph.new_crit_edge

.prol.loopexit75..lr.ph.new_crit_edge:            ; preds = %.prol.loopexit75
  br label %.lr.ph.new

.prol.loopexit75..preheader31_crit_edge:          ; preds = %.prol.loopexit75
  br label %.preheader31

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.prol.loopexit75..lr.ph.new_crit_edge
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv69.unr, %.prol.loopexit75..lr.ph.new_crit_edge ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv69
  %88 = bitcast double* %87 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %88, align 8
  %90 = fmul <2 x double> %89, %11
  %91 = bitcast double* %87 to <2 x double>*
  store <2 x double> %90, <2 x double>* %91, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv81, i64 %indvars.iv.next70.1
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8
  %95 = fmul <2 x double> %94, %13
  %96 = bitcast double* %92 to <2 x double>*
  store <2 x double> %95, <2 x double>* %96, align 8
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next70.3, %indvars.iv79
  br i1 %exitcond73.3, label %.lr.ph.new..preheader31_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new..preheader31_crit_edge:                ; preds = %.lr.ph.new
  br label %.preheader31

.preheader31:                                     ; preds = %.lr.ph.new..preheader31_crit_edge, %.prol.loopexit75..preheader31_crit_edge
  %exitcond84 = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond84, label %.preheader31.._crit_edge41_crit_edge, label %.preheader31..lr.ph_crit_edge

.preheader31..lr.ph_crit_edge:                    ; preds = %.preheader31
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  br label %.lr.ph

.preheader31.._crit_edge41_crit_edge:             ; preds = %.preheader31
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %.preheader31.._crit_edge41_crit_edge, %._crit_edge37.us.._crit_edge41_crit_edge, %.._crit_edge41_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %2
  br label %._crit_edge12

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us..preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %10
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %15
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge17

._crit_edge17:                                    ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge.us.._crit_edge12_crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us.._crit_edge12_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge.us.._crit_edge12_crit_edge, %.._crit_edge12_crit_edge
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12}
!12 = distinct !{!12, !6}
!13 = !{!14}
!14 = distinct !{!14, !6}
!15 = !{!12, !5, !10, !8}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}
