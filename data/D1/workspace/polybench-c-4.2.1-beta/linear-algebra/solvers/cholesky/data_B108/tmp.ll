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
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge101.thread

._crit_edge101.thread:                            ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge75

._crit_edge.lr.ph:                                ; preds = %2
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %._crit_edge99, %._crit_edge.lr.ph
  %indvars.iv148 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next149, %._crit_edge99 ]
  %indvars.iv146 = phi i64 [ 1, %._crit_edge.lr.ph ], [ %indvars.iv.next147, %._crit_edge99 ]
  %4 = sub nsw i64 1998, %indvars.iv148
  br label %._crit_edge152

._crit_edge152:                                   ; preds = %._crit_edge152, %.lr.ph94
  %indvars.iv130 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next131, %._crit_edge152 ]
  %5 = sub nsw i64 0, %indvars.iv130
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv130
  store double %10, double* %11, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next131, %indvars.iv146
  br i1 %exitcond137, label %._crit_edge95, label %._crit_edge152

._crit_edge95:                                    ; preds = %._crit_edge152
  %12 = mul nuw nsw i64 %indvars.iv148, 2001
  %13 = shl i64 %4, 3
  %14 = add nuw nsw i64 %12, 1
  %15 = and i64 %13, 34359738360
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %14
  %16 = add nuw nsw i64 %15, 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %17 = icmp slt i64 %indvars.iv.next149, 2000
  br i1 %17, label %._crit_edge99.loopexit, label %._crit_edge99

._crit_edge99.loopexit:                           ; preds = %._crit_edge95
  %18 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge95, %._crit_edge99.loopexit
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv148
  store double 1.000000e+00, double* %19, align 8
  %exitcond151 = icmp eq i64 %indvars.iv.next149, 2000
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  br i1 %exitcond151, label %._crit_edge101, label %.lr.ph94

._crit_edge101:                                   ; preds = %._crit_edge99
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge91.us.prol.loopexit, label %._crit_edge91.us.prol.preheader

._crit_edge91.us.prol.preheader:                  ; preds = %._crit_edge101
  br label %._crit_edge91.us.prol

._crit_edge91.us.prol:                            ; preds = %._crit_edge91.us.prol, %._crit_edge91.us.prol.preheader
  %indvars.iv126.prol = phi i64 [ 0, %._crit_edge91.us.prol.preheader ], [ %indvars.iv.next127.prol, %._crit_edge91.us.prol ]
  %prol.iter205 = phi i64 [ 0, %._crit_edge91.us.prol.preheader ], [ %prol.iter205.sub, %._crit_edge91.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv126.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.prol = add nuw nsw i64 %indvars.iv126.prol, 1
  %prol.iter205.sub = add nsw i64 %prol.iter205, -1
  %prol.iter205.cmp = icmp eq i64 %prol.iter205.sub, 0
  br i1 %prol.iter205.cmp, label %._crit_edge91.us.prol.loopexit.unr-lcssa, label %._crit_edge91.us.prol, !llvm.loop !1

._crit_edge91.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge91.us.prol
  br label %._crit_edge91.us.prol.loopexit

._crit_edge91.us.prol.loopexit:                   ; preds = %._crit_edge101, %._crit_edge91.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge70.us.us.preheader.preheader, label %._crit_edge101.new

._crit_edge101.new:                               ; preds = %._crit_edge91.us.prol.loopexit
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %._crit_edge101.new
  %indvars.iv126 = phi i64 [ 0, %._crit_edge101.new ], [ %indvars.iv.next127.7, %._crit_edge91.us ]
  %22 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = mul i64 %indvars.iv126, 16000
  %24 = add nuw nsw i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %25 = mul i64 %indvars.iv126, 16000
  %26 = add nuw nsw i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %27 = mul i64 %indvars.iv126, 16000
  %28 = add nuw nsw i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %29 = mul i64 %indvars.iv126, 16000
  %30 = add nuw nsw i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %31 = mul i64 %indvars.iv126, 16000
  %32 = add nuw nsw i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %33 = mul i64 %indvars.iv126, 16000
  %34 = add nuw nsw i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul i64 %indvars.iv126, 16000
  %36 = add nuw nsw i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.7 = add nuw nsw i64 %indvars.iv126, 8
  %exitcond129.7 = icmp eq i64 %indvars.iv.next127.7, 2000
  br i1 %exitcond129.7, label %._crit_edge70.us.us.preheader.preheader.unr-lcssa, label %._crit_edge91.us

._crit_edge70.us.us.preheader.preheader.unr-lcssa: ; preds = %._crit_edge91.us
  br label %._crit_edge70.us.us.preheader.preheader

._crit_edge70.us.us.preheader.preheader:          ; preds = %._crit_edge91.us.prol.loopexit, %._crit_edge70.us.us.preheader.preheader.unr-lcssa
  %37 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %._crit_edge70.us.us.preheader

._crit_edge70.us.us.preheader:                    ; preds = %._crit_edge80.us, %._crit_edge70.us.us.preheader.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge80.us ], [ 0, %._crit_edge70.us.us.preheader.preheader ]
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv118
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  %38 = add nsw i64 %indvars.iv118, -1999
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %38
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  br label %._crit_edge70.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond121, label %._crit_edge71.us.preheader, label %._crit_edge70.us.us.preheader

._crit_edge70.us.us:                              ; preds = %._crit_edge78.us.us, %._crit_edge70.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %._crit_edge70.us.us.preheader ], [ %indvars.iv.next115, %._crit_edge78.us.us ]
  %39 = mul nuw nsw i64 %indvars.iv114, 16000
  %scevgep158 = getelementptr i8, i8* %20, i64 %39
  %40 = add nuw nsw i64 16000, %39
  %scevgep159 = getelementptr i8, i8* %20, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv118
  br i1 false, label %._crit_edge153.preheader, label %min.iters.checked

._crit_edge153.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge70.us.us
  %indvars.iv110.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge70.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge153.prol.loopexit.unr-lcssa, label %._crit_edge153.prol.preheader

._crit_edge153.prol.preheader:                    ; preds = %._crit_edge153.preheader
  br label %._crit_edge153.prol

._crit_edge153.prol:                              ; preds = %._crit_edge153.prol.preheader
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110.ph, i64 %indvars.iv118
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv114, i64 %indvars.iv110.ph
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next111.prol = add nuw nsw i64 %indvars.iv110.ph, 1
  br label %._crit_edge153.prol.loopexit.unr-lcssa

._crit_edge153.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge153.preheader, %._crit_edge153.prol
  %indvars.iv110.unr.ph = phi i64 [ %indvars.iv.next111.prol, %._crit_edge153.prol ], [ %indvars.iv110.ph, %._crit_edge153.preheader ]
  br label %._crit_edge153.prol.loopexit

._crit_edge153.prol.loopexit:                     ; preds = %._crit_edge153.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge78.us.us.loopexit, label %._crit_edge153.preheader.new

._crit_edge153.preheader.new:                     ; preds = %._crit_edge153.prol.loopexit
  br label %._crit_edge153

min.iters.checked:                                ; preds = %._crit_edge70.us.us
  br i1 false, label %._crit_edge153.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep158, %scevgep162163
  %bound1 = icmp ult i8* %scevgep160161, %scevgep159
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc164 = bitcast double* %41 to i8*
  %bound0165 = icmp ult i8* %scevgep158, %bc164
  %bound1166 = icmp ult i8* %bc, %scevgep159
  %found.conflict167 = and i1 %bound0165, %bound1166
  %conflict.rdx = or i1 %found.conflict, %found.conflict167
  br i1 %conflict.rdx, label %._crit_edge153.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %49 = load double, double* %41, align 8, !alias.scope !3
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = insertelement <2 x double> undef, double %49, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %54 = or i64 %index, 1
  %55 = or i64 %index, 2
  %56 = or i64 %index, 3
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv118
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv118
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv118
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv118
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = fmul <2 x double> %51, %66
  %70 = fmul <2 x double> %53, %68
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv114, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !8, !noalias !10
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !8, !noalias !10
  %75 = fadd <2 x double> %wide.load, %69
  %76 = fadd <2 x double> %wide.load169, %70
  %77 = bitcast double* %71 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = bitcast double* %73 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge78.us.us, label %._crit_edge153.preheader

._crit_edge78.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge153
  br label %._crit_edge78.us.us.loopexit

._crit_edge78.us.us.loopexit:                     ; preds = %._crit_edge153.prol.loopexit, %._crit_edge78.us.us.loopexit.unr-lcssa
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit, %middle.block
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond117, label %._crit_edge80.us, label %._crit_edge70.us.us

._crit_edge153:                                   ; preds = %._crit_edge153, %._crit_edge153.preheader.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr.ph, %._crit_edge153.preheader.new ], [ %indvars.iv.next111.1, %._crit_edge153 ]
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv118
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv114, i64 %indvars.iv110
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %87 = load double, double* %41, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next111, i64 %indvars.iv118
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next111
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %exitcond113.1 = icmp eq i64 %indvars.iv.next111.1, 2000
  br i1 %exitcond113.1, label %._crit_edge78.us.us.loopexit.unr-lcssa, label %._crit_edge153, !llvm.loop !14

._crit_edge71.us.preheader:                       ; preds = %._crit_edge80.us
  br label %._crit_edge71.us

._crit_edge71.us:                                 ; preds = %._crit_edge73.us, %._crit_edge71.us.preheader
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge73.us ], [ 0, %._crit_edge71.us.preheader ]
  %scevgep179 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep179180 = bitcast double* %scevgep179 to i8*
  %scevgep181 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 2000
  %scevgep181182 = bitcast double* %scevgep181 to i8*
  %94 = mul nuw nsw i64 %indvars.iv106, 16000
  %scevgep183 = getelementptr i8, i8* %20, i64 %94
  %95 = add nuw nsw i64 16000, %94
  %scevgep184 = getelementptr i8, i8* %20, i64 %95
  br i1 false, label %._crit_edge154.preheader, label %min.iters.checked174

min.iters.checked174:                             ; preds = %._crit_edge71.us
  br i1 false, label %._crit_edge154.preheader, label %vector.memcheck189

vector.memcheck189:                               ; preds = %min.iters.checked174
  %bound0185 = icmp ult i8* %scevgep179180, %scevgep184
  %bound1186 = icmp ult i8* %scevgep183, %scevgep181182
  %memcheck.conflict188 = and i1 %bound0185, %bound1186
  br i1 %memcheck.conflict188, label %._crit_edge154.preheader, label %vector.body170.preheader

vector.body170.preheader:                         ; preds = %vector.memcheck189
  br label %vector.body170

vector.body170:                                   ; preds = %vector.body170.preheader, %vector.body170
  %index191 = phi i64 [ %index.next192, %vector.body170 ], [ 0, %vector.body170.preheader ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %index191
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load199 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load200 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !15
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index191
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load199, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load200, <2 x i64>* %103, align 8, !alias.scope !18, !noalias !15
  %index.next192 = add nuw nsw i64 %index191, 4
  %104 = icmp eq i64 %index.next192, 2000
  br i1 %104, label %middle.block171, label %vector.body170, !llvm.loop !20

middle.block171:                                  ; preds = %vector.body170
  br i1 true, label %._crit_edge73.us, label %._crit_edge154.preheader

._crit_edge154.preheader:                         ; preds = %middle.block171, %vector.memcheck189, %min.iters.checked174, %._crit_edge71.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck189 ], [ 0, %min.iters.checked174 ], [ 0, %._crit_edge71.us ], [ 2000, %middle.block171 ]
  %105 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge154.prol.loopexit, label %._crit_edge154.prol.preheader

._crit_edge154.prol.preheader:                    ; preds = %._crit_edge154.preheader
  br label %._crit_edge154.prol

._crit_edge154.prol:                              ; preds = %._crit_edge154.prol, %._crit_edge154.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge154.prol ], [ %indvars.iv.ph, %._crit_edge154.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge154.prol ], [ 0, %._crit_edge154.prol.preheader ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %indvars.iv.prol
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.prol
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge154.prol.loopexit.unr-lcssa, label %._crit_edge154.prol, !llvm.loop !21

._crit_edge154.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge154.prol
  br label %._crit_edge154.prol.loopexit

._crit_edge154.prol.loopexit:                     ; preds = %._crit_edge154.preheader, %._crit_edge154.prol.loopexit.unr-lcssa
  %111 = icmp ult i64 %105, 3
  br i1 %111, label %._crit_edge73.us.loopexit, label %._crit_edge154.preheader.new

._crit_edge154.preheader.new:                     ; preds = %._crit_edge154.prol.loopexit
  br label %._crit_edge154

._crit_edge154:                                   ; preds = %._crit_edge154, %._crit_edge154.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge154.preheader.new ], [ %indvars.iv.next.3, %._crit_edge154 ]
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond105.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond105.3, label %._crit_edge73.us.loopexit.unr-lcssa, label %._crit_edge154, !llvm.loop !22

._crit_edge73.us.loopexit.unr-lcssa:              ; preds = %._crit_edge154
  br label %._crit_edge73.us.loopexit

._crit_edge73.us.loopexit:                        ; preds = %._crit_edge154.prol.loopexit, %._crit_edge73.us.loopexit.unr-lcssa
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit, %middle.block171
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond109, label %._crit_edge75.loopexit, label %._crit_edge71.us

._crit_edge75.loopexit:                           ; preds = %._crit_edge73.us
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.loopexit, %._crit_edge101.thread
  %132 = phi i8* [ %3, %._crit_edge101.thread ], [ %20, %._crit_edge75.loopexit ]
  tail call void @free(i8* %132) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %._crit_edge.preheader, label %._crit_edge49

._crit_edge.preheader:                            ; preds = %2
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge47, %._crit_edge.preheader
  %indvars.iv85 = phi i2 [ %indvars.iv.next86, %._crit_edge47 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge47 ], [ 0, %._crit_edge.preheader ]
  %3 = zext i2 %indvars.iv85 to i64
  %4 = add nsw i64 %indvars.iv72, -1
  %5 = icmp sgt i64 %indvars.iv72, 0
  br i1 %5, label %._crit_edge40.preheader, label %._crit_edge47

._crit_edge40.preheader:                          ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 0
  br label %._crit_edge40

.lr.ph46:                                         ; preds = %._crit_edge43
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %.pre79 = load double, double* %7, align 8
  %xtraiter80 = and i64 %indvars.iv72, 3
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod81, label %._crit_edge77.prol.loopexit, label %._crit_edge77.prol.preheader

._crit_edge77.prol.preheader:                     ; preds = %.lr.ph46
  br label %._crit_edge77.prol

._crit_edge77.prol:                               ; preds = %._crit_edge77.prol, %._crit_edge77.prol.preheader
  %8 = phi double [ %.pre79, %._crit_edge77.prol.preheader ], [ %12, %._crit_edge77.prol ]
  %indvars.iv64.prol = phi i64 [ 0, %._crit_edge77.prol.preheader ], [ %indvars.iv.next65.prol, %._crit_edge77.prol ]
  %prol.iter = phi i64 [ %xtraiter80, %._crit_edge77.prol.preheader ], [ %prol.iter.sub, %._crit_edge77.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv64.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next65.prol = add nuw nsw i64 %indvars.iv64.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge77.prol.loopexit.unr-lcssa, label %._crit_edge77.prol, !llvm.loop !23

._crit_edge77.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge77.prol
  br label %._crit_edge77.prol.loopexit

._crit_edge77.prol.loopexit:                      ; preds = %.lr.ph46, %._crit_edge77.prol.loopexit.unr-lcssa
  %.unr82 = phi double [ %.pre79, %.lr.ph46 ], [ %12, %._crit_edge77.prol.loopexit.unr-lcssa ]
  %indvars.iv64.unr = phi i64 [ 0, %.lr.ph46 ], [ %3, %._crit_edge77.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge47.loopexit, label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %._crit_edge77.prol.loopexit
  br label %._crit_edge77

._crit_edge40:                                    ; preds = %._crit_edge40.preheader, %._crit_edge43
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge43 ], [ 0, %._crit_edge40.preheader ]
  %14 = icmp sgt i64 %indvars.iv56, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv56
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge76.preheader, label %._crit_edge43

._crit_edge76.preheader:                          ; preds = %._crit_edge40
  %xtraiter = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge76.prol.loopexit.unr-lcssa, label %._crit_edge76.prol.preheader

._crit_edge76.prol.preheader:                     ; preds = %._crit_edge76.preheader
  br label %._crit_edge76.prol

._crit_edge76.prol:                               ; preds = %._crit_edge76.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge76.prol.loopexit.unr-lcssa

._crit_edge76.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge76.preheader, %._crit_edge76.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge76.prol ], [ undef, %._crit_edge76.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge76.prol ], [ %.pre, %._crit_edge76.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge76.prol ], [ 0, %._crit_edge76.preheader ]
  br label %._crit_edge76.prol.loopexit

._crit_edge76.prol.loopexit:                      ; preds = %._crit_edge76.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv56, 1
  br i1 %21, label %._crit_edge43.loopexit, label %._crit_edge76.preheader.new

._crit_edge76.preheader.new:                      ; preds = %._crit_edge76.prol.loopexit
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76, %._crit_edge76.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge76.preheader.new ], [ %34, %._crit_edge76 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge76.preheader.new ], [ %indvars.iv.next.1, %._crit_edge76 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond55.1, label %._crit_edge43.loopexit.unr-lcssa, label %._crit_edge76

._crit_edge43.loopexit.unr-lcssa:                 ; preds = %._crit_edge76
  br label %._crit_edge43.loopexit

._crit_edge43.loopexit:                           ; preds = %._crit_edge76.prol.loopexit, %._crit_edge43.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge76.prol.loopexit ], [ %34, %._crit_edge43.loopexit.unr-lcssa ]
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %._crit_edge40
  %35 = phi double [ %.pre, %._crit_edge40 ], [ %.lcssa, %._crit_edge43.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next57, %indvars.iv72
  br i1 %exitcond63, label %.lr.ph46, label %._crit_edge40

._crit_edge77:                                    ; preds = %._crit_edge77, %.lr.ph46.new
  %39 = phi double [ %.unr82, %.lr.ph46.new ], [ %55, %._crit_edge77 ]
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr, %.lr.ph46.new ], [ %indvars.iv.next65.3, %._crit_edge77 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv64
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next65
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next65.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next65.2 = add nsw i64 %indvars.iv64, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next65.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next65.3 = add nuw nsw i64 %indvars.iv64, 4
  %exitcond71.3 = icmp eq i64 %indvars.iv.next65.3, %indvars.iv72
  br i1 %exitcond71.3, label %._crit_edge47.loopexit.unr-lcssa, label %._crit_edge77

._crit_edge47.loopexit.unr-lcssa:                 ; preds = %._crit_edge77
  br label %._crit_edge47.loopexit

._crit_edge47.loopexit:                           ; preds = %._crit_edge77.prol.loopexit, %._crit_edge47.loopexit.unr-lcssa
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %._crit_edge
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 2000
  %indvars.iv.next86 = add i2 %indvars.iv85, 1
  br i1 %exitcond75, label %._crit_edge49.loopexit, label %._crit_edge

._crit_edge49.loopexit:                           ; preds = %._crit_edge47
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %2
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
  br i1 true, label %._crit_edge.preheader, label %._crit_edge15

._crit_edge.preheader:                            ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge13, %._crit_edge.preheader
  %indvars.iv24 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next25, %._crit_edge13 ]
  %indvars.iv22 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next23, %._crit_edge13 ]
  %7 = mul nuw nsw i64 %indvars.iv24, 2000
  br label %._crit_edge11._crit_edge

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge11._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, %indvars.iv22
  br i1 %exitcond21, label %._crit_edge13, label %._crit_edge11._crit_edge

._crit_edge13:                                    ; preds = %._crit_edge11
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 2000
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  br i1 %exitcond27, label %._crit_edge15.loopexit, label %.lr.ph

._crit_edge15.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
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
