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
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge96.thread

._crit_edge96.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge77

._crit_edge.lr.ph:                                ; preds = %2
  br label %.lr.ph89.preheader

.lr.ph89.preheader:                               ; preds = %._crit_edge.lr.ph, %._crit_edge94.._crit_edge_crit_edge
  %indvars.iv144 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next145, %._crit_edge94.._crit_edge_crit_edge ]
  %indvars.iv142 = phi i64 [ 1, %._crit_edge.lr.ph ], [ %indvars.iv.next143, %._crit_edge94.._crit_edge_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv144, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv144
  %7 = shl i64 %6, 3
  br label %.lr.ph89

.lr.ph89:                                         ; preds = %.lr.ph89, %.lr.ph89.preheader
  %indvars.iv126 = phi i64 [ 0, %.lr.ph89.preheader ], [ %indvars.iv.next127, %.lr.ph89 ]
  %8 = sub nsw i64 0, %indvars.iv126
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv126
  store double %13, double* %14, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next127, %indvars.iv142
  br i1 %exitcond133, label %._crit_edge._crit_edge, label %.lr.ph89

._crit_edge._crit_edge:                           ; preds = %.lr.ph89
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %15 = and i64 %7, 34359738360
  %scevgep138139 = bitcast double* %scevgep138 to i8*
  %16 = add nuw nsw i64 %15, 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %17 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %17, label %._crit_edge94.._crit_edge_crit_edge, label %._crit_edge96

._crit_edge94.._crit_edge_crit_edge:              ; preds = %._crit_edge._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep138139, i8 0, i64 %16, i32 8, i1 false)
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %18, align 8
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  br label %.lr.ph89.preheader

._crit_edge96:                                    ; preds = %._crit_edge._crit_edge
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %19, align 8
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %21 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge86.prol.loopexit, label %._crit_edge86.prol.preheader

._crit_edge86.prol.preheader:                     ; preds = %._crit_edge96
  br label %._crit_edge86.prol

._crit_edge86.prol:                               ; preds = %._crit_edge86.prol, %._crit_edge86.prol.preheader
  %indvars.iv122.prol = phi i64 [ 0, %._crit_edge86.prol.preheader ], [ %indvars.iv.next123.prol, %._crit_edge86.prol ]
  %prol.iter195 = phi i64 [ 0, %._crit_edge86.prol.preheader ], [ %prol.iter195.sub, %._crit_edge86.prol ]
  %22 = mul nuw nsw i64 %indvars.iv122.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %20, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.prol = add nuw nsw i64 %indvars.iv122.prol, 1
  %prol.iter195.sub = add nsw i64 %prol.iter195, -1
  %prol.iter195.cmp = icmp eq i64 %prol.iter195.sub, 0
  br i1 %prol.iter195.cmp, label %._crit_edge86.prol.loopexit.unr-lcssa, label %._crit_edge86.prol, !llvm.loop !1

._crit_edge86.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge86.prol
  br label %._crit_edge86.prol.loopexit

._crit_edge86.prol.loopexit:                      ; preds = %._crit_edge96, %._crit_edge86.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge70.preheader, label %._crit_edge96.new

._crit_edge96.new:                                ; preds = %._crit_edge86.prol.loopexit
  br label %._crit_edge86

._crit_edge70.preheader.unr-lcssa:                ; preds = %._crit_edge86
  br label %._crit_edge70.preheader

._crit_edge70.preheader:                          ; preds = %._crit_edge86.prol.loopexit, %._crit_edge70.preheader.unr-lcssa
  br label %._crit_edge70

._crit_edge86:                                    ; preds = %._crit_edge86, %._crit_edge96.new
  %indvars.iv122 = phi i64 [ 0, %._crit_edge96.new ], [ %indvars.iv.next123.7, %._crit_edge86 ]
  %23 = mul nuw nsw i64 %indvars.iv122, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv122, 16000
  %25 = add i64 %24, 16000
  %scevgep.1 = getelementptr i8, i8* %20, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv122, 16000
  %27 = add i64 %26, 32000
  %scevgep.2 = getelementptr i8, i8* %20, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv122, 16000
  %29 = add i64 %28, 48000
  %scevgep.3 = getelementptr i8, i8* %20, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv122, 16000
  %31 = add i64 %30, 64000
  %scevgep.4 = getelementptr i8, i8* %20, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv122, 16000
  %33 = add i64 %32, 80000
  %scevgep.5 = getelementptr i8, i8* %20, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv122, 16000
  %35 = add i64 %34, 96000
  %scevgep.6 = getelementptr i8, i8* %20, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %36 = mul i64 %indvars.iv122, 16000
  %37 = add i64 %36, 112000
  %scevgep.7 = getelementptr i8, i8* %20, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.7 = add nsw i64 %indvars.iv122, 8
  %exitcond125.7 = icmp eq i64 %indvars.iv.next123.7, 2000
  br i1 %exitcond125.7, label %._crit_edge70.preheader.unr-lcssa, label %._crit_edge86

._crit_edge73.preheader:                          ; preds = %._crit_edge82
  br label %._crit_edge73

._crit_edge70:                                    ; preds = %._crit_edge70.preheader, %._crit_edge82
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge82 ], [ 0, %._crit_edge70.preheader ]
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  %38 = add nsw i64 %indvars.iv114, -1999
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %38
  %scevgep152153 = bitcast double* %scevgep152 to i8*
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge80, %._crit_edge70
  %indvars.iv110 = phi i64 [ 0, %._crit_edge70 ], [ %indvars.iv.next111, %._crit_edge80 ]
  %39 = mul nuw nsw i64 %indvars.iv110, 16000
  %scevgep148 = getelementptr i8, i8* %20, i64 %39
  %40 = add i64 16000, %39
  %scevgep149 = getelementptr i8, i8* %20, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv114
  br i1 false, label %._crit_edge146.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge72
  br i1 false, label %._crit_edge146.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep148, %scevgep152153
  %bound1 = icmp ult i8* %scevgep150151, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc154 = bitcast double* %41 to i8*
  %bound0155 = icmp ult i8* %scevgep148, %bc154
  %bound1156 = icmp ult i8* %bc, %scevgep149
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
  br i1 %conflict.rdx, label %._crit_edge146.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = or i64 %index, 1
  %43 = or i64 %index, 2
  %44 = or i64 %index, 3
  %45 = load double, double* %41, align 8, !alias.scope !3
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %45, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv114
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %42, i64 %indvars.iv114
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %43, i64 %indvars.iv114
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %44, i64 %indvars.iv114
  %54 = load double, double* %50, align 8, !alias.scope !6
  %55 = load double, double* %51, align 8, !alias.scope !6
  %56 = load double, double* %52, align 8, !alias.scope !6
  %57 = load double, double* %53, align 8, !alias.scope !6
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fmul <2 x double> %47, %59
  %63 = fmul <2 x double> %49, %61
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv110, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !8, !noalias !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !8, !noalias !10
  %68 = fadd <2 x double> %wide.load, %62
  %69 = fadd <2 x double> %wide.load159, %63
  %70 = bitcast double* %64 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %71 = bitcast double* %66 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %72 = icmp eq i64 %index.next, 2000
  br i1 %72, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge80, label %._crit_edge146.preheader

._crit_edge146.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge72
  %indvars.iv106.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge72 ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge146.prol.loopexit.unr-lcssa, label %._crit_edge146.prol.preheader

._crit_edge146.prol.preheader:                    ; preds = %._crit_edge146.preheader
  br label %._crit_edge146.prol

._crit_edge146.prol:                              ; preds = %._crit_edge146.prol.preheader
  %73 = load double, double* %41, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106.ph, i64 %indvars.iv114
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv110, i64 %indvars.iv106.ph
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next107.prol = add nuw nsw i64 %indvars.iv106.ph, 1
  br label %._crit_edge146.prol.loopexit.unr-lcssa

._crit_edge146.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge146.preheader, %._crit_edge146.prol
  %indvars.iv106.unr.ph = phi i64 [ %indvars.iv.next107.prol, %._crit_edge146.prol ], [ %indvars.iv106.ph, %._crit_edge146.preheader ]
  br label %._crit_edge146.prol.loopexit

._crit_edge146.prol.loopexit:                     ; preds = %._crit_edge146.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge80.loopexit, label %._crit_edge146.preheader.new

._crit_edge146.preheader.new:                     ; preds = %._crit_edge146.prol.loopexit
  br label %._crit_edge146

._crit_edge146:                                   ; preds = %._crit_edge146, %._crit_edge146.preheader.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr.ph, %._crit_edge146.preheader.new ], [ %indvars.iv.next107.1, %._crit_edge146 ]
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv114
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv110, i64 %indvars.iv106
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %87 = load double, double* %41, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next107, i64 %indvars.iv114
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next107
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 2000
  br i1 %exitcond109.1, label %._crit_edge80.loopexit.unr-lcssa, label %._crit_edge146, !llvm.loop !14

._crit_edge80.loopexit.unr-lcssa:                 ; preds = %._crit_edge146
  br label %._crit_edge80.loopexit

._crit_edge80.loopexit:                           ; preds = %._crit_edge146.prol.loopexit, %._crit_edge80.loopexit.unr-lcssa
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %middle.block
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, 2000
  br i1 %exitcond113, label %._crit_edge82, label %._crit_edge72

._crit_edge82:                                    ; preds = %._crit_edge80
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond117, label %._crit_edge73.preheader, label %._crit_edge70

._crit_edge73:                                    ; preds = %._crit_edge73.preheader, %._crit_edge75
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge75 ], [ 0, %._crit_edge73.preheader ]
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 0
  %scevgep169170 = bitcast double* %scevgep169 to i8*
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 2000
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  %94 = mul nuw nsw i64 %indvars.iv102, 16000
  %scevgep173 = getelementptr i8, i8* %20, i64 %94
  %95 = add i64 16000, %94
  %scevgep174 = getelementptr i8, i8* %20, i64 %95
  br i1 false, label %._crit_edge147.preheader, label %min.iters.checked164

min.iters.checked164:                             ; preds = %._crit_edge73
  br i1 false, label %._crit_edge147.preheader, label %vector.memcheck179

vector.memcheck179:                               ; preds = %min.iters.checked164
  %bound0175 = icmp ult i8* %scevgep169170, %scevgep174
  %bound1176 = icmp ult i8* %scevgep173, %scevgep171172
  %memcheck.conflict178 = and i1 %bound0175, %bound1176
  br i1 %memcheck.conflict178, label %._crit_edge147.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %vector.memcheck179
  br label %vector.body160

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index181 = phi i64 [ %index.next182, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %index181
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !15
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %index181
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load189, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %103, align 8, !alias.scope !18, !noalias !15
  %index.next182 = add i64 %index181, 4
  %104 = icmp eq i64 %index.next182, 2000
  br i1 %104, label %middle.block161, label %vector.body160, !llvm.loop !20

middle.block161:                                  ; preds = %vector.body160
  br i1 true, label %._crit_edge75, label %._crit_edge147.preheader

._crit_edge147.preheader:                         ; preds = %middle.block161, %vector.memcheck179, %min.iters.checked164, %._crit_edge73
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck179 ], [ 0, %min.iters.checked164 ], [ 0, %._crit_edge73 ], [ 2000, %middle.block161 ]
  %105 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge147.prol.loopexit, label %._crit_edge147.prol.preheader

._crit_edge147.prol.preheader:                    ; preds = %._crit_edge147.preheader
  br label %._crit_edge147.prol

._crit_edge147.prol:                              ; preds = %._crit_edge147.prol, %._crit_edge147.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge147.prol ], [ %indvars.iv.ph, %._crit_edge147.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge147.prol ], [ 0, %._crit_edge147.prol.preheader ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %indvars.iv.prol
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.prol
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge147.prol.loopexit.unr-lcssa, label %._crit_edge147.prol, !llvm.loop !21

._crit_edge147.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge147.prol
  br label %._crit_edge147.prol.loopexit

._crit_edge147.prol.loopexit:                     ; preds = %._crit_edge147.preheader, %._crit_edge147.prol.loopexit.unr-lcssa
  %111 = icmp ult i64 %105, 3
  br i1 %111, label %._crit_edge75.loopexit, label %._crit_edge147.preheader.new

._crit_edge147.preheader.new:                     ; preds = %._crit_edge147.prol.loopexit
  br label %._crit_edge147

._crit_edge147:                                   ; preds = %._crit_edge147, %._crit_edge147.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge147.preheader.new ], [ %indvars.iv.next.3, %._crit_edge147 ]
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond101.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond101.3, label %._crit_edge75.loopexit.unr-lcssa, label %._crit_edge147, !llvm.loop !22

._crit_edge75.loopexit.unr-lcssa:                 ; preds = %._crit_edge147
  br label %._crit_edge75.loopexit

._crit_edge75.loopexit:                           ; preds = %._crit_edge147.prol.loopexit, %._crit_edge75.loopexit.unr-lcssa
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.loopexit, %middle.block161
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond105, label %._crit_edge77.loopexit, label %._crit_edge73

._crit_edge77.loopexit:                           ; preds = %._crit_edge75
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %._crit_edge96.thread
  %132 = phi i8* [ %3, %._crit_edge96.thread ], [ %20, %._crit_edge77.loopexit ]
  tail call void @free(i8* %132) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %._crit_edge.preheader, label %._crit_edge52

._crit_edge.preheader:                            ; preds = %2
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge44._crit_edge
  %indvars.iv112 = phi i2 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next113, %._crit_edge44._crit_edge ]
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge44._crit_edge ], [ 0, %._crit_edge.preheader ]
  %3 = zext i2 %indvars.iv112 to i64
  %4 = add nsw i64 %indvars.iv91, -1
  %5 = icmp sgt i64 %indvars.iv91, 0
  br i1 %5, label %._crit_edge43.preheader, label %._crit_edge44.thread

._crit_edge43.preheader:                          ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 0
  br label %._crit_edge43

._crit_edge44.thread:                             ; preds = %._crit_edge
  %.phi.trans.insert5996 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv91
  %.pre6097 = load double, double* %.phi.trans.insert5996, align 8
  br label %._crit_edge44._crit_edge

._crit_edge44:                                    ; preds = %._crit_edge46
  %.phi.trans.insert59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv91
  %.pre60 = load double, double* %.phi.trans.insert59, align 8
  %xtraiter106 = and i64 %indvars.iv91, 3
  %lcmp.mod107 = icmp eq i64 %xtraiter106, 0
  br i1 %lcmp.mod107, label %.lr.ph49.prol.loopexit, label %.lr.ph49.prol.preheader

.lr.ph49.prol.preheader:                          ; preds = %._crit_edge44
  br label %.lr.ph49.prol

.lr.ph49.prol:                                    ; preds = %.lr.ph49.prol, %.lr.ph49.prol.preheader
  %indvars.iv83.prol = phi i64 [ %indvars.iv.next84.prol, %.lr.ph49.prol ], [ 0, %.lr.ph49.prol.preheader ]
  %7 = phi double [ %11, %.lr.ph49.prol ], [ %.pre60, %.lr.ph49.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph49.prol ], [ %xtraiter106, %.lr.ph49.prol.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv83.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %.phi.trans.insert59, align 8
  %indvars.iv.next84.prol = add nuw nsw i64 %indvars.iv83.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph49.prol.loopexit.unr-lcssa, label %.lr.ph49.prol, !llvm.loop !23

.lr.ph49.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph49.prol
  br label %.lr.ph49.prol.loopexit

.lr.ph49.prol.loopexit:                           ; preds = %._crit_edge44, %.lr.ph49.prol.loopexit.unr-lcssa
  %.lcssa105.unr = phi double [ undef, %._crit_edge44 ], [ %11, %.lr.ph49.prol.loopexit.unr-lcssa ]
  %indvars.iv83.unr = phi i64 [ 0, %._crit_edge44 ], [ %3, %.lr.ph49.prol.loopexit.unr-lcssa ]
  %.unr108 = phi double [ %.pre60, %._crit_edge44 ], [ %11, %.lr.ph49.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 3
  br i1 %12, label %._crit_edge44._crit_edge.loopexit, label %._crit_edge44.new

._crit_edge44.new:                                ; preds = %.lr.ph49.prol.loopexit
  br label %.lr.ph49

._crit_edge43:                                    ; preds = %._crit_edge43.preheader, %._crit_edge46
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge46 ], [ 0, %._crit_edge43.preheader ]
  %13 = icmp sgt i64 %indvars.iv75, 0
  %.phi.trans.insert54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv75
  %.pre = load double, double* %.phi.trans.insert54, align 8
  br i1 %13, label %._crit_edge95.preheader, label %._crit_edge46

._crit_edge95.preheader:                          ; preds = %._crit_edge43
  %xtraiter = and i64 %indvars.iv75, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge95.prol.loopexit.unr-lcssa, label %._crit_edge95.prol.preheader

._crit_edge95.prol.preheader:                     ; preds = %._crit_edge95.preheader
  br label %._crit_edge95.prol

._crit_edge95.prol:                               ; preds = %._crit_edge95.prol.preheader
  %14 = load double, double* %6, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %.phi.trans.insert54, align 8
  br label %._crit_edge95.prol.loopexit.unr-lcssa

._crit_edge95.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge95.preheader, %._crit_edge95.prol
  %.lcssa.unr.ph = phi double [ %18, %._crit_edge95.prol ], [ undef, %._crit_edge95.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge95.prol ], [ 0, %._crit_edge95.preheader ]
  %.unr.ph = phi double [ %18, %._crit_edge95.prol ], [ %.pre, %._crit_edge95.preheader ]
  br label %._crit_edge95.prol.loopexit

._crit_edge95.prol.loopexit:                      ; preds = %._crit_edge95.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv75, 1
  br i1 %19, label %._crit_edge46.loopexit, label %._crit_edge95.preheader.new

._crit_edge95.preheader.new:                      ; preds = %._crit_edge95.prol.loopexit
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95, %._crit_edge95.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge95.preheader.new ], [ %indvars.iv.next.1, %._crit_edge95 ]
  %20 = phi double [ %.unr.ph, %._crit_edge95.preheader.new ], [ %32, %._crit_edge95 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %.phi.trans.insert54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %.phi.trans.insert54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond74.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv75
  br i1 %exitcond74.1, label %._crit_edge46.loopexit.unr-lcssa, label %._crit_edge95

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %._crit_edge95
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge95.prol.loopexit, %._crit_edge46.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge95.prol.loopexit ], [ %32, %._crit_edge46.loopexit.unr-lcssa ]
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %._crit_edge43
  %33 = phi double [ %.pre, %._crit_edge43 ], [ %.lcssa, %._crit_edge46.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv75, i64 %indvars.iv75
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %.phi.trans.insert54, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next76, %indvars.iv91
  br i1 %exitcond82, label %._crit_edge44, label %._crit_edge43

.lr.ph49:                                         ; preds = %.lr.ph49, %._crit_edge44.new
  %indvars.iv83 = phi i64 [ %indvars.iv83.unr, %._crit_edge44.new ], [ %indvars.iv.next84.3, %.lr.ph49 ]
  %37 = phi double [ %.unr108, %._crit_edge44.new ], [ %53, %.lr.ph49 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv83
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %.phi.trans.insert59, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next84
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %.phi.trans.insert59, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next84.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %.phi.trans.insert59, align 8
  %indvars.iv.next84.2 = add nsw i64 %indvars.iv83, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv.next84.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %.phi.trans.insert59, align 8
  %indvars.iv.next84.3 = add nuw nsw i64 %indvars.iv83, 4
  %exitcond90.3 = icmp eq i64 %indvars.iv.next84.3, %indvars.iv91
  br i1 %exitcond90.3, label %._crit_edge44._crit_edge.loopexit.unr-lcssa, label %.lr.ph49

._crit_edge44._crit_edge.loopexit.unr-lcssa:      ; preds = %.lr.ph49
  br label %._crit_edge44._crit_edge.loopexit

._crit_edge44._crit_edge.loopexit:                ; preds = %.lr.ph49.prol.loopexit, %._crit_edge44._crit_edge.loopexit.unr-lcssa
  %.lcssa105 = phi double [ %.lcssa105.unr, %.lr.ph49.prol.loopexit ], [ %53, %._crit_edge44._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge44._crit_edge

._crit_edge44._crit_edge:                         ; preds = %._crit_edge44._crit_edge.loopexit, %._crit_edge44.thread
  %.phi.trans.insert5998 = phi double* [ %.phi.trans.insert5996, %._crit_edge44.thread ], [ %.phi.trans.insert59, %._crit_edge44._crit_edge.loopexit ]
  %54 = phi double [ %.pre6097, %._crit_edge44.thread ], [ %.lcssa105, %._crit_edge44._crit_edge.loopexit ]
  %55 = tail call double @sqrt(double %54) #3
  store double %55, double* %.phi.trans.insert5998, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  %indvars.iv.next113 = add i2 %indvars.iv112, 1
  br i1 %exitcond94, label %._crit_edge52.loopexit, label %._crit_edge

._crit_edge52.loopexit:                           ; preds = %._crit_edge44._crit_edge
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit, %2
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
  br i1 true, label %._crit_edge.preheader, label %._crit_edge17

._crit_edge.preheader:                            ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge14, %._crit_edge.preheader
  %indvars.iv26 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next27, %._crit_edge14 ]
  %indvars.iv24 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next25, %._crit_edge14 ]
  %7 = mul nsw i64 %indvars.iv26, 2000
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge12 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge12

; <label>:12:                                     ; preds = %._crit_edge12._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, %indvars.iv24
  br i1 %exitcond23, label %._crit_edge14, label %._crit_edge12._crit_edge

._crit_edge14:                                    ; preds = %._crit_edge12
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 2000
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br i1 %exitcond29, label %._crit_edge17.loopexit, label %.lr.ph

._crit_edge17.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %2
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
