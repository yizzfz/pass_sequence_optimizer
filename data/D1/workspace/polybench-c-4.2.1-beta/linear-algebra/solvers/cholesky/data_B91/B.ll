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
  br i1 true, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge74

.preheader71.lr.ph:                               ; preds = %2
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %._crit_edge98..lr.ph93_crit_edge, %.preheader71.lr.ph
  %indvars.iv147 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next148, %._crit_edge98..lr.ph93_crit_edge ]
  %indvars.iv145 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next146, %._crit_edge98..lr.ph93_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv147, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv147
  %7 = shl i64 %6, 3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph93
  %indvars.iv129 = phi i64 [ 0, %.lr.ph93 ], [ %indvars.iv.next130, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv129
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv129
  store double %13, double* %14, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next130, %indvars.iv145
  br i1 %exitcond136, label %._crit_edge94, label %._crit_edge

._crit_edge94:                                    ; preds = %._crit_edge
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %15 = and i64 %7, 34359738360
  %16 = add nuw nsw i64 %15, 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %17 = icmp slt i64 %indvars.iv.next148, 2000
  br i1 %17, label %._crit_edge98.loopexit, label %._crit_edge98

._crit_edge98.loopexit:                           ; preds = %._crit_edge94
  %18 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge94, %._crit_edge98.loopexit
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv147
  store double 1.000000e+00, double* %19, align 8
  %exitcond150 = icmp eq i64 %indvars.iv.next148, 2000
  br i1 %exitcond150, label %._crit_edge100, label %._crit_edge98..lr.ph93_crit_edge

._crit_edge98..lr.ph93_crit_edge:                 ; preds = %._crit_edge98
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  br label %.lr.ph93

._crit_edge100:                                   ; preds = %._crit_edge98
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge90.us.prol.loopexit, label %._crit_edge90.us.prol.preheader

._crit_edge90.us.prol.preheader:                  ; preds = %._crit_edge100
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol:                            ; preds = %._crit_edge90.us.prol, %._crit_edge90.us.prol.preheader
  %indvars.iv125.prol = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %indvars.iv.next126.prol, %._crit_edge90.us.prol ]
  %prol.iter203 = phi i64 [ 0, %._crit_edge90.us.prol.preheader ], [ %prol.iter203.sub, %._crit_edge90.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv125.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.prol = add nuw nsw i64 %indvars.iv125.prol, 1
  %prol.iter203.sub = add nsw i64 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i64 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %._crit_edge90.us.prol.loopexit.loopexit, label %._crit_edge90.us.prol, !llvm.loop !1

._crit_edge90.us.prol.loopexit.loopexit:          ; preds = %._crit_edge90.us.prol
  br label %._crit_edge90.us.prol.loopexit

._crit_edge90.us.prol.loopexit:                   ; preds = %._crit_edge90.us.prol.loopexit.loopexit, %._crit_edge100
  br i1 false, label %.preheader67.us.us.preheader.preheader, label %._crit_edge100.new

._crit_edge100.new:                               ; preds = %._crit_edge90.us.prol.loopexit
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us, %._crit_edge100.new
  %indvars.iv125 = phi i64 [ 0, %._crit_edge100.new ], [ %indvars.iv.next126.7, %._crit_edge90.us ]
  %22 = mul nuw nsw i64 %indvars.iv125, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv125, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv125, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv125, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv125, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv125, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv125, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv125, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next126.7 = add nuw nsw i64 %indvars.iv125, 8
  %exitcond128.7 = icmp eq i64 %indvars.iv.next126.7, 2000
  br i1 %exitcond128.7, label %.preheader67.us.us.preheader.preheader.loopexit, label %._crit_edge90.us

.preheader67.us.us.preheader.preheader.loopexit:  ; preds = %._crit_edge90.us
  br label %.preheader67.us.us.preheader.preheader

.preheader67.us.us.preheader.preheader:           ; preds = %.preheader67.us.us.preheader.preheader.loopexit, %._crit_edge90.us.prol.loopexit
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge79.us, %.preheader67.us.us.preheader.preheader
  %indvars.iv117 = phi i64 [ 0, %.preheader67.us.us.preheader.preheader ], [ %indvars.iv.next118, %._crit_edge79.us ]
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv117
  %37 = add nsw i64 %indvars.iv117, -1999
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %37
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond120, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader67.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge77.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep156 = getelementptr i8, i8* %20, i64 %38
  %39 = add i64 16000, %38
  %scevgep157 = getelementptr i8, i8* %20, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv117
  br i1 false, label %._crit_edge151.preheader, label %min.iters.checked

._crit_edge151.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader67.us.us
  %indvars.iv109.ph = phi i64 [ 2000, %middle.block ], [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader67.us.us ]
  br i1 true, label %._crit_edge151.prol.loopexit, label %._crit_edge151.prol

._crit_edge151.prol:                              ; preds = %._crit_edge151.preheader
  %41 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %42 = load double, double* %40, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109.ph, i64 %indvars.iv117
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv113, i64 %indvars.iv109.ph
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.ph, 1
  br label %._crit_edge151.prol.loopexit

._crit_edge151.prol.loopexit:                     ; preds = %._crit_edge151.prol, %._crit_edge151.preheader
  %indvars.iv109.unr.ph = phi i64 [ %indvars.iv.next110.prol, %._crit_edge151.prol ], [ %indvars.iv109.ph, %._crit_edge151.preheader ]
  br i1 false, label %._crit_edge77.us.us, label %._crit_edge151.preheader.new

._crit_edge151.preheader.new:                     ; preds = %._crit_edge151.prol.loopexit
  br label %._crit_edge151

min.iters.checked:                                ; preds = %.preheader67.us.us
  br i1 false, label %._crit_edge151.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %49 = bitcast double* %scevgep160 to i8*
  %50 = bitcast double* %scevgep158 to i8*
  %bound0 = icmp ult i8* %scevgep156, %49
  %bound1 = icmp ult i8* %50, %scevgep157
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc162 = bitcast double* %40 to i8*
  %bound0163 = icmp ult i8* %scevgep156, %bc162
  %bound1164 = icmp ult i8* %bc, %scevgep157
  %found.conflict165 = and i1 %bound0163, %bound1164
  %conflict.rdx = or i1 %found.conflict, %found.conflict165
  br i1 %conflict.rdx, label %._crit_edge151.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %51 = load double, double* %40, align 8, !alias.scope !3
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %51, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv117
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv117
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv117
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv117
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %53, %69
  %73 = fmul <2 x double> %55, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv113, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load167, %73
  %80 = bitcast double* %74 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %81 = bitcast double* %76 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge77.us.us, label %._crit_edge151.preheader

._crit_edge77.us.us.loopexit:                     ; preds = %._crit_edge151
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %._crit_edge151.prol.loopexit, %middle.block
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond116, label %._crit_edge79.us, label %.preheader67.us.us

._crit_edge151:                                   ; preds = %._crit_edge151, %._crit_edge151.preheader.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr.ph, %._crit_edge151.preheader.new ], [ %indvars.iv.next110.1, %._crit_edge151 ]
  %83 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %84 = load double, double* %40, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv117
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv113, i64 %indvars.iv109
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %91 = load double, double* %40, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next110, i64 %indvars.iv117
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next110
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond112.1, label %._crit_edge77.us.us.loopexit, label %._crit_edge151, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next106, %._crit_edge.us ]
  %scevgep177 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 0
  %scevgep179 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 2000
  %98 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep181 = getelementptr i8, i8* %20, i64 %98
  %99 = add i64 16000, %98
  %scevgep182 = getelementptr i8, i8* %20, i64 %99
  br i1 false, label %._crit_edge152.preheader, label %min.iters.checked172

min.iters.checked172:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge152.preheader, label %vector.memcheck187

vector.memcheck187:                               ; preds = %min.iters.checked172
  %100 = bitcast double* %scevgep179 to i8*
  %101 = bitcast double* %scevgep177 to i8*
  %bound0183 = icmp ult i8* %101, %scevgep182
  %bound1184 = icmp ult i8* %scevgep181, %100
  %memcheck.conflict186 = and i1 %bound0183, %bound1184
  br i1 %memcheck.conflict186, label %._crit_edge152.preheader, label %vector.body168.preheader

vector.body168.preheader:                         ; preds = %vector.memcheck187
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168.preheader, %vector.body168
  %index189 = phi i64 [ %index.next190, %vector.body168 ], [ 0, %vector.body168.preheader ]
  %102 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv105, i64 %index189
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load197 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load198 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !15
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %index189
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load197, <2 x i64>* %108, align 8, !alias.scope !18, !noalias !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load198, <2 x i64>* %110, align 8, !alias.scope !18, !noalias !15
  %index.next190 = add i64 %index189, 4
  %111 = icmp eq i64 %index.next190, 2000
  br i1 %111, label %middle.block169, label %vector.body168, !llvm.loop !20

middle.block169:                                  ; preds = %vector.body168
  br i1 true, label %._crit_edge.us, label %._crit_edge152.preheader

._crit_edge152.preheader:                         ; preds = %middle.block169, %vector.memcheck187, %min.iters.checked172, %.preheader.us
  %indvars.iv.ph = phi i64 [ 2000, %middle.block169 ], [ 0, %vector.memcheck187 ], [ 0, %min.iters.checked172 ], [ 0, %.preheader.us ]
  %112 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge152.prol.loopexit, label %._crit_edge152.prol.preheader

._crit_edge152.prol.preheader:                    ; preds = %._crit_edge152.preheader
  br label %._crit_edge152.prol

._crit_edge152.prol:                              ; preds = %._crit_edge152.prol, %._crit_edge152.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge152.prol ], [ %indvars.iv.ph, %._crit_edge152.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge152.prol ], [ 0, %._crit_edge152.prol.preheader ]
  %113 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %113, i64 0, i64 %indvars.iv105, i64 %indvars.iv.prol
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.prol
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge152.prol.loopexit.unr-lcssa, label %._crit_edge152.prol, !llvm.loop !21

._crit_edge152.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge152.prol
  br label %._crit_edge152.prol.loopexit

._crit_edge152.prol.loopexit:                     ; preds = %._crit_edge152.preheader, %._crit_edge152.prol.loopexit.unr-lcssa
  %119 = icmp ult i64 %112, 3
  br i1 %119, label %._crit_edge.us, label %._crit_edge152.preheader.new

._crit_edge152.preheader.new:                     ; preds = %._crit_edge152.prol.loopexit
  br label %._crit_edge152

._crit_edge152:                                   ; preds = %._crit_edge152, %._crit_edge152.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge152.preheader.new ], [ %indvars.iv.next.3, %._crit_edge152 ]
  %120 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond104.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond104.3, label %._crit_edge.us.loopexit, label %._crit_edge152, !llvm.loop !22

._crit_edge.us.loopexit:                          ; preds = %._crit_edge152
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge152.prol.loopexit, %middle.block169
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond108, label %._crit_edge74.loopexit, label %.preheader.us

._crit_edge74.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge100.thread
  %141 = phi i8* [ %3, %._crit_edge100.thread ], [ %20, %._crit_edge74.loopexit ]
  tail call void @free(i8* %141) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader41.preheader, label %._crit_edge48

.preheader41.preheader:                           ; preds = %2
  br label %.preheader41

.preheader41:                                     ; preds = %._crit_edge46, %.preheader41.preheader
  %indvars.iv84 = phi i2 [ %indvars.iv.next85, %._crit_edge46 ], [ 0, %.preheader41.preheader ]
  %indvars.iv71 = phi i64 [ 0, %.preheader41.preheader ], [ %indvars.iv.next72, %._crit_edge46 ]
  %3 = zext i2 %indvars.iv84 to i64
  %4 = add nsw i64 %indvars.iv71, -1
  %5 = icmp sgt i64 %indvars.iv71, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge46

.preheader.preheader:                             ; preds = %.preheader41
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 0
  br label %.preheader

.lr.ph45:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %.pre78 = load double, double* %7, align 8
  %xtraiter79 = and i64 %indvars.iv71, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod80, label %._crit_edge76.prol.loopexit, label %._crit_edge76.prol.preheader

._crit_edge76.prol.preheader:                     ; preds = %.lr.ph45
  br label %._crit_edge76.prol

._crit_edge76.prol:                               ; preds = %._crit_edge76.prol, %._crit_edge76.prol.preheader
  %8 = phi double [ %.pre78, %._crit_edge76.prol.preheader ], [ %12, %._crit_edge76.prol ]
  %indvars.iv63.prol = phi i64 [ 0, %._crit_edge76.prol.preheader ], [ %indvars.iv.next64.prol, %._crit_edge76.prol ]
  %prol.iter = phi i64 [ %xtraiter79, %._crit_edge76.prol.preheader ], [ %prol.iter.sub, %._crit_edge76.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge76.prol.loopexit.loopexit, label %._crit_edge76.prol, !llvm.loop !23

._crit_edge76.prol.loopexit.loopexit:             ; preds = %._crit_edge76.prol
  br label %._crit_edge76.prol.loopexit

._crit_edge76.prol.loopexit:                      ; preds = %._crit_edge76.prol.loopexit.loopexit, %.lr.ph45
  %.unr81 = phi double [ %.pre78, %.lr.ph45 ], [ %12, %._crit_edge76.prol.loopexit.loopexit ]
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph45 ], [ %3, %._crit_edge76.prol.loopexit.loopexit ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge46, label %.lr.ph45.new

.lr.ph45.new:                                     ; preds = %._crit_edge76.prol.loopexit
  br label %._crit_edge76

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv55, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv55
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge75.preheader, label %._crit_edge

._crit_edge75.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv55, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge75.prol.loopexit, label %._crit_edge75.prol

._crit_edge75.prol:                               ; preds = %._crit_edge75.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge75.prol.loopexit

._crit_edge75.prol.loopexit:                      ; preds = %._crit_edge75.prol, %._crit_edge75.preheader
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge75.prol ], [ undef, %._crit_edge75.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge75.prol ], [ %.pre, %._crit_edge75.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge75.prol ], [ 0, %._crit_edge75.preheader ]
  %21 = icmp eq i64 %indvars.iv55, 1
  br i1 %21, label %._crit_edge, label %._crit_edge75.preheader.new

._crit_edge75.preheader.new:                      ; preds = %._crit_edge75.prol.loopexit
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75, %._crit_edge75.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge75.preheader.new ], [ %34, %._crit_edge75 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge75.preheader.new ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond54.1, label %._crit_edge.loopexit, label %._crit_edge75

._crit_edge.loopexit:                             ; preds = %._crit_edge75
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge75.prol.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa.unr.ph, %._crit_edge75.prol.loopexit ], [ %34, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv55
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next56, %indvars.iv71
  br i1 %exitcond62, label %.lr.ph45, label %.preheader

._crit_edge76:                                    ; preds = %._crit_edge76, %.lr.ph45.new
  %39 = phi double [ %.unr81, %.lr.ph45.new ], [ %55, %._crit_edge76 ]
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr, %.lr.ph45.new ], [ %indvars.iv.next64.3, %._crit_edge76 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv63
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next64.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next64.3 = add nuw nsw i64 %indvars.iv63, 4
  %exitcond70.3 = icmp eq i64 %indvars.iv.next64.3, %indvars.iv71
  br i1 %exitcond70.3, label %._crit_edge46.loopexit, label %._crit_edge76

._crit_edge46.loopexit:                           ; preds = %._crit_edge76
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %._crit_edge76.prol.loopexit, %.preheader41
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv71
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2000
  %indvars.iv.next85 = add i2 %indvars.iv84, 1
  br i1 %exitcond74, label %._crit_edge48.loopexit, label %.preheader41

._crit_edge48.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %2
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

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge..lr.ph_crit_edge ]
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
  br i1 %exitcond25, label %._crit_edge13.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br label %.lr.ph

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
