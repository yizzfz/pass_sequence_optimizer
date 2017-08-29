; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph47.preheader, label %._crit_edge44.thread

.lr.ph47.preheader:                               ; preds = %5
  br i1 true, label %.lr.ph47.prol.loopexit, label %.lr.ph47.prol.preheader

.lr.ph47.prol.preheader:                          ; preds = %.lr.ph47.preheader
  br label %.lr.ph47.prol

.lr.ph47.prol:                                    ; preds = %.lr.ph47.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %6 = fdiv double 1.000000e+00, 2.000000e+03
  %7 = fmul double %6, 5.000000e-01
  %8 = fadd double %7, 4.000000e+00
  store double %8, double* %2, align 8
  br label %.lr.ph47.prol.loopexit

.lr.ph47.prol.loopexit:                           ; preds = %.lr.ph47.preheader, %.lr.ph47.prol
  %indvars.iv98.unr = phi i64 [ 0, %.lr.ph47.preheader ], [ 1, %.lr.ph47.prol ]
  br i1 false, label %.preheader15.preheader, label %.lr.ph47.preheader.new

.lr.ph47.preheader.new:                           ; preds = %.lr.ph47.prol.loopexit
  br label %.lr.ph47

.preheader15.preheader.unr-lcssa:                 ; preds = %.lr.ph47
  br label %.preheader15.preheader

.preheader15.preheader:                           ; preds = %.lr.ph47.prol.loopexit, %.preheader15.preheader.unr-lcssa
  br label %.lr.ph38

.lr.ph47:                                         ; preds = %.lr.ph47, %.lr.ph47.preheader.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr, %.lr.ph47.preheader.new ], [ %indvars.iv.next99.1, %.lr.ph47 ]
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv98
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds double, double* %4, i64 %indvars.iv98
  store double 0.000000e+00, double* %10, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %11 = trunc i64 %indvars.iv.next99 to i32
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fmul double %13, 5.000000e-01
  %15 = fadd double %14, 4.000000e+00
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv98
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next99
  store double 0.000000e+00, double* %17, align 8
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next99
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next99.1 = add nuw nsw i64 %indvars.iv98, 2
  %19 = trunc i64 %indvars.iv.next99.1 to i32
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 2.000000e+03
  %22 = fmul double %21, 5.000000e-01
  %23 = fadd double %22, 4.000000e+00
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next99
  store double %23, double* %24, align 8
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, 2000
  br i1 %exitcond101.1, label %.preheader15.preheader.unr-lcssa, label %.lr.ph47

.lr.ph38:                                         ; preds = %._crit_edge42, %.preheader15.preheader
  %indvars.iv94 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next95, %._crit_edge42 ]
  %indvars.iv92 = phi i64 [ 1, %.preheader15.preheader ], [ %indvars.iv.next93, %._crit_edge42 ]
  %25 = mul nuw nsw i64 %indvars.iv94, 2001
  %26 = add nuw nsw i64 %25, 1
  %27 = sub i64 1998, %indvars.iv94
  %28 = shl i64 %27, 3
  br label %._crit_edge

.preheader14:                                     ; preds = %._crit_edge
  %scevgep88 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %26
  %29 = and i64 %28, 34359738360
  %scevgep8889 = bitcast double* %scevgep88 to i8*
  %30 = add nuw nsw i64 %29, 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %31 = icmp slt i64 %indvars.iv.next95, 2000
  br i1 %31, label %._crit_edge42.loopexit, label %._crit_edge42

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph38
  %indvars.iv76 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next77, %._crit_edge ]
  %32 = sub nsw i64 0, %indvars.iv76
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 2000
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 2.000000e+03
  %37 = fadd double %36, 1.000000e+00
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv76
  store double %37, double* %38, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next77, %indvars.iv92
  br i1 %exitcond83, label %.preheader14, label %._crit_edge

._crit_edge42.loopexit:                           ; preds = %.preheader14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8889, i8 0, i64 %30, i32 8, i1 false)
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %.preheader14, %._crit_edge42.loopexit
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv94
  store double 1.000000e+00, double* %39, align 8
  %exitcond97 = icmp eq i64 %indvars.iv.next95, 2000
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  br i1 %exitcond97, label %._crit_edge44, label %.lr.ph38

._crit_edge44.thread:                             ; preds = %5
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge19

._crit_edge44:                                    ; preds = %._crit_edge42
  %41 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %42 = bitcast i8* %41 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge35.us.prol.loopexit, label %._crit_edge35.us.prol.preheader

._crit_edge35.us.prol.preheader:                  ; preds = %._crit_edge44
  br label %._crit_edge35.us.prol

._crit_edge35.us.prol:                            ; preds = %._crit_edge35.us.prol, %._crit_edge35.us.prol.preheader
  %indvars.iv72.prol = phi i64 [ 0, %._crit_edge35.us.prol.preheader ], [ %indvars.iv.next73.prol, %._crit_edge35.us.prol ]
  %prol.iter154 = phi i64 [ 0, %._crit_edge35.us.prol.preheader ], [ %prol.iter154.sub, %._crit_edge35.us.prol ]
  %43 = mul nuw nsw i64 %indvars.iv72.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %41, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter154.sub = add nsw i64 %prol.iter154, -1
  %prol.iter154.cmp = icmp eq i64 %prol.iter154.sub, 0
  br i1 %prol.iter154.cmp, label %._crit_edge35.us.prol.loopexit.unr-lcssa, label %._crit_edge35.us.prol, !llvm.loop !1

._crit_edge35.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge35.us.prol
  br label %._crit_edge35.us.prol.loopexit

._crit_edge35.us.prol.loopexit:                   ; preds = %._crit_edge44, %._crit_edge35.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.us.us.preheader.preheader, label %._crit_edge44.new

._crit_edge44.new:                                ; preds = %._crit_edge35.us.prol.loopexit
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us, %._crit_edge44.new
  %indvars.iv72 = phi i64 [ 0, %._crit_edge44.new ], [ %indvars.iv.next73.7, %._crit_edge35.us ]
  %44 = mul nuw nsw i64 %indvars.iv72, 16000
  %scevgep = getelementptr i8, i8* %41, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %45 = mul i64 %indvars.iv72, 16000
  %46 = add i64 %45, 16000
  %scevgep.1 = getelementptr i8, i8* %41, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %47 = mul i64 %indvars.iv72, 16000
  %48 = add i64 %47, 32000
  %scevgep.2 = getelementptr i8, i8* %41, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %49 = mul i64 %indvars.iv72, 16000
  %50 = add i64 %49, 48000
  %scevgep.3 = getelementptr i8, i8* %41, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %51 = mul i64 %indvars.iv72, 16000
  %52 = add i64 %51, 64000
  %scevgep.4 = getelementptr i8, i8* %41, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %53 = mul i64 %indvars.iv72, 16000
  %54 = add i64 %53, 80000
  %scevgep.5 = getelementptr i8, i8* %41, i64 %54
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %55 = mul i64 %indvars.iv72, 16000
  %56 = add i64 %55, 96000
  %scevgep.6 = getelementptr i8, i8* %41, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %57 = mul i64 %indvars.iv72, 16000
  %58 = add i64 %57, 112000
  %scevgep.7 = getelementptr i8, i8* %41, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next73.7 = add nsw i64 %indvars.iv72, 8
  %exitcond75.7 = icmp eq i64 %indvars.iv.next73.7, 2000
  br i1 %exitcond75.7, label %.preheader10.us.us.preheader.preheader.unr-lcssa, label %._crit_edge35.us

.preheader10.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge35.us
  br label %.preheader10.us.us.preheader.preheader

.preheader10.us.us.preheader.preheader:           ; preds = %._crit_edge35.us.prol.loopexit, %.preheader10.us.us.preheader.preheader.unr-lcssa
  br label %.preheader10.us.us.preheader

.preheader10.us.us.preheader:                     ; preds = %.preheader10.us.us.preheader.preheader, %._crit_edge24.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge24.us ], [ 0, %.preheader10.us.us.preheader.preheader ]
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv64
  %scevgep109110 = bitcast double* %scevgep109 to i8*
  %59 = add nsw i64 %indvars.iv64, -1999
  %scevgep111 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %59
  %scevgep111112 = bitcast double* %scevgep111 to i8*
  br label %.preheader10.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond67, label %.preheader.us.preheader, label %.preheader10.us.us.preheader

.preheader10.us.us:                               ; preds = %._crit_edge22.us.us, %.preheader10.us.us.preheader
  %indvars.iv60 = phi i64 [ 0, %.preheader10.us.us.preheader ], [ %indvars.iv.next61, %._crit_edge22.us.us ]
  %60 = mul nuw nsw i64 %indvars.iv60, 16000
  %scevgep107 = getelementptr i8, i8* %41, i64 %60
  %61 = add i64 16000, %60
  %scevgep108 = getelementptr i8, i8* %41, i64 %61
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv64
  br i1 false, label %._crit_edge102.preheader, label %min.iters.checked

._crit_edge102.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader10.us.us
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader10.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge102.prol.loopexit.unr-lcssa, label %._crit_edge102.prol.preheader

._crit_edge102.prol.preheader:                    ; preds = %._crit_edge102.preheader
  br label %._crit_edge102.prol

._crit_edge102.prol:                              ; preds = %._crit_edge102.prol.preheader
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56.ph, i64 %indvars.iv64
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv60, i64 %indvars.iv56.ph
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.ph, 1
  br label %._crit_edge102.prol.loopexit.unr-lcssa

._crit_edge102.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge102.preheader, %._crit_edge102.prol
  %indvars.iv56.unr.ph = phi i64 [ %indvars.iv.next57.prol, %._crit_edge102.prol ], [ %indvars.iv56.ph, %._crit_edge102.preheader ]
  br label %._crit_edge102.prol.loopexit

._crit_edge102.prol.loopexit:                     ; preds = %._crit_edge102.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge22.us.us.loopexit, label %._crit_edge102.preheader.new

._crit_edge102.preheader.new:                     ; preds = %._crit_edge102.prol.loopexit
  br label %._crit_edge102

min.iters.checked:                                ; preds = %.preheader10.us.us
  br i1 false, label %._crit_edge102.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep107, %scevgep111112
  %bound1 = icmp ult i8* %scevgep109110, %scevgep108
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %62 to i8*
  %bc113 = bitcast double* %62 to i8*
  %bound0114 = icmp ult i8* %scevgep107, %bc113
  %bound1115 = icmp ult i8* %bc, %scevgep108
  %found.conflict116 = and i1 %bound0114, %bound1115
  %conflict.rdx = or i1 %found.conflict, %found.conflict116
  br i1 %conflict.rdx, label %._crit_edge102.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %70 = load double, double* %62, align 8, !alias.scope !3
  %71 = insertelement <2 x double> undef, double %70, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = insertelement <2 x double> undef, double %70, i32 0
  %74 = shufflevector <2 x double> %73, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %75 = or i64 %index, 1
  %76 = or i64 %index, 2
  %77 = or i64 %index, 3
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv64
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %75, i64 %indvars.iv64
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %76, i64 %indvars.iv64
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %77, i64 %indvars.iv64
  %82 = load double, double* %78, align 8, !alias.scope !6
  %83 = load double, double* %79, align 8, !alias.scope !6
  %84 = load double, double* %80, align 8, !alias.scope !6
  %85 = load double, double* %81, align 8, !alias.scope !6
  %86 = insertelement <2 x double> undef, double %82, i32 0
  %87 = insertelement <2 x double> %86, double %83, i32 1
  %88 = insertelement <2 x double> undef, double %84, i32 0
  %89 = insertelement <2 x double> %88, double %85, i32 1
  %90 = fmul <2 x double> %72, %87
  %91 = fmul <2 x double> %74, %89
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv60, i64 %index
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !8, !noalias !10
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !8, !noalias !10
  %96 = fadd <2 x double> %wide.load, %90
  %97 = fadd <2 x double> %wide.load118, %91
  %98 = bitcast double* %92 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !8, !noalias !10
  %99 = bitcast double* %94 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 2000
  br i1 %100, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge22.us.us, label %._crit_edge102.preheader

._crit_edge22.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge102
  br label %._crit_edge22.us.us.loopexit

._crit_edge22.us.us.loopexit:                     ; preds = %._crit_edge102.prol.loopexit, %._crit_edge22.us.us.loopexit.unr-lcssa
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %middle.block
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond63, label %._crit_edge24.us, label %.preheader10.us.us

._crit_edge102:                                   ; preds = %._crit_edge102, %._crit_edge102.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr.ph, %._crit_edge102.preheader.new ], [ %indvars.iv.next57.1, %._crit_edge102 ]
  %101 = load double, double* %62, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv64
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv60, i64 %indvars.iv56
  %106 = load double, double* %105, align 8
  %107 = fadd double %106, %104
  store double %107, double* %105, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %108 = load double, double* %62, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next57, i64 %indvars.iv64
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv60, i64 %indvars.iv.next57
  %113 = load double, double* %112, align 8
  %114 = fadd double %113, %111
  store double %114, double* %112, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, 2000
  br i1 %exitcond59.1, label %._crit_edge22.us.us.loopexit.unr-lcssa, label %._crit_edge102, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge24.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 0
  %scevgep128129 = bitcast double* %scevgep128 to i8*
  %scevgep130 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 2000
  %scevgep130131 = bitcast double* %scevgep130 to i8*
  %115 = mul nuw nsw i64 %indvars.iv52, 16000
  %scevgep132 = getelementptr i8, i8* %41, i64 %115
  %116 = add i64 16000, %115
  %scevgep133 = getelementptr i8, i8* %41, i64 %116
  br i1 false, label %._crit_edge103.preheader, label %min.iters.checked123

min.iters.checked123:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge103.preheader, label %vector.memcheck138

vector.memcheck138:                               ; preds = %min.iters.checked123
  %bound0134 = icmp ult i8* %scevgep128129, %scevgep133
  %bound1135 = icmp ult i8* %scevgep132, %scevgep130131
  %memcheck.conflict137 = and i1 %bound0134, %bound1135
  br i1 %memcheck.conflict137, label %._crit_edge103.preheader, label %vector.body119.preheader

vector.body119.preheader:                         ; preds = %vector.memcheck138
  br label %vector.body119

vector.body119:                                   ; preds = %vector.body119.preheader, %vector.body119
  %index140 = phi i64 [ %index.next141, %vector.body119 ], [ 0, %vector.body119.preheader ]
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %index140
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load148 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !15
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load149 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !15
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %index140
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load148, <2 x i64>* %122, align 8, !alias.scope !18, !noalias !15
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load149, <2 x i64>* %124, align 8, !alias.scope !18, !noalias !15
  %index.next141 = add i64 %index140, 4
  %125 = icmp eq i64 %index.next141, 2000
  br i1 %125, label %middle.block120, label %vector.body119, !llvm.loop !20

middle.block120:                                  ; preds = %vector.body119
  br i1 true, label %._crit_edge.us, label %._crit_edge103.preheader

._crit_edge103.preheader:                         ; preds = %middle.block120, %vector.memcheck138, %min.iters.checked123, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck138 ], [ 0, %min.iters.checked123 ], [ 0, %.preheader.us ], [ 2000, %middle.block120 ]
  %126 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge103.prol.loopexit, label %._crit_edge103.prol.preheader

._crit_edge103.prol.preheader:                    ; preds = %._crit_edge103.preheader
  br label %._crit_edge103.prol

._crit_edge103.prol:                              ; preds = %._crit_edge103.prol, %._crit_edge103.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge103.prol ], [ %indvars.iv.ph, %._crit_edge103.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge103.prol ], [ 0, %._crit_edge103.prol.preheader ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv.prol
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.prol
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge103.prol.loopexit.unr-lcssa, label %._crit_edge103.prol, !llvm.loop !21

._crit_edge103.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge103.prol
  br label %._crit_edge103.prol.loopexit

._crit_edge103.prol.loopexit:                     ; preds = %._crit_edge103.preheader, %._crit_edge103.prol.loopexit.unr-lcssa
  %132 = icmp ult i64 %126, 3
  br i1 %132, label %._crit_edge.us.loopexit, label %._crit_edge103.preheader.new

._crit_edge103.preheader.new:                     ; preds = %._crit_edge103.prol.loopexit
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %._crit_edge103, %._crit_edge103.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge103.preheader.new ], [ %indvars.iv.next.3, %._crit_edge103 ]
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.next
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next.1
  %144 = bitcast double* %143 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.next.1
  %147 = bitcast double* %146 to i64*
  store i64 %145, i64* %147, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %148 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next.2
  %149 = bitcast double* %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv.next.2
  %152 = bitcast double* %151 to i64*
  store i64 %150, i64* %152, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond51.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond51.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge103, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge103
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge103.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block120
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge44.thread
  %153 = phi i8* [ %40, %._crit_edge44.thread ], [ %41, %._crit_edge19.loopexit ]
  tail call void @free(i8* %153) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader12.preheader, label %._crit_edge19

.preheader12.preheader:                           ; preds = %5
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.preheader, %._crit_edge44
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge44 ], [ 0, %.preheader12.preheader ]
  %6 = icmp sgt i64 %indvars.iv103, 0
  br i1 %6, label %.lr.ph35.preheader, label %._crit_edge44

.lr.ph35.preheader:                               ; preds = %.preheader12
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 0
  br label %.lr.ph35

.lr.ph43.split.us:                                ; preds = %.lr.ph43.split.us.preheader, %._crit_edge40.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge40.us ], [ %indvars.iv103, %.lr.ph43.split.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv98
  %9 = load double, double* %8, align 8
  br i1 %lcmp.mod130, label %._crit_edge108.prol.loopexit.unr-lcssa, label %._crit_edge108.prol.preheader

._crit_edge108.prol.preheader:                    ; preds = %.lr.ph43.split.us
  br label %._crit_edge108.prol

._crit_edge108.prol:                              ; preds = %._crit_edge108.prol.preheader
  %10 = load double, double* %52, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv98
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %9, %13
  br label %._crit_edge108.prol.loopexit.unr-lcssa

._crit_edge108.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph43.split.us, %._crit_edge108.prol
  %.lcssa123.unr.ph = phi double [ %14, %._crit_edge108.prol ], [ undef, %.lr.ph43.split.us ]
  %indvars.iv87.unr.ph = phi i64 [ 1, %._crit_edge108.prol ], [ 0, %.lr.ph43.split.us ]
  %.137.us.unr.ph = phi double [ %14, %._crit_edge108.prol ], [ %9, %.lr.ph43.split.us ]
  br label %._crit_edge108.prol.loopexit

._crit_edge108.prol.loopexit:                     ; preds = %._crit_edge108.prol.loopexit.unr-lcssa
  br i1 %51, label %._crit_edge40.us, label %.lr.ph43.split.us.new

.lr.ph43.split.us.new:                            ; preds = %._crit_edge108.prol.loopexit
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108, %.lr.ph43.split.us.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr.ph, %.lr.ph43.split.us.new ], [ %indvars.iv.next88.1, %._crit_edge108 ]
  %.137.us = phi double [ %.137.us.unr.ph, %.lr.ph43.split.us.new ], [ %26, %._crit_edge108 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv87
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv98
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.137.us, %19
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next88
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next88, i64 %indvars.iv98
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  %indvars.iv.next88.1 = add nuw nsw i64 %indvars.iv87, 2
  %exitcond95.1 = icmp eq i64 %indvars.iv.next88.1, %indvars.iv103
  br i1 %exitcond95.1, label %._crit_edge40.us.unr-lcssa, label %._crit_edge108

._crit_edge40.us.unr-lcssa:                       ; preds = %._crit_edge108
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge108.prol.loopexit, %._crit_edge40.us.unr-lcssa
  %.lcssa123 = phi double [ %.lcssa123.unr.ph, %._crit_edge108.prol.loopexit ], [ %26, %._crit_edge40.us.unr-lcssa ]
  store double %.lcssa123, double* %8, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next99, 2000
  br i1 %exitcond102, label %._crit_edge44.loopexit, label %.lr.ph43.split.us

.lr.ph35:                                         ; preds = %.lr.ph35.preheader, %._crit_edge32
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge32 ], [ 0, %.lr.ph35.preheader ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv77
  %28 = load double, double* %27, align 8
  %29 = icmp sgt i64 %indvars.iv77, 0
  br i1 %29, label %.lr.ph31.preheader, label %._crit_edge32

.lr.ph31.preheader:                               ; preds = %.lr.ph35
  %xtraiter127 = and i64 %indvars.iv77, 1
  %lcmp.mod128 = icmp eq i64 %xtraiter127, 0
  br i1 %lcmp.mod128, label %.lr.ph31.prol.loopexit.unr-lcssa, label %.lr.ph31.prol.preheader

.lr.ph31.prol.preheader:                          ; preds = %.lr.ph31.preheader
  br label %.lr.ph31.prol

.lr.ph31.prol:                                    ; preds = %.lr.ph31.prol.preheader
  %30 = load double, double* %7, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  br label %.lr.ph31.prol.loopexit.unr-lcssa

.lr.ph31.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph31.preheader, %.lr.ph31.prol
  %.lcssa122.unr.ph = phi double [ %34, %.lr.ph31.prol ], [ undef, %.lr.ph31.preheader ]
  %indvars.iv68.unr.ph = phi i64 [ 1, %.lr.ph31.prol ], [ 0, %.lr.ph31.preheader ]
  %.029.unr.ph = phi double [ %34, %.lr.ph31.prol ], [ %28, %.lr.ph31.preheader ]
  br label %.lr.ph31.prol.loopexit

.lr.ph31.prol.loopexit:                           ; preds = %.lr.ph31.prol.loopexit.unr-lcssa
  %35 = icmp eq i64 %indvars.iv77, 1
  br i1 %35, label %._crit_edge32.loopexit, label %.lr.ph31.preheader.new

.lr.ph31.preheader.new:                           ; preds = %.lr.ph31.prol.loopexit
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31, %.lr.ph31.preheader.new
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr.ph, %.lr.ph31.preheader.new ], [ %indvars.iv.next69.1, %.lr.ph31 ]
  %.029 = phi double [ %.029.unr.ph, %.lr.ph31.preheader.new ], [ %47, %.lr.ph31 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv68
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv77
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.029, %40
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next69
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next69, i64 %indvars.iv77
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  %indvars.iv.next69.1 = add nuw nsw i64 %indvars.iv68, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next69.1, %indvars.iv77
  br i1 %exitcond76.1, label %._crit_edge32.loopexit.unr-lcssa, label %.lr.ph31

._crit_edge32.loopexit.unr-lcssa:                 ; preds = %.lr.ph31
  br label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %.lr.ph31.prol.loopexit, %._crit_edge32.loopexit.unr-lcssa
  %.lcssa122 = phi double [ %.lcssa122.unr.ph, %.lr.ph31.prol.loopexit ], [ %47, %._crit_edge32.loopexit.unr-lcssa ]
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.lr.ph35
  %.0.lcssa = phi double [ %28, %.lr.ph35 ], [ %.lcssa122, %._crit_edge32.loopexit ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv77
  %49 = load double, double* %48, align 8
  %50 = fdiv double %.0.lcssa, %49
  store double %50, double* %27, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next78, %indvars.iv103
  br i1 %exitcond85, label %.lr.ph43.split.us.preheader, label %.lr.ph35

.lr.ph43.split.us.preheader:                      ; preds = %._crit_edge32
  %xtraiter129 = and i64 %indvars.iv103, 1
  %lcmp.mod130 = icmp eq i64 %xtraiter129, 0
  %51 = icmp eq i64 %indvars.iv103, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 0
  br label %.lr.ph43.split.us

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %.preheader12
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond107, label %.lr.ph27.preheader, label %.preheader12

.lr.ph27.preheader:                               ; preds = %._crit_edge44
  br label %.lr.ph27

.lr.ph18.preheader:                               ; preds = %._crit_edge24
  br label %.lr.ph18

.lr.ph27:                                         ; preds = %.lr.ph27.preheader, %._crit_edge24
  %indvars.iv141 = phi i2 [ 0, %.lr.ph27.preheader ], [ %indvars.iv.next142, %._crit_edge24 ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge24 ], [ 0, %.lr.ph27.preheader ]
  %53 = zext i2 %indvars.iv141 to i64
  %54 = add nsw i64 %indvars.iv63, -1
  %55 = getelementptr inbounds double, double* %2, i64 %indvars.iv63
  %56 = load double, double* %55, align 8
  %57 = icmp sgt i64 %indvars.iv63, 0
  br i1 %57, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph27
  %xtraiter124 = and i64 %indvars.iv63, 3
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  br i1 %lcmp.mod125, label %.lr.ph23.prol.loopexit, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol, %.lr.ph23.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph23.prol ], [ 0, %.lr.ph23.prol.preheader ]
  %.221.prol = phi double [ %63, %.lr.ph23.prol ], [ %56, %.lr.ph23.prol.preheader ]
  %prol.iter126 = phi i64 [ %prol.iter126.sub, %.lr.ph23.prol ], [ %xtraiter124, %.lr.ph23.prol.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.prol
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %.221.prol, %62
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter126.sub = add nsw i64 %prol.iter126, -1
  %prol.iter126.cmp = icmp eq i64 %prol.iter126.sub, 0
  br i1 %prol.iter126.cmp, label %.lr.ph23.prol.loopexit.unr-lcssa, label %.lr.ph23.prol, !llvm.loop !23

.lr.ph23.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph23.prol
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.preheader, %.lr.ph23.prol.loopexit.unr-lcssa
  %.lcssa121.unr = phi double [ undef, %.lr.ph23.preheader ], [ %63, %.lr.ph23.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph23.preheader ], [ %53, %.lr.ph23.prol.loopexit.unr-lcssa ]
  %.221.unr = phi double [ %56, %.lr.ph23.preheader ], [ %63, %.lr.ph23.prol.loopexit.unr-lcssa ]
  %64 = icmp ult i64 %54, 3
  br i1 %64, label %._crit_edge24.loopexit, label %.lr.ph23.preheader.new

.lr.ph23.preheader.new:                           ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23, %.lr.ph23.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph23.preheader.new ], [ %indvars.iv.next.3, %.lr.ph23 ]
  %.221 = phi double [ %.221.unr, %.lr.ph23.preheader.new ], [ %88, %.lr.ph23 ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %.221, %69
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fsub double %70, %75
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next.1
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fsub double %76, %81
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next.2
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fsub double %82, %87
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond62.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond62.3, label %._crit_edge24.loopexit.unr-lcssa, label %.lr.ph23

._crit_edge24.loopexit.unr-lcssa:                 ; preds = %.lr.ph23
  br label %._crit_edge24.loopexit

._crit_edge24.loopexit:                           ; preds = %.lr.ph23.prol.loopexit, %._crit_edge24.loopexit.unr-lcssa
  %.lcssa121 = phi double [ %.lcssa121.unr, %.lr.ph23.prol.loopexit ], [ %88, %._crit_edge24.loopexit.unr-lcssa ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph27
  %.2.lcssa = phi double [ %56, %.lr.ph27 ], [ %.lcssa121, %._crit_edge24.loopexit ]
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv63
  store double %.2.lcssa, double* %89, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next64, 2000
  %indvars.iv.next142 = add i2 %indvars.iv141, 1
  br i1 %exitcond67, label %.lr.ph18.preheader, label %.lr.ph27

.lr.ph18:                                         ; preds = %._crit_edge, %.lr.ph18.preheader
  %indvars.iv139 = phi i2 [ %indvars.iv.next140, %._crit_edge ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge ], [ 2001, %.lr.ph18.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge ], [ 2000, %.lr.ph18.preheader ]
  %.2917.in = phi i32 [ %.2917, %._crit_edge ], [ 2000, %.lr.ph18.preheader ]
  %90 = zext i2 %indvars.iv139 to i32
  %91 = add i32 %90, -1
  %92 = zext i32 %91 to i64
  %93 = add i64 %indvars.iv137, %92
  %94 = add nsw i32 %indvar, -1
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, -1
  %.2917 = add nsw i32 %.2917.in, -1
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next55
  %96 = load double, double* %95, align 8
  %97 = icmp slt i32 %.2917.in, 2000
  br i1 %97, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol ], [ %indvars.iv54, %.lr.ph.prol.preheader ]
  %.314.prol = phi double [ %103, %.lr.ph.prol ], [ %96, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52.prol
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv52.prol
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fsub double %.314.prol, %102
  %indvars.iv.next53.prol = add nsw i64 %indvars.iv52.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !24

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv52.unr = phi i64 [ %indvars.iv54, %.lr.ph.preheader ], [ %93, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.314.unr = phi double [ %96, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.unr-lcssa ]
  %104 = icmp ult i32 %94, 3
  br i1 %104, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next53.3, %.lr.ph ]
  %.314 = phi double [ %.314.unr, %.lr.ph.preheader.new ], [ %128, %.lr.ph ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %.314, %109
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fsub double %110, %115
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.1
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.1
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = fsub double %116, %121
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.2
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.2
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fsub double %122, %127
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next53.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %128, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph18
  %.3.lcssa = phi double [ %96, %.lr.ph18 ], [ %.lcssa, %._crit_edge.loopexit ]
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next55
  %130 = load double, double* %129, align 8
  %131 = fdiv double %.3.lcssa, %130
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next55
  store double %131, double* %132, align 8
  %133 = icmp sgt i64 %indvars.iv54, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next138 = add nsw i64 %indvars.iv137, -1
  %indvars.iv.next140 = add i2 %indvars.iv139, 1
  br i1 %133, label %.lr.ph18, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %.lr.ph._crit_edge

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

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
!24 = distinct !{!24, !2}
