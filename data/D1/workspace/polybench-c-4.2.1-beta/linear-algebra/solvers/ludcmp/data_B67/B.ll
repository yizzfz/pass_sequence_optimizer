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
  br label %._crit_edge96

._crit_edge96:                                    ; preds = %._crit_edge96, %5
  %indvars.iv142 = phi i64 [ 0, %5 ], [ %indvars.iv.next143.1, %._crit_edge96 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv142
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next143 = or i64 %indvars.iv142, 1
  %10 = trunc i64 %indvars.iv.next143 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv142
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %13 = trunc i64 %indvars.iv.next143.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond144.1 = icmp eq i64 %indvars.iv.next143, 1999
  br i1 %exitcond144.1, label %.lr.ph.preheader, label %._crit_edge96

.lr.ph.preheader:                                 ; preds = %._crit_edge96
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge93._crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge93._crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv140, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %22
  %23 = sub i64 1998, %indvars.iv140
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %27

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv123
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %33, double* %34, align 8
  %exitcond131 = icmp eq i64 %indvars.iv123, %indvars.iv140
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br i1 %exitcond131, label %._crit_edge, label %27

._crit_edge:                                      ; preds = %27
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %35 = icmp slt i64 %indvars.iv.next141, 2000
  br i1 %35, label %._crit_edge93._crit_edge, label %38

._crit_edge93._crit_edge:                         ; preds = %._crit_edge
  %36 = bitcast double* %scevgep138 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %36, i8 0, i64 %26, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %39, align 8
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %41

; <label>:41:                                     ; preds = %41, %38
  %indvars.iv121 = phi i64 [ 0, %38 ], [ %indvars.iv.next122.7, %41 ]
  %42 = mul nuw nsw i64 %indvars.iv121, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %43 = mul nuw nsw i64 %indvars.iv.next122, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.1 = or i64 %indvars.iv121, 2
  %44 = mul nuw nsw i64 %indvars.iv.next122.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.2 = or i64 %indvars.iv121, 3
  %45 = mul nuw nsw i64 %indvars.iv.next122.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.3 = or i64 %indvars.iv121, 4
  %46 = mul nuw nsw i64 %indvars.iv.next122.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.4 = or i64 %indvars.iv121, 5
  %47 = mul nuw nsw i64 %indvars.iv.next122.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.5 = or i64 %indvars.iv121, 6
  %48 = mul nuw nsw i64 %indvars.iv.next122.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.6 = or i64 %indvars.iv121, 7
  %49 = mul nuw nsw i64 %indvars.iv.next122.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond145.7 = icmp eq i64 %indvars.iv.next122.6, 1999
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  br i1 %exitcond145.7, label %._crit_edge105.preheader, label %41

._crit_edge105.preheader:                         ; preds = %41
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.preheader, %99
  %indvars.iv116 = phi i64 [ %53, %99 ], [ 0, %._crit_edge105.preheader ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv116
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  %53 = add i64 %indvars.iv116, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %53
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %middle.block, %._crit_edge105
  %indvars.iv114 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next115, %middle.block ]
  %54 = mul i64 %indvars.iv114, 16000
  %scevgep146 = getelementptr i8, i8* %40, i64 %54
  %55 = add i64 %54, 16000
  %scevgep147 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv116
  %bound0 = icmp ult i8* %scevgep146, %scevgep150151
  %bound1 = icmp ult i8* %scevgep148149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound0153 = icmp ult i8* %scevgep146, %bc
  %bound1154 = icmp ult i8* %bc, %scevgep147
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge104
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge104
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = load double, double* %56, align 8, !alias.scope !1
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv116
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv116
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv116
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv116
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
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv114, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load157, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit187, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv111 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next112.1, %scalar.ph ]
  %84 = load double, double* %56, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv116
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv114, i64 %indvars.iv111
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %91 = load double, double* %56, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next112, i64 %indvars.iv116
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next112
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond113.1 = icmp eq i64 %indvars.iv.next112, 1999
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  br i1 %exitcond113.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit187:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit187, %middle.block.loopexit
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %98 = icmp slt i64 %indvars.iv.next115, 2000
  br i1 %98, label %._crit_edge104, label %99

; <label>:99:                                     ; preds = %middle.block
  %100 = icmp slt i64 %53, 2000
  br i1 %100, label %._crit_edge105, label %._crit_edge107.preheader

._crit_edge107.preheader:                         ; preds = %99
  %101 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %107 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.preheader, %middle.block159
  %indvars.iv109 = phi i64 [ %108, %middle.block159 ], [ 0, %._crit_edge107.preheader ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %108 = add i64 %indvars.iv109, 1
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %1, i64 %108, i64 0
  %scevgep165166 = bitcast double* %scevgep165 to i8*
  %109 = mul i64 %indvars.iv109, 16000
  %scevgep167 = getelementptr i8, i8* %40, i64 %109
  %110 = add i64 %109, 16000
  %scevgep168 = getelementptr i8, i8* %40, i64 %110
  %bound0169 = icmp ult i8* %scevgep163164, %scevgep168
  %bound1170 = icmp ult i8* %scevgep167, %scevgep165166
  %memcheck.conflict172 = and i1 %bound0169, %bound1170
  br i1 %memcheck.conflict172, label %scalar.ph160.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %._crit_edge107
  br label %vector.body158

scalar.ph160.preheader:                           ; preds = %._crit_edge107
  br label %scalar.ph160

vector.body158:                                   ; preds = %vector.body158, %vector.body158.preheader
  %index175 = phi i64 [ 0, %vector.body158.preheader ], [ %index.next176.1, %vector.body158 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv109, i64 %index175
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load184 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %index175
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load184, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next176 = or i64 %index175, 4
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv109, i64 %index.next176
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load184.1 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !13
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %index.next176
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load184.1, <2 x i64>* %126, align 8, !alias.scope !16, !noalias !13
  %index.next176.1 = add nsw i64 %index175, 8
  %127 = icmp eq i64 %index.next176.1, 2000
  br i1 %127, label %middle.block159.loopexit186, label %vector.body158, !llvm.loop !18

scalar.ph160:                                     ; preds = %scalar.ph160, %scalar.ph160.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph160.preheader ], [ %indvars.iv.next.4, %scalar.ph160 ]
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv109, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %147 = bitcast double* %146 to i64*
  store i64 %145, i64* %147, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %148 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next.3
  %152 = bitcast double* %151 to i64*
  store i64 %150, i64* %152, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block159.loopexit, label %scalar.ph160, !llvm.loop !19

middle.block159.loopexit:                         ; preds = %scalar.ph160
  br label %middle.block159

middle.block159.loopexit186:                      ; preds = %vector.body158
  br label %middle.block159

middle.block159:                                  ; preds = %middle.block159.loopexit186, %middle.block159.loopexit
  %153 = icmp slt i64 %108, 2000
  br i1 %153, label %._crit_edge107, label %154

; <label>:154:                                    ; preds = %middle.block159
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %6

; <label>:6:                                      ; preds = %._crit_edge123, %5
  %indvars.iv190 = phi i64 [ %indvars.iv.next191, %._crit_edge123 ], [ 4294967295, %5 ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %._crit_edge123 ], [ 0, %5 ]
  %7 = sub i64 2000, %indvars.iv182
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv182
  %11 = and i64 %indvars.iv190, 4294967295
  %12 = icmp sgt i64 %indvars.iv182, 0
  br i1 %12, label %.lr.ph112.preheader, label %.lr.ph122.split.preheader

.lr.ph112.preheader:                              ; preds = %6
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 0
  br label %.lr.ph112

.lr.ph122.split.preheader:                        ; preds = %.lr.ph122..lr.ph122.split.preheader_crit_edge, %6
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph122.split.preheader204, label %min.iters.checked

.lr.ph122.split.preheader204:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph122.split.preheader
  %indvars.iv165.ph = phi i64 [ %indvars.iv182, %min.iters.checked ], [ %indvars.iv182, %.lr.ph122.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph122.split

min.iters.checked:                                ; preds = %.lr.ph122.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv182, %n.vec
  br i1 %cmp.zero, label %.lr.ph122.split.preheader204, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %9, 1
  %lcmp.mod218 = icmp eq i64 %14, 0
  br i1 %lcmp.mod218, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv182
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load203.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load203.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %9, 0
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %20 = add i64 %indvars.iv182, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load203 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load203, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv182, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load203.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load203.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge123, label %.lr.ph122.split.preheader204

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge108
  %indvars.iv187 = phi i64 [ %indvars.iv.next188, %._crit_edge108 ], [ 4294967295, %.lr.ph112.preheader ]
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge108 ], [ 0, %.lr.ph112.preheader ]
  %31 = and i64 %indvars.iv187, 4294967295
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv161
  %33 = load double, double* %32, align 8
  %34 = icmp sgt i64 %indvars.iv161, 0
  br i1 %34, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %35 = and i64 %indvars.iv187, 1
  %lcmp.mod216 = icmp eq i64 %35, 0
  br i1 %lcmp.mod216, label %.lr.ph107.prol.preheader, label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol.preheader
  %36 = load double, double* %13, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv161
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %33, %39
  br label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.preheader, %.lr.ph107.prol
  %.lcssa210.unr.ph = phi double [ %40, %.lr.ph107.prol ], [ undef, %.lr.ph107.preheader ]
  %indvars.iv152.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %.lr.ph107.preheader ]
  %.0105.unr.ph = phi double [ %40, %.lr.ph107.prol ], [ %33, %.lr.ph107.preheader ]
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %31, 0
  br i1 %41, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv152 = phi i64 [ %indvars.iv152.unr.ph, %.lr.ph107.preheader.new ], [ %indvars.iv.next153.1, %.lr.ph107 ]
  %.0105 = phi double [ %.0105.unr.ph, %.lr.ph107.preheader.new ], [ %55, %.lr.ph107 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv152
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv152, i64 %indvars.iv161
  %45 = load double, double* %44, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next153, i64 %indvars.iv161
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.0105, %52
  %55 = fsub double %54, %53
  %exitcond189.1 = icmp eq i64 %indvars.iv.next153, %31
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  br i1 %exitcond189.1, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa210 = phi double [ %.lcssa210.unr.ph, %.lr.ph107.prol.loopexit ], [ %55, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %33, %.lr.ph112 ], [ %.lcssa210, %._crit_edge108.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv161, i64 %indvars.iv161
  %57 = load double, double* %56, align 8
  %58 = fdiv double %.0.lcssa, %57
  store double %58, double* %32, align 8
  %indvars.iv.next162 = add nuw i64 %indvars.iv161, 1
  %59 = icmp slt i64 %indvars.iv.next162, %indvars.iv182
  %indvars.iv.next188 = add nuw nsw i64 %31, 1
  br i1 %59, label %.lr.ph112, label %.lr.ph122

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122..lr.ph122.split.preheader_crit_edge

.lr.ph122..lr.ph122.split.preheader_crit_edge:    ; preds = %.lr.ph122
  br label %.lr.ph122.split.preheader

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %60 = and i64 %indvars.iv190, 1
  %lcmp.mod222 = icmp eq i64 %60, 0
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 0
  %62 = icmp eq i64 %11, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge118.us
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge118.us ], [ %indvars.iv182, %.lr.ph122.split.us.preheader ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv180
  %64 = load double, double* %63, align 8
  br i1 %lcmp.mod222, label %.prol.preheader219, label %.prol.loopexit220.unr-lcssa

.prol.preheader219:                               ; preds = %.lr.ph122.split.us
  br label %65

; <label>:65:                                     ; preds = %.prol.preheader219
  %66 = load double, double* %61, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv180
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %64, %69
  br label %.prol.loopexit220.unr-lcssa

.prol.loopexit220.unr-lcssa:                      ; preds = %.lr.ph122.split.us, %65
  %.lcssa211.unr.ph = phi double [ %70, %65 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv169.unr.ph = phi i64 [ 1, %65 ], [ 0, %.lr.ph122.split.us ]
  %.1115.us.unr.ph = phi double [ %70, %65 ], [ %64, %.lr.ph122.split.us ]
  br label %.prol.loopexit220

.prol.loopexit220:                                ; preds = %.prol.loopexit220.unr-lcssa
  br i1 %62, label %._crit_edge118.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit220
  br label %71

; <label>:71:                                     ; preds = %71, %.lr.ph122.split.us.new
  %indvars.iv169 = phi i64 [ %indvars.iv169.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next170.1, %71 ]
  %.1115.us = phi double [ %.1115.us.unr.ph, %.lr.ph122.split.us.new ], [ %85, %71 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv169
  %73 = bitcast double* %72 to <2 x double>*
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv180
  %75 = load double, double* %74, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %76 = load <2 x double>, <2 x double>* %73, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next170, i64 %indvars.iv180
  %78 = load double, double* %77, align 8
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = fmul <2 x double> %76, %80
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  %84 = fsub double %.1115.us, %82
  %85 = fsub double %84, %83
  %exitcond192.1 = icmp eq i64 %indvars.iv.next170, %11
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  br i1 %exitcond192.1, label %._crit_edge118.us.unr-lcssa, label %71

._crit_edge118.us.unr-lcssa:                      ; preds = %71
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.prol.loopexit220, %._crit_edge118.us.unr-lcssa
  %.lcssa211 = phi double [ %.lcssa211.unr.ph, %.prol.loopexit220 ], [ %85, %._crit_edge118.us.unr-lcssa ]
  store double %.lcssa211, double* %63, align 8
  %indvars.iv.next181 = add nuw i64 %indvars.iv180, 1
  %86 = icmp slt i64 %indvars.iv.next181, 2000
  br i1 %86, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph122.split:                                  ; preds = %.lr.ph122.split.preheader204, %.lr.ph122.split
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %.lr.ph122.split ], [ %indvars.iv165.ph, %.lr.ph122.split.preheader204 ]
  %exitcond167 = icmp eq i64 %indvars.iv165, 1999
  %indvars.iv.next166 = add nuw i64 %indvars.iv165, 1
  br i1 %exitcond167, label %._crit_edge123.loopexit205, label %.lr.ph122.split, !llvm.loop !21

._crit_edge123.loopexit:                          ; preds = %._crit_edge118.us
  br label %._crit_edge123

._crit_edge123.loopexit205:                       ; preds = %.lr.ph122.split
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit205, %._crit_edge123.loopexit, %middle.block
  %indvars.iv.next183 = add nuw i64 %indvars.iv182, 1
  %87 = icmp slt i64 %indvars.iv.next183, 2000
  %indvars.iv.next191 = add nuw nsw i64 %11, 1
  br i1 %87, label %6, label %._crit_edge123._crit_edge128.preheader

._crit_edge123._crit_edge128.preheader:           ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge128

._crit_edge123._crit_edge128:                     ; preds = %._crit_edge123._crit_edge128.preheader, %._crit_edge101
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %._crit_edge101 ], [ 4294967295, %._crit_edge123._crit_edge128.preheader ]
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge101 ], [ 0, %._crit_edge123._crit_edge128.preheader ]
  %88 = and i64 %indvars.iv184, 4294967295
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv150
  %90 = load double, double* %89, align 8
  %91 = icmp sgt i64 %indvars.iv150, 0
  br i1 %91, label %.lr.ph100.preheader, label %._crit_edge101

.lr.ph100.preheader:                              ; preds = %._crit_edge123._crit_edge128
  %92 = add nsw i64 %indvars.iv184, 1
  %xtraiter212 = and i64 %92, 3
  %lcmp.mod213 = icmp eq i64 %xtraiter212, 0
  br i1 %lcmp.mod213, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol, %.lr.ph100.prol.preheader
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph100.prol ], [ 0, %.lr.ph100.prol.preheader ]
  %.298.prol = phi double [ %98, %.lr.ph100.prol ], [ %90, %.lr.ph100.prol.preheader ]
  %prol.iter214 = phi i64 [ %prol.iter214.sub, %.lr.ph100.prol ], [ %xtraiter212, %.lr.ph100.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv141.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv141.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.298.prol, %97
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter214.sub = add i64 %prol.iter214, -1
  %prol.iter214.cmp = icmp eq i64 %prol.iter214.sub, 0
  br i1 %prol.iter214.cmp, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol, !llvm.loop !23

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.preheader, %.lr.ph100.prol.loopexit.unr-lcssa
  %.lcssa209.unr = phi double [ undef, %.lr.ph100.preheader ], [ %98, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next142.prol, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %.298.unr = phi double [ %90, %.lr.ph100.preheader ], [ %98, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %99 = icmp ult i64 %88, 3
  br i1 %99, label %._crit_edge101.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr, %.lr.ph100.preheader.new ], [ %indvars.iv.next142.3, %.lr.ph100 ]
  %.298 = phi double [ %.298.unr, %.lr.ph100.preheader.new ], [ %121, %.lr.ph100 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv141
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv141
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.298, %107
  %110 = fsub double %109, %108
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv.next142.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next142.1
  %114 = bitcast double* %113 to <2 x double>*
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %exitcond186.3 = icmp eq i64 %indvars.iv.next142.2, %88
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  br i1 %exitcond186.3, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  %.lcssa209 = phi double [ %.lcssa209.unr, %.lr.ph100.prol.loopexit ], [ %121, %._crit_edge101.loopexit.unr-lcssa ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge123._crit_edge128
  %.2.lcssa = phi double [ %90, %._crit_edge123._crit_edge128 ], [ %.lcssa209, %._crit_edge101.loopexit ]
  %122 = getelementptr inbounds double, double* %4, i64 %indvars.iv150
  store double %.2.lcssa, double* %122, align 8
  %indvars.iv.next151 = add nuw i64 %indvars.iv150, 1
  %123 = icmp slt i64 %indvars.iv.next151, 2000
  %indvars.iv.next185 = add nuw nsw i64 %88, 1
  br i1 %123, label %._crit_edge123._crit_edge128, label %._crit_edge101._crit_edge131.preheader

._crit_edge101._crit_edge131.preheader:           ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge131

._crit_edge101._crit_edge131:                     ; preds = %._crit_edge101._crit_edge131.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge101._crit_edge131.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %128 = load double, double* %127, align 8
  %129 = icmp slt i32 %indvars.iv, 2000
  br i1 %129, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge101._crit_edge131
  %130 = sext i32 %indvars.iv to i64
  %131 = sub nsw i64 0, %125
  %xtraiter = and i64 %131, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %132

; <label>:132:                                    ; preds = %132, %.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %132 ], [ %130, %.prol.preheader ]
  %.394.prol = phi double [ %138, %132 ], [ %128, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %132 ], [ %xtraiter, %.prol.preheader ]
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv137.prol
  %136 = load double, double* %135, align 8
  %137 = fmul double %134, %136
  %138 = fsub double %.394.prol, %137
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %132, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %132
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %138, %.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %130, %.lr.ph ], [ %indvars.iv.next138.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %128, %.lr.ph ], [ %138, %.prol.loopexit.unr-lcssa ]
  %139 = icmp ult i64 %126, 3
  br i1 %139, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %140

; <label>:140:                                    ; preds = %140, %.lr.ph.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph.new ], [ %indvars.iv.next138.3, %140 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %162, %140 ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137
  %142 = bitcast double* %141 to <2 x double>*
  %143 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %142, align 8
  %146 = load <2 x double>, <2 x double>* %144, align 8
  %147 = fmul <2 x double> %145, %146
  %148 = extractelement <2 x double> %147, i32 0
  %149 = extractelement <2 x double> %147, i32 1
  %150 = fsub double %.394, %148
  %151 = fsub double %150, %149
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %153 = bitcast double* %152 to <2 x double>*
  %154 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next138.1
  %155 = bitcast double* %154 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %156 = load <2 x double>, <2 x double>* %153, align 8
  %157 = load <2 x double>, <2 x double>* %155, align 8
  %158 = fmul <2 x double> %156, %157
  %159 = extractelement <2 x double> %158, i32 0
  %160 = extractelement <2 x double> %158, i32 1
  %161 = fsub double %151, %159
  %162 = fsub double %161, %160
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %140

._crit_edge.loopexit.unr-lcssa:                   ; preds = %140
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %162, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge101._crit_edge131
  %.3.lcssa = phi double [ %128, %._crit_edge101._crit_edge131 ], [ %.lcssa, %._crit_edge.loopexit ]
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %164 = load double, double* %163, align 8
  %165 = fdiv double %.3.lcssa, %164
  %166 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %165, double* %166, align 8
  %167 = icmp sgt i64 %indvars.iv139, 0
  br i1 %167, label %._crit_edge._crit_edge, label %168

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge131

; <label>:168:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
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
