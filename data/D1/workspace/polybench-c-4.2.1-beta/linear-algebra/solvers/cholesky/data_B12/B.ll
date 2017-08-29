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
  br i1 true, label %.preheader14.lr.ph, label %._crit_edge35.thread

._crit_edge35.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %._crit_edge33, %.preheader14.lr.ph
  %indvars.iv85 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next86, %._crit_edge33 ]
  %indvars.iv83 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next84, %._crit_edge33 ]
  %4 = mul nuw nsw i64 %indvars.iv85, 2001
  %5 = sub i64 1998, %indvars.iv85
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %6 = add nuw nsw i64 %4, 1
  %7 = shl i64 %5, 3
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %6
  %8 = and i64 %7, 34359738360
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %9 = icmp slt i64 %indvars.iv.next86, 2000
  br i1 %9, label %._crit_edge33.loopexit, label %._crit_edge33

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph29
  %indvars.iv69 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next70, %._crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv69
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv69
  store double %15, double* %16, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, %indvars.iv83
  br i1 %exitcond74, label %.preheader13, label %._crit_edge

._crit_edge33.loopexit:                           ; preds = %.preheader13
  %17 = add nuw nsw i64 %8, 8
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8182, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %.preheader13, %._crit_edge33.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %18, align 8
  %exitcond96 = icmp eq i64 %indvars.iv.next86, 2000
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  br i1 %exitcond96, label %._crit_edge35, label %.lr.ph29

._crit_edge35:                                    ; preds = %._crit_edge33
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge26.us.prol.loopexit, label %._crit_edge26.us.prol.preheader

._crit_edge26.us.prol.preheader:                  ; preds = %._crit_edge35
  br label %._crit_edge26.us.prol

._crit_edge26.us.prol:                            ; preds = %._crit_edge26.us.prol, %._crit_edge26.us.prol.preheader
  %indvars.iv65.prol = phi i64 [ 0, %._crit_edge26.us.prol.preheader ], [ %indvars.iv.next66.prol, %._crit_edge26.us.prol ]
  %prol.iter149 = phi i64 [ 0, %._crit_edge26.us.prol.preheader ], [ %prol.iter149.sub, %._crit_edge26.us.prol ]
  %20 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter149.sub = add nsw i64 %prol.iter149, -1
  %prol.iter149.cmp = icmp eq i64 %prol.iter149.sub, 0
  br i1 %prol.iter149.cmp, label %._crit_edge26.us.prol.loopexit.unr-lcssa, label %._crit_edge26.us.prol, !llvm.loop !1

._crit_edge26.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge26.us.prol
  br label %._crit_edge26.us.prol.loopexit

._crit_edge26.us.prol.loopexit:                   ; preds = %._crit_edge35, %._crit_edge26.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.lr.ph, label %._crit_edge35.new

._crit_edge35.new:                                ; preds = %._crit_edge26.us.prol.loopexit
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us, %._crit_edge35.new
  %indvars.iv65 = phi i64 [ 0, %._crit_edge35.new ], [ %indvars.iv.next66.7, %._crit_edge26.us ]
  %21 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv65, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv65, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv65, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv65, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv65, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv65, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv65, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.7 = add nsw i64 %indvars.iv65, 8
  %exitcond94.7 = icmp eq i64 %indvars.iv.next66.7, 2000
  br i1 %exitcond94.7, label %.preheader10.lr.ph.unr-lcssa, label %._crit_edge26.us

.preheader10.lr.ph.unr-lcssa:                     ; preds = %._crit_edge26.us
  br label %.preheader10.lr.ph

.preheader10.lr.ph:                               ; preds = %._crit_edge26.us.prol.loopexit, %.preheader10.lr.ph.unr-lcssa
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader10.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next58, %._crit_edge22.us ]
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv57
  %scevgep104105 = bitcast double* %scevgep104 to i8*
  %37 = add nsw i64 %indvars.iv57, -1999
  %scevgep106 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %37
  %scevgep106107 = bitcast double* %scevgep106 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond92, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv53, 16000
  %scevgep102 = getelementptr i8, i8* %19, i64 %38
  %39 = add i64 16000, %38
  %scevgep103 = getelementptr i8, i8* %19, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 false, label %._crit_edge97.preheader, label %min.iters.checked

._crit_edge97.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv49.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge97.prol.loopexit.unr-lcssa, label %._crit_edge97.prol.preheader

._crit_edge97.prol.preheader:                     ; preds = %._crit_edge97.preheader
  br label %._crit_edge97.prol

._crit_edge97.prol:                               ; preds = %._crit_edge97.prol.preheader
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49.ph, i64 %indvars.iv57
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv53, i64 %indvars.iv49.ph
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.ph, 1
  br label %._crit_edge97.prol.loopexit.unr-lcssa

._crit_edge97.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge97.preheader, %._crit_edge97.prol
  %indvars.iv49.unr.ph = phi i64 [ %indvars.iv.next50.prol, %._crit_edge97.prol ], [ %indvars.iv49.ph, %._crit_edge97.preheader ]
  br label %._crit_edge97.prol.loopexit

._crit_edge97.prol.loopexit:                      ; preds = %._crit_edge97.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge20.us.us.loopexit, label %._crit_edge97.preheader.new

._crit_edge97.preheader.new:                      ; preds = %._crit_edge97.prol.loopexit
  br label %._crit_edge97

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %._crit_edge97.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep102, %scevgep106107
  %bound1 = icmp ult i8* %scevgep104105, %scevgep103
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bound0109 = icmp ult i8* %scevgep102, %bc
  %bound1110 = icmp ult i8* %bc, %scevgep103
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx = or i1 %found.conflict, %found.conflict111
  br i1 %conflict.rdx, label %._crit_edge97.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %48 = or i64 %index, 1
  %49 = or i64 %index, 2
  %50 = or i64 %index, 3
  %51 = load double, double* %40, align 8, !alias.scope !3
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv57
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %48, i64 %indvars.iv57
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %49, i64 %indvars.iv57
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %50, i64 %indvars.iv57
  %58 = load double, double* %54, align 8, !alias.scope !6
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = fmul <2 x double> %53, %63
  %67 = fmul <2 x double> %53, %65
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv53, i64 %index
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !8, !noalias !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = fadd <2 x double> %wide.load, %66
  %73 = fadd <2 x double> %wide.load113, %67
  store <2 x double> %72, <2 x double>* %69, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %73, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %74 = icmp eq i64 %index.next, 2000
  br i1 %74, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge20.us.us, label %._crit_edge97.preheader

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge97
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge97.prol.loopexit, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %middle.block
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond91, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge97:                                    ; preds = %._crit_edge97, %._crit_edge97.preheader.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %._crit_edge97.preheader.new ], [ %indvars.iv.next50.1, %._crit_edge97 ]
  %75 = load double, double* %40, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %82 = load double, double* %40, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv57
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond90.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %._crit_edge97, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us ]
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2000
  %scevgep125126 = bitcast double* %scevgep125 to i8*
  %89 = mul nuw nsw i64 %indvars.iv45, 16000
  %scevgep127 = getelementptr i8, i8* %19, i64 %89
  %90 = add i64 16000, %89
  %scevgep128 = getelementptr i8, i8* %19, i64 %90
  br i1 false, label %._crit_edge98.preheader, label %min.iters.checked118

min.iters.checked118:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge98.preheader, label %vector.memcheck133

vector.memcheck133:                               ; preds = %min.iters.checked118
  %bound0129 = icmp ult i8* %scevgep123124, %scevgep128
  %bound1130 = icmp ult i8* %scevgep127, %scevgep125126
  %memcheck.conflict132 = and i1 %bound0129, %bound1130
  br i1 %memcheck.conflict132, label %._crit_edge98.preheader, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %vector.memcheck133
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index135 = phi i64 [ %index.next136, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %index135
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load143 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !15
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load144 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !15
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index135
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load143, <2 x i64>* %96, align 8, !alias.scope !18, !noalias !15
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load144, <2 x i64>* %98, align 8, !alias.scope !18, !noalias !15
  %index.next136 = add i64 %index135, 4
  %99 = icmp eq i64 %index.next136, 2000
  br i1 %99, label %middle.block115, label %vector.body114, !llvm.loop !20

middle.block115:                                  ; preds = %vector.body114
  br i1 true, label %._crit_edge.us, label %._crit_edge98.preheader

._crit_edge98.preheader:                          ; preds = %middle.block115, %vector.memcheck133, %min.iters.checked118, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck133 ], [ 0, %min.iters.checked118 ], [ 0, %.preheader.us ], [ 2000, %middle.block115 ]
  %100 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge98.prol.loopexit, label %._crit_edge98.prol.preheader

._crit_edge98.prol.preheader:                     ; preds = %._crit_edge98.preheader
  br label %._crit_edge98.prol

._crit_edge98.prol:                               ; preds = %._crit_edge98.prol, %._crit_edge98.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge98.prol ], [ %indvars.iv.ph, %._crit_edge98.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge98.prol ], [ 0, %._crit_edge98.prol.preheader ]
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge98.prol.loopexit.unr-lcssa, label %._crit_edge98.prol, !llvm.loop !21

._crit_edge98.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge98.prol
  br label %._crit_edge98.prol.loopexit

._crit_edge98.prol.loopexit:                      ; preds = %._crit_edge98.preheader, %._crit_edge98.prol.loopexit.unr-lcssa
  %106 = icmp ult i64 %100, 3
  br i1 %106, label %._crit_edge.us.loopexit, label %._crit_edge98.preheader.new

._crit_edge98.preheader.new:                      ; preds = %._crit_edge98.prol.loopexit
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %._crit_edge98.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge98.preheader.new ], [ %indvars.iv.next.3, %._crit_edge98 ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond89.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond89.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge98, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge98
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge98.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block115
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge35.thread
  %127 = phi i8* [ %3, %._crit_edge35.thread ], [ %19, %._crit_edge17.loopexit ]
  tail call void @free(i8* %127) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv42 = phi i2 [ %indvars.iv.next43, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %indvars.iv25 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next26, %._crit_edge9 ]
  %3 = zext i2 %indvars.iv42 to i64
  %4 = add nsw i64 %indvars.iv25, -1
  %5 = icmp sgt i64 %indvars.iv25, 0
  br i1 %5, label %.preheader.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre34 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre33 = load double, double* %7, align 8
  %xtraiter36 = and i64 %indvars.iv25, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod37, label %._crit_edge31.prol.loopexit, label %._crit_edge31.prol.preheader

._crit_edge31.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge31.prol

._crit_edge31.prol:                               ; preds = %._crit_edge31.prol, %._crit_edge31.prol.preheader
  %8 = phi double [ %.pre33, %._crit_edge31.prol.preheader ], [ %12, %._crit_edge31.prol ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge31.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge31.prol ]
  %prol.iter = phi i64 [ %xtraiter36, %._crit_edge31.prol.preheader ], [ %prol.iter.sub, %._crit_edge31.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge31.prol.loopexit.unr-lcssa, label %._crit_edge31.prol, !llvm.loop !23

._crit_edge31.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge31.prol
  br label %._crit_edge31.prol.loopexit

._crit_edge31.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge31.prol.loopexit.unr-lcssa
  %.lcssa35.unr = phi double [ undef, %.lr.ph8 ], [ %12, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %.unr38 = phi double [ %.pre33, %.lr.ph8 ], [ %12, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge31.prol.loopexit
  br label %._crit_edge31

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv14, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge30.preheader, label %._crit_edge

._crit_edge30.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge30.prol.loopexit.unr-lcssa, label %._crit_edge30.prol.preheader

._crit_edge30.prol.preheader:                     ; preds = %._crit_edge30.preheader
  br label %._crit_edge30.prol

._crit_edge30.prol:                               ; preds = %._crit_edge30.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge30.prol.loopexit.unr-lcssa

._crit_edge30.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge30.preheader, %._crit_edge30.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge30.prol ], [ undef, %._crit_edge30.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge30.prol ], [ %.pre, %._crit_edge30.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge30.prol ], [ 0, %._crit_edge30.preheader ]
  br label %._crit_edge30.prol.loopexit

._crit_edge30.prol.loopexit:                      ; preds = %._crit_edge30.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv14, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge30.preheader.new

._crit_edge30.preheader.new:                      ; preds = %._crit_edge30.prol.loopexit
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %._crit_edge30.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge30.preheader.new ], [ %34, %._crit_edge30 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge30.preheader.new ], [ %indvars.iv.next.1, %._crit_edge30 ]
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
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge30

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge30
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge30.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge30.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
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

._crit_edge31:                                    ; preds = %._crit_edge31, %.lr.ph8.new
  %39 = phi double [ %.unr38, %.lr.ph8.new ], [ %55, %._crit_edge31 ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph8.new ], [ %indvars.iv.next21.3, %._crit_edge31 ]
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
  br i1 %exitcond24.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge31

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge31
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge31.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  %.lcssa35 = phi double [ %.lcssa35.unr, %._crit_edge31.prol.loopexit ], [ %55, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader4.._crit_edge9_crit_edge, %._crit_edge9.loopexit
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader4.._crit_edge9_crit_edge ], [ %7, %._crit_edge9.loopexit ]
  %56 = phi double [ %.pre34, %.preheader4.._crit_edge9_crit_edge ], [ %.lcssa35, %._crit_edge9.loopexit ]
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %.pre-phi, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 2000
  %indvars.iv.next43 = add i2 %indvars.iv42, 1
  br i1 %exitcond29, label %._crit_edge11.loopexit, label %.preheader4

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
