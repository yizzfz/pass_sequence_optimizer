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
  %indvars.iv59 = phi i64 [ 0, %4 ], [ %indvars.iv.next60.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv59
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %9 = trunc i64 %indvars.iv.next60 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv59
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %12 = trunc i64 %indvars.iv.next60.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond61.1 = icmp eq i64 %indvars.iv.next60, 1999
  br i1 %exitcond61.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge18.._crit_edge1_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge18.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv57, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep55 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %21
  %22 = sub i64 1998, %indvars.iv57
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge2:                                     ; preds = %27
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %26 = icmp slt i64 %indvars.iv.next58, 2000
  br i1 %26, label %._crit_edge18.._crit_edge1_crit_edge, label %37

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv40
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv40
  store double %33, double* %34, align 8
  %exitcond48 = icmp eq i64 %indvars.iv40, %indvars.iv57
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  br i1 %exitcond48, label %._crit_edge2, label %27

._crit_edge18.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %35 = bitcast double* %scevgep55 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %.._crit_edge3_crit_edge, %37
  %indvars.iv38 = phi i64 [ 0, %37 ], [ %indvars.iv.next39.7, %.._crit_edge3_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv38, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %41 = mul nuw nsw i64 %indvars.iv.next39, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.1 = or i64 %indvars.iv38, 2
  %42 = mul nuw nsw i64 %indvars.iv.next39.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.2 = or i64 %indvars.iv38, 3
  %43 = mul nuw nsw i64 %indvars.iv.next39.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.3 = or i64 %indvars.iv38, 4
  %44 = mul nuw nsw i64 %indvars.iv.next39.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.4 = or i64 %indvars.iv38, 5
  %45 = mul nuw nsw i64 %indvars.iv.next39.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.5 = or i64 %indvars.iv38, 6
  %46 = mul nuw nsw i64 %indvars.iv.next39.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.6 = or i64 %indvars.iv38, 7
  %47 = mul nuw nsw i64 %indvars.iv.next39.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.7 = add nsw i64 %indvars.iv38, 8
  %48 = icmp slt i64 %indvars.iv.next39.7, 2000
  br i1 %48, label %.._crit_edge3_crit_edge, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %.._crit_edge3_crit_edge
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %98
  %indvars.iv33 = phi i64 [ %52, %98 ], [ 0, %._crit_edge5.preheader ]
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv33
  %scevgep6465 = bitcast double* %scevgep64 to i8*
  %52 = add i64 %indvars.iv33, 1
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep6667 = bitcast double* %scevgep66 to i8*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv31 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next32, %middle.block ]
  %53 = mul i64 %indvars.iv31, 16000
  %scevgep62 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep63 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv33
  %bound0 = icmp ult i8* %scevgep62, %scevgep6667
  %bound1 = icmp ult i8* %scevgep6465, %scevgep63
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound069 = icmp ult i8* %scevgep62, %bc
  %bound170 = icmp ult i8* %bc, %scevgep63
  %found.conflict71 = and i1 %bound069, %bound170
  %conflict.rdx = or i1 %found.conflict, %found.conflict71
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
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv33
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv33
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv33
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv33
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv31, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load73, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit103, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv28 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next29.1, %scalar.ph ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv33
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv31, i64 %indvars.iv28
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next29, i64 %indvars.iv33
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next29
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next29, 1999
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond30.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit103:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit103, %middle.block.loopexit
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %97 = icmp slt i64 %indvars.iv.next32, 2000
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

._crit_edge8:                                     ; preds = %._crit_edge8.preheader, %middle.block75
  %indvars.iv26 = phi i64 [ %107, %middle.block75 ], [ 0, %._crit_edge8.preheader ]
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 0
  %scevgep7980 = bitcast double* %scevgep79 to i8*
  %107 = add i64 %indvars.iv26, 1
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %0, i64 %107, i64 0
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %108 = mul i64 %indvars.iv26, 16000
  %scevgep83 = getelementptr i8, i8* %39, i64 %108
  %109 = add i64 %108, 16000
  %scevgep84 = getelementptr i8, i8* %39, i64 %109
  %bound085 = icmp ult i8* %scevgep7980, %scevgep84
  %bound186 = icmp ult i8* %scevgep83, %scevgep8182
  %memcheck.conflict88 = and i1 %bound085, %bound186
  br i1 %memcheck.conflict88, label %scalar.ph76.preheader, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %._crit_edge8
  br label %vector.body74

scalar.ph76.preheader:                            ; preds = %._crit_edge8
  br label %scalar.ph76

vector.body74:                                    ; preds = %vector.body74, %vector.body74.preheader
  %index91 = phi i64 [ 0, %vector.body74.preheader ], [ %index.next92.1, %vector.body74 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv26, i64 %index91
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load99 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load100 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %index91
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load99, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load100, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next92 = or i64 %index91, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv26, i64 %index.next92
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load99.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load100.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %index.next92
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load99.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load100.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %index.next92.1 = add nsw i64 %index91, 8
  %126 = icmp eq i64 %index.next92.1, 2000
  br i1 %126, label %middle.block75.loopexit102, label %vector.body74, !llvm.loop !18

scalar.ph76:                                      ; preds = %scalar.ph76, %scalar.ph76.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph76.preheader ], [ %indvars.iv.next.4, %scalar.ph76 ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv26, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.3
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.3
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block75.loopexit, label %scalar.ph76, !llvm.loop !19

middle.block75.loopexit:                          ; preds = %scalar.ph76
  br label %middle.block75

middle.block75.loopexit102:                       ; preds = %vector.body74
  br label %middle.block75

middle.block75:                                   ; preds = %middle.block75.loopexit102, %middle.block75.loopexit
  %152 = icmp slt i64 %107, 2000
  br i1 %152, label %._crit_edge8, label %153

; <label>:153:                                    ; preds = %middle.block75
  call void @free(i8* nonnull %39) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge35, %4
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge35 ], [ 0, %4 ]
  %indvars.iv81 = phi i32 [ %indvars.iv.next82, %._crit_edge35 ], [ -1, %4 ]
  %5 = add i64 %indvars.iv89, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 1999, %indvars.iv89
  %8 = icmp sgt i64 %indvars.iv89, 0
  br i1 %8, label %.lr.ph25.preheader, label %.lr.ph34.split.preheader

.lr.ph34.split.preheader:                         ; preds = %._crit_edge
  %9 = sub i64 0, %indvars.iv89
  %xtraiter111 = and i64 %9, 7
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  br i1 %lcmp.mod112, label %.lr.ph34.split.prol.loopexit, label %.lr.ph34.split.prol.preheader

.lr.ph34.split.prol.preheader:                    ; preds = %.lr.ph34.split.preheader
  br label %.lr.ph34.split.prol

.lr.ph34.split.prol:                              ; preds = %.lr.ph34.split.prol, %.lr.ph34.split.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %.lr.ph34.split.prol ], [ %indvars.iv89, %.lr.ph34.split.prol.preheader ]
  %prol.iter113 = phi i64 [ %prol.iter113.sub, %.lr.ph34.split.prol ], [ %xtraiter111, %.lr.ph34.split.prol.preheader ]
  %indvars.iv.next73.prol = add nuw i64 %indvars.iv72.prol, 1
  %prol.iter113.sub = add i64 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i64 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %.lr.ph34.split.prol.loopexit.unr-lcssa, label %.lr.ph34.split.prol, !llvm.loop !20

.lr.ph34.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph34.split.prol
  br label %.lr.ph34.split.prol.loopexit

.lr.ph34.split.prol.loopexit:                     ; preds = %.lr.ph34.split.preheader, %.lr.ph34.split.prol.loopexit.unr-lcssa
  %indvars.iv72.unr = phi i64 [ %indvars.iv89, %.lr.ph34.split.preheader ], [ %indvars.iv.next73.prol, %.lr.ph34.split.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %7, 7
  br i1 %10, label %._crit_edge35.loopexit101, label %.lr.ph34.split.preheader.new

.lr.ph34.split.preheader.new:                     ; preds = %.lr.ph34.split.prol.loopexit
  br label %.lr.ph34.split

.lr.ph25.preheader:                               ; preds = %._crit_edge
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 0
  br label %.lr.ph25

.lr.ph34.split.us.preheader:                      ; preds = %._crit_edge22
  %wide.trip.count83 = zext i32 %indvars.iv81 to i64
  %12 = and i64 %5, 1
  %lcmp.mod117 = icmp eq i64 %12, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 0
  %14 = icmp eq i64 %6, 0
  br label %.lr.ph34.split.us

.lr.ph34.split.us:                                ; preds = %.lr.ph34.split.us.preheader, %._crit_edge30.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge30.us ], [ %indvars.iv89, %.lr.ph34.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv87
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod117, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph34.split.us
  br label %17

; <label>:17:                                     ; preds = %.prol.preheader
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv87
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph34.split.us, %17
  %.lcssa107.unr.ph = phi double [ %22, %17 ], [ undef, %.lr.ph34.split.us ]
  %indvars.iv76.unr.ph = phi i64 [ 1, %17 ], [ 0, %.lr.ph34.split.us ]
  %.127.us.unr.ph = phi double [ %22, %17 ], [ %16, %.lr.ph34.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %14, label %._crit_edge30.us, label %.lr.ph34.split.us.new

.lr.ph34.split.us.new:                            ; preds = %.prol.loopexit
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph34.split.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr.ph, %.lr.ph34.split.us.new ], [ %indvars.iv.next77.1, %23 ]
  %.127.us = phi double [ %.127.us.unr.ph, %.lr.ph34.split.us.new ], [ %37, %23 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv76
  %25 = bitcast double* %24 to <2 x double>*
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv87
  %27 = load double, double* %26, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %28 = load <2 x double>, <2 x double>* %25, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next77, i64 %indvars.iv87
  %30 = load double, double* %29, align 8
  %31 = insertelement <2 x double> undef, double %27, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %28, %32
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fsub double %.127.us, %34
  %37 = fsub double %36, %35
  %exitcond84.1 = icmp eq i64 %indvars.iv.next77, %wide.trip.count83
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  br i1 %exitcond84.1, label %._crit_edge30.us.unr-lcssa, label %23

._crit_edge30.us.unr-lcssa:                       ; preds = %23
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %.prol.loopexit, %._crit_edge30.us.unr-lcssa
  %.lcssa107 = phi double [ %.lcssa107.unr.ph, %.prol.loopexit ], [ %37, %._crit_edge30.us.unr-lcssa ]
  store double %.lcssa107, double* %15, align 8
  %indvars.iv.next88 = add nuw i64 %indvars.iv87, 1
  %38 = icmp slt i64 %indvars.iv.next88, 2000
  br i1 %38, label %.lr.ph34.split.us, label %._crit_edge35.loopexit

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %._crit_edge22
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge22 ], [ 0, %.lr.ph25.preheader ]
  %indvars.iv64 = phi i32 [ %indvars.iv.next65, %._crit_edge22 ], [ -1, %.lr.ph25.preheader ]
  %39 = add i64 %indvars.iv68, 4294967295
  %40 = and i64 %39, 4294967295
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv68
  %42 = load double, double* %41, align 8
  %43 = icmp sgt i64 %indvars.iv68, 0
  br i1 %43, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.lr.ph25
  %wide.trip.count66 = zext i32 %indvars.iv64 to i64
  %44 = and i64 %39, 1
  %lcmp.mod115 = icmp eq i64 %44, 0
  br i1 %lcmp.mod115, label %.lr.ph21.prol.preheader, label %.lr.ph21.prol.loopexit.unr-lcssa

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader
  %45 = load double, double* %11, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %42, %48
  br label %.lr.ph21.prol.loopexit.unr-lcssa

.lr.ph21.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph21.preheader, %.lr.ph21.prol
  %.lcssa106.unr.ph = phi double [ %49, %.lr.ph21.prol ], [ undef, %.lr.ph21.preheader ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %.lr.ph21.prol ], [ 0, %.lr.ph21.preheader ]
  %.019.unr.ph = phi double [ %49, %.lr.ph21.prol ], [ %42, %.lr.ph21.preheader ]
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.unr-lcssa
  %50 = icmp eq i64 %40, 0
  br i1 %50, label %._crit_edge22.loopexit, label %.lr.ph21.preheader.new

.lr.ph21.preheader.new:                           ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21, %.lr.ph21.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph21.preheader.new ], [ %indvars.iv.next60.1, %.lr.ph21 ]
  %.019 = phi double [ %.019.unr.ph, %.lr.ph21.preheader.new ], [ %64, %.lr.ph21 ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv59
  %52 = bitcast double* %51 to <2 x double>*
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv68
  %54 = load double, double* %53, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next60, i64 %indvars.iv68
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %55, %59
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %.019, %61
  %64 = fsub double %63, %62
  %exitcond67.1 = icmp eq i64 %indvars.iv.next60, %wide.trip.count66
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond67.1, label %._crit_edge22.loopexit.unr-lcssa, label %.lr.ph21

._crit_edge22.loopexit.unr-lcssa:                 ; preds = %.lr.ph21
  br label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %.lr.ph21.prol.loopexit, %._crit_edge22.loopexit.unr-lcssa
  %.lcssa106 = phi double [ %.lcssa106.unr.ph, %.lr.ph21.prol.loopexit ], [ %64, %._crit_edge22.loopexit.unr-lcssa ]
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph25
  %.0.lcssa = phi double [ %42, %.lr.ph25 ], [ %.lcssa106, %._crit_edge22.loopexit ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %66 = load double, double* %65, align 8
  %67 = fdiv double %.0.lcssa, %66
  store double %67, double* %41, align 8
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  %68 = icmp slt i64 %indvars.iv.next69, %indvars.iv89
  %indvars.iv.next65 = add nsw i32 %indvars.iv64, 1
  br i1 %68, label %.lr.ph25, label %.lr.ph34.split.us.preheader

.lr.ph34.split:                                   ; preds = %.lr.ph34.split, %.lr.ph34.split.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %.lr.ph34.split.preheader.new ], [ %indvars.iv.next73.7, %.lr.ph34.split ]
  %exitcond74.7 = icmp eq i64 %indvars.iv72, 1992
  %indvars.iv.next73.7 = add i64 %indvars.iv72, 8
  br i1 %exitcond74.7, label %._crit_edge35.loopexit101.unr-lcssa, label %.lr.ph34.split

._crit_edge35.loopexit:                           ; preds = %._crit_edge30.us
  br label %._crit_edge35

._crit_edge35.loopexit101.unr-lcssa:              ; preds = %.lr.ph34.split
  br label %._crit_edge35.loopexit101

._crit_edge35.loopexit101:                        ; preds = %.lr.ph34.split.prol.loopexit, %._crit_edge35.loopexit101.unr-lcssa
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit101, %._crit_edge35.loopexit
  %indvars.iv.next90 = add nuw i64 %indvars.iv89, 1
  %69 = icmp slt i64 %indvars.iv.next90, 2000
  %indvars.iv.next82 = add nsw i32 %indvars.iv81, 1
  br i1 %69, label %._crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge35
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge14
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge14 ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv53 = phi i32 [ %indvars.iv.next54, %._crit_edge14 ], [ -1, %._crit_edge1.preheader ]
  %70 = add i64 %indvars.iv57, 4294967295
  %71 = and i64 %70, 4294967295
  %72 = getelementptr inbounds double, double* %1, i64 %indvars.iv57
  %73 = load double, double* %72, align 8
  %74 = icmp sgt i64 %indvars.iv57, 0
  br i1 %74, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count55 = zext i32 %indvars.iv53 to i64
  %xtraiter108 = and i64 %indvars.iv57, 3
  %lcmp.mod109 = icmp eq i64 %xtraiter108, 0
  br i1 %lcmp.mod109, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol, %.lr.ph13.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %.211.prol = phi double [ %80, %.lr.ph13.prol ], [ %73, %.lr.ph13.prol.preheader ]
  %prol.iter110 = phi i64 [ %prol.iter110.sub, %.lr.ph13.prol ], [ %xtraiter108, %.lr.ph13.prol.preheader ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv48.prol
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %3, i64 %indvars.iv48.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %.211.prol, %79
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter110.sub = add i64 %prol.iter110, -1
  %prol.iter110.cmp = icmp eq i64 %prol.iter110.sub, 0
  br i1 %prol.iter110.cmp, label %.lr.ph13.prol.loopexit.unr-lcssa, label %.lr.ph13.prol, !llvm.loop !22

.lr.ph13.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph13.prol
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.preheader, %.lr.ph13.prol.loopexit.unr-lcssa
  %.lcssa105.unr = phi double [ undef, %.lr.ph13.preheader ], [ %80, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next49.prol, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %.211.unr = phi double [ %73, %.lr.ph13.preheader ], [ %80, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %81 = icmp ult i64 %71, 3
  br i1 %81, label %._crit_edge14.loopexit, label %.lr.ph13.preheader.new

.lr.ph13.preheader.new:                           ; preds = %.lr.ph13.prol.loopexit
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.lr.ph13.preheader.new ], [ %indvars.iv.next49.3, %.lr.ph13 ]
  %.211 = phi double [ %.211.unr, %.lr.ph13.preheader.new ], [ %103, %.lr.ph13 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv48
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %83, align 8
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = fmul <2 x double> %86, %87
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = fsub double %.211, %89
  %92 = fsub double %91, %90
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next49.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next49.1
  %96 = bitcast double* %95 to <2 x double>*
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %exitcond56.3 = icmp eq i64 %indvars.iv.next49.2, %wide.trip.count55
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  br i1 %exitcond56.3, label %._crit_edge14.loopexit.unr-lcssa, label %.lr.ph13

._crit_edge14.loopexit.unr-lcssa:                 ; preds = %.lr.ph13
  br label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.prol.loopexit, %._crit_edge14.loopexit.unr-lcssa
  %.lcssa105 = phi double [ %.lcssa105.unr, %.lr.ph13.prol.loopexit ], [ %103, %._crit_edge14.loopexit.unr-lcssa ]
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %73, %._crit_edge1 ], [ %.lcssa105, %._crit_edge14.loopexit ]
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  store double %.2.lcssa, double* %104, align 8
  %indvars.iv.next58 = add nuw i64 %indvars.iv57, 1
  %105 = icmp slt i64 %indvars.iv.next58, 2000
  %indvars.iv.next54 = add nsw i32 %indvars.iv53, 1
  br i1 %105, label %._crit_edge1, label %._crit_edge14._crit_edge.preheader

._crit_edge14._crit_edge.preheader:               ; preds = %._crit_edge14
  br label %._crit_edge14._crit_edge

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14._crit_edge.preheader, %._crit_edge7._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge14._crit_edge.preheader ], [ %indvar.next, %._crit_edge7._crit_edge ]
  %indvars.iv46 = phi i64 [ 1999, %._crit_edge14._crit_edge.preheader ], [ %indvars.iv.next47, %._crit_edge7._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge14._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge7._crit_edge ]
  %106 = sub i32 2000, %indvar
  %107 = sext i32 %106 to i64
  %108 = sub nsw i64 1999, %107
  %109 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %110 = load double, double* %109, align 8
  %111 = add nsw i64 %indvars.iv46, 1
  %112 = icmp slt i64 %111, 2000
  br i1 %112, label %..lr.ph_crit_edge, label %._crit_edge7.thread

._crit_edge7.thread:                              ; preds = %._crit_edge14._crit_edge
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %114 = load double, double* %113, align 8
  %115 = fdiv double %110, %114
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %115, double* %116, align 8
  br label %._crit_edge7._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge14._crit_edge
  %117 = sext i32 %indvars.iv to i64
  %118 = sub nsw i64 0, %107
  %xtraiter = and i64 %118, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %.lr.ph.prol ], [ %117, %.lr.ph.prol.preheader ]
  %.35.prol = phi double [ %124, %.lr.ph.prol ], [ %110, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44.prol
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %2, i64 %indvars.iv44.prol
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fsub double %.35.prol, %123
  %indvars.iv.next45.prol = add nsw i64 %indvars.iv44.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv44.unr = phi i64 [ %117, %..lr.ph_crit_edge ], [ %indvars.iv.next45.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.35.unr = phi double [ %110, %..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %125 = icmp ult i64 %108, 3
  br i1 %125, label %._crit_edge7, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next45.3, %.lr.ph ]
  %.35 = phi double [ %.35.unr, %..lr.ph_crit_edge.new ], [ %147, %.lr.ph ]
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44
  %127 = bitcast double* %126 to <2 x double>*
  %128 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %127, align 8
  %131 = load <2 x double>, <2 x double>* %129, align 8
  %132 = fmul <2 x double> %130, %131
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fsub double %.35, %133
  %136 = fsub double %135, %134
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next45.1
  %138 = bitcast double* %137 to <2 x double>*
  %139 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45.1
  %140 = bitcast double* %139 to <2 x double>*
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, 3
  %141 = load <2 x double>, <2 x double>* %138, align 8
  %142 = load <2 x double>, <2 x double>* %140, align 8
  %143 = fmul <2 x double> %141, %142
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fsub double %136, %144
  %147 = fsub double %146, %145
  %exitcond.3 = icmp eq i64 %indvars.iv.next45.2, 1999
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, 4
  br i1 %exitcond.3, label %._crit_edge7.unr-lcssa, label %.lr.ph

._crit_edge7.unr-lcssa:                           ; preds = %.lr.ph
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.lr.ph.prol.loopexit, %._crit_edge7.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %147, %._crit_edge7.unr-lcssa ]
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %149 = load double, double* %148, align 8
  %150 = fdiv double %.lcssa, %149
  %151 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %150, double* %151, align 8
  %152 = icmp sgt i64 %indvars.iv46, 0
  br i1 %152, label %._crit_edge7._crit_edge, label %153

._crit_edge7._crit_edge:                          ; preds = %._crit_edge7.thread, %._crit_edge7
  %indvars.iv.next47 = add i64 %indvars.iv46, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge14._crit_edge

; <label>:153:                                    ; preds = %._crit_edge7
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
!23 = distinct !{!23, !21}
