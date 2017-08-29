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
  br label %._crit_edge96

._crit_edge96:                                    ; preds = %._crit_edge96, %4
  %indvars.iv142 = phi i64 [ 0, %4 ], [ %indvars.iv.next143.1, %._crit_edge96 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv142
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv142
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next143 = or i64 %indvars.iv142, 1
  %9 = trunc i64 %indvars.iv.next143 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv142
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %12 = trunc i64 %indvars.iv.next143.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond144.1 = icmp eq i64 %indvars.iv.next143, 1999
  br i1 %exitcond144.1, label %.lr.ph.preheader, label %._crit_edge96

.lr.ph.preheader:                                 ; preds = %._crit_edge96
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge93._crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge93._crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv140, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %21
  %22 = sub i64 1998, %indvars.iv140
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %26 ], [ 0, %.lr.ph ]
  %27 = sub nsw i64 0, %indvars.iv123
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv123
  store double %32, double* %33, align 8
  %exitcond131 = icmp eq i64 %indvars.iv123, %indvars.iv140
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br i1 %exitcond131, label %._crit_edge, label %26

._crit_edge:                                      ; preds = %26
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %34 = icmp slt i64 %indvars.iv.next141, 2000
  br i1 %34, label %._crit_edge93._crit_edge, label %37

._crit_edge93._crit_edge:                         ; preds = %._crit_edge
  %35 = bitcast double* %scevgep138 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %37
  %indvars.iv121 = phi i64 [ 0, %37 ], [ %indvars.iv.next122.7, %._crit_edge102 ]
  %40 = mul nuw nsw i64 %indvars.iv121, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %41 = mul nuw nsw i64 %indvars.iv.next122, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.1 = or i64 %indvars.iv121, 2
  %42 = mul nuw nsw i64 %indvars.iv.next122.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.2 = or i64 %indvars.iv121, 3
  %43 = mul nuw nsw i64 %indvars.iv.next122.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.3 = or i64 %indvars.iv121, 4
  %44 = mul nuw nsw i64 %indvars.iv.next122.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.4 = or i64 %indvars.iv121, 5
  %45 = mul nuw nsw i64 %indvars.iv.next122.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.5 = or i64 %indvars.iv121, 6
  %46 = mul nuw nsw i64 %indvars.iv.next122.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.6 = or i64 %indvars.iv121, 7
  %47 = mul nuw nsw i64 %indvars.iv.next122.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  %48 = icmp slt i64 %indvars.iv.next122.7, 2000
  br i1 %48, label %._crit_edge102, label %._crit_edge105.preheader

._crit_edge105.preheader:                         ; preds = %._crit_edge102
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.preheader, %98
  %indvars.iv116 = phi i64 [ %52, %98 ], [ 0, %._crit_edge105.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv116
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %52 = add i64 %indvars.iv116, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %middle.block, %._crit_edge105
  %indvars.iv114 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next115, %middle.block ]
  %53 = mul i64 %indvars.iv114, 16000
  %scevgep1 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep2 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv116
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge104
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge104
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv116
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv116
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv116
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv116
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv114, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load12, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit42, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv111 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next112.1, %scalar.ph ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv116
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv114, i64 %indvars.iv111
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next112, i64 %indvars.iv116
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next112
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %exitcond113.1 = icmp eq i64 %indvars.iv.next112, 1999
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  br i1 %exitcond113.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit42:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit42, %middle.block.loopexit
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %97 = icmp slt i64 %indvars.iv.next115, 2000
  br i1 %97, label %._crit_edge104, label %98

; <label>:98:                                     ; preds = %middle.block
  %99 = icmp slt i64 %52, 2000
  br i1 %99, label %._crit_edge105, label %._crit_edge107.preheader

._crit_edge107.preheader:                         ; preds = %98
  %100 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.preheader, %middle.block14
  %indvars.iv109 = phi i64 [ %107, %middle.block14 ], [ 0, %._crit_edge107.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %107 = add i64 %indvars.iv109, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %107, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %108 = mul i64 %indvars.iv109, 16000
  %scevgep22 = getelementptr i8, i8* %39, i64 %108
  %109 = add i64 %108, 16000
  %scevgep23 = getelementptr i8, i8* %39, i64 %109
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %._crit_edge107
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %._crit_edge107
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv109, i64 %index30
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %index30
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv109, i64 %index.next31
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %index.next31
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %126 = icmp eq i64 %index.next31.1, 2000
  br i1 %126, label %middle.block14.loopexit41, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv109, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block14.loopexit, label %scalar.ph15, !llvm.loop !19

middle.block14.loopexit:                          ; preds = %scalar.ph15
  br label %middle.block14

middle.block14.loopexit41:                        ; preds = %vector.body13
  br label %middle.block14

middle.block14:                                   ; preds = %middle.block14.loopexit41, %middle.block14.loopexit
  %152 = icmp slt i64 %107, 2000
  br i1 %152, label %._crit_edge107, label %153

; <label>:153:                                    ; preds = %middle.block14
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge123, %4
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %._crit_edge123 ], [ 0, %4 ]
  %indvars.iv175 = phi i32 [ %indvars.iv.next176, %._crit_edge123 ], [ -1, %4 ]
  %6 = add i64 %indvars.iv183, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv183
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv183
  %12 = icmp sgt i64 %indvars.iv183, 0
  br i1 %12, label %.lr.ph112.preheader, label %.lr.ph122.split.preheader

.lr.ph112.preheader:                              ; preds = %5
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 0
  br label %.lr.ph112

.lr.ph122.split.preheader:                        ; preds = %.lr.ph122..lr.ph122.split.preheader_crit_edge, %5
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph122.split.preheader5, label %min.iters.checked

.lr.ph122.split.preheader5:                       ; preds = %middle.block, %min.iters.checked, %.lr.ph122.split.preheader
  %indvars.iv166.ph = phi i64 [ %indvars.iv183, %min.iters.checked ], [ %indvars.iv183, %.lr.ph122.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph122.split

min.iters.checked:                                ; preds = %.lr.ph122.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv183, %n.vec
  br i1 %cmp.zero, label %.lr.ph122.split.preheader5, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod19 = icmp eq i64 %14, 0
  br i1 %lcmp.mod19, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv183
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load4.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load4.prol, <2 x i64>* %18, align 8
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
  %20 = add i64 %indvars.iv183, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load4 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load4, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv183, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load4.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load4.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge123, label %.lr.ph122.split.preheader5

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge108
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge108 ], [ 0, %.lr.ph112.preheader ]
  %indvars.iv158 = phi i32 [ %indvars.iv.next159, %._crit_edge108 ], [ -1, %.lr.ph112.preheader ]
  %31 = add i64 %indvars.iv162, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv162
  %34 = load double, double* %33, align 8
  %35 = icmp sgt i64 %indvars.iv162, 0
  br i1 %35, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %wide.trip.count160 = zext i32 %indvars.iv158 to i64
  %36 = and i64 %31, 1
  %lcmp.mod17 = icmp eq i64 %36, 0
  br i1 %lcmp.mod17, label %.lr.ph107.prol.preheader, label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol.preheader
  %37 = load double, double* %13, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv162
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %34, %40
  br label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.preheader, %.lr.ph107.prol
  %.lcssa11.unr.ph = phi double [ %41, %.lr.ph107.prol ], [ undef, %.lr.ph107.preheader ]
  %indvars.iv153.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %.lr.ph107.preheader ]
  %.0105.unr.ph = phi double [ %41, %.lr.ph107.prol ], [ %34, %.lr.ph107.preheader ]
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.prol.loopexit.unr-lcssa
  %42 = icmp eq i64 %32, 0
  br i1 %42, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv153 = phi i64 [ %indvars.iv153.unr.ph, %.lr.ph107.preheader.new ], [ %indvars.iv.next154.1, %.lr.ph107 ]
  %.0105 = phi double [ %.0105.unr.ph, %.lr.ph107.preheader.new ], [ %56, %.lr.ph107 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv153
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv153, i64 %indvars.iv162
  %46 = load double, double* %45, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next154, i64 %indvars.iv162
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.0105, %53
  %56 = fsub double %55, %54
  %exitcond161.1 = icmp eq i64 %indvars.iv.next154, %wide.trip.count160
  %indvars.iv.next154.1 = add nsw i64 %indvars.iv153, 2
  br i1 %exitcond161.1, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa11 = phi double [ %.lcssa11.unr.ph, %.lr.ph107.prol.loopexit ], [ %56, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %34, %.lr.ph112 ], [ %.lcssa11, %._crit_edge108.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv162, i64 %indvars.iv162
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %33, align 8
  %indvars.iv.next163 = add nuw i64 %indvars.iv162, 1
  %60 = icmp slt i64 %indvars.iv.next163, %indvars.iv183
  %indvars.iv.next159 = add nsw i32 %indvars.iv158, 1
  br i1 %60, label %.lr.ph112, label %.lr.ph122

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122..lr.ph122.split.preheader_crit_edge

.lr.ph122..lr.ph122.split.preheader_crit_edge:    ; preds = %.lr.ph122
  br label %.lr.ph122.split.preheader

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %wide.trip.count177 = zext i32 %indvars.iv175 to i64
  %61 = and i64 %6, 1
  %lcmp.mod23 = icmp eq i64 %61, 0
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 0
  %63 = icmp eq i64 %7, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge118.us
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge118.us ], [ %indvars.iv183, %.lr.ph122.split.us.preheader ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv181
  %65 = load double, double* %64, align 8
  br i1 %lcmp.mod23, label %.prol.preheader20, label %.prol.loopexit21.unr-lcssa

.prol.preheader20:                                ; preds = %.lr.ph122.split.us
  br label %66

; <label>:66:                                     ; preds = %.prol.preheader20
  %67 = load double, double* %62, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv181
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fsub double %65, %70
  br label %.prol.loopexit21.unr-lcssa

.prol.loopexit21.unr-lcssa:                       ; preds = %.lr.ph122.split.us, %66
  %.lcssa12.unr.ph = phi double [ %71, %66 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv170.unr.ph = phi i64 [ 1, %66 ], [ 0, %.lr.ph122.split.us ]
  %.1115.us.unr.ph = phi double [ %71, %66 ], [ %65, %.lr.ph122.split.us ]
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.loopexit21.unr-lcssa
  br i1 %63, label %._crit_edge118.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit21
  br label %72

; <label>:72:                                     ; preds = %72, %.lr.ph122.split.us.new
  %indvars.iv170 = phi i64 [ %indvars.iv170.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next171.1, %72 ]
  %.1115.us = phi double [ %.1115.us.unr.ph, %.lr.ph122.split.us.new ], [ %86, %72 ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv170
  %74 = bitcast double* %73 to <2 x double>*
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv170, i64 %indvars.iv181
  %76 = load double, double* %75, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %77 = load <2 x double>, <2 x double>* %74, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next171, i64 %indvars.iv181
  %79 = load double, double* %78, align 8
  %80 = insertelement <2 x double> undef, double %76, i32 0
  %81 = insertelement <2 x double> %80, double %79, i32 1
  %82 = fmul <2 x double> %77, %81
  %83 = extractelement <2 x double> %82, i32 0
  %84 = extractelement <2 x double> %82, i32 1
  %85 = fsub double %.1115.us, %83
  %86 = fsub double %85, %84
  %exitcond178.1 = icmp eq i64 %indvars.iv.next171, %wide.trip.count177
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  br i1 %exitcond178.1, label %._crit_edge118.us.unr-lcssa, label %72

._crit_edge118.us.unr-lcssa:                      ; preds = %72
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.prol.loopexit21, %._crit_edge118.us.unr-lcssa
  %.lcssa12 = phi double [ %.lcssa12.unr.ph, %.prol.loopexit21 ], [ %86, %._crit_edge118.us.unr-lcssa ]
  store double %.lcssa12, double* %64, align 8
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %87 = icmp slt i64 %indvars.iv.next182, 2000
  br i1 %87, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph122.split:                                  ; preds = %.lr.ph122.split.preheader5, %.lr.ph122.split
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %.lr.ph122.split ], [ %indvars.iv166.ph, %.lr.ph122.split.preheader5 ]
  %exitcond168 = icmp eq i64 %indvars.iv166, 1999
  %indvars.iv.next167 = add nuw i64 %indvars.iv166, 1
  br i1 %exitcond168, label %._crit_edge123.loopexit6, label %.lr.ph122.split, !llvm.loop !21

._crit_edge123.loopexit:                          ; preds = %._crit_edge118.us
  br label %._crit_edge123

._crit_edge123.loopexit6:                         ; preds = %.lr.ph122.split
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit6, %._crit_edge123.loopexit, %middle.block
  %indvars.iv.next184 = add nuw i64 %indvars.iv183, 1
  %88 = icmp slt i64 %indvars.iv.next184, 2000
  %indvars.iv.next176 = add nsw i32 %indvars.iv175, 1
  br i1 %88, label %5, label %._crit_edge123._crit_edge128.preheader

._crit_edge123._crit_edge128.preheader:           ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge128

._crit_edge123._crit_edge128:                     ; preds = %._crit_edge123._crit_edge128.preheader, %._crit_edge101
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge101 ], [ 0, %._crit_edge123._crit_edge128.preheader ]
  %indvars.iv147 = phi i32 [ %indvars.iv.next148, %._crit_edge101 ], [ -1, %._crit_edge123._crit_edge128.preheader ]
  %89 = add i64 %indvars.iv151, 4294967295
  %90 = and i64 %89, 4294967295
  %91 = getelementptr inbounds double, double* %1, i64 %indvars.iv151
  %92 = load double, double* %91, align 8
  %93 = icmp sgt i64 %indvars.iv151, 0
  br i1 %93, label %.lr.ph100.preheader, label %._crit_edge101

.lr.ph100.preheader:                              ; preds = %._crit_edge123._crit_edge128
  %wide.trip.count149 = zext i32 %indvars.iv147 to i64
  %xtraiter13 = and i64 %indvars.iv151, 3
  %lcmp.mod14 = icmp eq i64 %xtraiter13, 0
  br i1 %lcmp.mod14, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol, %.lr.ph100.prol.preheader
  %indvars.iv142.prol = phi i64 [ %indvars.iv.next143.prol, %.lr.ph100.prol ], [ 0, %.lr.ph100.prol.preheader ]
  %.298.prol = phi double [ %99, %.lr.ph100.prol ], [ %92, %.lr.ph100.prol.preheader ]
  %prol.iter15 = phi i64 [ %prol.iter15.sub, %.lr.ph100.prol ], [ %xtraiter13, %.lr.ph100.prol.preheader ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv142.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv142.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %.298.prol, %98
  %indvars.iv.next143.prol = add nuw nsw i64 %indvars.iv142.prol, 1
  %prol.iter15.sub = add i64 %prol.iter15, -1
  %prol.iter15.cmp = icmp eq i64 %prol.iter15.sub, 0
  br i1 %prol.iter15.cmp, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol, !llvm.loop !23

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.preheader, %.lr.ph100.prol.loopexit.unr-lcssa
  %.lcssa10.unr = phi double [ undef, %.lr.ph100.preheader ], [ %99, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %indvars.iv142.unr = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next143.prol, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %.298.unr = phi double [ %92, %.lr.ph100.preheader ], [ %99, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %100 = icmp ult i64 %90, 3
  br i1 %100, label %._crit_edge101.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %indvars.iv142 = phi i64 [ %indvars.iv142.unr, %.lr.ph100.preheader.new ], [ %indvars.iv.next143.3, %.lr.ph100 ]
  %.298 = phi double [ %.298.unr, %.lr.ph100.preheader.new ], [ %122, %.lr.ph100 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv142
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %3, i64 %indvars.iv142
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %.298, %108
  %111 = fsub double %110, %109
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv.next143.1
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next143.1
  %115 = bitcast double* %114 to <2 x double>*
  %indvars.iv.next143.2 = add nsw i64 %indvars.iv142, 3
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %exitcond150.3 = icmp eq i64 %indvars.iv.next143.2, %wide.trip.count149
  %indvars.iv.next143.3 = add nsw i64 %indvars.iv142, 4
  br i1 %exitcond150.3, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  %.lcssa10 = phi double [ %.lcssa10.unr, %.lr.ph100.prol.loopexit ], [ %122, %._crit_edge101.loopexit.unr-lcssa ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge123._crit_edge128
  %.2.lcssa = phi double [ %92, %._crit_edge123._crit_edge128 ], [ %.lcssa10, %._crit_edge101.loopexit ]
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv151
  store double %.2.lcssa, double* %123, align 8
  %indvars.iv.next152 = add nuw i64 %indvars.iv151, 1
  %124 = icmp slt i64 %indvars.iv.next152, 2000
  %indvars.iv.next148 = add nsw i32 %indvars.iv147, 1
  br i1 %124, label %._crit_edge123._crit_edge128, label %._crit_edge101._crit_edge131.preheader

._crit_edge101._crit_edge131.preheader:           ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge131

._crit_edge101._crit_edge131:                     ; preds = %._crit_edge101._crit_edge131.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge101._crit_edge131.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv139, 1
  %131 = icmp slt i64 %130, 2000
  br i1 %131, label %.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge101._crit_edge131
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  %133 = load double, double* %132, align 8
  %134 = fdiv double %129, %133
  %135 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store double %134, double* %135, align 8
  br label %._crit_edge._crit_edge

.lr.ph:                                           ; preds = %._crit_edge101._crit_edge131
  %136 = sext i32 %indvars.iv to i64
  %137 = sub nsw i64 0, %126
  %xtraiter = and i64 %137, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %138

; <label>:138:                                    ; preds = %138, %.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %138 ], [ %136, %.prol.preheader ]
  %.394.prol = phi double [ %144, %138 ], [ %129, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %138 ], [ %xtraiter, %.prol.preheader ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv137.prol
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = fsub double %.394.prol, %143
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %138, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %138
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %136, %.lr.ph ], [ %indvars.iv.next138.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %129, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %145 = icmp ult i64 %127, 3
  br i1 %145, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %146

; <label>:146:                                    ; preds = %146, %.lr.ph.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph.new ], [ %indvars.iv.next138.3, %146 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %168, %146 ]
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv137
  %148 = bitcast double* %147 to <2 x double>*
  %149 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  %150 = bitcast double* %149 to <2 x double>*
  %151 = load <2 x double>, <2 x double>* %148, align 8
  %152 = load <2 x double>, <2 x double>* %150, align 8
  %153 = fmul <2 x double> %151, %152
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %156 = fsub double %.394, %154
  %157 = fsub double %156, %155
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %159 = bitcast double* %158 to <2 x double>*
  %160 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next138.1
  %161 = bitcast double* %160 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %162 = load <2 x double>, <2 x double>* %159, align 8
  %163 = load <2 x double>, <2 x double>* %161, align 8
  %164 = fmul <2 x double> %162, %163
  %165 = extractelement <2 x double> %164, i32 0
  %166 = extractelement <2 x double> %164, i32 1
  %167 = fsub double %157, %165
  %168 = fsub double %167, %166
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %146

._crit_edge.unr-lcssa:                            ; preds = %146
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %168, %._crit_edge.unr-lcssa ]
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  %170 = load double, double* %169, align 8
  %171 = fdiv double %.lcssa, %170
  %172 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store double %171, double* %172, align 8
  %173 = icmp sgt i64 %indvars.iv139, 0
  br i1 %173, label %._crit_edge._crit_edge, label %174

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge131

; <label>:174:                                    ; preds = %._crit_edge
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
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge6, label %16

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
