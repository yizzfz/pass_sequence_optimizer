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

.lr.ph35:                                         ; preds = %._crit_edge40, %.preheader13.lr.ph
  %indvars.iv82 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next83, %._crit_edge40 ]
  %indvars.iv80 = phi i64 [ 1, %.preheader13.lr.ph ], [ %indvars.iv.next81, %._crit_edge40 ]
  %4 = mul i64 %indvars.iv82, 2001
  %5 = add i64 %4, 1
  %scevgep90 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = mul i64 %indvars.iv82, -8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph35
  %indvars.iv68 = phi i64 [ 0, %.lr.ph35 ], [ %indvars.iv.next69, %._crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv68
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %indvars.iv68
  store double %12, double* %13, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next69, %indvars.iv80
  br i1 %exitcond73, label %._crit_edge36, label %._crit_edge

._crit_edge36:                                    ; preds = %._crit_edge
  %scevgep9091 = bitcast double* %scevgep90 to i8*
  %14 = add i64 15992, %6
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %15 = icmp slt i64 %indvars.iv.next83, 2000
  br i1 %15, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge40.loopexit:                           ; preds = %._crit_edge36
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9091, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge36, %._crit_edge40.loopexit
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82, i64 %indvars.iv82
  store double 1.000000e+00, double* %16, align 8
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 2000
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  br i1 %exitcond85, label %._crit_edge42, label %.lr.ph35

._crit_edge42:                                    ; preds = %._crit_edge40
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %18 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge32.us.prol.loopexit, label %._crit_edge32.us.prol.preheader

._crit_edge32.us.prol.preheader:                  ; preds = %._crit_edge42
  br label %._crit_edge32.us.prol

._crit_edge32.us.prol:                            ; preds = %._crit_edge32.us.prol, %._crit_edge32.us.prol.preheader
  %indvars.iv64.prol = phi i64 [ 0, %._crit_edge32.us.prol.preheader ], [ %indvars.iv.next65.prol, %._crit_edge32.us.prol ]
  %prol.iter145 = phi i64 [ 0, %._crit_edge32.us.prol.preheader ], [ %prol.iter145.sub, %._crit_edge32.us.prol ]
  %19 = mul nuw nsw i64 %indvars.iv64.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next65.prol = add nuw nsw i64 %indvars.iv64.prol, 1
  %prol.iter145.sub = add nsw i64 %prol.iter145, -1
  %prol.iter145.cmp = icmp eq i64 %prol.iter145.sub, 0
  br i1 %prol.iter145.cmp, label %._crit_edge32.us.prol.loopexit.unr-lcssa, label %._crit_edge32.us.prol, !llvm.loop !1

._crit_edge32.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge32.us.prol
  br label %._crit_edge32.us.prol.loopexit

._crit_edge32.us.prol.loopexit:                   ; preds = %._crit_edge42, %._crit_edge32.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.lr.ph, label %._crit_edge42.new

._crit_edge42.new:                                ; preds = %._crit_edge32.us.prol.loopexit
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us, %._crit_edge42.new
  %indvars.iv64 = phi i64 [ 0, %._crit_edge42.new ], [ %indvars.iv.next65.7, %._crit_edge32.us ]
  %20 = mul nuw nsw i64 %indvars.iv64, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %21 = mul i64 %indvars.iv64, 16000
  %22 = add i64 %21, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv64, 16000
  %24 = add i64 %23, 32000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv64, 16000
  %26 = add i64 %25, 48000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv64, 16000
  %28 = add i64 %27, 64000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv64, 16000
  %30 = add i64 %29, 80000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv64, 16000
  %32 = add i64 %31, 96000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv64, 16000
  %34 = add i64 %33, 112000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next65.7 = add nsw i64 %indvars.iv64, 8
  %exitcond67.7 = icmp eq i64 %indvars.iv.next65.7, 2000
  br i1 %exitcond67.7, label %.preheader10.lr.ph.unr-lcssa, label %._crit_edge32.us

.preheader10.lr.ph.unr-lcssa:                     ; preds = %._crit_edge32.us
  br label %.preheader10.lr.ph

.preheader10.lr.ph:                               ; preds = %._crit_edge32.us.prol.loopexit, %.preheader10.lr.ph.unr-lcssa
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge21.us, %.preheader10.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next57, %._crit_edge21.us ]
  %scevgep100 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  %35 = add nsw i64 %indvars.iv56, -1999
  %scevgep102 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %35
  %scevgep102103 = bitcast double* %scevgep102 to i8*
  br label %.preheader9.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge19.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond59, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge19.us.us, %.preheader9.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next53, %._crit_edge19.us.us ]
  %36 = mul nuw nsw i64 %indvars.iv52, 16000
  %scevgep98 = getelementptr i8, i8* %17, i64 %36
  %37 = add i64 16000, %36
  %scevgep99 = getelementptr i8, i8* %17, i64 %37
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv56
  br i1 false, label %._crit_edge93.preheader, label %min.iters.checked

._crit_edge93.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge93.prol.loopexit.unr-lcssa, label %._crit_edge93.prol.preheader

._crit_edge93.prol.preheader:                     ; preds = %._crit_edge93.preheader
  br label %._crit_edge93.prol

._crit_edge93.prol:                               ; preds = %._crit_edge93.prol.preheader
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48.ph, i64 %indvars.iv56
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv52, i64 %indvars.iv48.ph
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.ph, 1
  br label %._crit_edge93.prol.loopexit.unr-lcssa

._crit_edge93.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge93.preheader, %._crit_edge93.prol
  %indvars.iv48.unr.ph = phi i64 [ %indvars.iv.next49.prol, %._crit_edge93.prol ], [ %indvars.iv48.ph, %._crit_edge93.preheader ]
  br label %._crit_edge93.prol.loopexit

._crit_edge93.prol.loopexit:                      ; preds = %._crit_edge93.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge19.us.us.loopexit, label %._crit_edge93.preheader.new

._crit_edge93.preheader.new:                      ; preds = %._crit_edge93.prol.loopexit
  br label %._crit_edge93

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %._crit_edge93.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep98, %scevgep102103
  %bound1 = icmp ult i8* %scevgep100101, %scevgep99
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %38 to i8*
  %bc104 = bitcast double* %38 to i8*
  %bound0105 = icmp ult i8* %scevgep98, %bc104
  %bound1106 = icmp ult i8* %bc, %scevgep99
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx = or i1 %found.conflict, %found.conflict107
  br i1 %conflict.rdx, label %._crit_edge93.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %46 = load double, double* %38, align 8, !alias.scope !3
  %47 = insertelement <2 x double> undef, double %46, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = insertelement <2 x double> undef, double %46, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = or i64 %index, 1
  %52 = or i64 %index, 2
  %53 = or i64 %index, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv56
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %51, i64 %indvars.iv56
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %52, i64 %indvars.iv56
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv56
  %58 = load double, double* %54, align 8, !alias.scope !6
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = fmul <2 x double> %48, %63
  %67 = fmul <2 x double> %50, %65
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv52, i64 %index
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !8, !noalias !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = fadd <2 x double> %wide.load, %66
  %73 = fadd <2 x double> %wide.load109, %67
  %74 = bitcast double* %68 to <2 x double>*
  store <2 x double> %72, <2 x double>* %74, align 8, !alias.scope !8, !noalias !10
  %75 = bitcast double* %70 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %76 = icmp eq i64 %index.next, 2000
  br i1 %76, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge19.us.us, label %._crit_edge93.preheader

._crit_edge19.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge93
  br label %._crit_edge19.us.us.loopexit

._crit_edge19.us.us.loopexit:                     ; preds = %._crit_edge93.prol.loopexit, %._crit_edge19.us.us.loopexit.unr-lcssa
  br label %._crit_edge19.us.us

._crit_edge19.us.us:                              ; preds = %._crit_edge19.us.us.loopexit, %middle.block
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %._crit_edge21.us, label %.preheader9.us.us

._crit_edge93:                                    ; preds = %._crit_edge93, %._crit_edge93.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %._crit_edge93.preheader.new ], [ %indvars.iv.next49.1, %._crit_edge93 ]
  %77 = load double, double* %38, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv56
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv52, i64 %indvars.iv48
  %82 = load double, double* %81, align 8
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %84 = load double, double* %38, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next49, i64 %indvars.iv56
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next49
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next49.1, 2000
  br i1 %exitcond.1, label %._crit_edge19.us.us.loopexit.unr-lcssa, label %._crit_edge93, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge21.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next45, %._crit_edge.us ]
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 0
  %scevgep119120 = bitcast double* %scevgep119 to i8*
  %scevgep121 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 2000
  %scevgep121122 = bitcast double* %scevgep121 to i8*
  %91 = mul nuw nsw i64 %indvars.iv44, 16000
  %scevgep123 = getelementptr i8, i8* %17, i64 %91
  %92 = add i64 16000, %91
  %scevgep124 = getelementptr i8, i8* %17, i64 %92
  br i1 false, label %._crit_edge94.preheader, label %min.iters.checked114

min.iters.checked114:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge94.preheader, label %vector.memcheck129

vector.memcheck129:                               ; preds = %min.iters.checked114
  %bound0125 = icmp ult i8* %scevgep119120, %scevgep124
  %bound1126 = icmp ult i8* %scevgep123, %scevgep121122
  %memcheck.conflict128 = and i1 %bound0125, %bound1126
  br i1 %memcheck.conflict128, label %._crit_edge94.preheader, label %vector.body110.preheader

vector.body110.preheader:                         ; preds = %vector.memcheck129
  br label %vector.body110

vector.body110:                                   ; preds = %vector.body110.preheader, %vector.body110
  %index131 = phi i64 [ %index.next132, %vector.body110 ], [ 0, %vector.body110.preheader ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %index131
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load139 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !15
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load140 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !15
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %index131
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load139, <2 x i64>* %98, align 8, !alias.scope !18, !noalias !15
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load140, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  %index.next132 = add i64 %index131, 4
  %101 = icmp eq i64 %index.next132, 2000
  br i1 %101, label %middle.block111, label %vector.body110, !llvm.loop !20

middle.block111:                                  ; preds = %vector.body110
  br i1 true, label %._crit_edge.us, label %._crit_edge94.preheader

._crit_edge94.preheader:                          ; preds = %middle.block111, %vector.memcheck129, %min.iters.checked114, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck129 ], [ 0, %min.iters.checked114 ], [ 0, %.preheader.us ], [ 2000, %middle.block111 ]
  %102 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge94.prol.loopexit, label %._crit_edge94.prol.preheader

._crit_edge94.prol.preheader:                     ; preds = %._crit_edge94.preheader
  br label %._crit_edge94.prol

._crit_edge94.prol:                               ; preds = %._crit_edge94.prol, %._crit_edge94.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge94.prol ], [ %indvars.iv.ph, %._crit_edge94.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge94.prol ], [ 0, %._crit_edge94.prol.preheader ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.prol
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv.prol
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge94.prol.loopexit.unr-lcssa, label %._crit_edge94.prol, !llvm.loop !21

._crit_edge94.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge94.prol
  br label %._crit_edge94.prol.loopexit

._crit_edge94.prol.loopexit:                      ; preds = %._crit_edge94.preheader, %._crit_edge94.prol.loopexit.unr-lcssa
  %108 = icmp ult i64 %102, 3
  br i1 %108, label %._crit_edge.us.loopexit, label %._crit_edge94.preheader.new

._crit_edge94.preheader.new:                      ; preds = %._crit_edge94.prol.loopexit
  br label %._crit_edge94

._crit_edge94:                                    ; preds = %._crit_edge94, %._crit_edge94.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge94.preheader.new ], [ %indvars.iv.next.3, %._crit_edge94 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond88.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond88.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge94, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge94
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge94.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block111
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond47, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge42.thread
  %129 = phi i8* [ %3, %._crit_edge42.thread ], [ %17, %._crit_edge16.loopexit ]
  tail call void @free(i8* %129) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv49 = phi i2 [ %indvars.iv.next50, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %indvars.iv25 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next26, %._crit_edge9 ]
  %3 = zext i2 %indvars.iv49 to i64
  %4 = add nsw i64 %indvars.iv25, -1
  %5 = icmp sgt i64 %indvars.iv25, 0
  br i1 %5, label %.preheader.preheader, label %.preheader3.._crit_edge9_crit_edge

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 0
  br label %.preheader

.preheader3.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre32 = load double, double* %.phi.trans.insert31, align 8
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre30 = load double, double* %7, align 8
  %xtraiter43 = and i64 %indvars.iv25, 3
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod44, label %._crit_edge37.prol.loopexit, label %._crit_edge37.prol.preheader

._crit_edge37.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge37.prol

._crit_edge37.prol:                               ; preds = %._crit_edge37.prol, %._crit_edge37.prol.preheader
  %8 = phi double [ %.pre30, %._crit_edge37.prol.preheader ], [ %12, %._crit_edge37.prol ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge37.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge37.prol ]
  %prol.iter = phi i64 [ %xtraiter43, %._crit_edge37.prol.preheader ], [ %prol.iter.sub, %._crit_edge37.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge37.prol.loopexit.unr-lcssa, label %._crit_edge37.prol, !llvm.loop !23

._crit_edge37.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge37.prol
  br label %._crit_edge37.prol.loopexit

._crit_edge37.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge37.prol.loopexit.unr-lcssa
  %.lcssa42.unr = phi double [ undef, %.lr.ph8 ], [ %12, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %.unr45 = phi double [ %.pre30, %.lr.ph8 ], [ %12, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %._crit_edge37.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge37.prol.loopexit
  br label %._crit_edge37

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv14, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge36.preheader, label %._crit_edge

._crit_edge36.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge36.prol.loopexit.unr-lcssa, label %._crit_edge36.prol.preheader

._crit_edge36.prol.preheader:                     ; preds = %._crit_edge36.preheader
  br label %._crit_edge36.prol

._crit_edge36.prol:                               ; preds = %._crit_edge36.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge36.prol.loopexit.unr-lcssa

._crit_edge36.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge36.preheader, %._crit_edge36.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge36.prol ], [ undef, %._crit_edge36.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge36.prol ], [ %.pre, %._crit_edge36.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge36.prol ], [ 0, %._crit_edge36.preheader ]
  br label %._crit_edge36.prol.loopexit

._crit_edge36.prol.loopexit:                      ; preds = %._crit_edge36.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv14, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge36.preheader.new

._crit_edge36.preheader.new:                      ; preds = %._crit_edge36.prol.loopexit
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge36.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge36.preheader.new ], [ %34, %._crit_edge36 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge36.preheader.new ], [ %indvars.iv.next.1, %._crit_edge36 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge36

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge36
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge36.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge36.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv14
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv25
  br i1 %exitcond19, label %.lr.ph8, label %.preheader

._crit_edge37:                                    ; preds = %._crit_edge37, %.lr.ph8.new
  %39 = phi double [ %.unr45, %.lr.ph8.new ], [ %55, %._crit_edge37 ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph8.new ], [ %indvars.iv.next21.3, %._crit_edge37 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next21.3 = add nsw i64 %indvars.iv20, 4
  %exitcond24.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv25
  br i1 %exitcond24.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge37

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge37
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge37.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  %.lcssa42 = phi double [ %.lcssa42.unr, %._crit_edge37.prol.loopexit ], [ %55, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader3.._crit_edge9_crit_edge
  %.pre-phi33 = phi double* [ %.phi.trans.insert31, %.preheader3.._crit_edge9_crit_edge ], [ %7, %._crit_edge9.loopexit ]
  %56 = phi double [ %.pre32, %.preheader3.._crit_edge9_crit_edge ], [ %.lcssa42, %._crit_edge9.loopexit ]
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %.pre-phi33, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next26, 2000
  %indvars.iv.next50 = add i2 %indvars.iv49, 1
  br i1 %exitcond35, label %._crit_edge11.loopexit, label %.preheader4

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader, label %._crit_edge4

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv9, 2000
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge14 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge14

; <label>:12:                                     ; preds = %._crit_edge15
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge15

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 2000
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br i1 %exitcond13, label %._crit_edge4.loopexit, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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
