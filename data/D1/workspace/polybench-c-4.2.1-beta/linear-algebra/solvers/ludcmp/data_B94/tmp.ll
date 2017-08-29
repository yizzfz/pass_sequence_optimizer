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
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv116
  %scevgep147148 = bitcast double* %scevgep147 to i8*
  %52 = add i64 %indvars.iv116, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %middle.block, %._crit_edge105
  %indvars.iv114 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next115, %middle.block ]
  %53 = mul i64 %indvars.iv114, 16000
  %scevgep145 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep146 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv116
  %bound0 = icmp ult i8* %scevgep145, %scevgep149150
  %bound1 = icmp ult i8* %scevgep147148, %scevgep146
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
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
  %wide.load156 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load156, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit186, label %vector.body, !llvm.loop !9

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

middle.block.loopexit186:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit186, %middle.block.loopexit
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

._crit_edge107:                                   ; preds = %._crit_edge107.preheader, %middle.block158
  %indvars.iv109 = phi i64 [ %107, %middle.block158 ], [ 0, %._crit_edge107.preheader ]
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 0
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  %107 = add i64 %indvars.iv109, 1
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %0, i64 %107, i64 0
  %scevgep164165 = bitcast double* %scevgep164 to i8*
  %108 = mul i64 %indvars.iv109, 16000
  %scevgep166 = getelementptr i8, i8* %39, i64 %108
  %109 = add i64 %108, 16000
  %scevgep167 = getelementptr i8, i8* %39, i64 %109
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
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv109, i64 %index174
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %index174
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next175 = or i64 %index174, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv109, i64 %index.next175
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %index.next175
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %index.next175.1 = add nsw i64 %index174, 8
  %126 = icmp eq i64 %index.next175.1, 2000
  br i1 %126, label %middle.block158.loopexit185, label %vector.body157, !llvm.loop !18

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph159.preheader ], [ %indvars.iv.next.4, %scalar.ph159 ]
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
  br i1 %exitcond.4, label %middle.block158.loopexit, label %scalar.ph159, !llvm.loop !19

middle.block158.loopexit:                         ; preds = %scalar.ph159
  br label %middle.block158

middle.block158.loopexit185:                      ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %middle.block158.loopexit185, %middle.block158.loopexit
  %152 = icmp slt i64 %107, 2000
  br i1 %152, label %._crit_edge107, label %153

; <label>:153:                                    ; preds = %middle.block158
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge123, %4
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %._crit_edge123 ], [ 0, %4 ]
  %indvars.iv174 = phi i32 [ %indvars.iv.next175, %._crit_edge123 ], [ -1, %4 ]
  %6 = add i64 %indvars.iv182, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv182
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv182
  %12 = icmp sgt i64 %indvars.iv182, 0
  br i1 %12, label %.lr.ph112.preheader, label %.lr.ph122.split.preheader

.lr.ph112.preheader:                              ; preds = %5
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 0
  br label %.lr.ph112

.lr.ph122.split.preheader:                        ; preds = %.lr.ph122..lr.ph122.split.preheader_crit_edge, %5
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph122.split.preheader195, label %min.iters.checked

.lr.ph122.split.preheader195:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph122.split.preheader
  %indvars.iv165.ph = phi i64 [ %indvars.iv182, %min.iters.checked ], [ %indvars.iv182, %.lr.ph122.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph122.split

min.iters.checked:                                ; preds = %.lr.ph122.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv182, %n.vec
  br i1 %cmp.zero, label %.lr.ph122.split.preheader195, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod209 = icmp eq i64 %14, 0
  br i1 %lcmp.mod209, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %10, 0
  br i1 %15, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %index.next.1 = add i64 %index, 8
  %16 = icmp eq i64 %index.next.1, %n.vec
  br i1 %16, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge123, label %.lr.ph122.split.preheader195

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge108
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge108 ], [ 0, %.lr.ph112.preheader ]
  %indvars.iv157 = phi i32 [ %indvars.iv.next158, %._crit_edge108 ], [ -1, %.lr.ph112.preheader ]
  %17 = add i64 %indvars.iv161, 4294967295
  %18 = and i64 %17, 4294967295
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 %indvars.iv161
  %20 = load double, double* %19, align 8
  %21 = icmp sgt i64 %indvars.iv161, 0
  br i1 %21, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %wide.trip.count159 = zext i32 %indvars.iv157 to i64
  %22 = and i64 %17, 1
  %lcmp.mod207 = icmp eq i64 %22, 0
  br i1 %lcmp.mod207, label %.lr.ph107.prol.preheader, label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol.preheader
  %23 = load double, double* %13, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv161
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %20, %26
  br label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.preheader, %.lr.ph107.prol
  %.lcssa201.unr.ph = phi double [ %27, %.lr.ph107.prol ], [ undef, %.lr.ph107.preheader ]
  %indvars.iv152.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %.lr.ph107.preheader ]
  %.0105.unr.ph = phi double [ %27, %.lr.ph107.prol ], [ %20, %.lr.ph107.preheader ]
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.prol.loopexit.unr-lcssa
  %28 = icmp eq i64 %18, 0
  br i1 %28, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv152 = phi i64 [ %indvars.iv152.unr.ph, %.lr.ph107.preheader.new ], [ %indvars.iv.next153.1, %.lr.ph107 ]
  %.0105 = phi double [ %.0105.unr.ph, %.lr.ph107.preheader.new ], [ %42, %.lr.ph107 ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 %indvars.iv152
  %30 = bitcast double* %29 to <2 x double>*
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv152, i64 %indvars.iv161
  %32 = load double, double* %31, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %33 = load <2 x double>, <2 x double>* %30, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next153, i64 %indvars.iv161
  %35 = load double, double* %34, align 8
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %33, %37
  %39 = extractelement <2 x double> %38, i32 0
  %40 = extractelement <2 x double> %38, i32 1
  %41 = fsub double %.0105, %39
  %42 = fsub double %41, %40
  %exitcond160.1 = icmp eq i64 %indvars.iv.next153, %wide.trip.count159
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  br i1 %exitcond160.1, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr.ph, %.lr.ph107.prol.loopexit ], [ %42, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %20, %.lr.ph112 ], [ %.lcssa201, %._crit_edge108.loopexit ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 %indvars.iv161
  %44 = load double, double* %43, align 8
  %45 = fdiv double %.0.lcssa, %44
  store double %45, double* %19, align 8
  %indvars.iv.next162 = add nuw i64 %indvars.iv161, 1
  %46 = icmp slt i64 %indvars.iv.next162, %indvars.iv182
  %indvars.iv.next158 = add nsw i32 %indvars.iv157, 1
  br i1 %46, label %.lr.ph112, label %.lr.ph122

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122..lr.ph122.split.preheader_crit_edge

.lr.ph122..lr.ph122.split.preheader_crit_edge:    ; preds = %.lr.ph122
  br label %.lr.ph122.split.preheader

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %wide.trip.count176 = zext i32 %indvars.iv174 to i64
  %47 = and i64 %6, 1
  %lcmp.mod213 = icmp eq i64 %47, 0
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 0
  %49 = icmp eq i64 %7, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge118.us
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge118.us ], [ %indvars.iv182, %.lr.ph122.split.us.preheader ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 %indvars.iv180
  %51 = load double, double* %50, align 8
  br i1 %lcmp.mod213, label %.prol.preheader210, label %.prol.loopexit211.unr-lcssa

.prol.preheader210:                               ; preds = %.lr.ph122.split.us
  br label %52

; <label>:52:                                     ; preds = %.prol.preheader210
  %53 = load double, double* %48, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv180
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  br label %.prol.loopexit211.unr-lcssa

.prol.loopexit211.unr-lcssa:                      ; preds = %.lr.ph122.split.us, %52
  %.lcssa202.unr.ph = phi double [ %57, %52 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv169.unr.ph = phi i64 [ 1, %52 ], [ 0, %.lr.ph122.split.us ]
  %.1115.us.unr.ph = phi double [ %57, %52 ], [ %51, %.lr.ph122.split.us ]
  br label %.prol.loopexit211

.prol.loopexit211:                                ; preds = %.prol.loopexit211.unr-lcssa
  br i1 %49, label %._crit_edge118.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit211
  br label %58

; <label>:58:                                     ; preds = %58, %.lr.ph122.split.us.new
  %indvars.iv169 = phi i64 [ %indvars.iv169.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next170.1, %58 ]
  %.1115.us = phi double [ %.1115.us.unr.ph, %.lr.ph122.split.us.new ], [ %72, %58 ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv182, i64 %indvars.iv169
  %60 = bitcast double* %59 to <2 x double>*
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv169, i64 %indvars.iv180
  %62 = load double, double* %61, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %63 = load <2 x double>, <2 x double>* %60, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next170, i64 %indvars.iv180
  %65 = load double, double* %64, align 8
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fmul <2 x double> %63, %67
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %71 = fsub double %.1115.us, %69
  %72 = fsub double %71, %70
  %exitcond177.1 = icmp eq i64 %indvars.iv.next170, %wide.trip.count176
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  br i1 %exitcond177.1, label %._crit_edge118.us.unr-lcssa, label %58

._crit_edge118.us.unr-lcssa:                      ; preds = %58
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.prol.loopexit211, %._crit_edge118.us.unr-lcssa
  %.lcssa202 = phi double [ %.lcssa202.unr.ph, %.prol.loopexit211 ], [ %72, %._crit_edge118.us.unr-lcssa ]
  store double %.lcssa202, double* %50, align 8
  %indvars.iv.next181 = add nuw i64 %indvars.iv180, 1
  %73 = icmp slt i64 %indvars.iv.next181, 2000
  br i1 %73, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

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
  %74 = icmp slt i64 %indvars.iv.next183, 2000
  %indvars.iv.next175 = add nsw i32 %indvars.iv174, 1
  br i1 %74, label %5, label %._crit_edge123._crit_edge128.preheader

._crit_edge123._crit_edge128.preheader:           ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge128

._crit_edge123._crit_edge128:                     ; preds = %._crit_edge123._crit_edge128.preheader, %._crit_edge101
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge101 ], [ 0, %._crit_edge123._crit_edge128.preheader ]
  %indvars.iv146 = phi i32 [ %indvars.iv.next147, %._crit_edge101 ], [ -1, %._crit_edge123._crit_edge128.preheader ]
  %75 = add i64 %indvars.iv150, 4294967295
  %76 = and i64 %75, 4294967295
  %77 = getelementptr inbounds double, double* %1, i64 %indvars.iv150
  %78 = load double, double* %77, align 8
  %79 = icmp sgt i64 %indvars.iv150, 0
  br i1 %79, label %.lr.ph100.preheader, label %._crit_edge101

.lr.ph100.preheader:                              ; preds = %._crit_edge123._crit_edge128
  %wide.trip.count148 = zext i32 %indvars.iv146 to i64
  %xtraiter203 = and i64 %indvars.iv150, 3
  %lcmp.mod204 = icmp eq i64 %xtraiter203, 0
  br i1 %lcmp.mod204, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol, %.lr.ph100.prol.preheader
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph100.prol ], [ 0, %.lr.ph100.prol.preheader ]
  %.298.prol = phi double [ %85, %.lr.ph100.prol ], [ %78, %.lr.ph100.prol.preheader ]
  %prol.iter205 = phi i64 [ %prol.iter205.sub, %.lr.ph100.prol ], [ %xtraiter203, %.lr.ph100.prol.preheader ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv141.prol
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %3, i64 %indvars.iv141.prol
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fsub double %.298.prol, %84
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter205.sub = add i64 %prol.iter205, -1
  %prol.iter205.cmp = icmp eq i64 %prol.iter205.sub, 0
  br i1 %prol.iter205.cmp, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol, !llvm.loop !23

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.preheader, %.lr.ph100.prol.loopexit.unr-lcssa
  %.lcssa200.unr = phi double [ undef, %.lr.ph100.preheader ], [ %85, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next142.prol, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %.298.unr = phi double [ %78, %.lr.ph100.preheader ], [ %85, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %86 = icmp ult i64 %76, 3
  br i1 %86, label %._crit_edge101.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr, %.lr.ph100.preheader.new ], [ %indvars.iv.next142.3, %.lr.ph100 ]
  %.298 = phi double [ %.298.unr, %.lr.ph100.preheader.new ], [ %108, %.lr.ph100 ]
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv141
  %88 = bitcast double* %87 to <2 x double>*
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv141
  %90 = bitcast double* %89 to <2 x double>*
  %91 = load <2 x double>, <2 x double>* %88, align 8
  %92 = load <2 x double>, <2 x double>* %90, align 8
  %93 = fmul <2 x double> %91, %92
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %96 = fsub double %.298, %94
  %97 = fsub double %96, %95
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv150, i64 %indvars.iv.next142.1
  %99 = bitcast double* %98 to <2 x double>*
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next142.1
  %101 = bitcast double* %100 to <2 x double>*
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %102 = load <2 x double>, <2 x double>* %99, align 8
  %103 = load <2 x double>, <2 x double>* %101, align 8
  %104 = fmul <2 x double> %102, %103
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fsub double %97, %105
  %108 = fsub double %107, %106
  %exitcond149.3 = icmp eq i64 %indvars.iv.next142.2, %wide.trip.count148
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  br i1 %exitcond149.3, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr, %.lr.ph100.prol.loopexit ], [ %108, %._crit_edge101.loopexit.unr-lcssa ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge123._crit_edge128
  %.2.lcssa = phi double [ %78, %._crit_edge123._crit_edge128 ], [ %.lcssa200, %._crit_edge101.loopexit ]
  %109 = getelementptr inbounds double, double* %3, i64 %indvars.iv150
  store double %.2.lcssa, double* %109, align 8
  %indvars.iv.next151 = add nuw i64 %indvars.iv150, 1
  %110 = icmp slt i64 %indvars.iv.next151, 2000
  %indvars.iv.next147 = add nsw i32 %indvars.iv146, 1
  br i1 %110, label %._crit_edge123._crit_edge128, label %._crit_edge101._crit_edge131.preheader

._crit_edge101._crit_edge131.preheader:           ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge131

._crit_edge101._crit_edge131:                     ; preds = %._crit_edge101._crit_edge131.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge101._crit_edge131.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %111 = sub i32 2000, %indvar
  %112 = sext i32 %111 to i64
  %113 = sub nsw i64 1999, %112
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  %115 = load double, double* %114, align 8
  %116 = icmp slt i32 %indvars.iv, 2000
  br i1 %116, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge101._crit_edge131
  %117 = sext i32 %indvars.iv to i64
  %118 = sub nsw i64 0, %112
  %xtraiter = and i64 %118, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %119

; <label>:119:                                    ; preds = %119, %.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %119 ], [ %117, %.prol.preheader ]
  %.394.prol = phi double [ %125, %119 ], [ %115, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %119 ], [ %xtraiter, %.prol.preheader ]
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %2, i64 %indvars.iv137.prol
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fsub double %.394.prol, %124
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %119, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %119
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %125, %.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %117, %.lr.ph ], [ %indvars.iv.next138.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %115, %.lr.ph ], [ %125, %.prol.loopexit.unr-lcssa ]
  %126 = icmp ult i64 %113, 3
  br i1 %126, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %127

; <label>:127:                                    ; preds = %127, %.lr.ph.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph.new ], [ %indvars.iv.next138.3, %127 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %149, %127 ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv137
  %129 = bitcast double* %128 to <2 x double>*
  %130 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  %131 = bitcast double* %130 to <2 x double>*
  %132 = load <2 x double>, <2 x double>* %129, align 8
  %133 = load <2 x double>, <2 x double>* %131, align 8
  %134 = fmul <2 x double> %132, %133
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  %137 = fsub double %.394, %135
  %138 = fsub double %137, %136
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %140 = bitcast double* %139 to <2 x double>*
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next138.1
  %142 = bitcast double* %141 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %143 = load <2 x double>, <2 x double>* %140, align 8
  %144 = load <2 x double>, <2 x double>* %142, align 8
  %145 = fmul <2 x double> %143, %144
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fsub double %138, %146
  %149 = fsub double %148, %147
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %127

._crit_edge.loopexit.unr-lcssa:                   ; preds = %127
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %149, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge101._crit_edge131
  %.3.lcssa = phi double [ %115, %._crit_edge101._crit_edge131 ], [ %.lcssa, %._crit_edge.loopexit ]
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  %151 = load double, double* %150, align 8
  %152 = fdiv double %.3.lcssa, %151
  %153 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store double %152, double* %153, align 8
  %154 = icmp sgt i64 %indvars.iv139, 0
  br i1 %154, label %._crit_edge._crit_edge, label %155

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge131

; <label>:155:                                    ; preds = %._crit_edge
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
