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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv141 = phi i64 [ 0, %4 ], [ %indvars.iv.next142.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv141
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv141
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next142 = or i64 %indvars.iv141, 1
  %9 = trunc i64 %indvars.iv.next142 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv141
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next142.1 = add nuw nsw i64 %indvars.iv141, 2
  %12 = trunc i64 %indvars.iv.next142.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond143.1 = icmp eq i64 %indvars.iv.next142, 1999
  br i1 %exitcond143.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge100.._crit_edge81_crit_edge
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge100.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv139, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %22 = sub i64 1998, %indvars.iv139
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  br label %27

._crit_edge82:                                    ; preds = %27
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %21
  %25 = add nuw nsw i64 %24, 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %26 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %26, label %._crit_edge100.._crit_edge81_crit_edge, label %37

; <label>:27:                                     ; preds = %._crit_edge183, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge183 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv122
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv122
  store double %33, double* %34, align 8
  %exitcond130 = icmp eq i64 %indvars.iv122, %indvars.iv139
  br i1 %exitcond130, label %._crit_edge82, label %._crit_edge183

._crit_edge183:                                   ; preds = %27
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br label %27

._crit_edge100.._crit_edge81_crit_edge:           ; preds = %._crit_edge82
  %35 = bitcast double* %scevgep137 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge82
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge83_crit_edge

.._crit_edge83_crit_edge:                         ; preds = %.._crit_edge83_crit_edge, %37
  %indvars.iv120 = phi i64 [ 0, %37 ], [ %indvars.iv.next121.7, %.._crit_edge83_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %41 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %42 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %43 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %44 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %45 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %46 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %47 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nuw nsw i64 %indvars.iv120, 8
  %48 = icmp slt i64 %indvars.iv.next121.7, 2000
  br i1 %48, label %.._crit_edge83_crit_edge, label %._crit_edge85.preheader

._crit_edge85.preheader:                          ; preds = %.._crit_edge83_crit_edge
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %89
  %indvars.iv115 = phi i64 [ %51, %89 ], [ 0, %._crit_edge85.preheader ]
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv115
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  %51 = add nuw nsw i64 %indvars.iv115, 1
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %51
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block._crit_edge, %._crit_edge85
  %indvars.iv113 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next114, %middle.block._crit_edge ]
  %52 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep144 = getelementptr i8, i8* %39, i64 %52
  %53 = add nuw nsw i64 %52, 16000
  %scevgep145 = getelementptr i8, i8* %39, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep144, %scevgep148149
  %bound1 = icmp ult i8* %scevgep146147, %scevgep145
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
  %bound0151 = icmp ult i8* %scevgep144, %bc
  %bound1152 = icmp ult i8* %bc, %scevgep145
  %found.conflict153 = and i1 %bound0151, %bound1152
  %conflict.rdx = or i1 %found.conflict, %found.conflict153
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge87
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge87
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %55 = or i64 %index, 1
  %56 = or i64 %index, 2
  %57 = or i64 %index, 3
  %58 = load double, double* %54, align 8, !alias.scope !1
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv115
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %55, i64 %indvars.iv115
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv115
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv115
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
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv113, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = fadd <2 x double> %wide.load, %73
  %80 = fadd <2 x double> %wide.load155, %74
  store <2 x double> %79, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %80, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %middle.block._crit_edge.loopexit189, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph.preheader, %._crit_edge185
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge185 ], [ 0, %scalar.ph.preheader ]
  %82 = load double, double* %54, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv115
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %exitcond112 = icmp eq i64 %indvars.iv110, 1999
  br i1 %exitcond112, label %middle.block._crit_edge.loopexit, label %._crit_edge185, !llvm.loop !12

._crit_edge185:                                   ; preds = %scalar.ph
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  br label %scalar.ph

middle.block._crit_edge.loopexit:                 ; preds = %scalar.ph
  br label %middle.block._crit_edge

middle.block._crit_edge.loopexit189:              ; preds = %vector.body
  br label %middle.block._crit_edge

middle.block._crit_edge:                          ; preds = %middle.block._crit_edge.loopexit189, %middle.block._crit_edge.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond2 = icmp ne i64 %indvars.iv.next114, 2000
  br i1 %exitcond2, label %._crit_edge87, label %89

; <label>:89:                                     ; preds = %middle.block._crit_edge
  %exitcond3 = icmp ne i64 %51, 2000
  br i1 %exitcond3, label %._crit_edge85, label %._crit_edge88.preheader

._crit_edge88.preheader:                          ; preds = %89
  %90 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %91 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %92 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block157._crit_edge
  %indvars.iv108 = phi i64 [ %93, %middle.block157._crit_edge ], [ 0, %._crit_edge88.preheader ]
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %93 = add nuw nsw i64 %indvars.iv108, 1
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %0, i64 %93, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %94 = mul nuw nsw i64 %indvars.iv108, 16000
  %scevgep165 = getelementptr i8, i8* %39, i64 %94
  %95 = add nuw nsw i64 %94, 16000
  %scevgep166 = getelementptr i8, i8* %39, i64 %95
  %bound0167 = icmp ult i8* %scevgep161162, %scevgep166
  %bound1168 = icmp ult i8* %scevgep165, %scevgep163164
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %scalar.ph158.preheader, label %vector.body156.preheader

vector.body156.preheader:                         ; preds = %._crit_edge88
  br label %vector.body156

scalar.ph158.preheader:                           ; preds = %._crit_edge88
  br label %scalar.ph158

vector.body156:                                   ; preds = %vector.body156, %vector.body156.preheader
  %index173 = phi i64 [ 0, %vector.body156.preheader ], [ %index.next174.1, %vector.body156 ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv108, i64 %index173
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index173
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %101, align 8, !alias.scope !16, !noalias !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %index.next174 = or i64 %index173, 4
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %92, i64 0, i64 %indvars.iv108, i64 %index.next174
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !13
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index.next174
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %111, align 8, !alias.scope !16, !noalias !13
  %index.next174.1 = add nuw nsw i64 %index173, 8
  %112 = icmp eq i64 %index.next174.1, 2000
  br i1 %112, label %middle.block157._crit_edge.loopexit188, label %vector.body156, !llvm.loop !18

scalar.ph158:                                     ; preds = %scalar.ph158.preheader, %._crit_edge187
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge187 ], [ 0, %scalar.ph158.preheader ]
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %90, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %middle.block157._crit_edge.loopexit, label %._crit_edge187, !llvm.loop !19

._crit_edge187:                                   ; preds = %scalar.ph158
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph158

middle.block157._crit_edge.loopexit:              ; preds = %scalar.ph158
  br label %middle.block157._crit_edge

middle.block157._crit_edge.loopexit188:           ; preds = %vector.body156
  br label %middle.block157._crit_edge

middle.block157._crit_edge:                       ; preds = %middle.block157._crit_edge.loopexit188, %middle.block157._crit_edge.loopexit
  %exitcond1 = icmp ne i64 %93, 2000
  br i1 %exitcond1, label %._crit_edge88, label %118

; <label>:118:                                    ; preds = %middle.block157._crit_edge
  call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge130.._crit_edge_crit_edge, %4
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %._crit_edge130.._crit_edge_crit_edge ], [ 0, %4 ]
  %indvars.iv175 = phi i32 [ %indvars.iv.next176, %._crit_edge130.._crit_edge_crit_edge ], [ -1, %4 ]
  %5 = sub i64 2000, %indvars.iv183
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = sub i64 2000, %indvars.iv183
  %9 = icmp sgt i64 %indvars.iv183, 0
  br i1 %9, label %.lr.ph120.preheader, label %.lr.ph129.split.preheader

.lr.ph120.preheader:                              ; preds = %._crit_edge
  br label %.lr.ph120

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129..lr.ph129.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %8, 4
  br i1 %min.iters.check, label %.lr.ph129.split.preheader200, label %min.iters.checked

.lr.ph129.split.preheader200:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph129.split.preheader
  %indvars.iv166.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv183, %min.iters.checked ], [ %indvars.iv183, %.lr.ph129.split.preheader ]
  br label %.lr.ph129.split

min.iters.checked:                                ; preds = %.lr.ph129.split.preheader
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv183, %n.vec
  br i1 %cmp.zero, label %.lr.ph129.split.preheader200, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %10 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv183
  %12 = bitcast double* %11 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %12, align 8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load198.prol = load <2 x i64>, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %12, align 8
  store <2 x i64> %wide.load198.prol, <2 x i64>* %14, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %7, 0
  br i1 %15, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %16 = add i64 %indvars.iv183, %index
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %16
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load198 = load <2 x i64>, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load198, <2 x i64>* %20, align 8
  %index.next = add i64 %index, 4
  %21 = add i64 %indvars.iv183, %index.next
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %21
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load198.1 = load <2 x i64>, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load198.1, <2 x i64>* %25, align 8
  %index.next.1 = add i64 %index, 8
  %26 = icmp eq i64 %index.next.1, %n.vec
  br i1 %26, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %8, %n.vec
  br i1 %cmp.n, label %._crit_edge130, label %.lr.ph129.split.preheader200

.lr.ph129:                                        ; preds = %._crit_edge117
  br i1 true, label %.lr.ph129.split.us.preheader, label %.lr.ph129..lr.ph129.split.preheader_crit_edge

.lr.ph129..lr.ph129.split.preheader_crit_edge:    ; preds = %.lr.ph129
  br label %.lr.ph129.split.preheader

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %wide.trip.count177 = zext i32 %indvars.iv175 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %._crit_edge125.us, %.lr.ph129.split.us.preheader
  %indvars.iv181 = phi i64 [ %indvars.iv183, %.lr.ph129.split.us.preheader ], [ %indvars.iv.next182, %._crit_edge125.us ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv181
  %28 = load double, double* %27, align 8
  br label %29

; <label>:29:                                     ; preds = %._crit_edge199, %.lr.ph129.split.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge199 ], [ 0, %.lr.ph129.split.us ]
  %.1122.us = phi double [ %35, %._crit_edge199 ], [ %28, %.lr.ph129.split.us ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv170
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv170, i64 %indvars.iv181
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.1122.us, %34
  %exitcond178 = icmp eq i64 %indvars.iv170, %wide.trip.count177
  br i1 %exitcond178, label %._crit_edge125.us, label %._crit_edge199

._crit_edge199:                                   ; preds = %29
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  br label %29

._crit_edge125.us:                                ; preds = %29
  store double %35, double* %27, align 8
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next182, 2000
  br i1 %exitcond1, label %.lr.ph129.split.us, label %._crit_edge130.loopexit

.lr.ph120:                                        ; preds = %.lr.ph120.preheader, %._crit_edge117..lr.ph120_crit_edge
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge117..lr.ph120_crit_edge ], [ 0, %.lr.ph120.preheader ]
  %indvars.iv158 = phi i32 [ %indvars.iv.next159, %._crit_edge117..lr.ph120_crit_edge ], [ -1, %.lr.ph120.preheader ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv162
  %37 = load double, double* %36, align 8
  %38 = icmp sgt i64 %indvars.iv162, 0
  br i1 %38, label %.lr.ph116.preheader, label %._crit_edge117

.lr.ph116.preheader:                              ; preds = %.lr.ph120
  %wide.trip.count160 = zext i32 %indvars.iv158 to i64
  br label %.lr.ph116

.lr.ph116:                                        ; preds = %.lr.ph116..lr.ph116_crit_edge, %.lr.ph116.preheader
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %.lr.ph116..lr.ph116_crit_edge ], [ 0, %.lr.ph116.preheader ]
  %.0114 = phi double [ %44, %.lr.ph116..lr.ph116_crit_edge ], [ %37, %.lr.ph116.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv183, i64 %indvars.iv153
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv153, i64 %indvars.iv162
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.0114, %43
  %exitcond161 = icmp eq i64 %indvars.iv153, %wide.trip.count160
  br i1 %exitcond161, label %._crit_edge117.loopexit, label %.lr.ph116..lr.ph116_crit_edge

.lr.ph116..lr.ph116_crit_edge:                    ; preds = %.lr.ph116
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  br label %.lr.ph116

._crit_edge117.loopexit:                          ; preds = %.lr.ph116
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %._crit_edge117.loopexit, %.lr.ph120
  %.0.lcssa = phi double [ %37, %.lr.ph120 ], [ %44, %._crit_edge117.loopexit ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv162, i64 %indvars.iv162
  %46 = load double, double* %45, align 8
  %47 = fdiv double %.0.lcssa, %46
  store double %47, double* %36, align 8
  %indvars.iv.next163 = add nuw i64 %indvars.iv162, 1
  %48 = icmp slt i64 %indvars.iv.next163, %indvars.iv183
  br i1 %48, label %._crit_edge117..lr.ph120_crit_edge, label %.lr.ph129

._crit_edge117..lr.ph120_crit_edge:               ; preds = %._crit_edge117
  %indvars.iv.next159 = add nsw i32 %indvars.iv158, 1
  br label %.lr.ph120

.lr.ph129.split:                                  ; preds = %.lr.ph129.split.preheader200, %.lr.ph129.split..lr.ph129.split_crit_edge
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %.lr.ph129.split..lr.ph129.split_crit_edge ], [ %indvars.iv166.ph, %.lr.ph129.split.preheader200 ]
  %exitcond168 = icmp eq i64 %indvars.iv166, 1999
  br i1 %exitcond168, label %._crit_edge130.loopexit201, label %.lr.ph129.split..lr.ph129.split_crit_edge, !llvm.loop !21

.lr.ph129.split..lr.ph129.split_crit_edge:        ; preds = %.lr.ph129.split
  %indvars.iv.next167 = add nuw i64 %indvars.iv166, 1
  br label %.lr.ph129.split

._crit_edge130.loopexit:                          ; preds = %._crit_edge125.us
  br label %._crit_edge130

._crit_edge130.loopexit201:                       ; preds = %.lr.ph129.split
  br label %._crit_edge130

._crit_edge130:                                   ; preds = %._crit_edge130.loopexit201, %._crit_edge130.loopexit, %middle.block
  %indvars.iv.next184 = add nuw i64 %indvars.iv183, 1
  %49 = icmp slt i64 %indvars.iv.next184, 2000
  br i1 %49, label %._crit_edge130.._crit_edge_crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge130
  br label %._crit_edge93

._crit_edge130.._crit_edge_crit_edge:             ; preds = %._crit_edge130
  %indvars.iv.next176 = add nsw i32 %indvars.iv175, 1
  br label %._crit_edge

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge109.._crit_edge93_crit_edge
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge109.._crit_edge93_crit_edge ], [ 0, %._crit_edge93.preheader ]
  %indvars.iv147 = phi i32 [ %indvars.iv.next148, %._crit_edge109.._crit_edge93_crit_edge ], [ -1, %._crit_edge93.preheader ]
  %50 = getelementptr inbounds double, double* %1, i64 %indvars.iv151
  %51 = load double, double* %50, align 8
  %52 = icmp sgt i64 %indvars.iv151, 0
  br i1 %52, label %.lr.ph108.preheader, label %._crit_edge109

.lr.ph108.preheader:                              ; preds = %._crit_edge93
  %wide.trip.count149 = zext i32 %indvars.iv147 to i64
  br label %.lr.ph108

.lr.ph108:                                        ; preds = %.lr.ph108..lr.ph108_crit_edge, %.lr.ph108.preheader
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %.lr.ph108..lr.ph108_crit_edge ], [ 0, %.lr.ph108.preheader ]
  %.2106 = phi double [ %58, %.lr.ph108..lr.ph108_crit_edge ], [ %51, %.lr.ph108.preheader ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv142
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %3, i64 %indvars.iv142
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %.2106, %57
  %exitcond150 = icmp eq i64 %indvars.iv142, %wide.trip.count149
  br i1 %exitcond150, label %._crit_edge109.loopexit, label %.lr.ph108..lr.ph108_crit_edge

.lr.ph108..lr.ph108_crit_edge:                    ; preds = %.lr.ph108
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  br label %.lr.ph108

._crit_edge109.loopexit:                          ; preds = %.lr.ph108
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %51, %._crit_edge93 ], [ %58, %._crit_edge109.loopexit ]
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv151
  store double %.2.lcssa, double* %59, align 8
  %indvars.iv.next152 = add nuw i64 %indvars.iv151, 1
  %60 = icmp slt i64 %indvars.iv.next152, 2000
  br i1 %60, label %._crit_edge109.._crit_edge93_crit_edge, label %._crit_edge95.preheader

._crit_edge95.preheader:                          ; preds = %._crit_edge109
  br label %._crit_edge95

._crit_edge109.._crit_edge93_crit_edge:           ; preds = %._crit_edge109
  %indvars.iv.next148 = add nsw i32 %indvars.iv147, 1
  br label %._crit_edge93

._crit_edge95:                                    ; preds = %._crit_edge95.preheader, %._crit_edge101.._crit_edge95_crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge101.._crit_edge95_crit_edge ], [ 1999, %._crit_edge95.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge101.._crit_edge95_crit_edge ], [ 2000, %._crit_edge95.preheader ]
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  %62 = load double, double* %61, align 8
  %63 = icmp slt i32 %indvars.iv, 2000
  br i1 %63, label %._crit_edge95..lr.ph_crit_edge, label %._crit_edge101

._crit_edge95..lr.ph_crit_edge:                   ; preds = %._crit_edge95
  %64 = sext i32 %indvars.iv to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %._crit_edge95..lr.ph_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %.lr.ph..lr.ph_crit_edge ], [ %64, %._crit_edge95..lr.ph_crit_edge ]
  %.399 = phi double [ %70, %.lr.ph..lr.ph_crit_edge ], [ %62, %._crit_edge95..lr.ph_crit_edge ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv138
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %2, i64 %indvars.iv138
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %.399, %69
  %exitcond = icmp eq i64 %indvars.iv138, 1999
  br i1 %exitcond, label %._crit_edge101.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next139 = add nsw i64 %indvars.iv138, 1
  br label %.lr.ph

._crit_edge101.loopexit:                          ; preds = %.lr.ph
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge95
  %.3.lcssa = phi double [ %62, %._crit_edge95 ], [ %70, %._crit_edge101.loopexit ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv140
  %72 = load double, double* %71, align 8
  %73 = fdiv double %.3.lcssa, %72
  %74 = getelementptr inbounds double, double* %2, i64 %indvars.iv140
  store double %73, double* %74, align 8
  %75 = icmp sgt i64 %indvars.iv140, 0
  br i1 %75, label %._crit_edge101.._crit_edge95_crit_edge, label %76

._crit_edge101.._crit_edge95_crit_edge:           ; preds = %._crit_edge101
  %indvars.iv.next141 = add i64 %indvars.iv140, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %._crit_edge95

; <label>:76:                                     ; preds = %._crit_edge101
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
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge6, label %15

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
