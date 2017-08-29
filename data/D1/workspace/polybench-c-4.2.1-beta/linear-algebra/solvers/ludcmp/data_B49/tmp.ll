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
  %22 = sub i64 1998, %indvars.iv51
  %23 = shl i64 %22, 3
  br label %25

._crit_edge2:                                     ; preds = %25
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %24 = icmp slt i64 %indvars.iv.next52, 2000
  br i1 %24, label %._crit_edge20.._crit_edge1_crit_edge, label %36

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
  %33 = and i64 %23, 34359738360
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %21
  %34 = add nuw nsw i64 %33, 8
  %scevgep5859 = bitcast double* %scevgep58 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep5859, i8 0, i64 %34, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph

; <label>:36:                                     ; preds = %._crit_edge2
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %37, align 8
  %38 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %39

; <label>:39:                                     ; preds = %39, %36
  %indvars.iv39 = phi i64 [ 0, %36 ], [ %indvars.iv.next40.7, %39 ]
  %40 = mul nuw nsw i64 %indvars.iv39, 16000
  %scevgep = getelementptr i8, i8* %38, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %41 = mul nuw nsw i64 %indvars.iv.next40, 16000
  %scevgep.1 = getelementptr i8, i8* %38, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.1 = or i64 %indvars.iv39, 2
  %42 = mul nuw nsw i64 %indvars.iv.next40.1, 16000
  %scevgep.2 = getelementptr i8, i8* %38, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.2 = or i64 %indvars.iv39, 3
  %43 = mul nuw nsw i64 %indvars.iv.next40.2, 16000
  %scevgep.3 = getelementptr i8, i8* %38, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.3 = or i64 %indvars.iv39, 4
  %44 = mul nuw nsw i64 %indvars.iv.next40.3, 16000
  %scevgep.4 = getelementptr i8, i8* %38, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.4 = or i64 %indvars.iv39, 5
  %45 = mul nuw nsw i64 %indvars.iv.next40.4, 16000
  %scevgep.5 = getelementptr i8, i8* %38, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.5 = or i64 %indvars.iv39, 6
  %46 = mul nuw nsw i64 %indvars.iv.next40.5, 16000
  %scevgep.6 = getelementptr i8, i8* %38, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next40.6 = or i64 %indvars.iv39, 7
  %47 = mul nuw nsw i64 %indvars.iv.next40.6, 16000
  %scevgep.7 = getelementptr i8, i8* %38, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond60.7 = icmp eq i64 %indvars.iv.next40.6, 1999
  %indvars.iv.next40.7 = add nsw i64 %indvars.iv39, 8
  br i1 %exitcond60.7, label %._crit_edge5.preheader, label %39

._crit_edge5.preheader:                           ; preds = %39
  %48 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %96
  %indvars.iv34 = phi i64 [ %51, %96 ], [ 0, %._crit_edge5.preheader ]
  %scevgep66 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv34
  %scevgep6667 = bitcast double* %scevgep66 to i8*
  %51 = add i64 %indvars.iv34, 1
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %51
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %middle.block, %._crit_edge5
  %indvars.iv32 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next33, %middle.block ]
  %52 = mul i64 %indvars.iv32, 16000
  %scevgep64 = getelementptr i8, i8* %38, i64 %52
  %53 = add i64 %52, 16000
  %scevgep65 = getelementptr i8, i8* %38, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv34
  %bound0 = icmp ult i8* %scevgep64, %scevgep6869
  %bound1 = icmp ult i8* %scevgep6667, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
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
  %55 = or i64 %index, 1
  %56 = or i64 %index, 2
  %57 = or i64 %index, 3
  %58 = load double, double* %54, align 8, !alias.scope !1
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv34
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %55, i64 %indvars.iv34
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv34
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv34
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = fmul <2 x double> %60, %70
  %74 = fmul <2 x double> %60, %72
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv32, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = fadd <2 x double> %wide.load, %73
  %80 = fadd <2 x double> %wide.load75, %74
  store <2 x double> %79, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %80, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %middle.block.loopexit105, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv29 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next30.1, %scalar.ph ]
  %82 = load double, double* %54, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv34
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv32, i64 %indvars.iv29
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %89 = load double, double* %54, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next30, i64 %indvars.iv34
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv32, i64 %indvars.iv.next30
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next30, 1999
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  br i1 %exitcond31.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit105:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit105, %middle.block.loopexit
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond62, label %96, label %._crit_edge7

; <label>:96:                                     ; preds = %middle.block
  %exitcond63 = icmp eq i64 %51, 2000
  br i1 %exitcond63, label %._crit_edge8.preheader, label %._crit_edge5

._crit_edge8.preheader:                           ; preds = %96
  %97 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %98 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %99 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.preheader, %middle.block77
  %indvars.iv27 = phi i64 [ %104, %middle.block77 ], [ 0, %._crit_edge8.preheader ]
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 0
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %104 = add i64 %indvars.iv27, 1
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %104, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %105 = mul i64 %indvars.iv27, 16000
  %scevgep85 = getelementptr i8, i8* %38, i64 %105
  %106 = add i64 %105, 16000
  %scevgep86 = getelementptr i8, i8* %38, i64 %106
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
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv27, i64 %index93
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load101 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load102 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index93
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load101, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load102, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %index.next94 = or i64 %index93, 4
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv27, i64 %index.next94
  %116 = bitcast double* %115 to <2 x i64>*
  %wide.load101.1 = load <2 x i64>, <2 x i64>* %116, align 8, !alias.scope !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load102.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %index.next94
  %120 = bitcast double* %119 to <2 x i64>*
  store <2 x i64> %wide.load101.1, <2 x i64>* %120, align 8, !alias.scope !16, !noalias !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load102.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %index.next94.1 = add nsw i64 %index93, 8
  %123 = icmp eq i64 %index.next94.1, 2000
  br i1 %123, label %middle.block77.loopexit104, label %vector.body76, !llvm.loop !18

scalar.ph78:                                      ; preds = %scalar.ph78, %scalar.ph78.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph78.preheader ], [ %indvars.iv.next.4, %scalar.ph78 ]
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv27, i64 %indvars.iv
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %144 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %145 = bitcast double* %144 to i64*
  %146 = load i64, i64* %145, align 8
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv.next.3
  %148 = bitcast double* %147 to i64*
  store i64 %146, i64* %148, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block77.loopexit, label %scalar.ph78, !llvm.loop !19

middle.block77.loopexit:                          ; preds = %scalar.ph78
  br label %middle.block77

middle.block77.loopexit104:                       ; preds = %vector.body76
  br label %middle.block77

middle.block77:                                   ; preds = %middle.block77.loopexit104, %middle.block77.loopexit
  %exitcond61 = icmp eq i64 %104, 2000
  br i1 %exitcond61, label %149, label %._crit_edge8

; <label>:149:                                    ; preds = %middle.block77
  tail call void @free(i8* nonnull %38) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38, %4
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge38 ], [ 0, %4 ]
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %._crit_edge38 ], [ 4294967295, %4 ]
  %5 = sub i64 2000, %indvars.iv104
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = sub i64 2000, %indvars.iv104
  %9 = and i64 %indvars.iv91, 4294967295
  %10 = icmp sgt i64 %indvars.iv104, 0
  br i1 %10, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph28.preheader:                               ; preds = %._crit_edge
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 0
  br label %.lr.ph28

.lr.ph37.split.preheader:                         ; preds = %.lr.ph37..lr.ph37.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %8, 4
  br i1 %min.iters.check, label %.lr.ph37.split.preheader112, label %min.iters.checked

.lr.ph37.split.preheader112:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph37.split.preheader
  %indvars.iv69.ph = phi i64 [ %indvars.iv104, %min.iters.checked ], [ %indvars.iv104, %.lr.ph37.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph37.split

min.iters.checked:                                ; preds = %.lr.ph37.split.preheader
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv104, %n.vec
  br i1 %cmp.zero, label %.lr.ph37.split.preheader112, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = and i64 %7, 1
  %lcmp.mod126 = icmp eq i64 %12, 0
  br i1 %lcmp.mod126, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv104
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load111.prol = load <2 x i64>, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load111.prol, <2 x i64>* %16, align 8
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
  %18 = add i64 %indvars.iv104, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %18
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load111 = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load111, <2 x i64>* %22, align 8
  %index.next = add i64 %index, 4
  %23 = add i64 %indvars.iv104, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %23
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load111.1 = load <2 x i64>, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load111.1, <2 x i64>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = icmp eq i64 %index.next.1, %n.vec
  br i1 %28, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %8, %n.vec
  br i1 %cmp.n, label %._crit_edge38, label %.lr.ph37.split.preheader112

.lr.ph37:                                         ; preds = %._crit_edge25
  br i1 true, label %.lr.ph37.split.us.preheader, label %.lr.ph37..lr.ph37.split.preheader_crit_edge

.lr.ph37.split.us.preheader:                      ; preds = %.lr.ph37
  %29 = and i64 %indvars.iv91, 1
  %lcmp.mod128 = icmp eq i64 %29, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 0
  %31 = icmp eq i64 %9, 0
  br label %.lr.ph37.split.us

.lr.ph37..lr.ph37.split.preheader_crit_edge:      ; preds = %.lr.ph37
  br label %.lr.ph37.split.preheader

.lr.ph37.split.us:                                ; preds = %.lr.ph37.split.us.preheader, %._crit_edge33.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge33.us ], [ %indvars.iv104, %.lr.ph37.split.us.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv80
  %33 = load double, double* %32, align 8
  br i1 %lcmp.mod128, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph37.split.us
  br label %34

; <label>:34:                                     ; preds = %.prol.preheader
  %35 = load double, double* %30, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv80
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %33, %38
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph37.split.us, %34
  %.lcssa119.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph37.split.us ]
  %indvars.iv72.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph37.split.us ]
  %.130.us.unr.ph = phi double [ %39, %34 ], [ %33, %.lr.ph37.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %31, label %._crit_edge33.us, label %.lr.ph37.split.us.new

.lr.ph37.split.us.new:                            ; preds = %.prol.loopexit
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph37.split.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr.ph, %.lr.ph37.split.us.new ], [ %indvars.iv.next73.1, %40 ]
  %.130.us = phi double [ %.130.us.unr.ph, %.lr.ph37.split.us.new ], [ %54, %40 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv72
  %42 = bitcast double* %41 to <2 x double>*
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv80
  %44 = load double, double* %43, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %45 = load <2 x double>, <2 x double>* %42, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next73, i64 %indvars.iv80
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %45, %49
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fsub double %.130.us, %51
  %54 = fsub double %53, %52
  %exitcond93.1 = icmp eq i64 %indvars.iv.next73, %9
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  br i1 %exitcond93.1, label %._crit_edge33.us.unr-lcssa, label %40

._crit_edge33.us.unr-lcssa:                       ; preds = %40
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %.prol.loopexit, %._crit_edge33.us.unr-lcssa
  %.lcssa119 = phi double [ %.lcssa119.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge33.us.unr-lcssa ]
  store double %.lcssa119, double* %32, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond98, label %._crit_edge38.loopexit, label %.lr.ph37.split.us

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %._crit_edge25
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge25 ], [ 4294967295, %.lr.ph28.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge25 ], [ 0, %.lr.ph28.preheader ]
  %55 = and i64 %indvars.iv88, 4294967295
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv65
  %57 = load double, double* %56, align 8
  %58 = icmp sgt i64 %indvars.iv65, 0
  br i1 %58, label %.lr.ph24.preheader, label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %59 = and i64 %indvars.iv88, 1
  %lcmp.mod124 = icmp eq i64 %59, 0
  br i1 %lcmp.mod124, label %.lr.ph24.prol.preheader, label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader
  %60 = load double, double* %11, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv65
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %57, %63
  br label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph24.preheader, %.lr.ph24.prol
  %.lcssa118.unr.ph = phi double [ %64, %.lr.ph24.prol ], [ undef, %.lr.ph24.preheader ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %.lr.ph24.prol ], [ 0, %.lr.ph24.preheader ]
  %.022.unr.ph = phi double [ %64, %.lr.ph24.prol ], [ %57, %.lr.ph24.preheader ]
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.unr-lcssa
  %65 = icmp eq i64 %55, 0
  br i1 %65, label %._crit_edge25.loopexit, label %.lr.ph24.preheader.new

.lr.ph24.preheader.new:                           ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24, %.lr.ph24.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph24.preheader.new ], [ %indvars.iv.next60.1, %.lr.ph24 ]
  %.022 = phi double [ %.022.unr.ph, %.lr.ph24.preheader.new ], [ %79, %.lr.ph24 ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv59
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv65
  %69 = load double, double* %68, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %70 = load <2 x double>, <2 x double>* %67, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next60, i64 %indvars.iv65
  %72 = load double, double* %71, align 8
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = fmul <2 x double> %70, %74
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fsub double %.022, %76
  %79 = fsub double %78, %77
  %exitcond90.1 = icmp eq i64 %indvars.iv.next60, %55
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond90.1, label %._crit_edge25.loopexit.unr-lcssa, label %.lr.ph24

._crit_edge25.loopexit.unr-lcssa:                 ; preds = %.lr.ph24
  br label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.prol.loopexit, %._crit_edge25.loopexit.unr-lcssa
  %.lcssa118 = phi double [ %.lcssa118.unr.ph, %.lr.ph24.prol.loopexit ], [ %79, %._crit_edge25.loopexit.unr-lcssa ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.lr.ph28
  %.0.lcssa = phi double [ %57, %.lr.ph28 ], [ %.lcssa118, %._crit_edge25.loopexit ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %81 = load double, double* %80, align 8
  %82 = fdiv double %.0.lcssa, %81
  store double %82, double* %56, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %indvars.iv.next89 = add nuw nsw i64 %55, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next66, %indvars.iv104
  br i1 %exitcond106, label %.lr.ph37, label %.lr.ph28

.lr.ph37.split:                                   ; preds = %.lr.ph37.split.preheader112, %.lr.ph37.split
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %.lr.ph37.split ], [ %indvars.iv69.ph, %.lr.ph37.split.preheader112 ]
  %exitcond71 = icmp eq i64 %indvars.iv69, 1999
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br i1 %exitcond71, label %._crit_edge38.loopexit113, label %.lr.ph37.split, !llvm.loop !21

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit113:                        ; preds = %.lr.ph37.split
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit113, %._crit_edge38.loopexit, %middle.block
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %indvars.iv.next92 = add nuw nsw i64 %9, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge1.preheader, label %._crit_edge

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge17
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge17 ], [ 4294967295, %._crit_edge1.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge17 ], [ 0, %._crit_edge1.preheader ]
  %83 = and i64 %indvars.iv85, 4294967295
  %84 = getelementptr inbounds double, double* %1, i64 %indvars.iv57
  %85 = load double, double* %84, align 8
  %86 = icmp sgt i64 %indvars.iv57, 0
  br i1 %86, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %87 = add nsw i64 %indvars.iv85, 1
  %xtraiter120 = and i64 %87, 3
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  br i1 %lcmp.mod121, label %.lr.ph16.prol.loopexit, label %.lr.ph16.prol.preheader

.lr.ph16.prol.preheader:                          ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol

.lr.ph16.prol:                                    ; preds = %.lr.ph16.prol, %.lr.ph16.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph16.prol ], [ 0, %.lr.ph16.prol.preheader ]
  %.214.prol = phi double [ %93, %.lr.ph16.prol ], [ %85, %.lr.ph16.prol.preheader ]
  %prol.iter122 = phi i64 [ %prol.iter122.sub, %.lr.ph16.prol ], [ %xtraiter120, %.lr.ph16.prol.preheader ]
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv52.prol
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv52.prol
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fsub double %.214.prol, %92
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter122.sub = add i64 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i64 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %.lr.ph16.prol.loopexit.unr-lcssa, label %.lr.ph16.prol, !llvm.loop !23

.lr.ph16.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.preheader, %.lr.ph16.prol.loopexit.unr-lcssa
  %.lcssa117.unr = phi double [ undef, %.lr.ph16.preheader ], [ %93, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %indvars.iv52.unr = phi i64 [ 0, %.lr.ph16.preheader ], [ %indvars.iv.next53.prol, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %.214.unr = phi double [ %85, %.lr.ph16.preheader ], [ %93, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %94 = icmp ult i64 %83, 3
  br i1 %94, label %._crit_edge17.loopexit, label %.lr.ph16.preheader.new

.lr.ph16.preheader.new:                           ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16, %.lr.ph16.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %.lr.ph16.preheader.new ], [ %indvars.iv.next53.3, %.lr.ph16 ]
  %.214 = phi double [ %.214.unr, %.lr.ph16.preheader.new ], [ %116, %.lr.ph16 ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv52
  %96 = bitcast double* %95 to <2 x double>*
  %97 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  %98 = bitcast double* %97 to <2 x double>*
  %99 = load <2 x double>, <2 x double>* %96, align 8
  %100 = load <2 x double>, <2 x double>* %98, align 8
  %101 = fmul <2 x double> %99, %100
  %102 = extractelement <2 x double> %101, i32 0
  %103 = extractelement <2 x double> %101, i32 1
  %104 = fsub double %.214, %102
  %105 = fsub double %104, %103
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next53.1
  %107 = bitcast double* %106 to <2 x double>*
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.1
  %109 = bitcast double* %108 to <2 x double>*
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %110 = load <2 x double>, <2 x double>* %107, align 8
  %111 = load <2 x double>, <2 x double>* %109, align 8
  %112 = fmul <2 x double> %110, %111
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = fsub double %105, %113
  %116 = fsub double %115, %114
  %exitcond87.3 = icmp eq i64 %indvars.iv.next53.2, %83
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond87.3, label %._crit_edge17.loopexit.unr-lcssa, label %.lr.ph16

._crit_edge17.loopexit.unr-lcssa:                 ; preds = %.lr.ph16
  br label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %.lr.ph16.prol.loopexit, %._crit_edge17.loopexit.unr-lcssa
  %.lcssa117 = phi double [ %.lcssa117.unr, %.lr.ph16.prol.loopexit ], [ %116, %._crit_edge17.loopexit.unr-lcssa ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %85, %._crit_edge1 ], [ %.lcssa117, %._crit_edge17.loopexit ]
  %117 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  store double %.2.lcssa, double* %117, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %indvars.iv.next86 = add nuw nsw i64 %83, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond103, label %._crit_edge3.preheader, label %._crit_edge1

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge3.preheader ], [ %indvar.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv49 = phi i64 [ 1999, %._crit_edge3.preheader ], [ %indvars.iv.next50, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %118 = sub i32 2000, %indvar
  %119 = sext i32 %118 to i64
  %120 = sub nsw i64 1999, %119
  %121 = getelementptr inbounds double, double* %3, i64 %indvars.iv49
  %122 = load double, double* %121, align 8
  %123 = add nsw i64 %indvars.iv49, 1
  %124 = icmp slt i64 %123, 2000
  br i1 %124, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %126 = load double, double* %125, align 8
  %127 = fdiv double %122, %126
  %128 = getelementptr inbounds double, double* %2, i64 %indvars.iv49
  store double %127, double* %128, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %129 = sext i32 %indvars.iv to i64
  %130 = sub nsw i64 0, %119
  %xtraiter = and i64 %130, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge3..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %.37.prol = phi double [ %136, %.lr.ph.prol ], [ %122, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds double, double* %2, i64 %indvars.iv47.prol
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fsub double %.37.prol, %135
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge3..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge3..lr.ph_crit_edge ], [ %136, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv47.unr = phi i64 [ %129, %._crit_edge3..lr.ph_crit_edge ], [ %indvars.iv.next48.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.37.unr = phi double [ %122, %._crit_edge3..lr.ph_crit_edge ], [ %136, %.lr.ph.prol.loopexit.unr-lcssa ]
  %137 = icmp ult i64 %120, 3
  br i1 %137, label %._crit_edge10, label %._crit_edge3..lr.ph_crit_edge.new

._crit_edge3..lr.ph_crit_edge.new:                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge3..lr.ph_crit_edge.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %indvars.iv.next48.3, %.lr.ph ]
  %.37 = phi double [ %.37.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %159, %.lr.ph ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv47
  %139 = bitcast double* %138 to <2 x double>*
  %140 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %139, align 8
  %143 = load <2 x double>, <2 x double>* %141, align 8
  %144 = fmul <2 x double> %142, %143
  %145 = extractelement <2 x double> %144, i32 0
  %146 = extractelement <2 x double> %144, i32 1
  %147 = fsub double %.37, %145
  %148 = fsub double %147, %146
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next48.1
  %150 = bitcast double* %149 to <2 x double>*
  %151 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next48.1
  %152 = bitcast double* %151 to <2 x double>*
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %153 = load <2 x double>, <2 x double>* %150, align 8
  %154 = load <2 x double>, <2 x double>* %152, align 8
  %155 = fmul <2 x double> %153, %154
  %156 = extractelement <2 x double> %155, i32 0
  %157 = extractelement <2 x double> %155, i32 1
  %158 = fsub double %148, %156
  %159 = fsub double %158, %157
  %exitcond.3 = icmp eq i64 %indvars.iv.next48.2, 1999
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  br i1 %exitcond.3, label %._crit_edge10.unr-lcssa, label %.lr.ph

._crit_edge10.unr-lcssa:                          ; preds = %.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge10.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %159, %._crit_edge10.unr-lcssa ]
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %161 = load double, double* %160, align 8
  %162 = fdiv double %.lcssa, %161
  %163 = getelementptr inbounds double, double* %2, i64 %indvars.iv49
  store double %162, double* %163, align 8
  %164 = icmp sgt i64 %indvars.iv49, 0
  br i1 %164, label %._crit_edge10.._crit_edge3_crit_edge, label %165

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10.thread, %._crit_edge10
  %indvars.iv.next50 = add i64 %indvars.iv49, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge3

; <label>:165:                                    ; preds = %._crit_edge10
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge2

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
