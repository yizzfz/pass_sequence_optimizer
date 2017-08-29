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
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %4
  %indvars.iv61 = phi i64 [ 0, %4 ], [ %indvars.iv.next62.1, %._crit_edge15 ]
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
  br i1 %exitcond63.1, label %.lr.ph.preheader, label %._crit_edge15

.lr.ph.preheader:                                 ; preds = %._crit_edge15
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge12._crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge12._crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv59, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %21
  %22 = sub i64 1998, %indvars.iv59
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %26 ], [ 0, %.lr.ph ]
  %27 = sub nsw i64 0, %indvars.iv42
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv42
  store double %32, double* %33, align 8
  %exitcond50 = icmp eq i64 %indvars.iv42, %indvars.iv59
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br i1 %exitcond50, label %._crit_edge, label %26

._crit_edge:                                      ; preds = %26
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %34 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %34, label %._crit_edge12._crit_edge, label %37

._crit_edge12._crit_edge:                         ; preds = %._crit_edge
  %35 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %37
  %indvars.iv40 = phi i64 [ 0, %37 ], [ %indvars.iv.next41.7, %._crit_edge21 ]
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
  br i1 %48, label %._crit_edge21, label %._crit_edge24.preheader

._crit_edge24.preheader:                          ; preds = %._crit_edge21
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.preheader, %100
  %indvars.iv35 = phi i64 [ %52, %100 ], [ 0, %._crit_edge24.preheader ]
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv35
  %52 = add i64 %indvars.iv35, 1
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %53 = bitcast double* %scevgep68 to i8*
  %54 = bitcast double* %scevgep66 to i8*
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %middle.block, %._crit_edge24
  %indvars.iv33 = phi i64 [ 0, %._crit_edge24 ], [ %indvars.iv.next34, %middle.block ]
  %55 = mul i64 %indvars.iv33, 16000
  %scevgep64 = getelementptr i8, i8* %39, i64 %55
  %56 = add i64 %55, 16000
  %scevgep65 = getelementptr i8, i8* %39, i64 %56
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  %bound0 = icmp ult i8* %scevgep64, %53
  %bound1 = icmp ult i8* %54, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %57 to i8*
  %bound071 = icmp ult i8* %scevgep64, %bc
  %bound172 = icmp ult i8* %bc, %scevgep65
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge23
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge23
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %58 = or i64 %index, 1
  %59 = or i64 %index, 2
  %60 = or i64 %index, 3
  %61 = load double, double* %57, align 8, !alias.scope !1
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv35
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv35
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %59, i64 %indvars.iv35
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %60, i64 %indvars.iv35
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = load double, double* %66, align 8, !alias.scope !4
  %71 = load double, double* %67, align 8, !alias.scope !4
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = fmul <2 x double> %63, %73
  %77 = fmul <2 x double> %63, %75
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv33, i64 %index
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !6, !noalias !8
  %82 = fadd <2 x double> %wide.load, %76
  %83 = fadd <2 x double> %wide.load75, %77
  store <2 x double> %82, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %83, <2 x double>* %81, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %84 = icmp eq i64 %index.next, 2000
  br i1 %84, label %middle.block.loopexit105, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv30 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next31.1, %scalar.ph ]
  %85 = load double, double* %57, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %92 = load double, double* %57, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next31, i64 %indvars.iv35
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv33, i64 %indvars.iv.next31
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31, 1999
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond32.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit105:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit105, %middle.block.loopexit
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %99 = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %99, label %._crit_edge23, label %100

; <label>:100:                                    ; preds = %middle.block
  %101 = icmp slt i64 %52, 2000
  br i1 %101, label %._crit_edge24, label %._crit_edge26.preheader

._crit_edge26.preheader:                          ; preds = %100
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %107 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %108 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.preheader, %middle.block77
  %indvars.iv28 = phi i64 [ %109, %middle.block77 ], [ 0, %._crit_edge26.preheader ]
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %109 = add i64 %indvars.iv28, 1
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %109, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %110 = mul i64 %indvars.iv28, 16000
  %scevgep85 = getelementptr i8, i8* %39, i64 %110
  %111 = add i64 %110, 16000
  %scevgep86 = getelementptr i8, i8* %39, i64 %111
  %bound087 = icmp ult i8* %scevgep8182, %scevgep86
  %bound188 = icmp ult i8* %scevgep85, %scevgep8384
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph78.preheader, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %._crit_edge26
  br label %vector.body76

scalar.ph78.preheader:                            ; preds = %._crit_edge26
  br label %scalar.ph78

vector.body76:                                    ; preds = %vector.body76, %vector.body76.preheader
  %index93 = phi i64 [ 0, %vector.body76.preheader ], [ %index.next94.1, %vector.body76 ]
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv28, i64 %index93
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load101 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  %wide.load102 = load <2 x i64>, <2 x i64>* %115, align 8, !alias.scope !13
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index93
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load101, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  store <2 x i64> %wide.load102, <2 x i64>* %119, align 8, !alias.scope !16, !noalias !13
  %index.next94 = or i64 %index93, 4
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %108, i64 0, i64 %indvars.iv28, i64 %index.next94
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load101.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  %wide.load102.1 = load <2 x i64>, <2 x i64>* %123, align 8, !alias.scope !13
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index.next94
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load101.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x i64>*
  store <2 x i64> %wide.load102.1, <2 x i64>* %127, align 8, !alias.scope !16, !noalias !13
  %index.next94.1 = add nsw i64 %index93, 8
  %128 = icmp eq i64 %index.next94.1, 2000
  br i1 %128, label %middle.block77.loopexit104, label %vector.body76, !llvm.loop !18

scalar.ph78:                                      ; preds = %scalar.ph78, %scalar.ph78.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph78.preheader ], [ %indvars.iv.next.4, %scalar.ph78 ]
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  %146 = load i64, i64* %145, align 8
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %148 = bitcast double* %147 to i64*
  store i64 %146, i64* %148, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %149 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  %151 = load i64, i64* %150, align 8
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %153 = bitcast double* %152 to i64*
  store i64 %151, i64* %153, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block77.loopexit, label %scalar.ph78, !llvm.loop !19

middle.block77.loopexit:                          ; preds = %scalar.ph78
  br label %middle.block77

middle.block77.loopexit104:                       ; preds = %vector.body76
  br label %middle.block77

middle.block77:                                   ; preds = %middle.block77.loopexit104, %middle.block77.loopexit
  %154 = icmp slt i64 %109, 2000
  br i1 %154, label %._crit_edge26, label %155

; <label>:155:                                    ; preds = %middle.block77
  call void @free(i8* nonnull %39) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge30, %4
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge30 ], [ 0, %4 ]
  %indvars.iv81 = phi i32 [ %indvars.iv.next82, %._crit_edge30 ], [ -1, %4 ]
  %6 = add i64 %indvars.iv89, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv89
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv89
  %12 = icmp sgt i64 %indvars.iv89, 0
  br i1 %12, label %.lr.ph19.preheader, label %.lr.ph29.split.preheader

.lr.ph19.preheader:                               ; preds = %5
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 0
  br label %.lr.ph19

.lr.ph29.split.preheader:                         ; preds = %.lr.ph29..lr.ph29.split.preheader_crit_edge, %5
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph29.split.preheader105, label %min.iters.checked

.lr.ph29.split.preheader105:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph29.split.preheader
  %indvars.iv72.ph = phi i64 [ %indvars.iv89, %min.iters.checked ], [ %indvars.iv89, %.lr.ph29.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph29.split

min.iters.checked:                                ; preds = %.lr.ph29.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv89, %n.vec
  br i1 %cmp.zero, label %.lr.ph29.split.preheader105, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod119 = icmp eq i64 %14, 0
  br i1 %lcmp.mod119, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv89
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load104.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load104.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %10, 0
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %20 = add i64 %indvars.iv89, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load104, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv89, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load104.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge30, label %.lr.ph29.split.preheader105

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %._crit_edge15
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge15 ], [ 0, %.lr.ph19.preheader ]
  %indvars.iv64 = phi i32 [ %indvars.iv.next65, %._crit_edge15 ], [ -1, %.lr.ph19.preheader ]
  %31 = add i64 %indvars.iv68, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv68
  %34 = load double, double* %33, align 8
  %35 = icmp sgt i64 %indvars.iv68, 0
  br i1 %35, label %.lr.ph14.preheader, label %._crit_edge15

.lr.ph14.preheader:                               ; preds = %.lr.ph19
  %wide.trip.count66 = zext i32 %indvars.iv64 to i64
  %36 = and i64 %31, 1
  %lcmp.mod117 = icmp eq i64 %36, 0
  br i1 %lcmp.mod117, label %.lr.ph14.prol.preheader, label %.lr.ph14.prol.loopexit.unr-lcssa

.lr.ph14.prol.preheader:                          ; preds = %.lr.ph14.preheader
  br label %.lr.ph14.prol

.lr.ph14.prol:                                    ; preds = %.lr.ph14.prol.preheader
  %37 = load double, double* %13, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %34, %40
  br label %.lr.ph14.prol.loopexit.unr-lcssa

.lr.ph14.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph14.preheader, %.lr.ph14.prol
  %.lcssa111.unr.ph = phi double [ %41, %.lr.ph14.prol ], [ undef, %.lr.ph14.preheader ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %.lr.ph14.prol ], [ 0, %.lr.ph14.preheader ]
  %.012.unr.ph = phi double [ %41, %.lr.ph14.prol ], [ %34, %.lr.ph14.preheader ]
  br label %.lr.ph14.prol.loopexit

.lr.ph14.prol.loopexit:                           ; preds = %.lr.ph14.prol.loopexit.unr-lcssa
  %42 = icmp eq i64 %32, 0
  br i1 %42, label %._crit_edge15.loopexit, label %.lr.ph14.preheader.new

.lr.ph14.preheader.new:                           ; preds = %.lr.ph14.prol.loopexit
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph14.preheader.new ], [ %indvars.iv.next60.1, %.lr.ph14 ]
  %.012 = phi double [ %.012.unr.ph, %.lr.ph14.preheader.new ], [ %56, %.lr.ph14 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv59
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv68
  %46 = load double, double* %45, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next60, i64 %indvars.iv68
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.012, %53
  %56 = fsub double %55, %54
  %exitcond67.1 = icmp eq i64 %indvars.iv.next60, %wide.trip.count66
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond67.1, label %._crit_edge15.loopexit.unr-lcssa, label %.lr.ph14

._crit_edge15.loopexit.unr-lcssa:                 ; preds = %.lr.ph14
  br label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %.lr.ph14.prol.loopexit, %._crit_edge15.loopexit.unr-lcssa
  %.lcssa111 = phi double [ %.lcssa111.unr.ph, %.lr.ph14.prol.loopexit ], [ %56, %._crit_edge15.loopexit.unr-lcssa ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.lr.ph19
  %.0.lcssa = phi double [ %34, %.lr.ph19 ], [ %.lcssa111, %._crit_edge15.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %33, align 8
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  %60 = icmp slt i64 %indvars.iv.next69, %indvars.iv89
  %indvars.iv.next65 = add nsw i32 %indvars.iv64, 1
  br i1 %60, label %.lr.ph19, label %.lr.ph29

.lr.ph29:                                         ; preds = %._crit_edge15
  br i1 true, label %.lr.ph29.split.us.preheader, label %.lr.ph29..lr.ph29.split.preheader_crit_edge

.lr.ph29..lr.ph29.split.preheader_crit_edge:      ; preds = %.lr.ph29
  br label %.lr.ph29.split.preheader

.lr.ph29.split.us.preheader:                      ; preds = %.lr.ph29
  %wide.trip.count83 = zext i32 %indvars.iv81 to i64
  %61 = and i64 %6, 1
  %lcmp.mod123 = icmp eq i64 %61, 0
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 0
  %63 = icmp eq i64 %7, 0
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge25.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge25.us ], [ %indvars.iv89, %.lr.ph29.split.us.preheader ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv87
  %65 = load double, double* %64, align 8
  br i1 %lcmp.mod123, label %.prol.preheader120, label %.prol.loopexit121.unr-lcssa

.prol.preheader120:                               ; preds = %.lr.ph29.split.us
  br label %66

; <label>:66:                                     ; preds = %.prol.preheader120
  %67 = load double, double* %62, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv87
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fsub double %65, %70
  br label %.prol.loopexit121.unr-lcssa

.prol.loopexit121.unr-lcssa:                      ; preds = %.lr.ph29.split.us, %66
  %.lcssa112.unr.ph = phi double [ %71, %66 ], [ undef, %.lr.ph29.split.us ]
  %indvars.iv76.unr.ph = phi i64 [ 1, %66 ], [ 0, %.lr.ph29.split.us ]
  %.122.us.unr.ph = phi double [ %71, %66 ], [ %65, %.lr.ph29.split.us ]
  br label %.prol.loopexit121

.prol.loopexit121:                                ; preds = %.prol.loopexit121.unr-lcssa
  br i1 %63, label %._crit_edge25.us, label %.lr.ph29.split.us.new

.lr.ph29.split.us.new:                            ; preds = %.prol.loopexit121
  br label %72

; <label>:72:                                     ; preds = %72, %.lr.ph29.split.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr.ph, %.lr.ph29.split.us.new ], [ %indvars.iv.next77.1, %72 ]
  %.122.us = phi double [ %.122.us.unr.ph, %.lr.ph29.split.us.new ], [ %86, %72 ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv76
  %74 = bitcast double* %73 to <2 x double>*
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv87
  %76 = load double, double* %75, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %77 = load <2 x double>, <2 x double>* %74, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next77, i64 %indvars.iv87
  %79 = load double, double* %78, align 8
  %80 = insertelement <2 x double> undef, double %76, i32 0
  %81 = insertelement <2 x double> %80, double %79, i32 1
  %82 = fmul <2 x double> %77, %81
  %83 = extractelement <2 x double> %82, i32 0
  %84 = extractelement <2 x double> %82, i32 1
  %85 = fsub double %.122.us, %83
  %86 = fsub double %85, %84
  %exitcond84.1 = icmp eq i64 %indvars.iv.next77, %wide.trip.count83
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  br i1 %exitcond84.1, label %._crit_edge25.us.unr-lcssa, label %72

._crit_edge25.us.unr-lcssa:                       ; preds = %72
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %.prol.loopexit121, %._crit_edge25.us.unr-lcssa
  %.lcssa112 = phi double [ %.lcssa112.unr.ph, %.prol.loopexit121 ], [ %86, %._crit_edge25.us.unr-lcssa ]
  store double %.lcssa112, double* %64, align 8
  %indvars.iv.next88 = add nuw i64 %indvars.iv87, 1
  %87 = icmp slt i64 %indvars.iv.next88, 2000
  br i1 %87, label %.lr.ph29.split.us, label %._crit_edge30.loopexit

.lr.ph29.split:                                   ; preds = %.lr.ph29.split.preheader105, %.lr.ph29.split
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %.lr.ph29.split ], [ %indvars.iv72.ph, %.lr.ph29.split.preheader105 ]
  %exitcond74 = icmp eq i64 %indvars.iv72, 1999
  %indvars.iv.next73 = add nuw i64 %indvars.iv72, 1
  br i1 %exitcond74, label %._crit_edge30.loopexit106, label %.lr.ph29.split, !llvm.loop !21

._crit_edge30.loopexit:                           ; preds = %._crit_edge25.us
  br label %._crit_edge30

._crit_edge30.loopexit106:                        ; preds = %.lr.ph29.split
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit106, %._crit_edge30.loopexit, %middle.block
  %indvars.iv.next90 = add nuw i64 %indvars.iv89, 1
  %88 = icmp slt i64 %indvars.iv.next90, 2000
  %indvars.iv.next82 = add nsw i32 %indvars.iv81, 1
  br i1 %88, label %5, label %._crit_edge30._crit_edge35.preheader

._crit_edge30._crit_edge35.preheader:             ; preds = %._crit_edge30
  br label %._crit_edge30._crit_edge35

._crit_edge30._crit_edge35:                       ; preds = %._crit_edge30._crit_edge35.preheader, %._crit_edge8
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge8 ], [ 0, %._crit_edge30._crit_edge35.preheader ]
  %indvars.iv53 = phi i32 [ %indvars.iv.next54, %._crit_edge8 ], [ -1, %._crit_edge30._crit_edge35.preheader ]
  %89 = add i64 %indvars.iv57, 4294967295
  %90 = and i64 %89, 4294967295
  %91 = getelementptr inbounds double, double* %1, i64 %indvars.iv57
  %92 = load double, double* %91, align 8
  %93 = icmp sgt i64 %indvars.iv57, 0
  br i1 %93, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %._crit_edge30._crit_edge35
  %wide.trip.count55 = zext i32 %indvars.iv53 to i64
  %xtraiter113 = and i64 %indvars.iv57, 3
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph7.prol.loopexit, label %.lr.ph7.prol.preheader

.lr.ph7.prol.preheader:                           ; preds = %.lr.ph7.preheader
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.prol, %.lr.ph7.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.lr.ph7.prol ], [ 0, %.lr.ph7.prol.preheader ]
  %.25.prol = phi double [ %99, %.lr.ph7.prol ], [ %92, %.lr.ph7.prol.preheader ]
  %prol.iter115 = phi i64 [ %prol.iter115.sub, %.lr.ph7.prol ], [ %xtraiter113, %.lr.ph7.prol.preheader ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv48.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv48.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %.25.prol, %98
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph7.prol.loopexit.unr-lcssa, label %.lr.ph7.prol, !llvm.loop !23

.lr.ph7.prol.loopexit.unr-lcssa:                  ; preds = %.lr.ph7.prol
  br label %.lr.ph7.prol.loopexit

.lr.ph7.prol.loopexit:                            ; preds = %.lr.ph7.preheader, %.lr.ph7.prol.loopexit.unr-lcssa
  %.lcssa110.unr = phi double [ undef, %.lr.ph7.preheader ], [ %99, %.lr.ph7.prol.loopexit.unr-lcssa ]
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next49.prol, %.lr.ph7.prol.loopexit.unr-lcssa ]
  %.25.unr = phi double [ %92, %.lr.ph7.preheader ], [ %99, %.lr.ph7.prol.loopexit.unr-lcssa ]
  %100 = icmp ult i64 %90, 3
  br i1 %100, label %._crit_edge8.loopexit, label %.lr.ph7.preheader.new

.lr.ph7.preheader.new:                            ; preds = %.lr.ph7.prol.loopexit
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7, %.lr.ph7.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.lr.ph7.preheader.new ], [ %indvars.iv.next49.3, %.lr.ph7 ]
  %.25 = phi double [ %.25.unr, %.lr.ph7.preheader.new ], [ %122, %.lr.ph7 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv48
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %.25, %108
  %111 = fsub double %110, %109
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next49.1
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next49.1
  %115 = bitcast double* %114 to <2 x double>*
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %exitcond56.3 = icmp eq i64 %indvars.iv.next49.2, %wide.trip.count55
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  br i1 %exitcond56.3, label %._crit_edge8.loopexit.unr-lcssa, label %.lr.ph7

._crit_edge8.loopexit.unr-lcssa:                  ; preds = %.lr.ph7
  br label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.prol.loopexit, %._crit_edge8.loopexit.unr-lcssa
  %.lcssa110 = phi double [ %.lcssa110.unr, %.lr.ph7.prol.loopexit ], [ %122, %._crit_edge8.loopexit.unr-lcssa ]
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge30._crit_edge35
  %.2.lcssa = phi double [ %92, %._crit_edge30._crit_edge35 ], [ %.lcssa110, %._crit_edge8.loopexit ]
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  store double %.2.lcssa, double* %123, align 8
  %indvars.iv.next58 = add nuw i64 %indvars.iv57, 1
  %124 = icmp slt i64 %indvars.iv.next58, 2000
  %indvars.iv.next54 = add nsw i32 %indvars.iv53, 1
  br i1 %124, label %._crit_edge30._crit_edge35, label %._crit_edge8._crit_edge38.preheader

._crit_edge8._crit_edge38.preheader:              ; preds = %._crit_edge8
  br label %._crit_edge8._crit_edge38

._crit_edge8._crit_edge38:                        ; preds = %._crit_edge8._crit_edge38.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge8._crit_edge38.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv46 = phi i64 [ 1999, %._crit_edge8._crit_edge38.preheader ], [ %indvars.iv.next47, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge8._crit_edge38.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv46, 1
  %131 = icmp slt i64 %130, 2000
  br i1 %131, label %.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge8._crit_edge38
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %133 = load double, double* %132, align 8
  %134 = fdiv double %129, %133
  %135 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %134, double* %135, align 8
  br label %._crit_edge._crit_edge

.lr.ph:                                           ; preds = %._crit_edge8._crit_edge38
  %136 = sext i32 %indvars.iv to i64
  %137 = sub nsw i64 0, %126
  %xtraiter = and i64 %137, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %138

; <label>:138:                                    ; preds = %138, %.prol.preheader
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %138 ], [ %136, %.prol.preheader ]
  %.32.prol = phi double [ %144, %138 ], [ %129, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %138 ], [ %xtraiter, %.prol.preheader ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44.prol
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv44.prol
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = fsub double %.32.prol, %143
  %indvars.iv.next45.prol = add nsw i64 %indvars.iv44.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %138, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %138
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %indvars.iv44.unr = phi i64 [ %136, %.lr.ph ], [ %indvars.iv.next45.prol, %.prol.loopexit.unr-lcssa ]
  %.32.unr = phi double [ %129, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %145 = icmp ult i64 %127, 3
  br i1 %145, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %146

; <label>:146:                                    ; preds = %146, %.lr.ph.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr, %.lr.ph.new ], [ %indvars.iv.next45.3, %146 ]
  %.32 = phi double [ %.32.unr, %.lr.ph.new ], [ %168, %146 ]
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44
  %148 = bitcast double* %147 to <2 x double>*
  %149 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  %150 = bitcast double* %149 to <2 x double>*
  %151 = load <2 x double>, <2 x double>* %148, align 8
  %152 = load <2 x double>, <2 x double>* %150, align 8
  %153 = fmul <2 x double> %151, %152
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %156 = fsub double %.32, %154
  %157 = fsub double %156, %155
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next45.1
  %159 = bitcast double* %158 to <2 x double>*
  %160 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45.1
  %161 = bitcast double* %160 to <2 x double>*
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, 3
  %162 = load <2 x double>, <2 x double>* %159, align 8
  %163 = load <2 x double>, <2 x double>* %161, align 8
  %164 = fmul <2 x double> %162, %163
  %165 = extractelement <2 x double> %164, i32 0
  %166 = extractelement <2 x double> %164, i32 1
  %167 = fsub double %157, %165
  %168 = fsub double %167, %166
  %exitcond.3 = icmp eq i64 %indvars.iv.next45.2, 1999
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %146

._crit_edge.unr-lcssa:                            ; preds = %146
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %168, %._crit_edge.unr-lcssa ]
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %170 = load double, double* %169, align 8
  %171 = fdiv double %.lcssa, %170
  %172 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %171, double* %172, align 8
  %173 = icmp sgt i64 %indvars.iv46, 0
  br i1 %173, label %._crit_edge._crit_edge, label %174

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next47 = add i64 %indvars.iv46, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge8._crit_edge38

; <label>:174:                                    ; preds = %._crit_edge
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
