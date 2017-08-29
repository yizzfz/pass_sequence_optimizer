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
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %38
  %indvars.iv121 = phi i64 [ 0, %38 ], [ %indvars.iv.next122.7, %._crit_edge102 ]
  %41 = mul nuw nsw i64 %indvars.iv121, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %42 = mul nuw nsw i64 %indvars.iv.next122, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.1 = or i64 %indvars.iv121, 2
  %43 = mul nuw nsw i64 %indvars.iv.next122.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.2 = or i64 %indvars.iv121, 3
  %44 = mul nuw nsw i64 %indvars.iv.next122.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.3 = or i64 %indvars.iv121, 4
  %45 = mul nuw nsw i64 %indvars.iv.next122.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.4 = or i64 %indvars.iv121, 5
  %46 = mul nuw nsw i64 %indvars.iv.next122.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.5 = or i64 %indvars.iv121, 6
  %47 = mul nuw nsw i64 %indvars.iv.next122.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.6 = or i64 %indvars.iv121, 7
  %48 = mul nuw nsw i64 %indvars.iv.next122.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  %49 = icmp slt i64 %indvars.iv.next122.7, 2000
  br i1 %49, label %._crit_edge102, label %._crit_edge105.preheader

._crit_edge105.preheader:                         ; preds = %._crit_edge102
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.preheader, %99
  %indvars.iv116 = phi i64 [ %53, %99 ], [ 0, %._crit_edge105.preheader ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv116
  %scevgep147148 = bitcast double* %scevgep147 to i8*
  %53 = add i64 %indvars.iv116, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %53
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %middle.block, %._crit_edge105
  %indvars.iv114 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next115, %middle.block ]
  %54 = mul i64 %indvars.iv114, 16000
  %scevgep145 = getelementptr i8, i8* %40, i64 %54
  %55 = add i64 %54, 16000
  %scevgep146 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv116
  %bound0 = icmp ult i8* %scevgep145, %scevgep149150
  %bound1 = icmp ult i8* %scevgep147148, %scevgep146
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound0152 = icmp ult i8* %scevgep145, %bc
  %bound1153 = icmp ult i8* %bc, %scevgep146
  %found.conflict154 = and i1 %bound0152, %bound1153
  %conflict.rdx = or i1 %found.conflict, %found.conflict154
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
  %wide.load156 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load156, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit186, label %vector.body, !llvm.loop !9

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

middle.block.loopexit186:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit186, %middle.block.loopexit
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

._crit_edge107:                                   ; preds = %._crit_edge107.preheader, %middle.block158
  %indvars.iv109 = phi i64 [ %108, %middle.block158 ], [ 0, %._crit_edge107.preheader ]
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 0
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  %108 = add i64 %indvars.iv109, 1
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %1, i64 %108, i64 0
  %scevgep164165 = bitcast double* %scevgep164 to i8*
  %109 = mul i64 %indvars.iv109, 16000
  %scevgep166 = getelementptr i8, i8* %40, i64 %109
  %110 = add i64 %109, 16000
  %scevgep167 = getelementptr i8, i8* %40, i64 %110
  %bound0168 = icmp ult i8* %scevgep162163, %scevgep167
  %bound1169 = icmp ult i8* %scevgep166, %scevgep164165
  %memcheck.conflict171 = and i1 %bound0168, %bound1169
  br i1 %memcheck.conflict171, label %scalar.ph159.preheader, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %._crit_edge107
  br label %vector.body157

scalar.ph159.preheader:                           ; preds = %._crit_edge107
  br label %scalar.ph159

vector.body157:                                   ; preds = %vector.body157, %vector.body157.preheader
  %index174 = phi i64 [ 0, %vector.body157.preheader ], [ %index.next175.1, %vector.body157 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv109, i64 %index174
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %index174
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next175 = or i64 %index174, 4
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv109, i64 %index.next175
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !13
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %index.next175
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %126, align 8, !alias.scope !16, !noalias !13
  %index.next175.1 = add nsw i64 %index174, 8
  %127 = icmp eq i64 %index.next175.1, 2000
  br i1 %127, label %middle.block158.loopexit185, label %vector.body157, !llvm.loop !18

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph159.preheader ], [ %indvars.iv.next.4, %scalar.ph159 ]
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
  br i1 %exitcond.4, label %middle.block158.loopexit, label %scalar.ph159, !llvm.loop !19

middle.block158.loopexit:                         ; preds = %scalar.ph159
  br label %middle.block158

middle.block158.loopexit185:                      ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %middle.block158.loopexit185, %middle.block158.loopexit
  %153 = icmp slt i64 %108, 2000
  br i1 %153, label %._crit_edge107, label %154

; <label>:154:                                    ; preds = %middle.block158
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %6

; <label>:6:                                      ; preds = %._crit_edge123, %5
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %._crit_edge123 ], [ 0, %5 ]
  %indvars.iv174 = phi i32 [ %indvars.iv.next175, %._crit_edge123 ], [ -1, %5 ]
  %7 = add i64 %indvars.iv182, 4294967295
  %8 = and i64 %7, 4294967295
  %9 = sub i64 2000, %indvars.iv182
  %10 = add i64 %9, -4
  %11 = lshr i64 %10, 2
  %12 = sub i64 2000, %indvars.iv182
  %13 = icmp sgt i64 %indvars.iv182, 0
  br i1 %13, label %.lr.ph112.preheader, label %.lr.ph122.split.preheader

.lr.ph112.preheader:                              ; preds = %6
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 0
  br label %.lr.ph112

.lr.ph122.split.preheader:                        ; preds = %.lr.ph122..lr.ph122.split.preheader_crit_edge, %6
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %.lr.ph122.split.preheader195, label %min.iters.checked

.lr.ph122.split.preheader195:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph122.split.preheader
  %indvars.iv165.ph = phi i64 [ %indvars.iv182, %min.iters.checked ], [ %indvars.iv182, %.lr.ph122.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph122.split

min.iters.checked:                                ; preds = %.lr.ph122.split.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv182, %n.vec
  br i1 %cmp.zero, label %.lr.ph122.split.preheader195, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %15 = and i64 %11, 1
  %lcmp.mod209 = icmp eq i64 %15, 0
  br i1 %lcmp.mod209, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv182
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load194.prol = load <2 x i64>, <2 x i64>* %19, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load194.prol, <2 x i64>* %19, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %11, 0
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %21 = add i64 %indvars.iv182, %index
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %21
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load194 = load <2 x i64>, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load194, <2 x i64>* %25, align 8
  %index.next = add i64 %index, 4
  %26 = add i64 %indvars.iv182, %index.next
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %26
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load194.1 = load <2 x i64>, <2 x i64>* %30, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load194.1, <2 x i64>* %30, align 8
  %index.next.1 = add i64 %index, 8
  %31 = icmp eq i64 %index.next.1, %n.vec
  br i1 %31, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %._crit_edge123, label %.lr.ph122.split.preheader195

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge108
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge108 ], [ 0, %.lr.ph112.preheader ]
  %indvars.iv157 = phi i32 [ %indvars.iv.next158, %._crit_edge108 ], [ -1, %.lr.ph112.preheader ]
  %32 = add i64 %indvars.iv161, 4294967295
  %33 = and i64 %32, 4294967295
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv161
  %35 = load double, double* %34, align 8
  %36 = icmp sgt i64 %indvars.iv161, 0
  br i1 %36, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %wide.trip.count159 = zext i32 %indvars.iv157 to i64
  %37 = and i64 %32, 1
  %lcmp.mod207 = icmp eq i64 %37, 0
  br i1 %lcmp.mod207, label %.lr.ph107.prol.preheader, label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol.preheader
  %38 = load double, double* %14, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv161
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %35, %41
  br label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.preheader, %.lr.ph107.prol
  %.lcssa201.unr.ph = phi double [ %42, %.lr.ph107.prol ], [ undef, %.lr.ph107.preheader ]
  %indvars.iv152.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %.lr.ph107.preheader ]
  %.0105.unr.ph = phi double [ %42, %.lr.ph107.prol ], [ %35, %.lr.ph107.preheader ]
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.prol.loopexit.unr-lcssa
  %43 = icmp eq i64 %33, 0
  br i1 %43, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv152 = phi i64 [ %indvars.iv152.unr.ph, %.lr.ph107.preheader.new ], [ %indvars.iv.next153.1, %.lr.ph107 ]
  %.0105 = phi double [ %.0105.unr.ph, %.lr.ph107.preheader.new ], [ %57, %.lr.ph107 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv152
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv152, i64 %indvars.iv161
  %47 = load double, double* %46, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next153, i64 %indvars.iv161
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.0105, %54
  %57 = fsub double %56, %55
  %exitcond160.1 = icmp eq i64 %indvars.iv.next153, %wide.trip.count159
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  br i1 %exitcond160.1, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr.ph, %.lr.ph107.prol.loopexit ], [ %57, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %35, %.lr.ph112 ], [ %.lcssa201, %._crit_edge108.loopexit ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv161, i64 %indvars.iv161
  %59 = load double, double* %58, align 8
  %60 = fdiv double %.0.lcssa, %59
  store double %60, double* %34, align 8
  %indvars.iv.next162 = add nuw i64 %indvars.iv161, 1
  %61 = icmp slt i64 %indvars.iv.next162, %indvars.iv182
  %indvars.iv.next158 = add nsw i32 %indvars.iv157, 1
  br i1 %61, label %.lr.ph112, label %.lr.ph122

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122..lr.ph122.split.preheader_crit_edge

.lr.ph122..lr.ph122.split.preheader_crit_edge:    ; preds = %.lr.ph122
  br label %.lr.ph122.split.preheader

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %wide.trip.count176 = zext i32 %indvars.iv174 to i64
  %62 = and i64 %7, 1
  %lcmp.mod213 = icmp eq i64 %62, 0
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 0
  %64 = icmp eq i64 %8, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge118.us
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge118.us ], [ %indvars.iv182, %.lr.ph122.split.us.preheader ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv180
  %66 = load double, double* %65, align 8
  br i1 %lcmp.mod213, label %.prol.preheader210, label %.prol.loopexit211.unr-lcssa

.prol.preheader210:                               ; preds = %.lr.ph122.split.us
  br label %67

; <label>:67:                                     ; preds = %.prol.preheader210
  %68 = load double, double* %63, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv180
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fsub double %66, %71
  br label %.prol.loopexit211.unr-lcssa

.prol.loopexit211.unr-lcssa:                      ; preds = %.lr.ph122.split.us, %67
  %.lcssa202.unr.ph = phi double [ %72, %67 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv169.unr.ph = phi i64 [ 1, %67 ], [ 0, %.lr.ph122.split.us ]
  %.1115.us.unr.ph = phi double [ %72, %67 ], [ %66, %.lr.ph122.split.us ]
  br label %.prol.loopexit211

.prol.loopexit211:                                ; preds = %.prol.loopexit211.unr-lcssa
  br i1 %64, label %._crit_edge118.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit211
  br label %73

; <label>:73:                                     ; preds = %73, %.lr.ph122.split.us.new
  %indvars.iv169 = phi i64 [ %indvars.iv169.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next170.1, %73 ]
  %.1115.us = phi double [ %.1115.us.unr.ph, %.lr.ph122.split.us.new ], [ %87, %73 ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv182, i64 %indvars.iv169
  %75 = bitcast double* %74 to <2 x double>*
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv180
  %77 = load double, double* %76, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %78 = load <2 x double>, <2 x double>* %75, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next170, i64 %indvars.iv180
  %80 = load double, double* %79, align 8
  %81 = insertelement <2 x double> undef, double %77, i32 0
  %82 = insertelement <2 x double> %81, double %80, i32 1
  %83 = fmul <2 x double> %78, %82
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %86 = fsub double %.1115.us, %84
  %87 = fsub double %86, %85
  %exitcond177.1 = icmp eq i64 %indvars.iv.next170, %wide.trip.count176
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  br i1 %exitcond177.1, label %._crit_edge118.us.unr-lcssa, label %73

._crit_edge118.us.unr-lcssa:                      ; preds = %73
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.prol.loopexit211, %._crit_edge118.us.unr-lcssa
  %.lcssa202 = phi double [ %.lcssa202.unr.ph, %.prol.loopexit211 ], [ %87, %._crit_edge118.us.unr-lcssa ]
  store double %.lcssa202, double* %65, align 8
  %indvars.iv.next181 = add nuw i64 %indvars.iv180, 1
  %88 = icmp slt i64 %indvars.iv.next181, 2000
  br i1 %88, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph122.split:                                  ; preds = %.lr.ph122.split.preheader195, %.lr.ph122.split
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %.lr.ph122.split ], [ %indvars.iv165.ph, %.lr.ph122.split.preheader195 ]
  %exitcond167 = icmp eq i64 %indvars.iv165, 1999
  %indvars.iv.next166 = add nuw i64 %indvars.iv165, 1
  br i1 %exitcond167, label %._crit_edge123.loopexit196, label %.lr.ph122.split, !llvm.loop !21

._crit_edge123.loopexit:                          ; preds = %._crit_edge118.us
  br label %._crit_edge123

._crit_edge123.loopexit196:                       ; preds = %.lr.ph122.split
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit196, %._crit_edge123.loopexit, %middle.block
  %indvars.iv.next183 = add nuw i64 %indvars.iv182, 1
  %89 = icmp slt i64 %indvars.iv.next183, 2000
  %indvars.iv.next175 = add nsw i32 %indvars.iv174, 1
  br i1 %89, label %6, label %._crit_edge123._crit_edge128.preheader

._crit_edge123._crit_edge128.preheader:           ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge128

._crit_edge123._crit_edge128:                     ; preds = %._crit_edge123._crit_edge128.preheader, %._crit_edge101
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge101 ], [ 0, %._crit_edge123._crit_edge128.preheader ]
  %indvars.iv146 = phi i32 [ %indvars.iv.next147, %._crit_edge101 ], [ -1, %._crit_edge123._crit_edge128.preheader ]
  %90 = add i64 %indvars.iv150, 4294967295
  %91 = and i64 %90, 4294967295
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv150
  %93 = load double, double* %92, align 8
  %94 = icmp sgt i64 %indvars.iv150, 0
  br i1 %94, label %.lr.ph100.preheader, label %._crit_edge101

.lr.ph100.preheader:                              ; preds = %._crit_edge123._crit_edge128
  %wide.trip.count148 = zext i32 %indvars.iv146 to i64
  %xtraiter203 = and i64 %indvars.iv150, 3
  %lcmp.mod204 = icmp eq i64 %xtraiter203, 0
  br i1 %lcmp.mod204, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol, %.lr.ph100.prol.preheader
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph100.prol ], [ 0, %.lr.ph100.prol.preheader ]
  %.298.prol = phi double [ %100, %.lr.ph100.prol ], [ %93, %.lr.ph100.prol.preheader ]
  %prol.iter205 = phi i64 [ %prol.iter205.sub, %.lr.ph100.prol ], [ %xtraiter203, %.lr.ph100.prol.preheader ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv141.prol
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %4, i64 %indvars.iv141.prol
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fsub double %.298.prol, %99
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter205.sub = add i64 %prol.iter205, -1
  %prol.iter205.cmp = icmp eq i64 %prol.iter205.sub, 0
  br i1 %prol.iter205.cmp, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol, !llvm.loop !23

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.preheader, %.lr.ph100.prol.loopexit.unr-lcssa
  %.lcssa200.unr = phi double [ undef, %.lr.ph100.preheader ], [ %100, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next142.prol, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %.298.unr = phi double [ %93, %.lr.ph100.preheader ], [ %100, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %101 = icmp ult i64 %91, 3
  br i1 %101, label %._crit_edge101.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr, %.lr.ph100.preheader.new ], [ %indvars.iv.next142.3, %.lr.ph100 ]
  %.298 = phi double [ %.298.unr, %.lr.ph100.preheader.new ], [ %123, %.lr.ph100 ]
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv141
  %103 = bitcast double* %102 to <2 x double>*
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv141
  %105 = bitcast double* %104 to <2 x double>*
  %106 = load <2 x double>, <2 x double>* %103, align 8
  %107 = load <2 x double>, <2 x double>* %105, align 8
  %108 = fmul <2 x double> %106, %107
  %109 = extractelement <2 x double> %108, i32 0
  %110 = extractelement <2 x double> %108, i32 1
  %111 = fsub double %.298, %109
  %112 = fsub double %111, %110
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv.next142.1
  %114 = bitcast double* %113 to <2 x double>*
  %115 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next142.1
  %116 = bitcast double* %115 to <2 x double>*
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %117 = load <2 x double>, <2 x double>* %114, align 8
  %118 = load <2 x double>, <2 x double>* %116, align 8
  %119 = fmul <2 x double> %117, %118
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fsub double %112, %120
  %123 = fsub double %122, %121
  %exitcond149.3 = icmp eq i64 %indvars.iv.next142.2, %wide.trip.count148
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  br i1 %exitcond149.3, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr, %.lr.ph100.prol.loopexit ], [ %123, %._crit_edge101.loopexit.unr-lcssa ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge123._crit_edge128
  %.2.lcssa = phi double [ %93, %._crit_edge123._crit_edge128 ], [ %.lcssa200, %._crit_edge101.loopexit ]
  %124 = getelementptr inbounds double, double* %4, i64 %indvars.iv150
  store double %.2.lcssa, double* %124, align 8
  %indvars.iv.next151 = add nuw i64 %indvars.iv150, 1
  %125 = icmp slt i64 %indvars.iv.next151, 2000
  %indvars.iv.next147 = add nsw i32 %indvars.iv146, 1
  br i1 %125, label %._crit_edge123._crit_edge128, label %._crit_edge101._crit_edge131.preheader

._crit_edge101._crit_edge131.preheader:           ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge131

._crit_edge101._crit_edge131:                     ; preds = %._crit_edge101._crit_edge131.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge101._crit_edge131.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %126 = sub i32 2000, %indvar
  %127 = sext i32 %126 to i64
  %128 = sub nsw i64 1999, %127
  %129 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %130 = load double, double* %129, align 8
  %131 = icmp slt i32 %indvars.iv, 2000
  br i1 %131, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge101._crit_edge131
  %132 = sext i32 %indvars.iv to i64
  %133 = sub nsw i64 0, %127
  %xtraiter = and i64 %133, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %134

; <label>:134:                                    ; preds = %134, %.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %134 ], [ %132, %.prol.preheader ]
  %.394.prol = phi double [ %140, %134 ], [ %130, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %134 ], [ %xtraiter, %.prol.preheader ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %3, i64 %indvars.iv137.prol
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fsub double %.394.prol, %139
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %134, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %134
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %140, %.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %132, %.lr.ph ], [ %indvars.iv.next138.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %130, %.lr.ph ], [ %140, %.prol.loopexit.unr-lcssa ]
  %141 = icmp ult i64 %128, 3
  br i1 %141, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %142

; <label>:142:                                    ; preds = %142, %.lr.ph.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph.new ], [ %indvars.iv.next138.3, %142 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %164, %142 ]
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137
  %144 = bitcast double* %143 to <2 x double>*
  %145 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %146 = bitcast double* %145 to <2 x double>*
  %147 = load <2 x double>, <2 x double>* %144, align 8
  %148 = load <2 x double>, <2 x double>* %146, align 8
  %149 = fmul <2 x double> %147, %148
  %150 = extractelement <2 x double> %149, i32 0
  %151 = extractelement <2 x double> %149, i32 1
  %152 = fsub double %.394, %150
  %153 = fsub double %152, %151
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %155 = bitcast double* %154 to <2 x double>*
  %156 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next138.1
  %157 = bitcast double* %156 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %158 = load <2 x double>, <2 x double>* %155, align 8
  %159 = load <2 x double>, <2 x double>* %157, align 8
  %160 = fmul <2 x double> %158, %159
  %161 = extractelement <2 x double> %160, i32 0
  %162 = extractelement <2 x double> %160, i32 1
  %163 = fsub double %153, %161
  %164 = fsub double %163, %162
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %142

._crit_edge.loopexit.unr-lcssa:                   ; preds = %142
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %164, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge101._crit_edge131
  %.3.lcssa = phi double [ %130, %._crit_edge101._crit_edge131 ], [ %.lcssa, %._crit_edge.loopexit ]
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %166 = load double, double* %165, align 8
  %167 = fdiv double %.3.lcssa, %166
  %168 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %167, double* %168, align 8
  %169 = icmp sgt i64 %indvars.iv139, 0
  br i1 %169, label %._crit_edge._crit_edge, label %170

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge131

; <label>:170:                                    ; preds = %._crit_edge
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
