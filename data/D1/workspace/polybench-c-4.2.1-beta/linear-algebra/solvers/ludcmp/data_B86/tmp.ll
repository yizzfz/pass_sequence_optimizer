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
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv61 = phi i64 [ 0, %4 ], [ %indvars.iv.next62.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv61
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %10 = trunc i64 %indvars.iv.next62 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %13 = trunc i64 %indvars.iv.next62.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond63.1 = icmp eq i64 %indvars.iv.next62, 1999
  br i1 %exitcond63.1, label %.lr.ph.preheader, label %5

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv59, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %23 = sub i64 1998, %indvars.iv59
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  br label %27

._crit_edge2:                                     ; preds = %27
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %26 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %26, label %._crit_edge20.._crit_edge1_crit_edge, label %38

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv42 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next43, %27 ]
  %28 = sub nsw i64 0, %indvars.iv42
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv42
  store double %33, double* %34, align 8
  %exitcond50 = icmp eq i64 %indvars.iv42, %indvars.iv59
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br i1 %exitcond50, label %._crit_edge2, label %27

._crit_edge20.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %35 = add nuw nsw i64 %25, 8
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %22
  %36 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 %35, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge2
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %39, align 8
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %41

; <label>:41:                                     ; preds = %41, %38
  %indvars.iv40 = phi i64 [ 0, %38 ], [ %indvars.iv.next41.7, %41 ]
  %42 = mul nuw nsw i64 %indvars.iv40, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %43 = mul nuw nsw i64 %indvars.iv.next41, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.1 = or i64 %indvars.iv40, 2
  %44 = mul nuw nsw i64 %indvars.iv.next41.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.2 = or i64 %indvars.iv40, 3
  %45 = mul nuw nsw i64 %indvars.iv.next41.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.3 = or i64 %indvars.iv40, 4
  %46 = mul nuw nsw i64 %indvars.iv.next41.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.4 = or i64 %indvars.iv40, 5
  %47 = mul nuw nsw i64 %indvars.iv.next41.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.5 = or i64 %indvars.iv40, 6
  %48 = mul nuw nsw i64 %indvars.iv.next41.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.6 = or i64 %indvars.iv40, 7
  %49 = mul nuw nsw i64 %indvars.iv.next41.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.7 = add nsw i64 %indvars.iv40, 8
  %exitcond67.7 = icmp eq i64 %indvars.iv.next41.7, 2000
  br i1 %exitcond67.7, label %._crit_edge5.preheader, label %41

._crit_edge5.preheader:                           ; preds = %41
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %98
  %indvars.iv35 = phi i64 [ %53, %98 ], [ 0, %._crit_edge5.preheader ]
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv35
  %scevgep7475 = bitcast double* %scevgep74 to i8*
  %53 = add i64 %indvars.iv35, 1
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %53
  %scevgep7677 = bitcast double* %scevgep76 to i8*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv33 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next34, %middle.block ]
  %54 = mul i64 %indvars.iv33, 16000
  %scevgep72 = getelementptr i8, i8* %40, i64 %54
  %55 = add i64 %54, 16000
  %scevgep73 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  %bound0 = icmp ult i8* %scevgep72, %scevgep7677
  %bound1 = icmp ult i8* %scevgep7475, %scevgep73
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound079 = icmp ult i8* %scevgep72, %bc
  %bound180 = icmp ult i8* %bc, %scevgep73
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge7
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge7
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = load double, double* %56, align 8, !alias.scope !1
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv35
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv35
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv35
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %59, i64 %indvars.iv35
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = load double, double* %66, align 8, !alias.scope !4
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %70, i32 1
  %75 = fmul <2 x double> %62, %72
  %76 = fmul <2 x double> %62, %74
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv33, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load83, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit113, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv30 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next31.1, %scalar.ph ]
  %84 = load double, double* %56, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %91 = load double, double* %56, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next31, i64 %indvars.iv35
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv33, i64 %indvars.iv.next31
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31, 1999
  br i1 %exitcond32.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit113:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit113, %middle.block.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond65, label %98, label %._crit_edge7

; <label>:98:                                     ; preds = %middle.block
  %exitcond66 = icmp eq i64 %53, 2000
  br i1 %exitcond66, label %._crit_edge8.preheader, label %._crit_edge5

._crit_edge8.preheader:                           ; preds = %98
  %99 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.preheader, %middle.block85
  %indvars.iv28 = phi i64 [ %106, %middle.block85 ], [ 0, %._crit_edge8.preheader ]
  %scevgep89 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %scevgep8990 = bitcast double* %scevgep89 to i8*
  %106 = add i64 %indvars.iv28, 1
  %scevgep91 = getelementptr [2000 x double], [2000 x double]* %0, i64 %106, i64 0
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  %107 = mul i64 %indvars.iv28, 16000
  %scevgep93 = getelementptr i8, i8* %40, i64 %107
  %108 = add i64 %107, 16000
  %scevgep94 = getelementptr i8, i8* %40, i64 %108
  %bound095 = icmp ult i8* %scevgep8990, %scevgep94
  %bound196 = icmp ult i8* %scevgep93, %scevgep9192
  %memcheck.conflict98 = and i1 %bound095, %bound196
  br i1 %memcheck.conflict98, label %scalar.ph86.preheader, label %vector.body84.preheader

vector.body84.preheader:                          ; preds = %._crit_edge8
  br label %vector.body84

scalar.ph86.preheader:                            ; preds = %._crit_edge8
  br label %scalar.ph86

vector.body84:                                    ; preds = %vector.body84, %vector.body84.preheader
  %index101 = phi i64 [ 0, %vector.body84.preheader ], [ %index.next102.1, %vector.body84 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv28, i64 %index101
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load109 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load110 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index101
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load109, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load110, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next102 = or i64 %index101, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv28, i64 %index.next102
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load109.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load110.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index.next102
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load109.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load110.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %index.next102.1 = add nsw i64 %index101, 8
  %125 = icmp eq i64 %index.next102.1, 2000
  br i1 %125, label %middle.block85.loopexit112, label %vector.body84, !llvm.loop !18

scalar.ph86:                                      ; preds = %scalar.ph86, %scalar.ph86.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph86.preheader ], [ %indvars.iv.next.4, %scalar.ph86 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %middle.block85.loopexit, label %scalar.ph86, !llvm.loop !19

middle.block85.loopexit:                          ; preds = %scalar.ph86
  br label %middle.block85

middle.block85.loopexit112:                       ; preds = %vector.body84
  br label %middle.block85

middle.block85:                                   ; preds = %middle.block85.loopexit112, %middle.block85.loopexit
  %exitcond64 = icmp eq i64 %106, 2000
  br i1 %exitcond64, label %151, label %._crit_edge8

; <label>:151:                                    ; preds = %middle.block85
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge36, %4
  %indvars.iv91 = phi i64 [ 0, %4 ], [ %indvars.iv.next92, %._crit_edge36 ]
  %indvars.iv83 = phi i32 [ -1, %4 ], [ %indvars.iv.next84, %._crit_edge36 ]
  %5 = add i64 %indvars.iv91, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 2000, %indvars.iv91
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv91
  %11 = icmp sgt i64 %indvars.iv91, 0
  br i1 %11, label %.lr.ph27.preheader, label %.lr.ph35.split.preheader

.lr.ph27.preheader:                               ; preds = %._crit_edge
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 0
  br label %.lr.ph27

.lr.ph35.split.preheader:                         ; preds = %.lr.ph35..lr.ph35.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph35.split.preheader109, label %min.iters.checked

.lr.ph35.split.preheader109:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph35.split.preheader
  %indvars.iv74.ph = phi i64 [ %indvars.iv91, %min.iters.checked ], [ %indvars.iv91, %.lr.ph35.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph35.split

min.iters.checked:                                ; preds = %.lr.ph35.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv91, %n.vec
  br i1 %cmp.zero, label %.lr.ph35.split.preheader109, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %13 = and i64 %9, 1
  %lcmp.mod123 = icmp eq i64 %13, 0
  br i1 %lcmp.mod123, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv91
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load108.prol = load <2 x i64>, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %15, align 8
  store <2 x i64> %wide.load108.prol, <2 x i64>* %17, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %9, 0
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %19 = add i64 %indvars.iv91, %index
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %19
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load108 = load <2 x i64>, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load, <2 x i64>* %21, align 8
  store <2 x i64> %wide.load108, <2 x i64>* %23, align 8
  %index.next = add i64 %index, 4
  %24 = add i64 %indvars.iv91, %index.next
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %24
  %26 = bitcast double* %25 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load108.1 = load <2 x i64>, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %26, align 8
  store <2 x i64> %wide.load108.1, <2 x i64>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %29 = icmp eq i64 %index.next.1, %n.vec
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge36, label %.lr.ph35.split.preheader109

.lr.ph35:                                         ; preds = %._crit_edge24
  br i1 true, label %.lr.ph35.split.us.preheader, label %.lr.ph35..lr.ph35.split.preheader_crit_edge

.lr.ph35..lr.ph35.split.preheader_crit_edge:      ; preds = %.lr.ph35
  br label %.lr.ph35.split.preheader

.lr.ph35.split.us.preheader:                      ; preds = %.lr.ph35
  %wide.trip.count85 = zext i32 %indvars.iv83 to i64
  %30 = and i64 %5, 1
  %lcmp.mod125 = icmp eq i64 %30, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 0
  %32 = icmp eq i64 %6, 0
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %._crit_edge32.us, %.lr.ph35.split.us.preheader
  %indvars.iv89 = phi i64 [ %indvars.iv91, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next90, %._crit_edge32.us ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv89
  %34 = load double, double* %33, align 8
  br i1 %lcmp.mod125, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph35.split.us
  br label %35

; <label>:35:                                     ; preds = %.prol.preheader
  %36 = load double, double* %31, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv89
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %34, %39
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph35.split.us, %35
  %.lcssa116.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph35.split.us ]
  %indvars.iv78.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph35.split.us ]
  %.129.us.unr.ph = phi double [ %40, %35 ], [ %34, %.lr.ph35.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %32, label %._crit_edge32.us, label %.lr.ph35.split.us.new

.lr.ph35.split.us.new:                            ; preds = %.prol.loopexit
  br label %41

; <label>:41:                                     ; preds = %41, %.lr.ph35.split.us.new
  %indvars.iv78 = phi i64 [ %indvars.iv78.unr.ph, %.lr.ph35.split.us.new ], [ %indvars.iv.next79.1, %41 ]
  %.129.us = phi double [ %.129.us.unr.ph, %.lr.ph35.split.us.new ], [ %55, %41 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv78
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv89
  %45 = load double, double* %44, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next79, i64 %indvars.iv89
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.129.us, %52
  %55 = fsub double %54, %53
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next79, %wide.trip.count85
  br i1 %exitcond86.1, label %._crit_edge32.us.unr-lcssa, label %41

._crit_edge32.us.unr-lcssa:                       ; preds = %41
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %.prol.loopexit, %._crit_edge32.us.unr-lcssa
  %.lcssa116 = phi double [ %.lcssa116.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge32.us.unr-lcssa ]
  store double %.lcssa116, double* %33, align 8
  %indvars.iv.next90 = add nuw i64 %indvars.iv89, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond100, label %._crit_edge36.loopexit, label %.lr.ph35.split.us

.lr.ph27:                                         ; preds = %.lr.ph27.preheader, %._crit_edge24
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge24 ], [ 0, %.lr.ph27.preheader ]
  %indvars.iv66 = phi i32 [ %indvars.iv.next67, %._crit_edge24 ], [ -1, %.lr.ph27.preheader ]
  %56 = add i64 %indvars.iv70, 4294967295
  %57 = and i64 %56, 4294967295
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv70
  %59 = load double, double* %58, align 8
  %60 = icmp sgt i64 %indvars.iv70, 0
  br i1 %60, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph27
  %wide.trip.count68 = zext i32 %indvars.iv66 to i64
  %61 = and i64 %56, 1
  %lcmp.mod121 = icmp eq i64 %61, 0
  br i1 %lcmp.mod121, label %.lr.ph23.prol.preheader, label %.lr.ph23.prol.loopexit.unr-lcssa

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol.preheader
  %62 = load double, double* %12, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv70
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %59, %65
  br label %.lr.ph23.prol.loopexit.unr-lcssa

.lr.ph23.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph23.preheader, %.lr.ph23.prol
  %.lcssa115.unr.ph = phi double [ %66, %.lr.ph23.prol ], [ undef, %.lr.ph23.preheader ]
  %indvars.iv61.unr.ph = phi i64 [ 1, %.lr.ph23.prol ], [ 0, %.lr.ph23.preheader ]
  %.021.unr.ph = phi double [ %66, %.lr.ph23.prol ], [ %59, %.lr.ph23.preheader ]
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %57, 0
  br i1 %67, label %._crit_edge24.loopexit, label %.lr.ph23.preheader.new

.lr.ph23.preheader.new:                           ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23, %.lr.ph23.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr.ph, %.lr.ph23.preheader.new ], [ %indvars.iv.next62.1, %.lr.ph23 ]
  %.021 = phi double [ %.021.unr.ph, %.lr.ph23.preheader.new ], [ %81, %.lr.ph23 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv61
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv70
  %71 = load double, double* %70, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next62, i64 %indvars.iv70
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %.021, %78
  %81 = fsub double %80, %79
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next62, %wide.trip.count68
  br i1 %exitcond69.1, label %._crit_edge24.loopexit.unr-lcssa, label %.lr.ph23

._crit_edge24.loopexit.unr-lcssa:                 ; preds = %.lr.ph23
  br label %._crit_edge24.loopexit

._crit_edge24.loopexit:                           ; preds = %.lr.ph23.prol.loopexit, %._crit_edge24.loopexit.unr-lcssa
  %.lcssa115 = phi double [ %.lcssa115.unr.ph, %.lr.ph23.prol.loopexit ], [ %81, %._crit_edge24.loopexit.unr-lcssa ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph27
  %.0.lcssa = phi double [ %59, %.lr.ph27 ], [ %.lcssa115, %._crit_edge24.loopexit ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv70
  %83 = load double, double* %82, align 8
  %84 = fdiv double %.0.lcssa, %83
  store double %84, double* %58, align 8
  %indvars.iv.next71 = add nuw i64 %indvars.iv70, 1
  %85 = icmp slt i64 %indvars.iv.next71, %indvars.iv91
  %indvars.iv.next67 = add nsw i32 %indvars.iv66, 1
  br i1 %85, label %.lr.ph27, label %.lr.ph35

.lr.ph35.split:                                   ; preds = %.lr.ph35.split.preheader109, %.lr.ph35.split
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.lr.ph35.split ], [ %indvars.iv74.ph, %.lr.ph35.split.preheader109 ]
  %indvars.iv.next75 = add nuw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv74, 1999
  br i1 %exitcond76, label %._crit_edge36.loopexit110, label %.lr.ph35.split, !llvm.loop !21

._crit_edge36.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge36

._crit_edge36.loopexit110:                        ; preds = %.lr.ph35.split
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit110, %._crit_edge36.loopexit, %middle.block
  %indvars.iv.next92 = add nuw i64 %indvars.iv91, 1
  %86 = icmp slt i64 %indvars.iv.next92, 2000
  %indvars.iv.next84 = add nsw i32 %indvars.iv83, 1
  br i1 %86, label %._crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge36
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge16
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge16 ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv55 = phi i32 [ %indvars.iv.next56, %._crit_edge16 ], [ -1, %._crit_edge1.preheader ]
  %87 = add i64 %indvars.iv59, 4294967295
  %88 = and i64 %87, 4294967295
  %89 = getelementptr inbounds double, double* %1, i64 %indvars.iv59
  %90 = load double, double* %89, align 8
  %91 = icmp sgt i64 %indvars.iv59, 0
  br i1 %91, label %.lr.ph15.preheader, label %._crit_edge16

.lr.ph15.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count57 = zext i32 %indvars.iv55 to i64
  %xtraiter117 = and i64 %indvars.iv59, 3
  %lcmp.mod118 = icmp eq i64 %xtraiter117, 0
  br i1 %lcmp.mod118, label %.lr.ph15.prol.loopexit, label %.lr.ph15.prol.preheader

.lr.ph15.prol.preheader:                          ; preds = %.lr.ph15.preheader
  br label %.lr.ph15.prol

.lr.ph15.prol:                                    ; preds = %.lr.ph15.prol, %.lr.ph15.prol.preheader
  %indvars.iv50.prol = phi i64 [ 0, %.lr.ph15.prol.preheader ], [ %indvars.iv.next51.prol, %.lr.ph15.prol ]
  %.213.prol = phi double [ %90, %.lr.ph15.prol.preheader ], [ %97, %.lr.ph15.prol ]
  %prol.iter119 = phi i64 [ %xtraiter117, %.lr.ph15.prol.preheader ], [ %prol.iter119.sub, %.lr.ph15.prol ]
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv50.prol
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %3, i64 %indvars.iv50.prol
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fsub double %.213.prol, %96
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter119.sub = add i64 %prol.iter119, -1
  %prol.iter119.cmp = icmp eq i64 %prol.iter119.sub, 0
  br i1 %prol.iter119.cmp, label %.lr.ph15.prol.loopexit.unr-lcssa, label %.lr.ph15.prol, !llvm.loop !23

.lr.ph15.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph15.prol
  br label %.lr.ph15.prol.loopexit

.lr.ph15.prol.loopexit:                           ; preds = %.lr.ph15.preheader, %.lr.ph15.prol.loopexit.unr-lcssa
  %.lcssa114.unr = phi double [ undef, %.lr.ph15.preheader ], [ %97, %.lr.ph15.prol.loopexit.unr-lcssa ]
  %indvars.iv50.unr = phi i64 [ 0, %.lr.ph15.preheader ], [ %indvars.iv.next51.prol, %.lr.ph15.prol.loopexit.unr-lcssa ]
  %.213.unr = phi double [ %90, %.lr.ph15.preheader ], [ %97, %.lr.ph15.prol.loopexit.unr-lcssa ]
  %98 = icmp ult i64 %88, 3
  br i1 %98, label %._crit_edge16.loopexit, label %.lr.ph15.preheader.new

.lr.ph15.preheader.new:                           ; preds = %.lr.ph15.prol.loopexit
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15, %.lr.ph15.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr, %.lr.ph15.preheader.new ], [ %indvars.iv.next51.3, %.lr.ph15 ]
  %.213 = phi double [ %.213.unr, %.lr.ph15.preheader.new ], [ %120, %.lr.ph15 ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv50
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %100, align 8
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = fmul <2 x double> %103, %104
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fsub double %.213, %106
  %109 = fsub double %108, %107
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv.next51.1
  %111 = bitcast double* %110 to <2 x double>*
  %112 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.1
  %113 = bitcast double* %112 to <2 x double>*
  %indvars.iv.next51.2 = add nsw i64 %indvars.iv50, 3
  %114 = load <2 x double>, <2 x double>* %111, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = fmul <2 x double> %114, %115
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %109, %117
  %120 = fsub double %119, %118
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %exitcond58.3 = icmp eq i64 %indvars.iv.next51.2, %wide.trip.count57
  br i1 %exitcond58.3, label %._crit_edge16.loopexit.unr-lcssa, label %.lr.ph15

._crit_edge16.loopexit.unr-lcssa:                 ; preds = %.lr.ph15
  br label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %.lr.ph15.prol.loopexit, %._crit_edge16.loopexit.unr-lcssa
  %.lcssa114 = phi double [ %.lcssa114.unr, %.lr.ph15.prol.loopexit ], [ %120, %._crit_edge16.loopexit.unr-lcssa ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %90, %._crit_edge1 ], [ %.lcssa114, %._crit_edge16.loopexit ]
  %121 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  store double %.2.lcssa, double* %121, align 8
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %122 = icmp slt i64 %indvars.iv.next60, 2000
  %indvars.iv.next56 = add nsw i32 %indvars.iv55, 1
  br i1 %122, label %._crit_edge1, label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge16
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge9.._crit_edge3_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge9.._crit_edge3_crit_edge ], [ 1999, %._crit_edge3.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge9.._crit_edge3_crit_edge ], [ 2000, %._crit_edge3.preheader ]
  %sext = shl i64 %indvars.iv, 32
  %123 = ashr exact i64 %sext, 32
  %124 = getelementptr inbounds double, double* %3, i64 %indvars.iv47
  %125 = load double, double* %124, align 8
  %126 = add nsw i64 %indvars.iv47, 1
  %127 = icmp slt i64 %126, 2000
  br i1 %127, label %.lr.ph.preheader, label %._crit_edge9.thread

.lr.ph.preheader:                                 ; preds = %._crit_edge3
  %128 = sub nsw i64 1999, %123
  %129 = sub nsw i64 0, %123
  %xtraiter = and i64 %129, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.lr.ph.prol ], [ %123, %.lr.ph.prol.preheader ]
  %.36.prol = phi double [ %135, %.lr.ph.prol ], [ %125, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv45.prol
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %2, i64 %indvars.iv45.prol
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fsub double %.36.prol, %134
  %indvars.iv.next46.prol = add nsw i64 %indvars.iv45.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %135, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv45.unr = phi i64 [ %123, %.lr.ph.preheader ], [ %indvars.iv.next46.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.36.unr = phi double [ %125, %.lr.ph.preheader ], [ %135, %.lr.ph.prol.loopexit.unr-lcssa ]
  %136 = icmp ult i64 %128, 3
  br i1 %136, label %._crit_edge9, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

._crit_edge9.thread:                              ; preds = %._crit_edge3
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv47
  %138 = load double, double* %137, align 8
  %139 = fdiv double %125, %138
  %140 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  store double %139, double* %140, align 8
  br label %._crit_edge9.._crit_edge3_crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv45 = phi i64 [ %indvars.iv45.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next46.3, %.lr.ph ]
  %.36 = phi double [ %.36.unr, %.lr.ph.preheader.new ], [ %162, %.lr.ph ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv45
  %142 = bitcast double* %141 to <2 x double>*
  %143 = getelementptr inbounds double, double* %2, i64 %indvars.iv45
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %142, align 8
  %146 = load <2 x double>, <2 x double>* %144, align 8
  %147 = fmul <2 x double> %145, %146
  %148 = extractelement <2 x double> %147, i32 0
  %149 = extractelement <2 x double> %147, i32 1
  %150 = fsub double %.36, %148
  %151 = fsub double %150, %149
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.next46.1
  %153 = bitcast double* %152 to <2 x double>*
  %154 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next46.1
  %155 = bitcast double* %154 to <2 x double>*
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv45, 3
  %156 = load <2 x double>, <2 x double>* %153, align 8
  %157 = load <2 x double>, <2 x double>* %155, align 8
  %158 = fmul <2 x double> %156, %157
  %159 = extractelement <2 x double> %158, i32 0
  %160 = extractelement <2 x double> %158, i32 1
  %161 = fsub double %151, %159
  %162 = fsub double %161, %160
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next46.2, 1999
  br i1 %exitcond.3, label %._crit_edge9.unr-lcssa, label %.lr.ph

._crit_edge9.unr-lcssa:                           ; preds = %.lr.ph
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.lr.ph.prol.loopexit, %._crit_edge9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %162, %._crit_edge9.unr-lcssa ]
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv47
  %164 = load double, double* %163, align 8
  %165 = fdiv double %.lcssa, %164
  %166 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  store double %165, double* %166, align 8
  %167 = icmp sgt i64 %indvars.iv47, 0
  br i1 %167, label %._crit_edge9.._crit_edge3_crit_edge, label %168

._crit_edge9.._crit_edge3_crit_edge:              ; preds = %._crit_edge9, %._crit_edge9.thread
  %indvars.iv.next48 = add i64 %indvars.iv47, -1
  %indvars.iv.next = add nsw i64 %123, -1
  br label %._crit_edge3

; <label>:168:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
