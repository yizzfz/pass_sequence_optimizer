; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader13.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge16

.preheader13.lr.ph:                               ; preds = %2
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph39.._crit_edge40_crit_edge, %.preheader13.lr.ph
  %indvars.iv82 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next83, %.lr.ph39.._crit_edge40_crit_edge ]
  %4 = shl i64 %indvars.iv82, 32
  %sext = add i64 %4, 4294967296
  %5 = ashr exact i64 %sext, 32
  %scevgep78 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %5
  %6 = sub i64 1998, %indvars.iv82
  %7 = shl i64 %6, 3
  %8 = and i64 %7, 34359738360
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph35
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %9 ], [ 0, %.lr.ph35 ]
  %10 = sub nsw i64 0, %indvars.iv65
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %indvars.iv65
  store double %15, double* %16, align 8
  %exitcond72 = icmp eq i64 %indvars.iv65, %indvars.iv82
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br i1 %exitcond72, label %._crit_edge36, label %9

._crit_edge36:                                    ; preds = %9
  %scevgep7879 = bitcast double* %scevgep78 to i8*
  %17 = add nuw nsw i64 %8, 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %18 = icmp slt i64 %indvars.iv.next83, 2000
  br i1 %18, label %.lr.ph39.._crit_edge40_crit_edge, label %._crit_edge42.critedge

.lr.ph39.._crit_edge40_crit_edge:                 ; preds = %._crit_edge36
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7879, i8 0, i64 %17, i32 8, i1 false)
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %indvars.iv82
  store double 1.000000e+00, double* %19, align 8
  br label %.lr.ph35

._crit_edge42.critedge:                           ; preds = %._crit_edge36
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %indvars.iv82
  store double 1.000000e+00, double* %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %22 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge32.us.prol.loopexit, label %._crit_edge32.us.prol.preheader

._crit_edge32.us.prol.preheader:                  ; preds = %._crit_edge42.critedge
  br label %._crit_edge32.us.prol

._crit_edge32.us.prol:                            ; preds = %._crit_edge32.us.prol, %._crit_edge32.us.prol.preheader
  %indvars.iv63.prol = phi i64 [ 0, %._crit_edge32.us.prol.preheader ], [ %indvars.iv.next64.prol, %._crit_edge32.us.prol ]
  %prol.iter136 = phi i64 [ 0, %._crit_edge32.us.prol.preheader ], [ %prol.iter136.sub, %._crit_edge32.us.prol ]
  %23 = mul nuw nsw i64 %indvars.iv63.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %21, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter136.sub = add nsw i64 %prol.iter136, -1
  %prol.iter136.cmp = icmp eq i64 %prol.iter136.sub, 0
  br i1 %prol.iter136.cmp, label %._crit_edge32.us.prol.loopexit.unr-lcssa, label %._crit_edge32.us.prol, !llvm.loop !1

._crit_edge32.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge32.us.prol
  br label %._crit_edge32.us.prol.loopexit

._crit_edge32.us.prol.loopexit:                   ; preds = %._crit_edge42.critedge, %._crit_edge32.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.lr.ph, label %._crit_edge42.critedge.new

._crit_edge42.critedge.new:                       ; preds = %._crit_edge32.us.prol.loopexit
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us, %._crit_edge42.critedge.new
  %indvars.iv63 = phi i64 [ 0, %._crit_edge42.critedge.new ], [ %indvars.iv.next64.7, %._crit_edge32.us ]
  %24 = mul nuw nsw i64 %indvars.iv63, 16000
  %scevgep = getelementptr i8, i8* %21, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv63, 16000
  %26 = add i64 %25, 16000
  %scevgep.1 = getelementptr i8, i8* %21, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv63, 16000
  %28 = add i64 %27, 32000
  %scevgep.2 = getelementptr i8, i8* %21, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv63, 16000
  %30 = add i64 %29, 48000
  %scevgep.3 = getelementptr i8, i8* %21, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv63, 16000
  %32 = add i64 %31, 64000
  %scevgep.4 = getelementptr i8, i8* %21, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv63, 16000
  %34 = add i64 %33, 80000
  %scevgep.5 = getelementptr i8, i8* %21, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv63, 16000
  %36 = add i64 %35, 96000
  %scevgep.6 = getelementptr i8, i8* %21, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %37 = mul i64 %indvars.iv63, 16000
  %38 = add i64 %37, 112000
  %scevgep.7 = getelementptr i8, i8* %21, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next64.7 = add i64 %indvars.iv63, 8
  %39 = icmp slt i64 %indvars.iv.next64.7, 2000
  br i1 %39, label %._crit_edge32.us, label %.preheader10.lr.ph.unr-lcssa

.preheader10.lr.ph.unr-lcssa:                     ; preds = %._crit_edge32.us
  br label %.preheader10.lr.ph

.preheader10.lr.ph:                               ; preds = %._crit_edge32.us.prol.loopexit, %.preheader10.lr.ph.unr-lcssa
  br label %.preheader10.us..preheader9.us.us_crit_edge

.preheader10.us..preheader9.us.us_crit_edge:      ; preds = %._crit_edge21.us, %.preheader10.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next58, %._crit_edge21.us ]
  %scevgep89 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv57
  %scevgep8990 = bitcast double* %scevgep89 to i8*
  %40 = add nuw nsw i64 %indvars.iv57, 1
  %scevgep91 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %40
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  br label %.preheader9.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge19.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %41 = icmp slt i64 %indvars.iv.next58, 2000
  br i1 %41, label %.preheader10.us..preheader9.us.us_crit_edge, label %.preheader8..preheader.us_crit_edge

.preheader9.us.us:                                ; preds = %._crit_edge19.us.us, %.preheader10.us..preheader9.us.us_crit_edge
  %indvars.iv55 = phi i64 [ 0, %.preheader10.us..preheader9.us.us_crit_edge ], [ %indvars.iv.next56, %._crit_edge19.us.us ]
  %42 = mul nuw nsw i64 %indvars.iv55, 16000
  %scevgep87 = getelementptr i8, i8* %21, i64 %42
  %43 = add nuw nsw i64 16000, %42
  %scevgep88 = getelementptr i8, i8* %21, i64 %43
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv57
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv51.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ 2000, %middle.block ]
  br i1 true, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51.ph, i64 %indvars.iv57
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv55, i64 %indvars.iv51.ph
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next52.prol = or i64 %indvars.iv51.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv51.unr.ph = phi i64 [ %indvars.iv.next52.prol, %scalar.ph.prol ], [ %indvars.iv51.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge19.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep87, %scevgep9192
  %bound1 = icmp ult i8* %scevgep8990, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %44 to i8*
  %bc93 = bitcast double* %44 to i8*
  %bound094 = icmp ult i8* %scevgep87, %bc93
  %bound195 = icmp ult i8* %bc, %scevgep88
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx = or i1 %found.conflict, %found.conflict96
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %52 = load double, double* %44, align 8, !alias.scope !3
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = insertelement <2 x double> undef, double %52, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv57
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv57
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv57
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv57
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %54, %69
  %73 = fmul <2 x double> %56, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv55, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load98, %73
  %80 = bitcast double* %74 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %81 = bitcast double* %76 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge19.us.us, label %scalar.ph.preheader

._crit_edge19.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge19.us.us.loopexit

._crit_edge19.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge19.us.us.loopexit.unr-lcssa
  br label %._crit_edge19.us.us

._crit_edge19.us.us:                              ; preds = %._crit_edge19.us.us.loopexit, %middle.block
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %83 = icmp slt i64 %indvars.iv.next56, 2000
  br i1 %83, label %.preheader9.us.us, label %._crit_edge21.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next52.1, %scalar.ph ]
  %84 = load double, double* %44, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv57
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv55, i64 %indvars.iv51
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %91 = load double, double* %44, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next52, i64 %indvars.iv57
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next52
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52, 1999
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  br i1 %exitcond54.1, label %._crit_edge19.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.preheader8..preheader.us_crit_edge:              ; preds = %._crit_edge21.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader8..preheader.us_crit_edge
  %indvars.iv49 = phi i64 [ 0, %.preheader8..preheader.us_crit_edge ], [ %indvars.iv.next50, %._crit_edge.us ]
  %scevgep108 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 0
  %scevgep108109 = bitcast double* %scevgep108 to i8*
  %scevgep110 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 2000
  %scevgep110111 = bitcast double* %scevgep110 to i8*
  %98 = mul nuw nsw i64 %indvars.iv49, 16000
  %scevgep112 = getelementptr i8, i8* %21, i64 %98
  %99 = add nuw nsw i64 16000, %98
  %scevgep113 = getelementptr i8, i8* %21, i64 %99
  br i1 false, label %scalar.ph101.preheader, label %min.iters.checked103

min.iters.checked103:                             ; preds = %.preheader.us
  br i1 false, label %scalar.ph101.preheader, label %vector.memcheck118

vector.memcheck118:                               ; preds = %min.iters.checked103
  %bound0114 = icmp ult i8* %scevgep108109, %scevgep113
  %bound1115 = icmp ult i8* %scevgep112, %scevgep110111
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %scalar.ph101.preheader, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %vector.memcheck118
  br i1 false, label %vector.body99.prol.preheader, label %vector.body99.prol.loopexit.unr-lcssa

vector.body99.prol.preheader:                     ; preds = %vector.body99.preheader
  br label %vector.body99.prol

vector.body99.prol:                               ; preds = %vector.body99.prol.preheader
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 0
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load128.prol = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !15
  %102 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load129.prol = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !15
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 0
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load128.prol, <2 x i64>* %105, align 8, !alias.scope !18, !noalias !15
  %106 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load129.prol, <2 x i64>* %107, align 8, !alias.scope !18, !noalias !15
  br label %vector.body99.prol.loopexit.unr-lcssa

vector.body99.prol.loopexit.unr-lcssa:            ; preds = %vector.body99.preheader, %vector.body99.prol
  %index120.unr.ph = phi i64 [ 4, %vector.body99.prol ], [ 0, %vector.body99.preheader ]
  br label %vector.body99.prol.loopexit

vector.body99.prol.loopexit:                      ; preds = %vector.body99.prol.loopexit.unr-lcssa
  br i1 false, label %middle.block100, label %vector.body99.preheader.new

vector.body99.preheader.new:                      ; preds = %vector.body99.prol.loopexit
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99, %vector.body99.preheader.new
  %index120 = phi i64 [ %index120.unr.ph, %vector.body99.preheader.new ], [ %index.next121.1, %vector.body99 ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %index120
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load128 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !15
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load129 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !15
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %index120
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load128, <2 x i64>* %113, align 8, !alias.scope !18, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load129, <2 x i64>* %115, align 8, !alias.scope !18, !noalias !15
  %index.next121 = add i64 %index120, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %index.next121
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load128.1 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !15
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load129.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !15
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %index.next121
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load128.1, <2 x i64>* %121, align 8, !alias.scope !18, !noalias !15
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load129.1, <2 x i64>* %123, align 8, !alias.scope !18, !noalias !15
  %index.next121.1 = add i64 %index120, 8
  %124 = icmp eq i64 %index.next121.1, 2000
  br i1 %124, label %middle.block100.unr-lcssa, label %vector.body99, !llvm.loop !20

middle.block100.unr-lcssa:                        ; preds = %vector.body99
  br label %middle.block100

middle.block100:                                  ; preds = %vector.body99.prol.loopexit, %middle.block100.unr-lcssa
  br i1 true, label %._crit_edge.us, label %scalar.ph101.preheader

scalar.ph101.preheader:                           ; preds = %middle.block100, %vector.memcheck118, %min.iters.checked103, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck118 ], [ 0, %min.iters.checked103 ], [ 0, %.preheader.us ], [ 2000, %middle.block100 ]
  %125 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %scalar.ph101.prol.loopexit, label %scalar.ph101.prol.preheader

scalar.ph101.prol.preheader:                      ; preds = %scalar.ph101.preheader
  br label %scalar.ph101.prol

scalar.ph101.prol:                                ; preds = %scalar.ph101.prol, %scalar.ph101.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph101.prol ], [ %indvars.iv.ph, %scalar.ph101.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph101.prol ], [ 0, %scalar.ph101.prol.preheader ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %indvars.iv.prol
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.prol
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph101.prol.loopexit.unr-lcssa, label %scalar.ph101.prol, !llvm.loop !21

scalar.ph101.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph101.prol
  br label %scalar.ph101.prol.loopexit

scalar.ph101.prol.loopexit:                       ; preds = %scalar.ph101.preheader, %scalar.ph101.prol.loopexit.unr-lcssa
  %131 = icmp ult i64 %125, 3
  br i1 %131, label %._crit_edge.us.loopexit, label %scalar.ph101.preheader.new

scalar.ph101.preheader.new:                       ; preds = %scalar.ph101.prol.loopexit
  br label %scalar.ph101

scalar.ph101:                                     ; preds = %scalar.ph101, %scalar.ph101.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph101.preheader.new ], [ %indvars.iv.next.3, %scalar.ph101 ]
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %indvars.iv
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %indvars.iv.next
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %exitcond48.3 = icmp eq i64 %indvars.iv.next.2, 1999
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond48.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph101, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph101
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph101.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block100
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %152 = icmp slt i64 %indvars.iv.next50, 2000
  br i1 %152, label %.preheader.us, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge42.thread
  %153 = phi i8* [ %3, %._crit_edge42.thread ], [ %21, %._crit_edge16.loopexit ]
  tail call void @free(i8* %153) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %..preheader4_crit_edge, label %._crit_edge11

..preheader4_crit_edge:                           ; preds = %2
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %..preheader4_crit_edge
  %indvars.iv43 = phi i2 [ %indvars.iv.next44, %._crit_edge9 ], [ 0, %..preheader4_crit_edge ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge9 ], [ 0, %..preheader4_crit_edge ]
  %indvars.iv26 = phi i32 [ %indvars.iv.next27, %._crit_edge9 ], [ -1, %..preheader4_crit_edge ]
  %3 = zext i2 %indvars.iv43 to i64
  %4 = add nuw nsw i64 %indvars.iv41, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = icmp sgt i64 %indvars.iv41, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv41
  %wide.trip.count28 = zext i32 %indvars.iv26 to i64
  %.pre33 = load double, double* %8, align 8
  %xtraiter36 = and i64 %indvars.iv41, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod37, label %.prol.loopexit35, label %.prol.preheader34

.prol.preheader34:                                ; preds = %.lr.ph8
  br label %9

; <label>:9:                                      ; preds = %9, %.prol.preheader34
  %10 = phi double [ %14, %9 ], [ %.pre33, %.prol.preheader34 ]
  %indvars.iv22.prol = phi i64 [ %indvars.iv.next23.prol, %9 ], [ 0, %.prol.preheader34 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %9 ], [ %xtraiter36, %.prol.preheader34 ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv22.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fsub double %10, %13
  store double %14, double* %8, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit35.unr-lcssa, label %9, !llvm.loop !23

.prol.loopexit35.unr-lcssa:                       ; preds = %9
  br label %.prol.loopexit35

.prol.loopexit35:                                 ; preds = %.lr.ph8, %.prol.loopexit35.unr-lcssa
  %.unr38 = phi double [ %.pre33, %.lr.ph8 ], [ %14, %.prol.loopexit35.unr-lcssa ]
  %indvars.iv22.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %.prol.loopexit35.unr-lcssa ]
  %15 = icmp ult i64 %5, 3
  br i1 %15, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %.prol.loopexit35
  br label %46

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %._crit_edge ], [ -1, %.preheader.preheader ]
  %16 = add nuw nsw i64 %indvars.iv20, 4294967295
  %17 = and i64 %16, 4294967295
  %18 = icmp sgt i64 %indvars.iv20, 0
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv20
  br i1 %18, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.pre32 = load double, double* %19, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %wide.trip.count18 = zext i32 %indvars.iv16 to i64
  %.pre = load double, double* %19, align 8
  %20 = and i64 %16, 1
  %lcmp.mod = icmp eq i64 %20, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %21

; <label>:21:                                     ; preds = %.prol.preheader
  %22 = load double, double* %7, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 0
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %.pre, %25
  store double %26, double* %19, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %21
  %.lcssa.unr.ph = phi double [ %26, %21 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %26, %21 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %21 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %17, 0
  br i1 %27, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %28

; <label>:28:                                     ; preds = %28, %.lr.ph.new
  %29 = phi double [ %.unr.ph, %.lr.ph.new ], [ %41, %28 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %28 ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  store double %35, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv.next
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %19, align 8
  %exitcond19.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count18
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond19.1, label %._crit_edge.loopexit.unr-lcssa, label %28

._crit_edge.loopexit.unr-lcssa:                   ; preds = %28
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %41, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader.._crit_edge_crit_edge
  %42 = phi double [ %.pre32, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv20
  %44 = load double, double* %43, align 8
  %45 = fdiv double %42, %44
  store double %45, double* %19, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %indvars.iv.next17 = add nsw i32 %indvars.iv16, 1
  %exitcond = icmp ne i64 %indvars.iv.next21, %indvars.iv41
  br i1 %exitcond, label %.preheader, label %.lr.ph8

; <label>:46:                                     ; preds = %46, %.lr.ph8.new
  %47 = phi double [ %.unr38, %.lr.ph8.new ], [ %63, %46 ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr, %.lr.ph8.new ], [ %indvars.iv.next23.3, %46 ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv22
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %8, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next23
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %8, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next23.1
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %57
  %59 = fsub double %55, %58
  store double %59, double* %8, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next23.2
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %61
  %63 = fsub double %59, %62
  store double %63, double* %8, align 8
  %exitcond29.3 = icmp eq i64 %indvars.iv.next23.2, %wide.trip.count28
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv22, 4
  br i1 %exitcond29.3, label %._crit_edge9.loopexit.unr-lcssa, label %46

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %46
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %.prol.loopexit35, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv41
  %65 = load double, double* %64, align 8
  %66 = tail call double @sqrt(double %65) #3
  store double %66, double* %64, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %indvars.iv.next27 = add nsw i32 %indvars.iv26, 1
  %indvars.iv.next44 = add i2 %indvars.iv43, 1
  %exitcond45 = icmp ne i64 %indvars.iv.next42, 2000
  br i1 %exitcond45, label %.preheader4, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %..preheader_crit_edge, label %._crit_edge4

..preheader_crit_edge:                            ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %..preheader_crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 1, %..preheader_crit_edge ]
  %indvars.iv7 = phi i64 [ 0, %..preheader_crit_edge ], [ %indvars.iv.next8, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv7, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge5, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge5 ], [ 0, %.lr.ph ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge5

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %indvars.iv9
  br i1 %exitcond, label %8, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next8, 2000
  br i1 %exitcond11, label %.lr.ph, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
