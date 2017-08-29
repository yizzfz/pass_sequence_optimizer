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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #5
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
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

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge19.._crit_edge1_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge19.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv59, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %21
  %22 = sub i64 1998, %indvars.iv59
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge2:                                     ; preds = %27
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %26 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %26, label %._crit_edge19.._crit_edge1_crit_edge, label %37

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

._crit_edge19.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %35 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %.._crit_edge3_crit_edge, %37
  %indvars.iv40 = phi i64 [ 0, %37 ], [ %indvars.iv.next41.7, %.._crit_edge3_crit_edge ]
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
  br i1 %48, label %.._crit_edge3_crit_edge, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %.._crit_edge3_crit_edge
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
  call void @free(i8* nonnull %39) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge33, %4
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge33 ], [ 0, %4 ]
  %indvars.iv72 = phi i32 [ %indvars.iv.next73, %._crit_edge33 ], [ -1, %4 ]
  %5 = add i64 %indvars.iv80, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv80, 0
  br i1 %7, label %.lr.ph24.preheader, label %._crit_edge33

.lr.ph24.preheader:                               ; preds = %._crit_edge
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 0
  br label %.lr.ph24

.lr.ph32:                                         ; preds = %._crit_edge21
  br i1 true, label %.lr.ph32.split.us.preheader, label %.lr.ph32.._crit_edge33_crit_edge

.lr.ph32.._crit_edge33_crit_edge:                 ; preds = %.lr.ph32
  br label %._crit_edge33

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  %wide.trip.count74 = zext i32 %indvars.iv72 to i64
  %9 = and i64 %5, 1
  %lcmp.mod101 = icmp eq i64 %9, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 0
  %11 = icmp eq i64 %6, 0
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge29.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge29.us ], [ %indvars.iv80, %.lr.ph32.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv78
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod101, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph32.split.us
  br label %14

; <label>:14:                                     ; preds = %.prol.preheader
  %15 = load double, double* %10, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv78
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %13, %18
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph32.split.us, %14
  %.lcssa94.unr.ph = phi double [ %19, %14 ], [ undef, %.lr.ph32.split.us ]
  %indvars.iv67.unr.ph = phi i64 [ 1, %14 ], [ 0, %.lr.ph32.split.us ]
  %.126.us.unr.ph = phi double [ %19, %14 ], [ %13, %.lr.ph32.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %11, label %._crit_edge29.us, label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.prol.loopexit
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph32.split.us.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr.ph, %.lr.ph32.split.us.new ], [ %indvars.iv.next68.1, %20 ]
  %.126.us = phi double [ %.126.us.unr.ph, %.lr.ph32.split.us.new ], [ %34, %20 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv67
  %22 = bitcast double* %21 to <2 x double>*
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv78
  %24 = load double, double* %23, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %25 = load <2 x double>, <2 x double>* %22, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next68, i64 %indvars.iv78
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %25, %29
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %.126.us, %31
  %34 = fsub double %33, %32
  %exitcond75.1 = icmp eq i64 %indvars.iv.next68, %wide.trip.count74
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  br i1 %exitcond75.1, label %._crit_edge29.us.unr-lcssa, label %20

._crit_edge29.us.unr-lcssa:                       ; preds = %20
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %.prol.loopexit, %._crit_edge29.us.unr-lcssa
  %.lcssa94 = phi double [ %.lcssa94.unr.ph, %.prol.loopexit ], [ %34, %._crit_edge29.us.unr-lcssa ]
  store double %.lcssa94, double* %12, align 8
  %indvars.iv.next79 = add nuw i64 %indvars.iv78, 1
  %35 = icmp slt i64 %indvars.iv.next79, 2000
  br i1 %35, label %.lr.ph32.split.us, label %._crit_edge33.loopexit

.lr.ph24:                                         ; preds = %.lr.ph24.preheader, %._crit_edge21
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge21 ], [ 0, %.lr.ph24.preheader ]
  %indvars.iv60 = phi i32 [ %indvars.iv.next61, %._crit_edge21 ], [ -1, %.lr.ph24.preheader ]
  %36 = add i64 %indvars.iv64, 4294967295
  %37 = and i64 %36, 4294967295
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv64
  %39 = load double, double* %38, align 8
  %40 = icmp sgt i64 %indvars.iv64, 0
  br i1 %40, label %.lr.ph20.preheader, label %._crit_edge21

.lr.ph20.preheader:                               ; preds = %.lr.ph24
  %wide.trip.count62 = zext i32 %indvars.iv60 to i64
  %41 = and i64 %36, 1
  %lcmp.mod99 = icmp eq i64 %41, 0
  br i1 %lcmp.mod99, label %.lr.ph20.prol.preheader, label %.lr.ph20.prol.loopexit.unr-lcssa

.lr.ph20.prol.preheader:                          ; preds = %.lr.ph20.preheader
  br label %.lr.ph20.prol

.lr.ph20.prol:                                    ; preds = %.lr.ph20.prol.preheader
  %42 = load double, double* %8, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %39, %45
  br label %.lr.ph20.prol.loopexit.unr-lcssa

.lr.ph20.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph20.preheader, %.lr.ph20.prol
  %.lcssa93.unr.ph = phi double [ %46, %.lr.ph20.prol ], [ undef, %.lr.ph20.preheader ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.lr.ph20.prol ], [ 0, %.lr.ph20.preheader ]
  %.018.unr.ph = phi double [ %46, %.lr.ph20.prol ], [ %39, %.lr.ph20.preheader ]
  br label %.lr.ph20.prol.loopexit

.lr.ph20.prol.loopexit:                           ; preds = %.lr.ph20.prol.loopexit.unr-lcssa
  %47 = icmp eq i64 %37, 0
  br i1 %47, label %._crit_edge21.loopexit, label %.lr.ph20.preheader.new

.lr.ph20.preheader.new:                           ; preds = %.lr.ph20.prol.loopexit
  br label %.lr.ph20

.lr.ph20:                                         ; preds = %.lr.ph20, %.lr.ph20.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %.lr.ph20.preheader.new ], [ %indvars.iv.next56.1, %.lr.ph20 ]
  %.018 = phi double [ %.018.unr.ph, %.lr.ph20.preheader.new ], [ %61, %.lr.ph20 ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv55
  %49 = bitcast double* %48 to <2 x double>*
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv64
  %51 = load double, double* %50, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %52 = load <2 x double>, <2 x double>* %49, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next56, i64 %indvars.iv64
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %52, %56
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %60 = fsub double %.018, %58
  %61 = fsub double %60, %59
  %exitcond63.1 = icmp eq i64 %indvars.iv.next56, %wide.trip.count62
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  br i1 %exitcond63.1, label %._crit_edge21.loopexit.unr-lcssa, label %.lr.ph20

._crit_edge21.loopexit.unr-lcssa:                 ; preds = %.lr.ph20
  br label %._crit_edge21.loopexit

._crit_edge21.loopexit:                           ; preds = %.lr.ph20.prol.loopexit, %._crit_edge21.loopexit.unr-lcssa
  %.lcssa93 = phi double [ %.lcssa93.unr.ph, %.lr.ph20.prol.loopexit ], [ %61, %._crit_edge21.loopexit.unr-lcssa ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.lr.ph24
  %.0.lcssa = phi double [ %39, %.lr.ph24 ], [ %.lcssa93, %._crit_edge21.loopexit ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %63 = load double, double* %62, align 8
  %64 = fdiv double %.0.lcssa, %63
  store double %64, double* %38, align 8
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %65 = icmp slt i64 %indvars.iv.next65, %indvars.iv80
  %indvars.iv.next61 = add nsw i32 %indvars.iv60, 1
  br i1 %65, label %.lr.ph24, label %.lr.ph32

._crit_edge33.loopexit:                           ; preds = %._crit_edge29.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %.lr.ph32.._crit_edge33_crit_edge, %._crit_edge33.loopexit, %._crit_edge
  %indvars.iv.next81 = add nuw i64 %indvars.iv80, 1
  %66 = icmp slt i64 %indvars.iv.next81, 2000
  %indvars.iv.next73 = add nsw i32 %indvars.iv72, 1
  br i1 %66, label %._crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge33
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge14
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge14 ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv49 = phi i32 [ %indvars.iv.next50, %._crit_edge14 ], [ -1, %._crit_edge1.preheader ]
  %67 = add i64 %indvars.iv53, 4294967295
  %68 = and i64 %67, 4294967295
  %69 = getelementptr inbounds double, double* %1, i64 %indvars.iv53
  %70 = load double, double* %69, align 8
  %71 = icmp sgt i64 %indvars.iv53, 0
  br i1 %71, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count51 = zext i32 %indvars.iv49 to i64
  %xtraiter95 = and i64 %indvars.iv53, 3
  %lcmp.mod96 = icmp eq i64 %xtraiter95, 0
  br i1 %lcmp.mod96, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol, %.lr.ph13.prol.preheader
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %.211.prol = phi double [ %77, %.lr.ph13.prol ], [ %70, %.lr.ph13.prol.preheader ]
  %prol.iter97 = phi i64 [ %prol.iter97.sub, %.lr.ph13.prol ], [ %xtraiter95, %.lr.ph13.prol.preheader ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv44.prol
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %3, i64 %indvars.iv44.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %.211.prol, %76
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv44.prol, 1
  %prol.iter97.sub = add i64 %prol.iter97, -1
  %prol.iter97.cmp = icmp eq i64 %prol.iter97.sub, 0
  br i1 %prol.iter97.cmp, label %.lr.ph13.prol.loopexit.unr-lcssa, label %.lr.ph13.prol, !llvm.loop !20

.lr.ph13.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph13.prol
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.preheader, %.lr.ph13.prol.loopexit.unr-lcssa
  %.lcssa92.unr = phi double [ undef, %.lr.ph13.preheader ], [ %77, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %indvars.iv44.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next45.prol, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %.211.unr = phi double [ %70, %.lr.ph13.preheader ], [ %77, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %78 = icmp ult i64 %68, 3
  br i1 %78, label %._crit_edge14.loopexit, label %.lr.ph13.preheader.new

.lr.ph13.preheader.new:                           ; preds = %.lr.ph13.prol.loopexit
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr, %.lr.ph13.preheader.new ], [ %indvars.iv.next45.3, %.lr.ph13 ]
  %.211 = phi double [ %.211.unr, %.lr.ph13.preheader.new ], [ %100, %.lr.ph13 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv44
  %80 = bitcast double* %79 to <2 x double>*
  %81 = getelementptr inbounds double, double* %3, i64 %indvars.iv44
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %80, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %85 = fmul <2 x double> %83, %84
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = fsub double %.211, %86
  %89 = fsub double %88, %87
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv.next45.1
  %91 = bitcast double* %90 to <2 x double>*
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next45.1
  %93 = bitcast double* %92 to <2 x double>*
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, 3
  %94 = load <2 x double>, <2 x double>* %91, align 8
  %95 = load <2 x double>, <2 x double>* %93, align 8
  %96 = fmul <2 x double> %94, %95
  %97 = extractelement <2 x double> %96, i32 0
  %98 = extractelement <2 x double> %96, i32 1
  %99 = fsub double %89, %97
  %100 = fsub double %99, %98
  %exitcond52.3 = icmp eq i64 %indvars.iv.next45.2, %wide.trip.count51
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, 4
  br i1 %exitcond52.3, label %._crit_edge14.loopexit.unr-lcssa, label %.lr.ph13

._crit_edge14.loopexit.unr-lcssa:                 ; preds = %.lr.ph13
  br label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.prol.loopexit, %._crit_edge14.loopexit.unr-lcssa
  %.lcssa92 = phi double [ %.lcssa92.unr, %.lr.ph13.prol.loopexit ], [ %100, %._crit_edge14.loopexit.unr-lcssa ]
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %70, %._crit_edge1 ], [ %.lcssa92, %._crit_edge14.loopexit ]
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv53
  store double %.2.lcssa, double* %101, align 8
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  %102 = icmp slt i64 %indvars.iv.next54, 2000
  %indvars.iv.next50 = add nsw i32 %indvars.iv49, 1
  br i1 %102, label %._crit_edge1, label %._crit_edge14._crit_edge.preheader

._crit_edge14._crit_edge.preheader:               ; preds = %._crit_edge14
  br label %._crit_edge14._crit_edge

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14._crit_edge.preheader, %._crit_edge7._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge14._crit_edge.preheader ], [ %indvar.next, %._crit_edge7._crit_edge ]
  %indvars.iv42 = phi i64 [ 1999, %._crit_edge14._crit_edge.preheader ], [ %indvars.iv.next43, %._crit_edge7._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge14._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge7._crit_edge ]
  %103 = sub i32 2000, %indvar
  %104 = sext i32 %103 to i64
  %105 = sub nsw i64 1999, %104
  %106 = getelementptr inbounds double, double* %3, i64 %indvars.iv42
  %107 = load double, double* %106, align 8
  %108 = add nsw i64 %indvars.iv42, 1
  %109 = icmp slt i64 %108, 2000
  br i1 %109, label %..lr.ph_crit_edge, label %._crit_edge7.thread

._crit_edge7.thread:                              ; preds = %._crit_edge14._crit_edge
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv42
  %111 = load double, double* %110, align 8
  %112 = fdiv double %107, %111
  %113 = getelementptr inbounds double, double* %2, i64 %indvars.iv42
  store double %112, double* %113, align 8
  br label %._crit_edge7._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge14._crit_edge
  %114 = sext i32 %indvars.iv to i64
  %115 = sub nsw i64 0, %104
  %xtraiter = and i64 %115, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv40.prol = phi i64 [ %indvars.iv.next41.prol, %.lr.ph.prol ], [ %114, %.lr.ph.prol.preheader ]
  %.35.prol = phi double [ %121, %.lr.ph.prol ], [ %107, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv40.prol
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %2, i64 %indvars.iv40.prol
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fsub double %.35.prol, %120
  %indvars.iv.next41.prol = add nsw i64 %indvars.iv40.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %121, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv40.unr = phi i64 [ %114, %..lr.ph_crit_edge ], [ %indvars.iv.next41.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.35.unr = phi double [ %107, %..lr.ph_crit_edge ], [ %121, %.lr.ph.prol.loopexit.unr-lcssa ]
  %122 = icmp ult i64 %105, 3
  br i1 %122, label %._crit_edge7, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next41.3, %.lr.ph ]
  %.35 = phi double [ %.35.unr, %..lr.ph_crit_edge.new ], [ %144, %.lr.ph ]
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv40
  %124 = bitcast double* %123 to <2 x double>*
  %125 = getelementptr inbounds double, double* %2, i64 %indvars.iv40
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %124, align 8
  %128 = load <2 x double>, <2 x double>* %126, align 8
  %129 = fmul <2 x double> %127, %128
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fsub double %.35, %130
  %133 = fsub double %132, %131
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv.next41.1
  %135 = bitcast double* %134 to <2 x double>*
  %136 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next41.1
  %137 = bitcast double* %136 to <2 x double>*
  %indvars.iv.next41.2 = add nsw i64 %indvars.iv40, 3
  %138 = load <2 x double>, <2 x double>* %135, align 8
  %139 = load <2 x double>, <2 x double>* %137, align 8
  %140 = fmul <2 x double> %138, %139
  %141 = extractelement <2 x double> %140, i32 0
  %142 = extractelement <2 x double> %140, i32 1
  %143 = fsub double %133, %141
  %144 = fsub double %143, %142
  %exitcond.3 = icmp eq i64 %indvars.iv.next41.2, 1999
  %indvars.iv.next41.3 = add nsw i64 %indvars.iv40, 4
  br i1 %exitcond.3, label %._crit_edge7.unr-lcssa, label %.lr.ph

._crit_edge7.unr-lcssa:                           ; preds = %.lr.ph
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.lr.ph.prol.loopexit, %._crit_edge7.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %144, %._crit_edge7.unr-lcssa ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv42
  %146 = load double, double* %145, align 8
  %147 = fdiv double %.lcssa, %146
  %148 = getelementptr inbounds double, double* %2, i64 %indvars.iv42
  store double %147, double* %148, align 8
  %149 = icmp sgt i64 %indvars.iv42, 0
  br i1 %149, label %._crit_edge7._crit_edge, label %150

._crit_edge7._crit_edge:                          ; preds = %._crit_edge7.thread, %._crit_edge7
  %indvars.iv.next43 = add i64 %indvars.iv42, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge14._crit_edge

; <label>:150:                                    ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge2, label %16

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
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
