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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader71.lr.ph, label %._crit_edge99.thread

._crit_edge99.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader._crit_edge

.preheader71.lr.ph:                               ; preds = %2
  br label %.lr.ph92

.lr.ph92:                                         ; preds = %._crit_edge97, %.preheader71.lr.ph
  %indvars.iv146 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next147, %._crit_edge97 ]
  %indvars.iv144 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next145, %._crit_edge97 ]
  %4 = mul nuw nsw i64 %indvars.iv146, 2001
  %5 = sub i64 1998, %indvars.iv146
  %6 = shl i64 %5, 3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph92
  %indvars.iv128 = phi i64 [ 0, %.lr.ph92 ], [ %indvars.iv.next129, %._crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv128
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv128
  store double %12, double* %13, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next129, %indvars.iv144
  br i1 %exitcond135, label %._crit_edge93, label %._crit_edge

._crit_edge93:                                    ; preds = %._crit_edge
  %14 = add nuw nsw i64 %4, 1
  %15 = and i64 %6, 34359738360
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %14
  %16 = add nuw nsw i64 %15, 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %17 = icmp slt i64 %indvars.iv.next147, 2000
  br i1 %17, label %._crit_edge97.loopexit, label %._crit_edge97

._crit_edge97.loopexit:                           ; preds = %._crit_edge93
  %18 = bitcast double* %scevgep140 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge93, %._crit_edge97.loopexit
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv146
  store double 1.000000e+00, double* %19, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next147, 2000
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  br i1 %exitcond149, label %._crit_edge99, label %.lr.ph92

._crit_edge99:                                    ; preds = %._crit_edge97
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge89.us.prol.loopexit, label %._crit_edge89.us.prol.preheader

._crit_edge89.us.prol.preheader:                  ; preds = %._crit_edge99
  br label %._crit_edge89.us.prol

._crit_edge89.us.prol:                            ; preds = %._crit_edge89.us.prol, %._crit_edge89.us.prol.preheader
  %indvars.iv124.prol = phi i64 [ 0, %._crit_edge89.us.prol.preheader ], [ %indvars.iv.next125.prol, %._crit_edge89.us.prol ]
  %prol.iter169 = phi i64 [ 0, %._crit_edge89.us.prol.preheader ], [ %prol.iter169.sub, %._crit_edge89.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv124.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.prol = add nuw nsw i64 %indvars.iv124.prol, 1
  %prol.iter169.sub = add nsw i64 %prol.iter169, -1
  %prol.iter169.cmp = icmp eq i64 %prol.iter169.sub, 0
  br i1 %prol.iter169.cmp, label %._crit_edge89.us.prol.loopexit.unr-lcssa, label %._crit_edge89.us.prol, !llvm.loop !1

._crit_edge89.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge89.us.prol
  br label %._crit_edge89.us.prol.loopexit

._crit_edge89.us.prol.loopexit:                   ; preds = %._crit_edge99, %._crit_edge89.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader68.us.us.preheader.preheader, label %._crit_edge99.new

._crit_edge99.new:                                ; preds = %._crit_edge89.us.prol.loopexit
  br label %._crit_edge89.us

._crit_edge89.us:                                 ; preds = %._crit_edge89.us, %._crit_edge99.new
  %indvars.iv124 = phi i64 [ 0, %._crit_edge99.new ], [ %indvars.iv.next125.7, %._crit_edge89.us ]
  %22 = mul nuw nsw i64 %indvars.iv124, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv124, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv124, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv124, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv124, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv124, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv124, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv124, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.7 = add nsw i64 %indvars.iv124, 8
  %exitcond127.7 = icmp eq i64 %indvars.iv.next125.7, 2000
  br i1 %exitcond127.7, label %.preheader68.us.us.preheader.preheader.unr-lcssa, label %._crit_edge89.us

.preheader68.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge89.us
  br label %.preheader68.us.us.preheader.preheader

.preheader68.us.us.preheader.preheader:           ; preds = %._crit_edge89.us.prol.loopexit, %.preheader68.us.us.preheader.preheader.unr-lcssa
  %37 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader68.us.us.preheader

.preheader68.us.us.preheader:                     ; preds = %.preheader68.us.us.preheader.preheader, %.preheader1._crit_edge.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.preheader1._crit_edge.us ], [ 0, %.preheader68.us.us.preheader.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv116
  br label %.preheader68.us.us

.preheader1._crit_edge.us:                        ; preds = %._crit_edge76.us.us
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond119, label %.preheader67.us.preheader, label %.preheader68.us.us.preheader

.preheader67.us.preheader:                        ; preds = %.preheader1._crit_edge.us
  %41 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %42 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %43 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader67.us

.preheader68.us.us:                               ; preds = %._crit_edge76.us.us, %.preheader68.us.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.preheader68.us.us.preheader ], [ %indvars.iv.next113, %._crit_edge76.us.us ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv116
  br i1 true, label %._crit_edge150.prol.loopexit.unr-lcssa, label %._crit_edge150.prol.preheader

._crit_edge150.prol.preheader:                    ; preds = %.preheader68.us.us
  br label %._crit_edge150.prol

._crit_edge150.prol:                              ; preds = %._crit_edge150.prol.preheader
  %49 = load double, double* %48, align 8
  %50 = load double, double* %40, align 8
  %51 = fmul double %49, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv112, i64 0
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  br label %._crit_edge150.prol.loopexit.unr-lcssa

._crit_edge150.prol.loopexit.unr-lcssa:           ; preds = %.preheader68.us.us, %._crit_edge150.prol
  %indvars.iv108.unr.ph = phi i64 [ 1, %._crit_edge150.prol ], [ 0, %.preheader68.us.us ]
  br label %._crit_edge150.prol.loopexit

._crit_edge150.prol.loopexit:                     ; preds = %._crit_edge150.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge76.us.us, label %.preheader68.us.us.new

.preheader68.us.us.new:                           ; preds = %._crit_edge150.prol.loopexit
  br label %._crit_edge150

._crit_edge76.us.us.unr-lcssa:                    ; preds = %._crit_edge150
  br label %._crit_edge76.us.us

._crit_edge76.us.us:                              ; preds = %._crit_edge150.prol.loopexit, %._crit_edge76.us.us.unr-lcssa
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond115, label %.preheader1._crit_edge.us, label %.preheader68.us.us

._crit_edge150:                                   ; preds = %._crit_edge150, %.preheader68.us.us.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %.preheader68.us.us.new ], [ %indvars.iv.next109.1, %._crit_edge150 ]
  %55 = load double, double* %48, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv116
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv112, i64 %indvars.iv108
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %62 = load double, double* %48, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv116
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next109
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109.1, 2000
  br i1 %exitcond111.1, label %._crit_edge76.us.us.unr-lcssa, label %._crit_edge150

.preheader67.us:                                  ; preds = %.preheader67.us.preheader, %._crit_edge.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge.us ], [ 0, %.preheader67.us.preheader ]
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 2000
  %scevgep159 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv104, i64 0
  %scevgep161 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv104, i64 2000
  br i1 false, label %._crit_edge151.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader67.us
  br i1 false, label %._crit_edge151.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep155, %scevgep161
  %bound1 = icmp ult double* %scevgep159, %scevgep157
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge151.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv104, i64 %index
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !3
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load164 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !3
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %index
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %74, align 8, !alias.scope !6, !noalias !3
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load164, <2 x i64>* %76, align 8, !alias.scope !6, !noalias !3
  %index.next = add i64 %index, 4
  %77 = icmp eq i64 %index.next, 2000
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %._crit_edge151.preheader

._crit_edge151.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader67.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader67.us ], [ 2000, %middle.block ]
  %78 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge151.prol.loopexit, label %._crit_edge151.prol.preheader

._crit_edge151.prol.preheader:                    ; preds = %._crit_edge151.preheader
  br label %._crit_edge151.prol

._crit_edge151.prol:                              ; preds = %._crit_edge151.prol, %._crit_edge151.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge151.prol ], [ %indvars.iv.ph, %._crit_edge151.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge151.prol ], [ 0, %._crit_edge151.prol.preheader ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv104, i64 %indvars.iv.prol
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.prol
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge151.prol.loopexit.unr-lcssa, label %._crit_edge151.prol, !llvm.loop !11

._crit_edge151.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge151.prol
  br label %._crit_edge151.prol.loopexit

._crit_edge151.prol.loopexit:                     ; preds = %._crit_edge151.preheader, %._crit_edge151.prol.loopexit.unr-lcssa
  %84 = icmp ult i64 %78, 3
  br i1 %84, label %._crit_edge.us.loopexit, label %._crit_edge151.preheader.new

._crit_edge151.preheader.new:                     ; preds = %._crit_edge151.prol.loopexit
  br label %._crit_edge151

._crit_edge151:                                   ; preds = %._crit_edge151, %._crit_edge151.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge151.preheader.new ], [ %indvars.iv.next.3, %._crit_edge151 ]
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv104, i64 %indvars.iv
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond103.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond103.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge151, !llvm.loop !12

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge151
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge151.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %.preheader._crit_edge.loopexit, label %.preheader67.us

.preheader._crit_edge.loopexit:                   ; preds = %._crit_edge.us
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %._crit_edge99.thread
  %105 = phi i8* [ %3, %._crit_edge99.thread ], [ %20, %.preheader._crit_edge.loopexit ]
  tail call void @free(i8* %105) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader42.preheader, label %._crit_edge

.preheader42.preheader:                           ; preds = %2
  br label %.preheader42

.preheader42:                                     ; preds = %.preheader42.preheader, %.preheader1._crit_edge
  %indvars.iv87 = phi i2 [ 0, %.preheader42.preheader ], [ %indvars.iv.next88, %.preheader1._crit_edge ]
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %.preheader1._crit_edge ], [ 0, %.preheader42.preheader ]
  %3 = zext i2 %indvars.iv87 to i64
  %4 = add nsw i64 %indvars.iv70, -1
  %5 = icmp sgt i64 %indvars.iv70, 0
  br i1 %5, label %.preheader.preheader.preheader, label %.preheader42..preheader1._crit_edge_crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader42
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 0
  br label %.preheader.preheader

.preheader42..preheader1._crit_edge_crit_edge:    ; preds = %.preheader42
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv70
  %.pre77 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader1._crit_edge

.lr.ph46:                                         ; preds = %.preheader._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv70
  %.pre75 = load double, double* %7, align 8
  %xtraiter81 = and i64 %indvars.iv70, 3
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  br i1 %lcmp.mod82, label %.preheader1.prol.loopexit, label %.preheader1.prol.preheader

.preheader1.prol.preheader:                       ; preds = %.lr.ph46
  br label %.preheader1.prol

.preheader1.prol:                                 ; preds = %.preheader1.prol, %.preheader1.prol.preheader
  %8 = phi double [ %.pre75, %.preheader1.prol.preheader ], [ %12, %.preheader1.prol ]
  %indvars.iv62.prol = phi i64 [ 0, %.preheader1.prol.preheader ], [ %indvars.iv.next63.prol, %.preheader1.prol ]
  %prol.iter = phi i64 [ %xtraiter81, %.preheader1.prol.preheader ], [ %prol.iter.sub, %.preheader1.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv62.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv62.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader1.prol.loopexit.unr-lcssa, label %.preheader1.prol, !llvm.loop !13

.preheader1.prol.loopexit.unr-lcssa:              ; preds = %.preheader1.prol
  br label %.preheader1.prol.loopexit

.preheader1.prol.loopexit:                        ; preds = %.lr.ph46, %.preheader1.prol.loopexit.unr-lcssa
  %.lcssa80.unr = phi double [ undef, %.lr.ph46 ], [ %12, %.preheader1.prol.loopexit.unr-lcssa ]
  %.unr83 = phi double [ %.pre75, %.lr.ph46 ], [ %12, %.preheader1.prol.loopexit.unr-lcssa ]
  %indvars.iv62.unr = phi i64 [ 0, %.lr.ph46 ], [ %3, %.preheader1.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %.preheader1._crit_edge.loopexit, label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.preheader1.prol.loopexit
  br label %.preheader1

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader._crit_edge
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv54, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv54
  %.pre = load double, double* %15, align 8
  br i1 %14, label %.preheader.preheader79, label %.preheader._crit_edge

.preheader.preheader79:                           ; preds = %.preheader.preheader
  %xtraiter = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader79
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.preheader79, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %20, %.preheader.prol ], [ undef, %.preheader.preheader79 ]
  %.unr.ph = phi double [ %20, %.preheader.prol ], [ %.pre, %.preheader.preheader79 ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader79 ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv54, 1
  br i1 %21, label %.preheader._crit_edge.loopexit, label %.preheader.preheader79.new

.preheader.preheader79.new:                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader79.new
  %22 = phi double [ %.unr.ph, %.preheader.preheader79.new ], [ %34, %.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.preheader79.new ], [ %indvars.iv.next.1, %.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv54
  br i1 %exitcond53.1, label %.preheader._crit_edge.loopexit.unr-lcssa, label %.preheader

.preheader._crit_edge.loopexit.unr-lcssa:         ; preds = %.preheader
  br label %.preheader._crit_edge.loopexit

.preheader._crit_edge.loopexit:                   ; preds = %.preheader.prol.loopexit, %.preheader._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %34, %.preheader._crit_edge.loopexit.unr-lcssa ]
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.preheader
  %35 = phi double [ %.pre, %.preheader.preheader ], [ %.lcssa, %.preheader._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv54
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next55, %indvars.iv70
  br i1 %exitcond61, label %.lr.ph46, label %.preheader.preheader

.preheader1:                                      ; preds = %.preheader1, %.lr.ph46.new
  %39 = phi double [ %.unr83, %.lr.ph46.new ], [ %55, %.preheader1 ]
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr, %.lr.ph46.new ], [ %indvars.iv.next63.3, %.preheader1 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv62
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv.next63
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv.next63.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv.next63.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next63.3 = add nuw nsw i64 %indvars.iv62, 4
  %exitcond69.3 = icmp eq i64 %indvars.iv.next63.3, %indvars.iv70
  br i1 %exitcond69.3, label %.preheader1._crit_edge.loopexit.unr-lcssa, label %.preheader1

.preheader1._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader1
  br label %.preheader1._crit_edge.loopexit

.preheader1._crit_edge.loopexit:                  ; preds = %.preheader1.prol.loopexit, %.preheader1._crit_edge.loopexit.unr-lcssa
  %.lcssa80 = phi double [ %.lcssa80.unr, %.preheader1.prol.loopexit ], [ %55, %.preheader1._crit_edge.loopexit.unr-lcssa ]
  br label %.preheader1._crit_edge

.preheader1._crit_edge:                           ; preds = %.preheader1._crit_edge.loopexit, %.preheader42..preheader1._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader42..preheader1._crit_edge_crit_edge ], [ %7, %.preheader1._crit_edge.loopexit ]
  %56 = phi double [ %.pre77, %.preheader42..preheader1._crit_edge_crit_edge ], [ %.lcssa80, %.preheader1._crit_edge.loopexit ]
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %.pre-phi, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 2000
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  br i1 %exitcond73, label %._crit_edge.loopexit, label %.preheader42

._crit_edge.loopexit:                             ; preds = %.preheader1._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
  br i1 true, label %.preheader.preheader, label %._crit_edge13

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv22, 2000
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge26, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge26 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge26

; <label>:12:                                     ; preds = %._crit_edge27
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge27, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %indvars.iv20
  br i1 %exitcond19, label %._crit_edge, label %._crit_edge27

._crit_edge:                                      ; preds = %._crit_edge26
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond25, label %._crit_edge13.loopexit, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
