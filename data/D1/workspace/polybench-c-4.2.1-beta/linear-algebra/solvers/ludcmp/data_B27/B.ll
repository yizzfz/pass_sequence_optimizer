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
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %5
  %indvars.iv135 = phi i64 [ 0, %5 ], [ %indvars.iv.next136.1, %._crit_edge98 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv135
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv135
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next136 = or i64 %indvars.iv135, 1
  %10 = trunc i64 %indvars.iv.next136 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv135
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next136.1 = add nsw i64 %indvars.iv135, 2
  %13 = trunc i64 %indvars.iv.next136.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond137.1 = icmp eq i64 %indvars.iv.next136, 1999
  br i1 %exitcond137.1, label %.lr.ph.preheader, label %._crit_edge98

.lr.ph.preheader:                                 ; preds = %._crit_edge98
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader85_crit_edge
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge..preheader85_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv133, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %22
  %scevgep131132 = bitcast double* %scevgep131 to i8*
  %23 = sub i64 1998, %indvars.iv133
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

.preheader84:                                     ; preds = %28
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %27 = icmp slt i64 %indvars.iv.next134, 2000
  br i1 %27, label %._crit_edge..preheader85_crit_edge, label %37

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv120
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv120
  store double %34, double* %35, align 8
  %exitcond124 = icmp eq i64 %indvars.iv120, %indvars.iv133
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond124, label %.preheader84, label %28

._crit_edge..preheader85_crit_edge:               ; preds = %.preheader84
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep131132, i8 0, i64 %26, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv133
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader84
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv133
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %40

; <label>:40:                                     ; preds = %40, %37
  %indvars.iv118 = phi i64 [ 0, %37 ], [ %indvars.iv.next119.7, %40 ]
  %41 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %42 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %43 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %44 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %45 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %46 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %47 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %48 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond138.7 = icmp eq i64 %indvars.iv.next119.6, 1999
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  br i1 %exitcond138.7, label %..preheader81_crit_edge, label %40

..preheader81_crit_edge:                          ; preds = %40
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader81

.preheader81:                                     ; preds = %96, %..preheader81_crit_edge
  %indvars.iv113 = phi i64 [ 0, %..preheader81_crit_edge ], [ %50, %96 ]
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  %50 = add i64 %indvars.iv113, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %50
  %scevgep143144 = bitcast double* %scevgep143 to i8*
  br label %.preheader80

.preheader80:                                     ; preds = %middle.block, %.preheader81
  %indvars.iv111 = phi i64 [ 0, %.preheader81 ], [ %indvars.iv.next112, %middle.block ]
  %51 = mul i64 %indvars.iv111, 16000
  %scevgep139 = getelementptr i8, i8* %39, i64 %51
  %52 = add i64 %51, 16000
  %scevgep140 = getelementptr i8, i8* %39, i64 %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep139, %scevgep143144
  %bound1 = icmp ult i8* %scevgep141142, %scevgep140
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %53 to i8*
  %bound0146 = icmp ult i8* %scevgep139, %bc
  %bound1147 = icmp ult i8* %bc, %scevgep140
  %found.conflict148 = and i1 %bound0146, %bound1147
  %conflict.rdx = or i1 %found.conflict, %found.conflict148
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader80
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader80
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %54 = or i64 %index, 1
  %55 = or i64 %index, 2
  %56 = or i64 %index, 3
  %57 = load double, double* %53, align 8, !alias.scope !1
  %58 = insertelement <2 x double> undef, double %57, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv113
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv113
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %59, %69
  %73 = fmul <2 x double> %59, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv111, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load150, %73
  store <2 x double> %78, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %79, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %middle.block.loopexit180, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %81 = load double, double* %53, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %88 = load double, double* %53, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit180:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit180, %middle.block.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %95 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %95, label %.preheader80, label %96

; <label>:96:                                     ; preds = %middle.block
  %97 = icmp slt i64 %50, 2000
  br i1 %97, label %.preheader81, label %.preheader.preheader

.preheader.preheader:                             ; preds = %96
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block152
  %indvars.iv106 = phi i64 [ %98, %middle.block152 ], [ 0, %.preheader.preheader ]
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep156157 = bitcast double* %scevgep156 to i8*
  %98 = add i64 %indvars.iv106, 1
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 %98, i64 0
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  %99 = mul i64 %indvars.iv106, 16000
  %scevgep160 = getelementptr i8, i8* %39, i64 %99
  %100 = add i64 %99, 16000
  %scevgep161 = getelementptr i8, i8* %39, i64 %100
  %bound0162 = icmp ult i8* %scevgep156157, %scevgep161
  %bound1163 = icmp ult i8* %scevgep160, %scevgep158159
  %memcheck.conflict165 = and i1 %bound0162, %bound1163
  br i1 %memcheck.conflict165, label %scalar.ph153.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %.preheader
  br label %vector.body151

scalar.ph153.preheader:                           ; preds = %.preheader
  br label %scalar.ph153

vector.body151:                                   ; preds = %vector.body151, %vector.body151.preheader
  %index168 = phi i64 [ 0, %vector.body151.preheader ], [ %index.next169.1, %vector.body151 ]
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %index168
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load176 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load177 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index168
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load176, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load177, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %index.next169 = or i64 %index168, 4
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %index.next169
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load176.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load177.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next169
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load176.1, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load177.1, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next169.1 = add nsw i64 %index168, 8
  %117 = icmp eq i64 %index.next169.1, 2000
  br i1 %117, label %middle.block152.loopexit179, label %vector.body151, !llvm.loop !18

scalar.ph153:                                     ; preds = %scalar.ph153, %scalar.ph153.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph153.preheader ], [ %indvars.iv.next.4, %scalar.ph153 ]
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block152.loopexit, label %scalar.ph153, !llvm.loop !19

middle.block152.loopexit:                         ; preds = %scalar.ph153
  br label %middle.block152

middle.block152.loopexit179:                      ; preds = %vector.body151
  br label %middle.block152

middle.block152:                                  ; preds = %middle.block152.loopexit179, %middle.block152.loopexit
  %143 = icmp slt i64 %98, 2000
  br i1 %143, label %.preheader, label %144

; <label>:144:                                    ; preds = %middle.block152
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %5
  %indvars.iv180 = phi i32 [ %indvars.iv.next181, %._crit_edge125 ], [ -1, %5 ]
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge125 ], [ 0, %5 ]
  %6 = add i64 %indvars.iv172, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv172
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv172
  %12 = zext i32 %indvars.iv180 to i64
  %13 = icmp sgt i64 %indvars.iv172, 0
  br i1 %13, label %.lr.ph115.preheader, label %.lr.ph124.split.preheader

.lr.ph115.preheader:                              ; preds = %.preheader94
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 0
  br label %.lr.ph115

.lr.ph124.split.preheader:                        ; preds = %.lr.ph124..lr.ph124.split.preheader_crit_edge, %.preheader94
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph124.split.preheader194, label %min.iters.checked

.lr.ph124.split.preheader194:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph124.split.preheader
  %indvars.iv158.ph = phi i64 [ %indvars.iv172, %min.iters.checked ], [ %indvars.iv172, %.lr.ph124.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph124.split

min.iters.checked:                                ; preds = %.lr.ph124.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv172, %n.vec
  br i1 %cmp.zero, label %.lr.ph124.split.preheader194, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %15 = and i64 %10, 1
  %lcmp.mod208 = icmp eq i64 %15, 0
  br i1 %lcmp.mod208, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv172
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load193.prol = load <2 x i64>, <2 x i64>* %19, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load193.prol, <2 x i64>* %19, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %10, 0
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %21 = add i64 %indvars.iv172, %index
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %21
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load193, <2 x i64>* %25, align 8
  %index.next = add i64 %index, 4
  %26 = add i64 %indvars.iv172, %index.next
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %26
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load193.1 = load <2 x i64>, <2 x i64>* %30, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load193.1, <2 x i64>* %30, align 8
  %index.next.1 = add i64 %index, 8
  %31 = icmp eq i64 %index.next.1, %n.vec
  br i1 %31, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge125, label %.lr.ph124.split.preheader194

.lr.ph124:                                        ; preds = %._crit_edge112
  br i1 true, label %.lr.ph124.split.us.preheader, label %.lr.ph124..lr.ph124.split.preheader_crit_edge

.lr.ph124..lr.ph124.split.preheader_crit_edge:    ; preds = %.lr.ph124
  br label %.lr.ph124.split.preheader

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %32 = and i64 %6, 1
  %lcmp.mod210 = icmp eq i64 %32, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 0
  %34 = icmp eq i64 %7, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge120.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge120.us ], [ %indvars.iv172, %.lr.ph124.split.us.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv170
  %36 = load double, double* %35, align 8
  br i1 %lcmp.mod210, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  br label %37

; <label>:37:                                     ; preds = %.prol.preheader
  %38 = load double, double* %33, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv170
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph124.split.us, %37
  %.lcssa201.unr.ph = phi double [ %42, %37 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv162.unr.ph = phi i64 [ 1, %37 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %42, %37 ], [ %36, %.lr.ph124.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %34, label %._crit_edge120.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph124.split.us.new
  %indvars.iv162 = phi i64 [ %indvars.iv162.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next163.1, %43 ]
  %.1117.us = phi double [ %.1117.us.unr.ph, %.lr.ph124.split.us.new ], [ %57, %43 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv162
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv162, i64 %indvars.iv170
  %47 = load double, double* %46, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next163, i64 %indvars.iv170
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.1117.us, %54
  %57 = fsub double %56, %55
  %exitcond182.1 = icmp eq i64 %indvars.iv.next163, %12
  %indvars.iv.next163.1 = add nsw i64 %indvars.iv162, 2
  br i1 %exitcond182.1, label %._crit_edge120.us.unr-lcssa, label %43

._crit_edge120.us.unr-lcssa:                      ; preds = %43
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %.prol.loopexit, %._crit_edge120.us.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr.ph, %.prol.loopexit ], [ %57, %._crit_edge120.us.unr-lcssa ]
  store double %.lcssa201, double* %35, align 8
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %58 = icmp slt i64 %indvars.iv.next171, 2000
  br i1 %58, label %.lr.ph124.split.us, label %._crit_edge125.loopexit

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %._crit_edge112
  %indvars.iv177 = phi i32 [ %indvars.iv.next178, %._crit_edge112 ], [ -1, %.lr.ph115.preheader ]
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %._crit_edge112 ], [ 0, %.lr.ph115.preheader ]
  %59 = add i64 %indvars.iv154, 4294967295
  %60 = and i64 %59, 4294967295
  %61 = zext i32 %indvars.iv177 to i64
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv154
  %63 = load double, double* %62, align 8
  %64 = icmp sgt i64 %indvars.iv154, 0
  br i1 %64, label %.lr.ph111.preheader, label %._crit_edge112

.lr.ph111.preheader:                              ; preds = %.lr.ph115
  %65 = and i64 %59, 1
  %lcmp.mod206 = icmp eq i64 %65, 0
  br i1 %lcmp.mod206, label %.lr.ph111.prol.preheader, label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.preheader:                         ; preds = %.lr.ph111.preheader
  br label %.lr.ph111.prol

.lr.ph111.prol:                                   ; preds = %.lr.ph111.prol.preheader
  %66 = load double, double* %14, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv154
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %63, %69
  br label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph111.preheader, %.lr.ph111.prol
  %.lcssa200.unr.ph = phi double [ %70, %.lr.ph111.prol ], [ undef, %.lr.ph111.preheader ]
  %indvars.iv148.unr.ph = phi i64 [ 1, %.lr.ph111.prol ], [ 0, %.lr.ph111.preheader ]
  %.0109.unr.ph = phi double [ %70, %.lr.ph111.prol ], [ %63, %.lr.ph111.preheader ]
  br label %.lr.ph111.prol.loopexit

.lr.ph111.prol.loopexit:                          ; preds = %.lr.ph111.prol.loopexit.unr-lcssa
  %71 = icmp eq i64 %60, 0
  br i1 %71, label %._crit_edge112.loopexit, label %.lr.ph111.preheader.new

.lr.ph111.preheader.new:                          ; preds = %.lr.ph111.prol.loopexit
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111, %.lr.ph111.preheader.new
  %indvars.iv148 = phi i64 [ %indvars.iv148.unr.ph, %.lr.ph111.preheader.new ], [ %indvars.iv.next149.1, %.lr.ph111 ]
  %.0109 = phi double [ %.0109.unr.ph, %.lr.ph111.preheader.new ], [ %85, %.lr.ph111 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv148
  %73 = bitcast double* %72 to <2 x double>*
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv154
  %75 = load double, double* %74, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %76 = load <2 x double>, <2 x double>* %73, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next149, i64 %indvars.iv154
  %78 = load double, double* %77, align 8
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = fmul <2 x double> %76, %80
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  %84 = fsub double %.0109, %82
  %85 = fsub double %84, %83
  %exitcond179.1 = icmp eq i64 %indvars.iv.next149, %61
  %indvars.iv.next149.1 = add nsw i64 %indvars.iv148, 2
  br i1 %exitcond179.1, label %._crit_edge112.loopexit.unr-lcssa, label %.lr.ph111

._crit_edge112.loopexit.unr-lcssa:                ; preds = %.lr.ph111
  br label %._crit_edge112.loopexit

._crit_edge112.loopexit:                          ; preds = %.lr.ph111.prol.loopexit, %._crit_edge112.loopexit.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr.ph, %.lr.ph111.prol.loopexit ], [ %85, %._crit_edge112.loopexit.unr-lcssa ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %63, %.lr.ph115 ], [ %.lcssa200, %._crit_edge112.loopexit ]
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv154, i64 %indvars.iv154
  %87 = load double, double* %86, align 8
  %88 = fdiv double %.0.lcssa, %87
  store double %88, double* %62, align 8
  %indvars.iv.next155 = add nuw i64 %indvars.iv154, 1
  %89 = icmp slt i64 %indvars.iv.next155, %indvars.iv172
  %indvars.iv.next178 = add i32 %indvars.iv177, 1
  br i1 %89, label %.lr.ph115, label %.lr.ph124

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader194, %.lr.ph124.split
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %.lr.ph124.split ], [ %indvars.iv158.ph, %.lr.ph124.split.preheader194 ]
  %exitcond160 = icmp eq i64 %indvars.iv158, 1999
  %indvars.iv.next159 = add nuw i64 %indvars.iv158, 1
  br i1 %exitcond160, label %._crit_edge125.loopexit195, label %.lr.ph124.split, !llvm.loop !21

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125.loopexit195:                       ; preds = %.lr.ph124.split
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit195, %._crit_edge125.loopexit, %middle.block
  %indvars.iv.next173 = add nuw i64 %indvars.iv172, 1
  %90 = icmp slt i64 %indvars.iv.next173, 2000
  %indvars.iv.next181 = add i32 %indvars.iv180, 1
  br i1 %90, label %.preheader94, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv174 = phi i32 [ %indvars.iv.next175, %._crit_edge104 ], [ -1, %.preheader.preheader ]
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %91 = add i64 %indvars.iv146, 4294967295
  %92 = and i64 %91, 4294967295
  %93 = zext i32 %indvars.iv174 to i64
  %94 = getelementptr inbounds double, double* %2, i64 %indvars.iv146
  %95 = load double, double* %94, align 8
  %96 = icmp sgt i64 %indvars.iv146, 0
  br i1 %96, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader
  %xtraiter202 = and i64 %indvars.iv146, 3
  %lcmp.mod203 = icmp eq i64 %xtraiter202, 0
  br i1 %lcmp.mod203, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %102, %.lr.ph103.prol ], [ %95, %.lr.ph103.prol.preheader ]
  %prol.iter204 = phi i64 [ %prol.iter204.sub, %.lr.ph103.prol ], [ %xtraiter202, %.lr.ph103.prol.preheader ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv141.prol
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv141.prol
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fsub double %.2101.prol, %101
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter204.sub = add i64 %prol.iter204, -1
  %prol.iter204.cmp = icmp eq i64 %prol.iter204.sub, 0
  br i1 %prol.iter204.cmp, label %.lr.ph103.prol.loopexit.unr-lcssa, label %.lr.ph103.prol, !llvm.loop !23

.lr.ph103.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.preheader, %.lr.ph103.prol.loopexit.unr-lcssa
  %.lcssa199.unr = phi double [ undef, %.lr.ph103.preheader ], [ %102, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next142.prol, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %.2101.unr = phi double [ %95, %.lr.ph103.preheader ], [ %102, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %103 = icmp ult i64 %92, 3
  br i1 %103, label %._crit_edge104.loopexit, label %.lr.ph103.preheader.new

.lr.ph103.preheader.new:                          ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.lr.ph103.preheader.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr, %.lr.ph103.preheader.new ], [ %indvars.iv.next142.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.lr.ph103.preheader.new ], [ %125, %.lr.ph103 ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv141
  %105 = bitcast double* %104 to <2 x double>*
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv141
  %107 = bitcast double* %106 to <2 x double>*
  %108 = load <2 x double>, <2 x double>* %105, align 8
  %109 = load <2 x double>, <2 x double>* %107, align 8
  %110 = fmul <2 x double> %108, %109
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %113 = fsub double %.2101, %111
  %114 = fsub double %113, %112
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.next142.1
  %116 = bitcast double* %115 to <2 x double>*
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next142.1
  %118 = bitcast double* %117 to <2 x double>*
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %119 = load <2 x double>, <2 x double>* %116, align 8
  %120 = load <2 x double>, <2 x double>* %118, align 8
  %121 = fmul <2 x double> %119, %120
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fsub double %114, %122
  %125 = fsub double %124, %123
  %exitcond176.3 = icmp eq i64 %indvars.iv.next142.2, %93
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  br i1 %exitcond176.3, label %._crit_edge104.loopexit.unr-lcssa, label %.lr.ph103

._crit_edge104.loopexit.unr-lcssa:                ; preds = %.lr.ph103
  br label %._crit_edge104.loopexit

._crit_edge104.loopexit:                          ; preds = %.lr.ph103.prol.loopexit, %._crit_edge104.loopexit.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr, %.lr.ph103.prol.loopexit ], [ %125, %._crit_edge104.loopexit.unr-lcssa ]
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.preheader
  %.2.lcssa = phi double [ %95, %.preheader ], [ %.lcssa199, %._crit_edge104.loopexit ]
  %126 = getelementptr inbounds double, double* %4, i64 %indvars.iv146
  store double %.2.lcssa, double* %126, align 8
  %indvars.iv.next147 = add nuw i64 %indvars.iv146, 1
  %127 = icmp slt i64 %indvars.iv.next147, 2000
  %indvars.iv.next175 = add i32 %indvars.iv174, 1
  br i1 %127, label %.preheader, label %.preheader183.preheader

.preheader183.preheader:                          ; preds = %._crit_edge104
  br label %.preheader183

.preheader183:                                    ; preds = %.preheader183.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %.preheader183.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %.preheader183.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader183.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %128 = sub i32 2000, %indvar
  %129 = sext i32 %128 to i64
  %130 = sub nsw i64 1999, %129
  %131 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %132 = load double, double* %131, align 8
  %133 = add nsw i64 %indvars.iv139, 1
  %134 = icmp slt i64 %133, 2000
  br i1 %134, label %..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader183
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %136 = load double, double* %135, align 8
  %137 = fdiv double %132, %136
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %137, double* %138, align 8
  br label %._crit_edge._crit_edge

..lr.ph_crit_edge:                                ; preds = %.preheader183
  %139 = sext i32 %indvars.iv to i64
  %140 = sub nsw i64 0, %129
  %xtraiter = and i64 %140, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %.lr.ph.prol ], [ %139, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %146, %.lr.ph.prol ], [ %132, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds double, double* %3, i64 %indvars.iv137.prol
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fsub double %.397.prol, %145
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %146, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %139, %..lr.ph_crit_edge ], [ %indvars.iv.next138.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %132, %..lr.ph_crit_edge ], [ %146, %.lr.ph.prol.loopexit.unr-lcssa ]
  %147 = icmp ult i64 %130, 3
  br i1 %147, label %._crit_edge, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next138.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %169, %.lr.ph ]
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137
  %149 = bitcast double* %148 to <2 x double>*
  %150 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %151 = bitcast double* %150 to <2 x double>*
  %152 = load <2 x double>, <2 x double>* %149, align 8
  %153 = load <2 x double>, <2 x double>* %151, align 8
  %154 = fmul <2 x double> %152, %153
  %155 = extractelement <2 x double> %154, i32 0
  %156 = extractelement <2 x double> %154, i32 1
  %157 = fsub double %.397, %155
  %158 = fsub double %157, %156
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %160 = bitcast double* %159 to <2 x double>*
  %161 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next138.1
  %162 = bitcast double* %161 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %163 = load <2 x double>, <2 x double>* %160, align 8
  %164 = load <2 x double>, <2 x double>* %162, align 8
  %165 = fmul <2 x double> %163, %164
  %166 = extractelement <2 x double> %165, i32 0
  %167 = extractelement <2 x double> %165, i32 1
  %168 = fsub double %158, %166
  %169 = fsub double %168, %167
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %.lr.ph

._crit_edge.unr-lcssa:                            ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %169, %._crit_edge.unr-lcssa ]
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %171 = load double, double* %170, align 8
  %172 = fdiv double %.lcssa, %171
  %173 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %172, double* %173, align 8
  %174 = icmp sgt i64 %indvars.iv139, 0
  br i1 %174, label %._crit_edge._crit_edge, label %175

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader183

; <label>:175:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge6, label %17

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
