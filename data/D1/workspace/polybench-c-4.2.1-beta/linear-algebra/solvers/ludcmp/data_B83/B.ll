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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
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
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv61 = phi i64 [ 0, %4 ], [ %indvars.iv.next62.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv61
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %9 = trunc i64 %indvars.iv.next62 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %12 = trunc i64 %indvars.iv.next62.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond63.1 = icmp eq i64 %indvars.iv.next62, 1999
  br i1 %exitcond63.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv59 = phi i64 [ %20, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = add nuw nsw i64 %indvars.iv59, 1
  %sext = shl i64 %20, 32
  %21 = ashr exact i64 %sext, 32
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %21
  %22 = sub i64 1998, %indvars.iv59
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge2:                                     ; preds = %27
  %26 = icmp slt i64 %20, 2000
  br i1 %26, label %._crit_edge20.._crit_edge1_crit_edge, label %37

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %27 ], [ 0, %.lr.ph ]
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
  %35 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %37
  %indvars.iv40 = phi i64 [ 0, %37 ], [ %indvars.iv.next41.7, %._crit_edge3 ]
  %40 = mul nuw nsw i64 %indvars.iv40, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %41 = mul nuw nsw i64 %indvars.iv.next41, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.1 = or i64 %indvars.iv40, 2
  %42 = mul nuw nsw i64 %indvars.iv.next41.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.2 = or i64 %indvars.iv40, 3
  %43 = mul nuw nsw i64 %indvars.iv.next41.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.3 = or i64 %indvars.iv40, 4
  %44 = mul nuw nsw i64 %indvars.iv.next41.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.4 = or i64 %indvars.iv40, 5
  %45 = mul nuw nsw i64 %indvars.iv.next41.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.5 = or i64 %indvars.iv40, 6
  %46 = mul nuw nsw i64 %indvars.iv.next41.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.6 = or i64 %indvars.iv40, 7
  %47 = mul nuw nsw i64 %indvars.iv.next41.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.7 = add nsw i64 %indvars.iv40, 8
  %48 = icmp slt i64 %indvars.iv.next41.7, 2000
  br i1 %48, label %._crit_edge3, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge3
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %98
  %indvars.iv35 = phi i64 [ %52, %98 ], [ 0, %._crit_edge5.preheader ]
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv35
  %scevgep6667 = bitcast double* %scevgep66 to i8*
  %52 = add i64 %indvars.iv35, 1
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv33 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next34, %middle.block ]
  %53 = mul i64 %indvars.iv33, 16000
  %scevgep64 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep65 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  %bound0 = icmp ult i8* %scevgep64, %scevgep6869
  %bound1 = icmp ult i8* %scevgep6667, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound071 = icmp ult i8* %scevgep64, %bc
  %bound172 = icmp ult i8* %bc, %scevgep65
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge7
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge7
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv35
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv35
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv35
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv35
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = fmul <2 x double> %61, %71
  %75 = fmul <2 x double> %61, %73
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv33, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load75, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit105, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv30 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next31.1, %scalar.ph ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next31, i64 %indvars.iv35
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv33, i64 %indvars.iv.next31
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31, 1999
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond32.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit105:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit105, %middle.block.loopexit
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %97 = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %97, label %._crit_edge7, label %98

; <label>:98:                                     ; preds = %middle.block
  %99 = icmp slt i64 %52, 2000
  br i1 %99, label %._crit_edge5, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %98
  %100 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.preheader, %middle.block77
  %indvars.iv28 = phi i64 [ %107, %middle.block77 ], [ 0, %._crit_edge8.preheader ]
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %107 = add i64 %indvars.iv28, 1
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %107, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %108 = mul i64 %indvars.iv28, 16000
  %scevgep85 = getelementptr i8, i8* %39, i64 %108
  %109 = add i64 %108, 16000
  %scevgep86 = getelementptr i8, i8* %39, i64 %109
  %bound087 = icmp ult i8* %scevgep8182, %scevgep86
  %bound188 = icmp ult i8* %scevgep85, %scevgep8384
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph78.preheader, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %._crit_edge8
  br label %vector.body76

scalar.ph78.preheader:                            ; preds = %._crit_edge8
  br label %scalar.ph78

vector.body76:                                    ; preds = %vector.body76, %vector.body76.preheader
  %index93 = phi i64 [ 0, %vector.body76.preheader ], [ %index.next94.1, %vector.body76 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv28, i64 %index93
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load101 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load102 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index93
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load101, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load102, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next94 = or i64 %index93, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv28, i64 %index.next94
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load101.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load102.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index.next94
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load101.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load102.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %index.next94.1 = add nsw i64 %index93, 8
  %126 = icmp eq i64 %index.next94.1, 2000
  br i1 %126, label %middle.block77.loopexit104, label %vector.body76, !llvm.loop !18

scalar.ph78:                                      ; preds = %scalar.ph78, %scalar.ph78.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph78.preheader ], [ %indvars.iv.next.4, %scalar.ph78 ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block77.loopexit, label %scalar.ph78, !llvm.loop !19

middle.block77.loopexit:                          ; preds = %scalar.ph78
  br label %middle.block77

middle.block77.loopexit104:                       ; preds = %vector.body76
  br label %middle.block77

middle.block77:                                   ; preds = %middle.block77.loopexit104, %middle.block77.loopexit
  %152 = icmp slt i64 %107, 2000
  br i1 %152, label %._crit_edge8, label %153

; <label>:153:                                    ; preds = %middle.block77
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38, %4
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge38 ], [ 0, %4 ]
  %indvars.iv84 = phi i32 [ %indvars.iv.next85, %._crit_edge38 ], [ -1, %4 ]
  %5 = add i64 %indvars.iv92, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 1999, %indvars.iv92
  %8 = icmp sgt i64 %indvars.iv92, 0
  br i1 %8, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph28.preheader:                               ; preds = %._crit_edge
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 0
  br label %.lr.ph28

.lr.ph37.split.preheader:                         ; preds = %.lr.ph37..lr.ph37.split.preheader_crit_edge, %._crit_edge
  %10 = sub i64 0, %indvars.iv92
  %xtraiter118 = and i64 %10, 7
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  br i1 %lcmp.mod119, label %.lr.ph37.split.prol.loopexit, label %.lr.ph37.split.prol.preheader

.lr.ph37.split.prol.preheader:                    ; preds = %.lr.ph37.split.preheader
  br label %.lr.ph37.split.prol

.lr.ph37.split.prol:                              ; preds = %.lr.ph37.split.prol, %.lr.ph37.split.prol.preheader
  %indvars.iv75.prol = phi i64 [ %indvars.iv.next76.prol, %.lr.ph37.split.prol ], [ %indvars.iv92, %.lr.ph37.split.prol.preheader ]
  %prol.iter120 = phi i64 [ %prol.iter120.sub, %.lr.ph37.split.prol ], [ %xtraiter118, %.lr.ph37.split.prol.preheader ]
  %indvars.iv.next76.prol = add nuw i64 %indvars.iv75.prol, 1
  %prol.iter120.sub = add i64 %prol.iter120, -1
  %prol.iter120.cmp = icmp eq i64 %prol.iter120.sub, 0
  br i1 %prol.iter120.cmp, label %.lr.ph37.split.prol.loopexit.unr-lcssa, label %.lr.ph37.split.prol, !llvm.loop !20

.lr.ph37.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph37.split.prol
  br label %.lr.ph37.split.prol.loopexit

.lr.ph37.split.prol.loopexit:                     ; preds = %.lr.ph37.split.preheader, %.lr.ph37.split.prol.loopexit.unr-lcssa
  %indvars.iv75.unr = phi i64 [ %indvars.iv92, %.lr.ph37.split.preheader ], [ %indvars.iv.next76.prol, %.lr.ph37.split.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %7, 7
  br i1 %11, label %._crit_edge38.loopexit106, label %.lr.ph37.split.preheader.new

.lr.ph37.split.preheader.new:                     ; preds = %.lr.ph37.split.prol.loopexit
  br label %.lr.ph37.split

.lr.ph37:                                         ; preds = %._crit_edge25
  br i1 true, label %.lr.ph37.split.us.preheader, label %.lr.ph37..lr.ph37.split.preheader_crit_edge

.lr.ph37..lr.ph37.split.preheader_crit_edge:      ; preds = %.lr.ph37
  br label %.lr.ph37.split.preheader

.lr.ph37.split.us.preheader:                      ; preds = %.lr.ph37
  %wide.trip.count86 = zext i32 %indvars.iv84 to i64
  %12 = and i64 %5, 1
  %lcmp.mod122 = icmp eq i64 %12, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 0
  %14 = icmp eq i64 %6, 0
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %.lr.ph37.split.us.preheader, %._crit_edge33.us
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge33.us ], [ %indvars.iv92, %.lr.ph37.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv90
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod122, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph37.split.us
  br label %17

; <label>:17:                                     ; preds = %.prol.preheader
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv90
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph37.split.us, %17
  %.lcssa112.unr.ph = phi double [ %22, %17 ], [ undef, %.lr.ph37.split.us ]
  %indvars.iv79.unr.ph = phi i64 [ 1, %17 ], [ 0, %.lr.ph37.split.us ]
  %.130.us.unr.ph = phi double [ %22, %17 ], [ %16, %.lr.ph37.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %14, label %._crit_edge33.us, label %.lr.ph37.split.us.new

.lr.ph37.split.us.new:                            ; preds = %.prol.loopexit
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph37.split.us.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr.ph, %.lr.ph37.split.us.new ], [ %indvars.iv.next80.1, %23 ]
  %.130.us = phi double [ %.130.us.unr.ph, %.lr.ph37.split.us.new ], [ %37, %23 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv79
  %25 = bitcast double* %24 to <2 x double>*
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv90
  %27 = load double, double* %26, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %28 = load <2 x double>, <2 x double>* %25, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next80, i64 %indvars.iv90
  %30 = load double, double* %29, align 8
  %31 = insertelement <2 x double> undef, double %27, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %28, %32
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fsub double %.130.us, %34
  %37 = fsub double %36, %35
  %exitcond87.1 = icmp eq i64 %indvars.iv.next80, %wide.trip.count86
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond87.1, label %._crit_edge33.us.unr-lcssa, label %23

._crit_edge33.us.unr-lcssa:                       ; preds = %23
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %.prol.loopexit, %._crit_edge33.us.unr-lcssa
  %.lcssa112 = phi double [ %.lcssa112.unr.ph, %.prol.loopexit ], [ %37, %._crit_edge33.us.unr-lcssa ]
  store double %.lcssa112, double* %15, align 8
  %indvars.iv.next91 = add nuw i64 %indvars.iv90, 1
  %38 = icmp slt i64 %indvars.iv.next91, 2000
  br i1 %38, label %.lr.ph37.split.us, label %._crit_edge38.loopexit

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %._crit_edge25
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge25 ], [ 0, %.lr.ph28.preheader ]
  %indvars.iv67 = phi i32 [ %indvars.iv.next68, %._crit_edge25 ], [ -1, %.lr.ph28.preheader ]
  %39 = add i64 %indvars.iv71, 4294967295
  %40 = and i64 %39, 4294967295
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv71
  %42 = load double, double* %41, align 8
  %43 = icmp sgt i64 %indvars.iv71, 0
  br i1 %43, label %.lr.ph24.preheader, label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %wide.trip.count69 = zext i32 %indvars.iv67 to i64
  %44 = and i64 %39, 1
  %lcmp.mod117 = icmp eq i64 %44, 0
  br i1 %lcmp.mod117, label %.lr.ph24.prol.preheader, label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader
  %45 = load double, double* %9, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv71
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %42, %48
  br label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph24.preheader, %.lr.ph24.prol
  %.lcssa111.unr.ph = phi double [ %49, %.lr.ph24.prol ], [ undef, %.lr.ph24.preheader ]
  %indvars.iv62.unr.ph = phi i64 [ 1, %.lr.ph24.prol ], [ 0, %.lr.ph24.preheader ]
  %.022.unr.ph = phi double [ %49, %.lr.ph24.prol ], [ %42, %.lr.ph24.preheader ]
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.unr-lcssa
  %50 = icmp eq i64 %40, 0
  br i1 %50, label %._crit_edge25.loopexit, label %.lr.ph24.preheader.new

.lr.ph24.preheader.new:                           ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24, %.lr.ph24.preheader.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %.lr.ph24.preheader.new ], [ %indvars.iv.next63.1, %.lr.ph24 ]
  %.022 = phi double [ %.022.unr.ph, %.lr.ph24.preheader.new ], [ %64, %.lr.ph24 ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv62
  %52 = bitcast double* %51 to <2 x double>*
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv62, i64 %indvars.iv71
  %54 = load double, double* %53, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next63, i64 %indvars.iv71
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %55, %59
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %.022, %61
  %64 = fsub double %63, %62
  %exitcond70.1 = icmp eq i64 %indvars.iv.next63, %wide.trip.count69
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond70.1, label %._crit_edge25.loopexit.unr-lcssa, label %.lr.ph24

._crit_edge25.loopexit.unr-lcssa:                 ; preds = %.lr.ph24
  br label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.prol.loopexit, %._crit_edge25.loopexit.unr-lcssa
  %.lcssa111 = phi double [ %.lcssa111.unr.ph, %.lr.ph24.prol.loopexit ], [ %64, %._crit_edge25.loopexit.unr-lcssa ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.lr.ph28
  %.0.lcssa = phi double [ %42, %.lr.ph28 ], [ %.lcssa111, %._crit_edge25.loopexit ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv71
  %66 = load double, double* %65, align 8
  %67 = fdiv double %.0.lcssa, %66
  store double %67, double* %41, align 8
  %indvars.iv.next72 = add nuw i64 %indvars.iv71, 1
  %68 = icmp slt i64 %indvars.iv.next72, %indvars.iv92
  %indvars.iv.next68 = add nsw i32 %indvars.iv67, 1
  br i1 %68, label %.lr.ph28, label %.lr.ph37

.lr.ph37.split:                                   ; preds = %.lr.ph37.split, %.lr.ph37.split.preheader.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr, %.lr.ph37.split.preheader.new ], [ %indvars.iv.next76.7, %.lr.ph37.split ]
  %exitcond77.7 = icmp eq i64 %indvars.iv75, 1992
  %indvars.iv.next76.7 = add i64 %indvars.iv75, 8
  br i1 %exitcond77.7, label %._crit_edge38.loopexit106.unr-lcssa, label %.lr.ph37.split

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit106.unr-lcssa:              ; preds = %.lr.ph37.split
  br label %._crit_edge38.loopexit106

._crit_edge38.loopexit106:                        ; preds = %.lr.ph37.split.prol.loopexit, %._crit_edge38.loopexit106.unr-lcssa
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit106, %._crit_edge38.loopexit
  %indvars.iv.next93 = add nuw i64 %indvars.iv92, 1
  %69 = icmp slt i64 %indvars.iv.next93, 2000
  %indvars.iv.next85 = add nsw i32 %indvars.iv84, 1
  br i1 %69, label %._crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge17
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge17 ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv56 = phi i32 [ %indvars.iv.next57, %._crit_edge17 ], [ -1, %._crit_edge1.preheader ]
  %70 = add i64 %indvars.iv60, 4294967295
  %71 = and i64 %70, 4294967295
  %72 = getelementptr inbounds double, double* %1, i64 %indvars.iv60
  %73 = load double, double* %72, align 8
  %74 = icmp sgt i64 %indvars.iv60, 0
  br i1 %74, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count58 = zext i32 %indvars.iv56 to i64
  %xtraiter113 = and i64 %indvars.iv60, 3
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph16.prol.loopexit, label %.lr.ph16.prol.preheader

.lr.ph16.prol.preheader:                          ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol

.lr.ph16.prol:                                    ; preds = %.lr.ph16.prol, %.lr.ph16.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph16.prol ], [ 0, %.lr.ph16.prol.preheader ]
  %.214.prol = phi double [ %80, %.lr.ph16.prol ], [ %73, %.lr.ph16.prol.preheader ]
  %prol.iter115 = phi i64 [ %prol.iter115.sub, %.lr.ph16.prol ], [ %xtraiter113, %.lr.ph16.prol.preheader ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv51.prol
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %3, i64 %indvars.iv51.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %.214.prol, %79
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph16.prol.loopexit.unr-lcssa, label %.lr.ph16.prol, !llvm.loop !22

.lr.ph16.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.preheader, %.lr.ph16.prol.loopexit.unr-lcssa
  %.lcssa110.unr = phi double [ undef, %.lr.ph16.preheader ], [ %80, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph16.preheader ], [ %indvars.iv.next52.prol, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %.214.unr = phi double [ %73, %.lr.ph16.preheader ], [ %80, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %81 = icmp ult i64 %71, 3
  br i1 %81, label %._crit_edge17.loopexit, label %.lr.ph16.preheader.new

.lr.ph16.preheader.new:                           ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16, %.lr.ph16.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.lr.ph16.preheader.new ], [ %indvars.iv.next52.3, %.lr.ph16 ]
  %.214 = phi double [ %.214.unr, %.lr.ph16.preheader.new ], [ %103, %.lr.ph16 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv51
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %83, align 8
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = fmul <2 x double> %86, %87
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = fsub double %.214, %89
  %92 = fsub double %91, %90
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv.next52.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next52.1
  %96 = bitcast double* %95 to <2 x double>*
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %exitcond59.3 = icmp eq i64 %indvars.iv.next52.2, %wide.trip.count58
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  br i1 %exitcond59.3, label %._crit_edge17.loopexit.unr-lcssa, label %.lr.ph16

._crit_edge17.loopexit.unr-lcssa:                 ; preds = %.lr.ph16
  br label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %.lr.ph16.prol.loopexit, %._crit_edge17.loopexit.unr-lcssa
  %.lcssa110 = phi double [ %.lcssa110.unr, %.lr.ph16.prol.loopexit ], [ %103, %._crit_edge17.loopexit.unr-lcssa ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %73, %._crit_edge1 ], [ %.lcssa110, %._crit_edge17.loopexit ]
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv60
  store double %.2.lcssa, double* %104, align 8
  %indvars.iv.next61 = add nuw i64 %indvars.iv60, 1
  %105 = icmp slt i64 %indvars.iv.next61, 2000
  %indvars.iv.next57 = add nsw i32 %indvars.iv56, 1
  br i1 %105, label %._crit_edge1, label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge3.preheader ], [ %indvar.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv48 = phi i64 [ 1999, %._crit_edge3.preheader ], [ %indvars.iv.next49, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %106 = sub i32 2000, %indvar
  %107 = sext i32 %106 to i64
  %108 = sub nsw i64 1999, %107
  %109 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %110 = load double, double* %109, align 8
  %111 = add nsw i64 %indvars.iv48, 1
  %112 = icmp slt i64 %111, 2000
  br i1 %112, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %114 = load double, double* %113, align 8
  %115 = fdiv double %110, %114
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %115, double* %116, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %117 = sext i32 %indvars.iv to i64
  %118 = sub nsw i64 0, %107
  %xtraiter = and i64 %118, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge3..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph.prol ], [ %117, %.lr.ph.prol.preheader ]
  %.37.prol = phi double [ %124, %.lr.ph.prol ], [ %110, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46.prol
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %2, i64 %indvars.iv46.prol
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fsub double %.37.prol, %123
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge3..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge3..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv46.unr = phi i64 [ %117, %._crit_edge3..lr.ph_crit_edge ], [ %indvars.iv.next47.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.37.unr = phi double [ %110, %._crit_edge3..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %125 = icmp ult i64 %108, 3
  br i1 %125, label %._crit_edge10, label %._crit_edge3..lr.ph_crit_edge.new

._crit_edge3..lr.ph_crit_edge.new:                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge3..lr.ph_crit_edge.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %indvars.iv.next47.3, %.lr.ph ]
  %.37 = phi double [ %.37.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %147, %.lr.ph ]
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46
  %127 = bitcast double* %126 to <2 x double>*
  %128 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %127, align 8
  %131 = load <2 x double>, <2 x double>* %129, align 8
  %132 = fmul <2 x double> %130, %131
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fsub double %.37, %133
  %136 = fsub double %135, %134
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next47.1
  %138 = bitcast double* %137 to <2 x double>*
  %139 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next47.1
  %140 = bitcast double* %139 to <2 x double>*
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %141 = load <2 x double>, <2 x double>* %138, align 8
  %142 = load <2 x double>, <2 x double>* %140, align 8
  %143 = fmul <2 x double> %141, %142
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fsub double %136, %144
  %147 = fsub double %146, %145
  %exitcond.3 = icmp eq i64 %indvars.iv.next47.2, 1999
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  br i1 %exitcond.3, label %._crit_edge10.unr-lcssa, label %.lr.ph

._crit_edge10.unr-lcssa:                          ; preds = %.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge10.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %147, %._crit_edge10.unr-lcssa ]
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %149 = load double, double* %148, align 8
  %150 = fdiv double %.lcssa, %149
  %151 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %150, double* %151, align 8
  %152 = icmp sgt i64 %indvars.iv48, 0
  br i1 %152, label %._crit_edge10.._crit_edge3_crit_edge, label %153

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10.thread, %._crit_edge10
  %indvars.iv.next49 = add i64 %indvars.iv48, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge3

; <label>:153:                                    ; preds = %._crit_edge10
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
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge2, label %16

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
