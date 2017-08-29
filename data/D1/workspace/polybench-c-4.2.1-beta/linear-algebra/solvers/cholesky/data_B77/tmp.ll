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
  br i1 true, label %.preheader6.lr.ph, label %._crit_edge23.thread

._crit_edge23.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge7

.preheader6.lr.ph:                                ; preds = %2
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge22, %.preheader6.lr.ph
  %indvars.iv70 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next71, %._crit_edge22 ]
  %indvars.iv68 = phi i64 [ 1, %.preheader6.lr.ph ], [ %indvars.iv.next69, %._crit_edge22 ]
  %4 = sub i64 1998, %indvars.iv70
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph18
  %indvars.iv52 = phi i64 [ 0, %.lr.ph18 ], [ %indvars.iv.next53, %._crit_edge ]
  %5 = sub nsw i64 0, %indvars.iv52
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv52
  store double %10, double* %11, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %indvars.iv68
  br i1 %exitcond59, label %._crit_edge19, label %._crit_edge

._crit_edge19:                                    ; preds = %._crit_edge
  %12 = mul nuw nsw i64 %indvars.iv70, 2001
  %13 = shl i64 %4, 3
  %14 = add nuw nsw i64 %12, 1
  %15 = and i64 %13, 34359738360
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %16 = icmp slt i64 %indvars.iv.next71, 2000
  br i1 %16, label %._crit_edge22.loopexit, label %._crit_edge22

._crit_edge22.loopexit:                           ; preds = %._crit_edge19
  %17 = add nuw nsw i64 %15, 8
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %14
  %18 = bitcast double* %scevgep64 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge19, %._crit_edge22.loopexit
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv70
  store double 1.000000e+00, double* %19, align 8
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 2000
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  br i1 %exitcond73, label %.preheader5.us.preheader, label %.lr.ph18

.preheader5.us.preheader:                         ; preds = %._crit_edge22
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge17.us.prol.loopexit, label %._crit_edge17.us.prol.preheader

._crit_edge17.us.prol.preheader:                  ; preds = %.preheader5.us.preheader
  br label %._crit_edge17.us.prol

._crit_edge17.us.prol:                            ; preds = %._crit_edge17.us.prol, %._crit_edge17.us.prol.preheader
  %indvars.iv48.prol = phi i64 [ 0, %._crit_edge17.us.prol.preheader ], [ %indvars.iv.next49.prol, %._crit_edge17.us.prol ]
  %prol.iter93 = phi i64 [ 0, %._crit_edge17.us.prol.preheader ], [ %prol.iter93.sub, %._crit_edge17.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv48.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter93.sub = add nsw i64 %prol.iter93, -1
  %prol.iter93.cmp = icmp eq i64 %prol.iter93.sub, 0
  br i1 %prol.iter93.cmp, label %._crit_edge17.us.prol.loopexit.unr-lcssa, label %._crit_edge17.us.prol, !llvm.loop !1

._crit_edge17.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge17.us.prol
  br label %._crit_edge17.us.prol.loopexit

._crit_edge17.us.prol.loopexit:                   ; preds = %.preheader5.us.preheader, %._crit_edge17.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader2.us.us.preheader.preheader, label %.preheader5.us.preheader.new

.preheader5.us.preheader.new:                     ; preds = %._crit_edge17.us.prol.loopexit
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us, %.preheader5.us.preheader.new
  %indvars.iv48 = phi i64 [ 0, %.preheader5.us.preheader.new ], [ %indvars.iv.next49.7, %._crit_edge17.us ]
  %22 = mul nuw nsw i64 %indvars.iv48, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv48, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv48, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv48, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv48, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv48, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv48, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv48, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond51.7 = icmp eq i64 %indvars.iv.next49.7, 2000
  br i1 %exitcond51.7, label %.preheader2.us.us.preheader.preheader.unr-lcssa, label %._crit_edge17.us

.preheader2.us.us.preheader.preheader.unr-lcssa:  ; preds = %._crit_edge17.us
  br label %.preheader2.us.us.preheader.preheader

.preheader2.us.us.preheader.preheader:            ; preds = %._crit_edge17.us.prol.loopexit, %.preheader2.us.us.preheader.preheader.unr-lcssa
  %37 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %.preheader2.us.us.preheader.preheader, %._crit_edge10.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge10.us ], [ 0, %.preheader2.us.us.preheader.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv40
  br label %.preheader2.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 2000
  br i1 %exitcond43, label %.preheader.us.preheader, label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %._crit_edge9.us.us, %.preheader2.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us.us ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv40
  br i1 true, label %._crit_edge74.prol.loopexit.unr-lcssa, label %._crit_edge74.prol.preheader

._crit_edge74.prol.preheader:                     ; preds = %.preheader2.us.us
  br label %._crit_edge74.prol

._crit_edge74.prol:                               ; preds = %._crit_edge74.prol.preheader
  %40 = load double, double* %39, align 8
  %41 = load double, double* %38, align 8
  %42 = fmul double %40, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv36, i64 0
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  br label %._crit_edge74.prol.loopexit.unr-lcssa

._crit_edge74.prol.loopexit.unr-lcssa:            ; preds = %.preheader2.us.us, %._crit_edge74.prol
  %indvars.iv32.unr.ph = phi i64 [ 1, %._crit_edge74.prol ], [ 0, %.preheader2.us.us ]
  br label %._crit_edge74.prol.loopexit

._crit_edge74.prol.loopexit:                      ; preds = %._crit_edge74.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge9.us.us, label %.preheader2.us.us.new

.preheader2.us.us.new:                            ; preds = %._crit_edge74.prol.loopexit
  br label %._crit_edge74

._crit_edge9.us.us.unr-lcssa:                     ; preds = %._crit_edge74
  br label %._crit_edge9.us.us

._crit_edge9.us.us:                               ; preds = %._crit_edge74.prol.loopexit, %._crit_edge9.us.us.unr-lcssa
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond39, label %._crit_edge10.us, label %.preheader2.us.us

._crit_edge74:                                    ; preds = %._crit_edge74, %.preheader2.us.us.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %.preheader2.us.us.new ], [ %indvars.iv.next33.1, %._crit_edge74 ]
  %46 = load double, double* %39, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv40
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv36, i64 %indvars.iv32
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %53 = load double, double* %39, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next33, i64 %indvars.iv40
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next33
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, 2000
  br i1 %exitcond35.1, label %._crit_edge9.us.us.unr-lcssa, label %._crit_edge74

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 2000
  %scevgep83 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 0
  %scevgep85 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 2000
  br i1 false, label %._crit_edge75.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %._crit_edge75.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep79, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge75.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %index
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !3
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load88 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !3
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %index
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %65, align 8, !alias.scope !6, !noalias !3
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load88, <2 x i64>* %67, align 8, !alias.scope !6, !noalias !3
  %index.next = add i64 %index, 4
  %68 = icmp eq i64 %index.next, 2000
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %._crit_edge75.preheader

._crit_edge75.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ 2000, %middle.block ]
  %69 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge75.prol.loopexit, label %._crit_edge75.prol.preheader

._crit_edge75.prol.preheader:                     ; preds = %._crit_edge75.preheader
  br label %._crit_edge75.prol

._crit_edge75.prol:                               ; preds = %._crit_edge75.prol, %._crit_edge75.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge75.prol ], [ %indvars.iv.ph, %._crit_edge75.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge75.prol ], [ 0, %._crit_edge75.prol.preheader ]
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %indvars.iv.prol
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge75.prol.loopexit.unr-lcssa, label %._crit_edge75.prol, !llvm.loop !11

._crit_edge75.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge75.prol
  br label %._crit_edge75.prol.loopexit

._crit_edge75.prol.loopexit:                      ; preds = %._crit_edge75.preheader, %._crit_edge75.prol.loopexit.unr-lcssa
  %75 = icmp ult i64 %69, 3
  br i1 %75, label %._crit_edge.us.loopexit, label %._crit_edge75.preheader.new

._crit_edge75.preheader.new:                      ; preds = %._crit_edge75.prol.loopexit
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75, %._crit_edge75.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge75.preheader.new ], [ %indvars.iv.next.3, %._crit_edge75 ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond27.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge75, !llvm.loop !12

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge75
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge75.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond31, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge23.thread
  %96 = phi i8* [ %3, %._crit_edge23.thread ], [ %20, %._crit_edge7.loopexit ]
  tail call void @free(i8* %96) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader2.preheader, label %._crit_edge5

.preheader2.preheader:                            ; preds = %2
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge4
  %indvars.iv48 = phi i2 [ 0, %.preheader2.preheader ], [ %indvars.iv.next49, %._crit_edge4 ]
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge4 ], [ 0, %.preheader2.preheader ]
  %3 = zext i2 %indvars.iv48 to i64
  %4 = add nsw i64 %indvars.iv28, -1
  %5 = icmp sgt i64 %indvars.iv28, 0
  br i1 %5, label %.preheader.preheader, label %.preheader2.._crit_edge4_crit_edge

.preheader.preheader:                             ; preds = %.preheader2
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  br label %.preheader

.preheader2.._crit_edge4_crit_edge:               ; preds = %.preheader2
  %.phi.trans.insert36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre37 = load double, double* %.phi.trans.insert36, align 8
  br label %._crit_edge4

.lr.ph3:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre35 = load double, double* %7, align 8
  %xtraiter42 = and i64 %indvars.iv28, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %._crit_edge33.prol.loopexit, label %._crit_edge33.prol.preheader

._crit_edge33.prol.preheader:                     ; preds = %.lr.ph3
  br label %._crit_edge33.prol

._crit_edge33.prol:                               ; preds = %._crit_edge33.prol, %._crit_edge33.prol.preheader
  %8 = phi double [ %.pre35, %._crit_edge33.prol.preheader ], [ %12, %._crit_edge33.prol ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge33.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge33.prol ]
  %prol.iter = phi i64 [ %xtraiter42, %._crit_edge33.prol.preheader ], [ %prol.iter.sub, %._crit_edge33.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv20.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge33.prol.loopexit.unr-lcssa, label %._crit_edge33.prol, !llvm.loop !13

._crit_edge33.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge33.prol
  br label %._crit_edge33.prol.loopexit

._crit_edge33.prol.loopexit:                      ; preds = %.lr.ph3, %._crit_edge33.prol.loopexit.unr-lcssa
  %.lcssa41.unr = phi double [ undef, %.lr.ph3 ], [ %12, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %.unr44 = phi double [ %.pre35, %.lr.ph3 ], [ %12, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph3 ], [ %3, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge4.loopexit, label %.lr.ph3.new

.lr.ph3.new:                                      ; preds = %._crit_edge33.prol.loopexit
  br label %._crit_edge33

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv12, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv12
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge32.preheader, label %._crit_edge

._crit_edge32.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv12, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge32.prol.loopexit.unr-lcssa, label %._crit_edge32.prol.preheader

._crit_edge32.prol.preheader:                     ; preds = %._crit_edge32.preheader
  br label %._crit_edge32.prol

._crit_edge32.prol:                               ; preds = %._crit_edge32.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge32.prol.loopexit.unr-lcssa

._crit_edge32.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge32.preheader, %._crit_edge32.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge32.prol ], [ undef, %._crit_edge32.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge32.prol ], [ %.pre, %._crit_edge32.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge32.prol ], [ 0, %._crit_edge32.preheader ]
  br label %._crit_edge32.prol.loopexit

._crit_edge32.prol.loopexit:                      ; preds = %._crit_edge32.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv12, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge32.preheader.new

._crit_edge32.preheader.new:                      ; preds = %._crit_edge32.prol.loopexit
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32, %._crit_edge32.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge32.preheader.new ], [ %34, %._crit_edge32 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge32.preheader.new ], [ %indvars.iv.next.1, %._crit_edge32 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv12
  br i1 %exitcond11.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge32

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge32
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge32.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge32.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv12
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next13, %indvars.iv28
  br i1 %exitcond19, label %.lr.ph3, label %.preheader

._crit_edge33:                                    ; preds = %._crit_edge33, %.lr.ph3.new
  %39 = phi double [ %.unr44, %.lr.ph3.new ], [ %55, %._crit_edge33 ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph3.new ], [ %indvars.iv.next21.3, %._crit_edge33 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv20
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next21.3 = add nuw nsw i64 %indvars.iv20, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv28
  br i1 %exitcond27.3, label %._crit_edge4.loopexit.unr-lcssa, label %._crit_edge33

._crit_edge4.loopexit.unr-lcssa:                  ; preds = %._crit_edge33
  br label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge33.prol.loopexit, %._crit_edge4.loopexit.unr-lcssa
  %.lcssa41 = phi double [ %.lcssa41.unr, %._crit_edge33.prol.loopexit ], [ %55, %._crit_edge4.loopexit.unr-lcssa ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader2.._crit_edge4_crit_edge
  %.pre-phi38 = phi double* [ %.phi.trans.insert36, %.preheader2.._crit_edge4_crit_edge ], [ %7, %._crit_edge4.loopexit ]
  %56 = phi double [ %.pre37, %.preheader2.._crit_edge4_crit_edge ], [ %.lcssa41, %._crit_edge4.loopexit ]
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %.pre-phi38, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 2000
  %indvars.iv.next49 = add i2 %indvars.iv48, 1
  br i1 %exitcond31, label %._crit_edge5.loopexit, label %.preheader2

._crit_edge5.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
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
  br i1 true, label %.preheader.preheader, label %._crit_edge1

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next11, %._crit_edge ]
  %indvars.iv8 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next9, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv10, 2000
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
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, %indvars.iv8
  br i1 %exitcond7, label %._crit_edge, label %._crit_edge15

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 2000
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br i1 %exitcond13, label %._crit_edge1.loopexit, label %.lr.ph

._crit_edge1.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !2}
!12 = distinct !{!12, !9, !10}
!13 = distinct !{!13, !2}
