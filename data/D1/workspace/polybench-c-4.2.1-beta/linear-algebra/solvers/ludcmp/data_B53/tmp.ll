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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %5
  %indvars.iv133 = phi i64 [ 0, %5 ], [ %indvars.iv.next134.1, %._crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv133
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv133
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next134 = or i64 %indvars.iv133, 1
  %10 = trunc i64 %indvars.iv.next134 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv133
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %13 = trunc i64 %indvars.iv.next134.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond135.1 = icmp eq i64 %indvars.iv.next134, 1999
  br i1 %exitcond135.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge100.._crit_edge81_crit_edge
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge100.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv131, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %22
  %23 = ashr exact i64 %sext, 29
  br label %25

._crit_edge82:                                    ; preds = %25
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %24 = icmp slt i64 %indvars.iv.next132, 2000
  br i1 %24, label %._crit_edge100.._crit_edge81_crit_edge, label %36

; <label>:25:                                     ; preds = %._crit_edge181, %.lr.ph
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge181 ], [ 0, %.lr.ph ]
  %26 = sub nsw i64 0, %indvars.iv121
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv121
  store double %31, double* %32, align 8
  %exitcond125 = icmp eq i64 %indvars.iv121, %indvars.iv131
  br i1 %exitcond125, label %._crit_edge82, label %._crit_edge181

._crit_edge181:                                   ; preds = %25
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br label %25

._crit_edge100.._crit_edge81_crit_edge:           ; preds = %._crit_edge82
  %33 = sub nsw i64 16000, %23
  %34 = bitcast double* %scevgep138 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %34, i8 0, i64 %33, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph

; <label>:36:                                     ; preds = %._crit_edge82
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %37, align 8
  %38 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge83_crit_edge

.._crit_edge83_crit_edge:                         ; preds = %.._crit_edge83_crit_edge..._crit_edge83_crit_edge_crit_edge, %36
  %indvars.iv119 = phi i64 [ 0, %36 ], [ %indvars.iv.next120, %.._crit_edge83_crit_edge..._crit_edge83_crit_edge_crit_edge ]
  %39 = mul nuw nsw i64 %indvars.iv119, 16000
  %scevgep = getelementptr i8, i8* %38, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %exitcond140 = icmp eq i64 %indvars.iv119, 1999
  br i1 %exitcond140, label %._crit_edge85.preheader, label %.._crit_edge83_crit_edge..._crit_edge83_crit_edge_crit_edge

._crit_edge85.preheader:                          ; preds = %.._crit_edge83_crit_edge
  br label %._crit_edge85

.._crit_edge83_crit_edge..._crit_edge83_crit_edge_crit_edge: ; preds = %.._crit_edge83_crit_edge
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  br label %.._crit_edge83_crit_edge

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %83
  %indvars.iv114 = phi i64 [ %40, %83 ], [ 0, %._crit_edge85.preheader ]
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %40 = add i64 %indvars.iv114, 1
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %40
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block._crit_edge, %._crit_edge85
  %indvars.iv112 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next113, %middle.block._crit_edge ]
  %41 = bitcast double* %scevgep145 to i8*
  %42 = bitcast double* %scevgep143 to i8*
  %43 = mul i64 %indvars.iv112, 16000
  %scevgep141 = getelementptr i8, i8* %38, i64 %43
  %44 = add i64 %43, 16000
  %scevgep142 = getelementptr i8, i8* %38, i64 %44
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv114
  %bound0 = icmp ult i8* %scevgep141, %41
  %bound1 = icmp ult i8* %42, %scevgep142
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %45 to i8*
  %bound0148 = icmp ult i8* %scevgep141, %bc
  %bound1149 = icmp ult i8* %bc, %scevgep142
  %found.conflict150 = and i1 %bound0148, %bound1149
  %conflict.rdx = or i1 %found.conflict, %found.conflict150
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge87
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge87
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %46 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %47 = or i64 %index, 1
  %48 = or i64 %index, 2
  %49 = or i64 %index, 3
  %50 = load double, double* %45, align 8, !alias.scope !1
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv114
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %47, i64 %indvars.iv114
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %48, i64 %indvars.iv114
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %49, i64 %indvars.iv114
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = load double, double* %54, align 8, !alias.scope !4
  %59 = load double, double* %55, align 8, !alias.scope !4
  %60 = load double, double* %56, align 8, !alias.scope !4
  %61 = insertelement <2 x double> undef, double %57, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = fmul <2 x double> %52, %62
  %66 = fmul <2 x double> %52, %64
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv112, i64 %index
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !6, !noalias !8
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = fadd <2 x double> %wide.load, %65
  %72 = fadd <2 x double> %wide.load152, %66
  store <2 x double> %71, <2 x double>* %68, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %72, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %73 = icmp eq i64 %index.next, 2000
  br i1 %73, label %middle.block._crit_edge.loopexit187, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph.preheader, %._crit_edge182
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge182 ], [ 0, %scalar.ph.preheader ]
  %74 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %75 = load double, double* %45, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv114
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv112, i64 %indvars.iv109
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %exitcond111 = icmp eq i64 %indvars.iv109, 1999
  br i1 %exitcond111, label %middle.block._crit_edge.loopexit, label %._crit_edge182, !llvm.loop !12

._crit_edge182:                                   ; preds = %scalar.ph
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  br label %scalar.ph

middle.block._crit_edge.loopexit:                 ; preds = %scalar.ph
  br label %middle.block._crit_edge

middle.block._crit_edge.loopexit187:              ; preds = %vector.body
  br label %middle.block._crit_edge

middle.block._crit_edge:                          ; preds = %middle.block._crit_edge.loopexit187, %middle.block._crit_edge.loopexit
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %82 = icmp slt i64 %indvars.iv.next113, 2000
  br i1 %82, label %._crit_edge87, label %83

; <label>:83:                                     ; preds = %middle.block._crit_edge
  %84 = icmp slt i64 %40, 2000
  br i1 %84, label %._crit_edge85, label %._crit_edge88.preheader

._crit_edge88.preheader:                          ; preds = %83
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block154._crit_edge
  %indvars.iv107 = phi i64 [ %85, %middle.block154._crit_edge ], [ 0, %._crit_edge88.preheader ]
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 0
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  %85 = add i64 %indvars.iv107, 1
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 %85, i64 0
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  %86 = mul i64 %indvars.iv107, 16000
  %scevgep162 = getelementptr i8, i8* %38, i64 %86
  %87 = add i64 %86, 16000
  %scevgep163 = getelementptr i8, i8* %38, i64 %87
  %bound0164 = icmp ult i8* %scevgep158159, %scevgep163
  %bound1165 = icmp ult i8* %scevgep162, %scevgep160161
  %memcheck.conflict167 = and i1 %bound0164, %bound1165
  br i1 %memcheck.conflict167, label %scalar.ph155.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %._crit_edge88
  br label %vector.body153

scalar.ph155.preheader:                           ; preds = %._crit_edge88
  br label %scalar.ph155

vector.body153:                                   ; preds = %vector.body153, %vector.body153.preheader
  %index170 = phi i64 [ 0, %vector.body153.preheader ], [ %index.next171.1, %vector.body153 ]
  %88 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %89 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv107, i64 %index170
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index170
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %index.next171 = or i64 %index170, 4
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvars.iv107, i64 %index.next171
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index.next171
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next171.1 = add nsw i64 %index170, 8
  %106 = icmp eq i64 %index.next171.1, 2000
  br i1 %106, label %middle.block154._crit_edge.loopexit186, label %vector.body153, !llvm.loop !18

scalar.ph155:                                     ; preds = %scalar.ph155.preheader, %._crit_edge183
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge183 ], [ 0, %scalar.ph155.preheader ]
  %107 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %middle.block154._crit_edge.loopexit, label %._crit_edge183, !llvm.loop !19

._crit_edge183:                                   ; preds = %scalar.ph155
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph155

middle.block154._crit_edge.loopexit:              ; preds = %scalar.ph155
  br label %middle.block154._crit_edge

middle.block154._crit_edge.loopexit186:           ; preds = %vector.body153
  br label %middle.block154._crit_edge

middle.block154._crit_edge:                       ; preds = %middle.block154._crit_edge.loopexit186, %middle.block154._crit_edge.loopexit
  %113 = icmp slt i64 %85, 2000
  br i1 %113, label %._crit_edge88, label %114

; <label>:114:                                    ; preds = %middle.block154._crit_edge
  tail call void @free(i8* nonnull %38) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge130.._crit_edge_crit_edge, %5
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge130.._crit_edge_crit_edge ], [ 4294967295, %5 ]
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge130.._crit_edge_crit_edge ], [ 0, %5 ]
  %6 = sub i64 2000, %indvars.iv172
  %7 = add i64 %6, -4
  %8 = lshr i64 %7, 2
  %9 = sub i64 2000, %indvars.iv172
  %10 = and i64 %indvars.iv181, 4294967295
  %11 = icmp sgt i64 %indvars.iv172, 0
  br i1 %11, label %.lr.ph120.preheader, label %.lr.ph129.split.preheader

.lr.ph120.preheader:                              ; preds = %._crit_edge
  br label %.lr.ph120

.lr.ph129.split.us.preheader:                     ; preds = %._crit_edge117
  br label %.lr.ph129.split.us

.lr.ph129.split.preheader:                        ; preds = %._crit_edge
  %min.iters.check = icmp ult i64 %9, 4
  br i1 %min.iters.check, label %.lr.ph129.split.preheader195, label %min.iters.checked

.lr.ph129.split.preheader195:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph129.split.preheader
  %indvars.iv159.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv172, %min.iters.checked ], [ %indvars.iv172, %.lr.ph129.split.preheader ]
  br label %.lr.ph129.split

min.iters.checked:                                ; preds = %.lr.ph129.split.preheader
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv172, %n.vec
  br i1 %cmp.zero, label %.lr.ph129.split.preheader195, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv172
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load193.prol = load <2 x i64>, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load193.prol, <2 x i64>* %16, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %17 = icmp eq i64 %8, 0
  br i1 %17, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %18 = add i64 %indvars.iv172, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %18
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load193, <2 x i64>* %22, align 8
  %index.next = add i64 %index, 4
  %23 = add i64 %indvars.iv172, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %23
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load193.1 = load <2 x i64>, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load193.1, <2 x i64>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = icmp eq i64 %index.next.1, %n.vec
  br i1 %28, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %9, %n.vec
  br i1 %cmp.n, label %._crit_edge130, label %.lr.ph129.split.preheader195

.lr.ph129.split.us:                               ; preds = %.lr.ph129.split.us.preheader, %._crit_edge125.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge125.us ], [ %indvars.iv172, %.lr.ph129.split.us.preheader ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv170
  %30 = load double, double* %29, align 8
  br label %31

; <label>:31:                                     ; preds = %._crit_edge194, %.lr.ph129.split.us
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge194 ], [ 0, %.lr.ph129.split.us ]
  %.1122.us = phi double [ %37, %._crit_edge194 ], [ %30, %.lr.ph129.split.us ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv162
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv162, i64 %indvars.iv170
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.1122.us, %36
  %exitcond183 = icmp eq i64 %indvars.iv162, %10
  br i1 %exitcond183, label %._crit_edge125.us, label %._crit_edge194

._crit_edge194:                                   ; preds = %31
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  br label %31

._crit_edge125.us:                                ; preds = %31
  store double %37, double* %29, align 8
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %38 = icmp slt i64 %indvars.iv.next171, 2000
  br i1 %38, label %.lr.ph129.split.us, label %._crit_edge130.loopexit

.lr.ph120:                                        ; preds = %.lr.ph120.preheader, %._crit_edge117..lr.ph120_crit_edge
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge117..lr.ph120_crit_edge ], [ 4294967295, %.lr.ph120.preheader ]
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %._crit_edge117..lr.ph120_crit_edge ], [ 0, %.lr.ph120.preheader ]
  %39 = and i64 %indvars.iv177, 4294967295
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv155
  %41 = load double, double* %40, align 8
  %42 = icmp sgt i64 %indvars.iv155, 0
  br i1 %42, label %.lr.ph116.preheader, label %._crit_edge117

.lr.ph116.preheader:                              ; preds = %.lr.ph120
  br label %.lr.ph116

.lr.ph116:                                        ; preds = %.lr.ph116.preheader, %.lr.ph116..lr.ph116_crit_edge
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %.lr.ph116..lr.ph116_crit_edge ], [ 0, %.lr.ph116.preheader ]
  %.0114 = phi double [ %48, %.lr.ph116..lr.ph116_crit_edge ], [ %41, %.lr.ph116.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv149
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv155
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %.0114, %47
  %exitcond179 = icmp eq i64 %indvars.iv149, %39
  br i1 %exitcond179, label %._crit_edge117.loopexit, label %.lr.ph116..lr.ph116_crit_edge

.lr.ph116..lr.ph116_crit_edge:                    ; preds = %.lr.ph116
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  br label %.lr.ph116

._crit_edge117.loopexit:                          ; preds = %.lr.ph116
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %._crit_edge117.loopexit, %.lr.ph120
  %.0.lcssa = phi double [ %41, %.lr.ph120 ], [ %48, %._crit_edge117.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv155
  %50 = load double, double* %49, align 8
  %51 = fdiv double %.0.lcssa, %50
  store double %51, double* %40, align 8
  %indvars.iv.next156 = add nuw i64 %indvars.iv155, 1
  %52 = icmp slt i64 %indvars.iv.next156, %indvars.iv172
  br i1 %52, label %._crit_edge117..lr.ph120_crit_edge, label %.lr.ph129.split.us.preheader

._crit_edge117..lr.ph120_crit_edge:               ; preds = %._crit_edge117
  %indvars.iv.next178 = add nuw nsw i64 %39, 1
  br label %.lr.ph120

.lr.ph129.split:                                  ; preds = %.lr.ph129.split.preheader195, %.lr.ph129.split..lr.ph129.split_crit_edge
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %.lr.ph129.split..lr.ph129.split_crit_edge ], [ %indvars.iv159.ph, %.lr.ph129.split.preheader195 ]
  %exitcond161 = icmp eq i64 %indvars.iv159, 1999
  br i1 %exitcond161, label %._crit_edge130.loopexit206, label %.lr.ph129.split..lr.ph129.split_crit_edge, !llvm.loop !21

.lr.ph129.split..lr.ph129.split_crit_edge:        ; preds = %.lr.ph129.split
  %indvars.iv.next160 = add nuw i64 %indvars.iv159, 1
  br label %.lr.ph129.split

._crit_edge130.loopexit:                          ; preds = %._crit_edge125.us
  br label %._crit_edge130

._crit_edge130.loopexit206:                       ; preds = %.lr.ph129.split
  br label %._crit_edge130

._crit_edge130:                                   ; preds = %._crit_edge130.loopexit206, %._crit_edge130.loopexit, %middle.block
  %indvars.iv.next173 = add nuw i64 %indvars.iv172, 1
  %53 = icmp slt i64 %indvars.iv.next173, 2000
  br i1 %53, label %._crit_edge130.._crit_edge_crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge130
  br label %._crit_edge93

._crit_edge130.._crit_edge_crit_edge:             ; preds = %._crit_edge130
  %indvars.iv.next182 = add nuw nsw i64 %10, 1
  br label %._crit_edge

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge109.._crit_edge93_crit_edge
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge109.._crit_edge93_crit_edge ], [ 4294967295, %._crit_edge93.preheader ]
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge109.._crit_edge93_crit_edge ], [ 0, %._crit_edge93.preheader ]
  %54 = and i64 %indvars.iv174, 4294967295
  %55 = getelementptr inbounds double, double* %2, i64 %indvars.iv147
  %56 = load double, double* %55, align 8
  %57 = icmp sgt i64 %indvars.iv147, 0
  br i1 %57, label %.lr.ph108.preheader, label %._crit_edge109

.lr.ph108.preheader:                              ; preds = %._crit_edge93
  br label %.lr.ph108

.lr.ph108:                                        ; preds = %.lr.ph108.preheader, %.lr.ph108..lr.ph108_crit_edge
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %.lr.ph108..lr.ph108_crit_edge ], [ 0, %.lr.ph108.preheader ]
  %.2106 = phi double [ %63, %.lr.ph108..lr.ph108_crit_edge ], [ %56, %.lr.ph108.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv142
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %.2106, %62
  %exitcond176 = icmp eq i64 %indvars.iv142, %54
  br i1 %exitcond176, label %._crit_edge109.loopexit, label %.lr.ph108..lr.ph108_crit_edge

.lr.ph108..lr.ph108_crit_edge:                    ; preds = %.lr.ph108
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  br label %.lr.ph108

._crit_edge109.loopexit:                          ; preds = %.lr.ph108
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %56, %._crit_edge93 ], [ %63, %._crit_edge109.loopexit ]
  %64 = getelementptr inbounds double, double* %4, i64 %indvars.iv147
  store double %.2.lcssa, double* %64, align 8
  %indvars.iv.next148 = add nuw i64 %indvars.iv147, 1
  %65 = icmp slt i64 %indvars.iv.next148, 2000
  br i1 %65, label %._crit_edge109.._crit_edge93_crit_edge, label %._crit_edge95.preheader

._crit_edge95.preheader:                          ; preds = %._crit_edge109
  br label %._crit_edge95

._crit_edge109.._crit_edge93_crit_edge:           ; preds = %._crit_edge109
  %indvars.iv.next175 = add nuw nsw i64 %54, 1
  br label %._crit_edge93

._crit_edge95:                                    ; preds = %._crit_edge95.preheader, %._crit_edge101.._crit_edge95_crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge101.._crit_edge95_crit_edge ], [ 1999, %._crit_edge95.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge101.._crit_edge95_crit_edge ], [ 2000, %._crit_edge95.preheader ]
  %66 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %67 = load double, double* %66, align 8
  %68 = icmp slt i32 %indvars.iv, 2000
  br i1 %68, label %._crit_edge95..lr.ph_crit_edge, label %._crit_edge101

._crit_edge95..lr.ph_crit_edge:                   ; preds = %._crit_edge95
  %69 = sext i32 %indvars.iv to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %._crit_edge95..lr.ph_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %.lr.ph..lr.ph_crit_edge ], [ %69, %._crit_edge95..lr.ph_crit_edge ]
  %.399 = phi double [ %75, %.lr.ph..lr.ph_crit_edge ], [ %67, %._crit_edge95..lr.ph_crit_edge ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv138
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %.399, %74
  %exitcond = icmp eq i64 %indvars.iv138, 1999
  br i1 %exitcond, label %._crit_edge101.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next139 = add nsw i64 %indvars.iv138, 1
  br label %.lr.ph

._crit_edge101.loopexit:                          ; preds = %.lr.ph
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge95
  %.3.lcssa = phi double [ %67, %._crit_edge95 ], [ %75, %._crit_edge101.loopexit ]
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  %77 = load double, double* %76, align 8
  %78 = fdiv double %.3.lcssa, %77
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  store double %78, double* %79, align 8
  %80 = icmp sgt i64 %indvars.iv140, 0
  br i1 %80, label %._crit_edge101.._crit_edge95_crit_edge, label %81

._crit_edge101.._crit_edge95_crit_edge:           ; preds = %._crit_edge101
  %indvars.iv.next141 = add i64 %indvars.iv140, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %._crit_edge95

; <label>:81:                                     ; preds = %._crit_edge101
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
