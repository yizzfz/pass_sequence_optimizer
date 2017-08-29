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
  %indvars.iv53 = phi i64 [ 0, %4 ], [ %indvars.iv.next54.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv53
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv53
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %9 = trunc i64 %indvars.iv.next54 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv53
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %12 = trunc i64 %indvars.iv.next54.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond55.1 = icmp eq i64 %indvars.iv.next54, 1999
  br i1 %exitcond55.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv51, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %21
  %22 = ashr exact i64 %sext, 29
  %23 = sub nsw i64 16000, %22
  br label %25

._crit_edge2:                                     ; preds = %25
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %24 = icmp slt i64 %indvars.iv.next52, 2000
  br i1 %24, label %._crit_edge20.._crit_edge1_crit_edge, label %35

; <label>:25:                                     ; preds = %25, %.lr.ph
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %25 ], [ 0, %.lr.ph ]
  %26 = sub nsw i64 0, %indvars.iv41
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv41
  store double %31, double* %32, align 8
  %exitcond45 = icmp eq i64 %indvars.iv41, %indvars.iv51
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  br i1 %exitcond45, label %._crit_edge2, label %25

._crit_edge20.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %33 = bitcast double* %scevgep58 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %33, i8 0, i64 %23, i32 8, i1 false)
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %34, align 8
  br label %.lr.ph

; <label>:35:                                     ; preds = %._crit_edge2
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %36, align 8
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %.._crit_edge3_crit_edge, %35
  %indvars.iv39 = phi i64 [ 0, %35 ], [ %indvars.iv.next40.7, %.._crit_edge3_crit_edge ]
  %38 = mul nuw nsw i64 %indvars.iv39, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %39 = mul nuw nsw i64 %indvars.iv.next40, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.1 = or i64 %indvars.iv39, 2
  %40 = mul nuw nsw i64 %indvars.iv.next40.1, 16000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.2 = or i64 %indvars.iv39, 3
  %41 = mul nuw nsw i64 %indvars.iv.next40.2, 16000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.3 = or i64 %indvars.iv39, 4
  %42 = mul nuw nsw i64 %indvars.iv.next40.3, 16000
  %scevgep.4 = getelementptr i8, i8* %37, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.4 = or i64 %indvars.iv39, 5
  %43 = mul nuw nsw i64 %indvars.iv.next40.4, 16000
  %scevgep.5 = getelementptr i8, i8* %37, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.5 = or i64 %indvars.iv39, 6
  %44 = mul nuw nsw i64 %indvars.iv.next40.5, 16000
  %scevgep.6 = getelementptr i8, i8* %37, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.6 = or i64 %indvars.iv39, 7
  %45 = mul nuw nsw i64 %indvars.iv.next40.6, 16000
  %scevgep.7 = getelementptr i8, i8* %37, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.7 = add nsw i64 %indvars.iv39, 8
  %46 = icmp slt i64 %indvars.iv.next40.7, 2000
  br i1 %46, label %.._crit_edge3_crit_edge, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %.._crit_edge3_crit_edge
  %47 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %96
  %indvars.iv34 = phi i64 [ %50, %96 ], [ 0, %._crit_edge5.preheader ]
  %scevgep62 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv34
  %scevgep6263 = bitcast double* %scevgep62 to i8*
  %50 = add i64 %indvars.iv34, 1
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %50
  %scevgep6465 = bitcast double* %scevgep64 to i8*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv32 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next33, %middle.block ]
  %51 = mul i64 %indvars.iv32, 16000
  %scevgep60 = getelementptr i8, i8* %37, i64 %51
  %52 = add i64 %51, 16000
  %scevgep61 = getelementptr i8, i8* %37, i64 %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv34
  %bound0 = icmp ult i8* %scevgep60, %scevgep6465
  %bound1 = icmp ult i8* %scevgep6263, %scevgep61
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %53 to i8*
  %bound067 = icmp ult i8* %scevgep60, %bc
  %bound168 = icmp ult i8* %bc, %scevgep61
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge7
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge7
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %54 = or i64 %index, 1
  %55 = or i64 %index, 2
  %56 = or i64 %index, 3
  %57 = load double, double* %53, align 8, !alias.scope !1
  %58 = insertelement <2 x double> undef, double %57, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv34
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv34
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %55, i64 %indvars.iv34
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv34
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
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv32, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load71, %73
  store <2 x double> %78, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %79, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %middle.block.loopexit101, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv29 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next30.1, %scalar.ph ]
  %81 = load double, double* %53, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv34
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv32, i64 %indvars.iv29
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %88 = load double, double* %53, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next30, i64 %indvars.iv34
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv32, i64 %indvars.iv.next30
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next30, 1999
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  br i1 %exitcond31.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit101:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit101, %middle.block.loopexit
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %95 = icmp slt i64 %indvars.iv.next33, 2000
  br i1 %95, label %._crit_edge7, label %96

; <label>:96:                                     ; preds = %middle.block
  %97 = icmp slt i64 %50, 2000
  br i1 %97, label %._crit_edge5, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %96
  %98 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %99 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %37 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.preheader, %middle.block73
  %indvars.iv27 = phi i64 [ %105, %middle.block73 ], [ 0, %._crit_edge8.preheader ]
  %scevgep77 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 0
  %scevgep7778 = bitcast double* %scevgep77 to i8*
  %105 = add i64 %indvars.iv27, 1
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %0, i64 %105, i64 0
  %scevgep7980 = bitcast double* %scevgep79 to i8*
  %106 = mul i64 %indvars.iv27, 16000
  %scevgep81 = getelementptr i8, i8* %37, i64 %106
  %107 = add i64 %106, 16000
  %scevgep82 = getelementptr i8, i8* %37, i64 %107
  %bound083 = icmp ult i8* %scevgep7778, %scevgep82
  %bound184 = icmp ult i8* %scevgep81, %scevgep7980
  %memcheck.conflict86 = and i1 %bound083, %bound184
  br i1 %memcheck.conflict86, label %scalar.ph74.preheader, label %vector.body72.preheader

vector.body72.preheader:                          ; preds = %._crit_edge8
  br label %vector.body72

scalar.ph74.preheader:                            ; preds = %._crit_edge8
  br label %scalar.ph74

vector.body72:                                    ; preds = %vector.body72, %vector.body72.preheader
  %index89 = phi i64 [ 0, %vector.body72.preheader ], [ %index.next90.1, %vector.body72 ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv27, i64 %index89
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load97 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load98 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index89
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load97, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load98, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %index.next90 = or i64 %index89, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv27, i64 %index.next90
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load97.1 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !13
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load98.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index.next90
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load97.1, <2 x i64>* %121, align 8, !alias.scope !16, !noalias !13
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load98.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %index.next90.1 = add nsw i64 %index89, 8
  %124 = icmp eq i64 %index.next90.1, 2000
  br i1 %124, label %middle.block73.loopexit100, label %vector.body72, !llvm.loop !18

scalar.ph74:                                      ; preds = %scalar.ph74, %scalar.ph74.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph74.preheader ], [ %indvars.iv.next.4, %scalar.ph74 ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv27, i64 %indvars.iv
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block73.loopexit, label %scalar.ph74, !llvm.loop !19

middle.block73.loopexit:                          ; preds = %scalar.ph74
  br label %middle.block73

middle.block73.loopexit100:                       ; preds = %vector.body72
  br label %middle.block73

middle.block73:                                   ; preds = %middle.block73.loopexit100, %middle.block73.loopexit
  %150 = icmp slt i64 %105, 2000
  br i1 %150, label %._crit_edge8, label %151

; <label>:151:                                    ; preds = %middle.block73
  tail call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38, %4
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge38 ], [ 4294967295, %4 ]
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge38 ], [ 0, %4 ]
  %5 = sub i64 2000, %indvars.iv81
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = sub i64 2000, %indvars.iv81
  %9 = and i64 %indvars.iv90, 4294967295
  %10 = icmp sgt i64 %indvars.iv81, 0
  br i1 %10, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph28.preheader:                               ; preds = %._crit_edge
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 0
  br label %.lr.ph28

.lr.ph37.split.preheader:                         ; preds = %.lr.ph37..lr.ph37.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %8, 4
  br i1 %min.iters.check, label %.lr.ph37.split.preheader105, label %min.iters.checked

.lr.ph37.split.preheader105:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph37.split.preheader
  %indvars.iv68.ph = phi i64 [ %indvars.iv81, %min.iters.checked ], [ %indvars.iv81, %.lr.ph37.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph37.split

min.iters.checked:                                ; preds = %.lr.ph37.split.preheader
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv81, %n.vec
  br i1 %cmp.zero, label %.lr.ph37.split.preheader105, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = and i64 %7, 1
  %lcmp.mod119 = icmp eq i64 %12, 0
  br i1 %lcmp.mod119, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv81
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load104.prol = load <2 x i64>, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load104.prol, <2 x i64>* %16, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %7, 0
  br i1 %17, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %18 = add i64 %indvars.iv81, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %18
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load104, <2 x i64>* %22, align 8
  %index.next = add i64 %index, 4
  %23 = add i64 %indvars.iv81, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %23
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load104.1, <2 x i64>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = icmp eq i64 %index.next.1, %n.vec
  br i1 %28, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %8, %n.vec
  br i1 %cmp.n, label %._crit_edge38, label %.lr.ph37.split.preheader105

.lr.ph37:                                         ; preds = %._crit_edge25
  br i1 true, label %.lr.ph37.split.us.preheader, label %.lr.ph37..lr.ph37.split.preheader_crit_edge

.lr.ph37..lr.ph37.split.preheader_crit_edge:      ; preds = %.lr.ph37
  br label %.lr.ph37.split.preheader

.lr.ph37.split.us.preheader:                      ; preds = %.lr.ph37
  %29 = and i64 %indvars.iv90, 1
  %lcmp.mod121 = icmp eq i64 %29, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 0
  %31 = icmp eq i64 %9, 0
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %.lr.ph37.split.us.preheader, %._crit_edge33.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge33.us ], [ %indvars.iv81, %.lr.ph37.split.us.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv79
  %33 = load double, double* %32, align 8
  br i1 %lcmp.mod121, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph37.split.us
  br label %34

; <label>:34:                                     ; preds = %.prol.preheader
  %35 = load double, double* %30, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv79
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %33, %38
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph37.split.us, %34
  %.lcssa112.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph37.split.us ]
  %indvars.iv71.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph37.split.us ]
  %.130.us.unr.ph = phi double [ %39, %34 ], [ %33, %.lr.ph37.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %31, label %._crit_edge33.us, label %.lr.ph37.split.us.new

.lr.ph37.split.us.new:                            ; preds = %.prol.loopexit
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph37.split.us.new
  %indvars.iv71 = phi i64 [ %indvars.iv71.unr.ph, %.lr.ph37.split.us.new ], [ %indvars.iv.next72.1, %40 ]
  %.130.us = phi double [ %.130.us.unr.ph, %.lr.ph37.split.us.new ], [ %54, %40 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv71
  %42 = bitcast double* %41 to <2 x double>*
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv79
  %44 = load double, double* %43, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %45 = load <2 x double>, <2 x double>* %42, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next72, i64 %indvars.iv79
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %45, %49
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fsub double %.130.us, %51
  %54 = fsub double %53, %52
  %exitcond92.1 = icmp eq i64 %indvars.iv.next72, %9
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  br i1 %exitcond92.1, label %._crit_edge33.us.unr-lcssa, label %40

._crit_edge33.us.unr-lcssa:                       ; preds = %40
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %.prol.loopexit, %._crit_edge33.us.unr-lcssa
  %.lcssa112 = phi double [ %.lcssa112.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge33.us.unr-lcssa ]
  store double %.lcssa112, double* %32, align 8
  %indvars.iv.next80 = add nuw i64 %indvars.iv79, 1
  %55 = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %55, label %.lr.ph37.split.us, label %._crit_edge38.loopexit

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %._crit_edge25
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge25 ], [ 4294967295, %.lr.ph28.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge25 ], [ 0, %.lr.ph28.preheader ]
  %56 = and i64 %indvars.iv86, 4294967295
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv64
  %58 = load double, double* %57, align 8
  %59 = icmp sgt i64 %indvars.iv64, 0
  br i1 %59, label %.lr.ph24.preheader, label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %60 = and i64 %indvars.iv86, 1
  %lcmp.mod117 = icmp eq i64 %60, 0
  br i1 %lcmp.mod117, label %.lr.ph24.prol.preheader, label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader
  %61 = load double, double* %11, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %58, %64
  br label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph24.preheader, %.lr.ph24.prol
  %.lcssa111.unr.ph = phi double [ %65, %.lr.ph24.prol ], [ undef, %.lr.ph24.preheader ]
  %indvars.iv58.unr.ph = phi i64 [ 1, %.lr.ph24.prol ], [ 0, %.lr.ph24.preheader ]
  %.022.unr.ph = phi double [ %65, %.lr.ph24.prol ], [ %58, %.lr.ph24.preheader ]
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.unr-lcssa
  %66 = icmp eq i64 %56, 0
  br i1 %66, label %._crit_edge25.loopexit, label %.lr.ph24.preheader.new

.lr.ph24.preheader.new:                           ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24, %.lr.ph24.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr.ph, %.lr.ph24.preheader.new ], [ %indvars.iv.next59.1, %.lr.ph24 ]
  %.022 = phi double [ %.022.unr.ph, %.lr.ph24.preheader.new ], [ %80, %.lr.ph24 ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv58
  %68 = bitcast double* %67 to <2 x double>*
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 %indvars.iv64
  %70 = load double, double* %69, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %71 = load <2 x double>, <2 x double>* %68, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next59, i64 %indvars.iv64
  %73 = load double, double* %72, align 8
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fmul <2 x double> %71, %75
  %77 = extractelement <2 x double> %76, i32 0
  %78 = extractelement <2 x double> %76, i32 1
  %79 = fsub double %.022, %77
  %80 = fsub double %79, %78
  %exitcond88.1 = icmp eq i64 %indvars.iv.next59, %56
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  br i1 %exitcond88.1, label %._crit_edge25.loopexit.unr-lcssa, label %.lr.ph24

._crit_edge25.loopexit.unr-lcssa:                 ; preds = %.lr.ph24
  br label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.prol.loopexit, %._crit_edge25.loopexit.unr-lcssa
  %.lcssa111 = phi double [ %.lcssa111.unr.ph, %.lr.ph24.prol.loopexit ], [ %80, %._crit_edge25.loopexit.unr-lcssa ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.lr.ph28
  %.0.lcssa = phi double [ %58, %.lr.ph28 ], [ %.lcssa111, %._crit_edge25.loopexit ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %82 = load double, double* %81, align 8
  %83 = fdiv double %.0.lcssa, %82
  store double %83, double* %57, align 8
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %84 = icmp slt i64 %indvars.iv.next65, %indvars.iv81
  %indvars.iv.next87 = add nuw nsw i64 %56, 1
  br i1 %84, label %.lr.ph28, label %.lr.ph37

.lr.ph37.split:                                   ; preds = %.lr.ph37.split.preheader105, %.lr.ph37.split
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.lr.ph37.split ], [ %indvars.iv68.ph, %.lr.ph37.split.preheader105 ]
  %exitcond70 = icmp eq i64 %indvars.iv68, 1999
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  br i1 %exitcond70, label %._crit_edge38.loopexit106, label %.lr.ph37.split, !llvm.loop !21

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit106:                        ; preds = %.lr.ph37.split
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit106, %._crit_edge38.loopexit, %middle.block
  %indvars.iv.next82 = add nuw i64 %indvars.iv81, 1
  %85 = icmp slt i64 %indvars.iv.next82, 2000
  %indvars.iv.next91 = add nuw nsw i64 %9, 1
  br i1 %85, label %._crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge17
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge17 ], [ 4294967295, %._crit_edge1.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge17 ], [ 0, %._crit_edge1.preheader ]
  %86 = and i64 %indvars.iv83, 4294967295
  %87 = getelementptr inbounds double, double* %1, i64 %indvars.iv56
  %88 = load double, double* %87, align 8
  %89 = icmp sgt i64 %indvars.iv56, 0
  br i1 %89, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %90 = add nsw i64 %indvars.iv83, 1
  %xtraiter113 = and i64 %90, 3
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph16.prol.loopexit, label %.lr.ph16.prol.preheader

.lr.ph16.prol.preheader:                          ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol

.lr.ph16.prol:                                    ; preds = %.lr.ph16.prol, %.lr.ph16.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph16.prol ], [ 0, %.lr.ph16.prol.preheader ]
  %.214.prol = phi double [ %96, %.lr.ph16.prol ], [ %88, %.lr.ph16.prol.preheader ]
  %prol.iter115 = phi i64 [ %prol.iter115.sub, %.lr.ph16.prol ], [ %xtraiter113, %.lr.ph16.prol.preheader ]
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv51.prol
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %3, i64 %indvars.iv51.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %.214.prol, %95
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph16.prol.loopexit.unr-lcssa, label %.lr.ph16.prol, !llvm.loop !23

.lr.ph16.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.preheader, %.lr.ph16.prol.loopexit.unr-lcssa
  %.lcssa110.unr = phi double [ undef, %.lr.ph16.preheader ], [ %96, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph16.preheader ], [ %indvars.iv.next52.prol, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %.214.unr = phi double [ %88, %.lr.ph16.preheader ], [ %96, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %97 = icmp ult i64 %86, 3
  br i1 %97, label %._crit_edge17.loopexit, label %.lr.ph16.preheader.new

.lr.ph16.preheader.new:                           ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16, %.lr.ph16.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.lr.ph16.preheader.new ], [ %indvars.iv.next52.3, %.lr.ph16 ]
  %.214 = phi double [ %.214.unr, %.lr.ph16.preheader.new ], [ %119, %.lr.ph16 ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv51
  %99 = bitcast double* %98 to <2 x double>*
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %101 = bitcast double* %100 to <2 x double>*
  %102 = load <2 x double>, <2 x double>* %99, align 8
  %103 = load <2 x double>, <2 x double>* %101, align 8
  %104 = fmul <2 x double> %102, %103
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fsub double %.214, %105
  %108 = fsub double %107, %106
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv.next52.1
  %110 = bitcast double* %109 to <2 x double>*
  %111 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next52.1
  %112 = bitcast double* %111 to <2 x double>*
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %113 = load <2 x double>, <2 x double>* %110, align 8
  %114 = load <2 x double>, <2 x double>* %112, align 8
  %115 = fmul <2 x double> %113, %114
  %116 = extractelement <2 x double> %115, i32 0
  %117 = extractelement <2 x double> %115, i32 1
  %118 = fsub double %108, %116
  %119 = fsub double %118, %117
  %exitcond85.3 = icmp eq i64 %indvars.iv.next52.2, %86
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  br i1 %exitcond85.3, label %._crit_edge17.loopexit.unr-lcssa, label %.lr.ph16

._crit_edge17.loopexit.unr-lcssa:                 ; preds = %.lr.ph16
  br label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %.lr.ph16.prol.loopexit, %._crit_edge17.loopexit.unr-lcssa
  %.lcssa110 = phi double [ %.lcssa110.unr, %.lr.ph16.prol.loopexit ], [ %119, %._crit_edge17.loopexit.unr-lcssa ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %88, %._crit_edge1 ], [ %.lcssa110, %._crit_edge17.loopexit ]
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv56
  store double %.2.lcssa, double* %120, align 8
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %121 = icmp slt i64 %indvars.iv.next57, 2000
  %indvars.iv.next84 = add nuw nsw i64 %86, 1
  br i1 %121, label %._crit_edge1, label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge3.preheader ], [ %indvar.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv48 = phi i64 [ 1999, %._crit_edge3.preheader ], [ %indvars.iv.next49, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %122 = sub i32 2000, %indvar
  %123 = sext i32 %122 to i64
  %124 = sub nsw i64 1999, %123
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %126 = load double, double* %125, align 8
  %127 = add nsw i64 %indvars.iv48, 1
  %128 = icmp slt i64 %127, 2000
  br i1 %128, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %130 = load double, double* %129, align 8
  %131 = fdiv double %126, %130
  %132 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %131, double* %132, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %133 = sext i32 %indvars.iv to i64
  %134 = sub nsw i64 0, %123
  %xtraiter = and i64 %134, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge3..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph.prol ], [ %133, %.lr.ph.prol.preheader ]
  %.37.prol = phi double [ %140, %.lr.ph.prol ], [ %126, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46.prol
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %2, i64 %indvars.iv46.prol
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fsub double %.37.prol, %139
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge3..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge3..lr.ph_crit_edge ], [ %140, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv46.unr = phi i64 [ %133, %._crit_edge3..lr.ph_crit_edge ], [ %indvars.iv.next47.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.37.unr = phi double [ %126, %._crit_edge3..lr.ph_crit_edge ], [ %140, %.lr.ph.prol.loopexit.unr-lcssa ]
  %141 = icmp ult i64 %124, 3
  br i1 %141, label %._crit_edge10, label %._crit_edge3..lr.ph_crit_edge.new

._crit_edge3..lr.ph_crit_edge.new:                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge3..lr.ph_crit_edge.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %indvars.iv.next47.3, %.lr.ph ]
  %.37 = phi double [ %.37.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %163, %.lr.ph ]
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46
  %143 = bitcast double* %142 to <2 x double>*
  %144 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  %145 = bitcast double* %144 to <2 x double>*
  %146 = load <2 x double>, <2 x double>* %143, align 8
  %147 = load <2 x double>, <2 x double>* %145, align 8
  %148 = fmul <2 x double> %146, %147
  %149 = extractelement <2 x double> %148, i32 0
  %150 = extractelement <2 x double> %148, i32 1
  %151 = fsub double %.37, %149
  %152 = fsub double %151, %150
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next47.1
  %154 = bitcast double* %153 to <2 x double>*
  %155 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next47.1
  %156 = bitcast double* %155 to <2 x double>*
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %157 = load <2 x double>, <2 x double>* %154, align 8
  %158 = load <2 x double>, <2 x double>* %156, align 8
  %159 = fmul <2 x double> %157, %158
  %160 = extractelement <2 x double> %159, i32 0
  %161 = extractelement <2 x double> %159, i32 1
  %162 = fsub double %152, %160
  %163 = fsub double %162, %161
  %exitcond.3 = icmp eq i64 %indvars.iv.next47.2, 1999
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  br i1 %exitcond.3, label %._crit_edge10.unr-lcssa, label %.lr.ph

._crit_edge10.unr-lcssa:                          ; preds = %.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge10.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %163, %._crit_edge10.unr-lcssa ]
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %165 = load double, double* %164, align 8
  %166 = fdiv double %.lcssa, %165
  %167 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %166, double* %167, align 8
  %168 = icmp sgt i64 %indvars.iv48, 0
  br i1 %168, label %._crit_edge10.._crit_edge3_crit_edge, label %169

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10.thread, %._crit_edge10
  %indvars.iv.next49 = add i64 %indvars.iv48, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge3

; <label>:169:                                    ; preds = %._crit_edge10
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
