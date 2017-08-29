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
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  call fastcc void @print_array(i32 2000, double* %9)
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
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %5
  %indvars.iv141 = phi i64 [ 0, %5 ], [ %indvars.iv.next142.1, %._crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv141
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv141
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next142 = or i64 %indvars.iv141, 1
  %10 = trunc i64 %indvars.iv.next142 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv141
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next142.1 = add nuw nsw i64 %indvars.iv141, 2
  %13 = trunc i64 %indvars.iv.next142.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond143.1 = icmp eq i64 %indvars.iv.next142, 1999
  br i1 %exitcond143.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge100.._crit_edge81_crit_edge
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge100.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv139, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %23 = sub i64 1998, %indvars.iv139
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  br label %28

._crit_edge82:                                    ; preds = %28
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %22
  %26 = add nuw nsw i64 %25, 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %27 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %27, label %._crit_edge100.._crit_edge81_crit_edge, label %38

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv122
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv122
  store double %34, double* %35, align 8
  %exitcond130 = icmp eq i64 %indvars.iv122, %indvars.iv139
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond130, label %._crit_edge82, label %28

._crit_edge100.._crit_edge81_crit_edge:           ; preds = %._crit_edge82
  %36 = bitcast double* %scevgep137 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %36, i8 0, i64 %26, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge82
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %39, align 8
  %40 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge83_crit_edge

.._crit_edge83_crit_edge:                         ; preds = %.._crit_edge83_crit_edge, %38
  %indvars.iv120 = phi i64 [ 0, %38 ], [ %indvars.iv.next121.7, %.._crit_edge83_crit_edge ]
  %41 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %42 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %43 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %44 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %45 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %46 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %47 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %48 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nuw nsw i64 %indvars.iv120, 8
  %49 = icmp slt i64 %indvars.iv.next121.7, 2000
  br i1 %49, label %.._crit_edge83_crit_edge, label %._crit_edge85.preheader

._crit_edge85.preheader:                          ; preds = %.._crit_edge83_crit_edge
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %98
  %indvars.iv115 = phi i64 [ %53, %98 ], [ 0, %._crit_edge85.preheader ]
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv115
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  %53 = add nuw nsw i64 %indvars.iv115, 1
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %53
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block, %._crit_edge85
  %indvars.iv113 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next114, %middle.block ]
  %54 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep144 = getelementptr i8, i8* %40, i64 %54
  %55 = add nuw nsw i64 %54, 16000
  %scevgep145 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep144, %scevgep148149
  %bound1 = icmp ult i8* %scevgep146147, %scevgep145
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
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
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = load double, double* %56, align 8, !alias.scope !1
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv115
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv115
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv115
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv115
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
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv113, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load155, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit185, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %84 = load double, double* %56, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv115
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %91 = load double, double* %56, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next111, i64 %indvars.iv115
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  %indvars.iv.next111.1 = add nuw nsw i64 %indvars.iv110, 2
  br i1 %exitcond112.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit185:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit185, %middle.block.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond186 = icmp ne i64 %indvars.iv.next114, 2000
  br i1 %exitcond186, label %._crit_edge87, label %98

; <label>:98:                                     ; preds = %middle.block
  %exitcond187 = icmp ne i64 %53, 2000
  br i1 %exitcond187, label %._crit_edge85, label %._crit_edge88.preheader

._crit_edge88.preheader:                          ; preds = %98
  %99 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block157
  %indvars.iv108 = phi i64 [ %106, %middle.block157 ], [ 0, %._crit_edge88.preheader ]
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %106 = add nuw nsw i64 %indvars.iv108, 1
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 %106, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %107 = mul nuw nsw i64 %indvars.iv108, 16000
  %scevgep165 = getelementptr i8, i8* %40, i64 %107
  %108 = add nuw nsw i64 %107, 16000
  %scevgep166 = getelementptr i8, i8* %40, i64 %108
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
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv108, i64 %index173
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index173
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next174 = or i64 %index173, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv108, i64 %index.next174
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index.next174
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %index.next174.1 = add nuw nsw i64 %index173, 8
  %125 = icmp eq i64 %index.next174.1, 2000
  br i1 %125, label %middle.block157.loopexit184, label %vector.body156, !llvm.loop !18

scalar.ph158:                                     ; preds = %scalar.ph158, %scalar.ph158.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph158.preheader ], [ %indvars.iv.next.4, %scalar.ph158 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block157.loopexit, label %scalar.ph158, !llvm.loop !19

middle.block157.loopexit:                         ; preds = %scalar.ph158
  br label %middle.block157

middle.block157.loopexit184:                      ; preds = %vector.body156
  br label %middle.block157

middle.block157:                                  ; preds = %middle.block157.loopexit184, %middle.block157.loopexit
  %exitcond = icmp ne i64 %106, 2000
  br i1 %exitcond, label %._crit_edge88, label %151

; <label>:151:                                    ; preds = %middle.block157
  call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge128, %5
  %indvars.iv224 = phi i64 [ %indvars.iv.next225, %._crit_edge128 ], [ 0, %5 ]
  %indvars.iv173 = phi i32 [ %indvars.iv.next174, %._crit_edge128 ], [ -1, %5 ]
  %6 = add nuw nsw i64 %indvars.iv224, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub nuw nsw i64 2000, %indvars.iv224
  %9 = add nsw i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub nuw nsw i64 2000, %indvars.iv224
  %12 = icmp sgt i64 %indvars.iv224, 0
  br i1 %12, label %.lr.ph119.preheader, label %.lr.ph127.split.preheader

.lr.ph119.preheader:                              ; preds = %._crit_edge
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 0
  br label %.lr.ph119

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader197, label %min.iters.checked

.lr.ph127.split.preheader197:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv224, %min.iters.checked ], [ %indvars.iv224, %.lr.ph127.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv224, %n.vec
  br i1 %cmp.zero, label %.lr.ph127.split.preheader197, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod211 = icmp eq i64 %14, 0
  br i1 %lcmp.mod211, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %indvars.iv224
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load196.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load196.prol, <2 x i64>* %18, align 8
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
  %20 = add i64 %indvars.iv224, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load196 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load196, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv224, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load196.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load196.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge128, label %.lr.ph127.split.preheader197

.lr.ph127:                                        ; preds = %._crit_edge116
  br i1 true, label %.lr.ph127.split.us.preheader, label %.lr.ph127..lr.ph127.split.preheader_crit_edge

.lr.ph127..lr.ph127.split.preheader_crit_edge:    ; preds = %.lr.ph127
  br label %.lr.ph127.split.preheader

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %wide.trip.count175 = zext i32 %indvars.iv173 to i64
  %31 = and i64 %6, 1
  %lcmp.mod213 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge124.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge124.us ], [ %indvars.iv224, %.lr.ph127.split.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %indvars.iv179
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod213, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv179
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %36
  %.lcssa204.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph127.split.us ]
  %.1121.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge124.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph127.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next169.1, %42 ]
  %.1121.us = phi double [ %.1121.us.unr.ph, %.lr.ph127.split.us.new ], [ %56, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %indvars.iv168
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv168, i64 %indvars.iv179
  %46 = load double, double* %45, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next169, i64 %indvars.iv179
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.1121.us, %53
  %56 = fsub double %55, %54
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge124.us.unr-lcssa, label %42

._crit_edge124.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %.prol.loopexit, %._crit_edge124.us.unr-lcssa
  %.lcssa204 = phi double [ %.lcssa204.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge124.us.unr-lcssa ]
  store double %.lcssa204, double* %34, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond227 = icmp ne i64 %indvars.iv.next180, 2000
  br i1 %exitcond227, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph119:                                        ; preds = %.lr.ph119.preheader, %._crit_edge116
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge116 ], [ 0, %.lr.ph119.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge116 ], [ -1, %.lr.ph119.preheader ]
  %57 = add nuw nsw i64 %indvars.iv160, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %indvars.iv160
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv160, 0
  br i1 %61, label %.lr.ph115.preheader, label %._crit_edge116

.lr.ph115.preheader:                              ; preds = %.lr.ph119
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %62 = and i64 %57, 1
  %lcmp.mod209 = icmp eq i64 %62, 0
  br i1 %lcmp.mod209, label %.lr.ph115.prol.preheader, label %.lr.ph115.prol.loopexit.unr-lcssa

.lr.ph115.prol.preheader:                         ; preds = %.lr.ph115.preheader
  br label %.lr.ph115.prol

.lr.ph115.prol:                                   ; preds = %.lr.ph115.prol.preheader
  %63 = load double, double* %13, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph115.prol.loopexit.unr-lcssa

.lr.ph115.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph115.preheader, %.lr.ph115.prol
  %.lcssa203.unr.ph = phi double [ %67, %.lr.ph115.prol ], [ undef, %.lr.ph115.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph115.prol ], [ 0, %.lr.ph115.preheader ]
  %.0113.unr.ph = phi double [ %67, %.lr.ph115.prol ], [ %60, %.lr.ph115.preheader ]
  br label %.lr.ph115.prol.loopexit

.lr.ph115.prol.loopexit:                          ; preds = %.lr.ph115.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge116.loopexit, label %.lr.ph115.preheader.new

.lr.ph115.preheader.new:                          ; preds = %.lr.ph115.prol.loopexit
  br label %.lr.ph115

.lr.ph115:                                        ; preds = %.lr.ph115, %.lr.ph115.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph115.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph115 ]
  %.0113 = phi double [ %.0113.unr.ph, %.lr.ph115.preheader.new ], [ %82, %.lr.ph115 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv224, i64 %indvars.iv151
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %72 = load double, double* %71, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %73, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.0113, %79
  %82 = fsub double %81, %80
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge116.loopexit.unr-lcssa, label %.lr.ph115

._crit_edge116.loopexit.unr-lcssa:                ; preds = %.lr.ph115
  br label %._crit_edge116.loopexit

._crit_edge116.loopexit:                          ; preds = %.lr.ph115.prol.loopexit, %._crit_edge116.loopexit.unr-lcssa
  %.lcssa203 = phi double [ %.lcssa203.unr.ph, %.lr.ph115.prol.loopexit ], [ %82, %._crit_edge116.loopexit.unr-lcssa ]
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit, %.lr.ph119
  %.0.lcssa = phi double [ %60, %.lr.ph119 ], [ %.lcssa203, %._crit_edge116.loopexit ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %84 = load double, double* %83, align 8
  %85 = fdiv double %.0.lcssa, %84
  store double %85, double* %59, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  %exitcond226 = icmp ne i64 %indvars.iv.next161, %indvars.iv224
  br i1 %exitcond226, label %.lr.ph119, label %.lr.ph127

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader197, %.lr.ph127.split
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.lr.ph127.split ], [ %indvars.iv164.ph, %.lr.ph127.split.preheader197 ]
  %exitcond166 = icmp eq i64 %indvars.iv164, 1999
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  br i1 %exitcond166, label %._crit_edge128.loopexit198, label %.lr.ph127.split, !llvm.loop !21

._crit_edge128.loopexit:                          ; preds = %._crit_edge124.us
  br label %._crit_edge128

._crit_edge128.loopexit198:                       ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit198, %._crit_edge128.loopexit, %middle.block
  %indvars.iv.next225 = add nuw nsw i64 %indvars.iv224, 1
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  %exitcond228 = icmp ne i64 %indvars.iv.next225, 2000
  br i1 %exitcond228, label %._crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge128
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge108
  %indvars.iv = phi i2 [ 0, %._crit_edge93.preheader ], [ %indvars.iv.next, %._crit_edge108 ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge108 ], [ 0, %._crit_edge93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge108 ], [ -1, %._crit_edge93.preheader ]
  %86 = zext i2 %indvars.iv to i64
  %87 = add nuw nsw i64 %indvars.iv149, 4294967295
  %88 = and i64 %87, 4294967295
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %90 = load double, double* %89, align 8
  %91 = icmp sgt i64 %indvars.iv149, 0
  br i1 %91, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %._crit_edge93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter205 = and i64 %indvars.iv149, 3
  %lcmp.mod206 = icmp eq i64 %xtraiter205, 0
  br i1 %lcmp.mod206, label %.lr.ph107.prol.loopexit, label %.lr.ph107.prol.preheader

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol, %.lr.ph107.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph107.prol ], [ 0, %.lr.ph107.prol.preheader ]
  %.2105.prol = phi double [ %97, %.lr.ph107.prol ], [ %90, %.lr.ph107.prol.preheader ]
  %prol.iter207 = phi i64 [ %prol.iter207.sub, %.lr.ph107.prol ], [ %xtraiter205, %.lr.ph107.prol.preheader ]
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fsub double %.2105.prol, %96
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter207.sub = add nsw i64 %prol.iter207, -1
  %prol.iter207.cmp = icmp eq i64 %prol.iter207.sub, 0
  br i1 %prol.iter207.cmp, label %.lr.ph107.prol.loopexit.unr-lcssa, label %.lr.ph107.prol, !llvm.loop !23

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.prol
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.preheader, %.lr.ph107.prol.loopexit.unr-lcssa
  %.lcssa202.unr = phi double [ undef, %.lr.ph107.preheader ], [ %97, %.lr.ph107.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph107.preheader ], [ %86, %.lr.ph107.prol.loopexit.unr-lcssa ]
  %.2105.unr = phi double [ %90, %.lr.ph107.preheader ], [ %97, %.lr.ph107.prol.loopexit.unr-lcssa ]
  %98 = icmp ult i64 %88, 3
  br i1 %98, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph107.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph107 ]
  %.2105 = phi double [ %.2105.unr, %.lr.ph107.preheader.new ], [ %120, %.lr.ph107 ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %100, align 8
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = fmul <2 x double> %103, %104
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fsub double %.2105, %106
  %109 = fsub double %108, %107
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %111 = bitcast double* %110 to <2 x double>*
  %112 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %113 = bitcast double* %112 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %114 = load <2 x double>, <2 x double>* %111, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = fmul <2 x double> %114, %115
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %109, %117
  %120 = fsub double %119, %118
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa202 = phi double [ %.lcssa202.unr, %.lr.ph107.prol.loopexit ], [ %120, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %90, %._crit_edge93 ], [ %.lcssa202, %._crit_edge108.loopexit ]
  %121 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %121, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next150, 2000
  br i1 %exitcond, label %._crit_edge93, label %._crit_edge95.preheader

._crit_edge95.preheader:                          ; preds = %._crit_edge108
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95.preheader, %._crit_edge100.._crit_edge95_crit_edge
  %indvars.iv222 = phi i2 [ 0, %._crit_edge95.preheader ], [ %indvars.iv.next223, %._crit_edge100.._crit_edge95_crit_edge ]
  %indvars.iv220 = phi i32 [ 2000, %._crit_edge95.preheader ], [ %indvars.iv.next221, %._crit_edge100.._crit_edge95_crit_edge ]
  %indvar = phi i32 [ 0, %._crit_edge95.preheader ], [ %indvar.next, %._crit_edge100.._crit_edge95_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %._crit_edge95.preheader ], [ %indvars.iv.next139, %._crit_edge100.._crit_edge95_crit_edge ]
  %122 = sext i32 %indvars.iv220 to i64
  %123 = zext i2 %indvars.iv222 to i64
  %124 = add i64 %122, %123
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %129 = load double, double* %128, align 8
  %130 = icmp slt i32 %indvars.iv220, 2000
  br i1 %130, label %._crit_edge95..lr.ph_crit_edge, label %._crit_edge100

._crit_edge95..lr.ph_crit_edge:                   ; preds = %._crit_edge95
  %131 = sext i32 %indvars.iv220 to i64
  %132 = sub nsw i64 0, %126
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge95..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %131, %.lr.ph.prol.preheader ]
  %.398.prol = phi double [ %138, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %136 = load double, double* %135, align 8
  %137 = fmul double %134, %136
  %138 = fsub double %.398.prol, %137
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge95..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge95..lr.ph_crit_edge ], [ %138, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %131, %._crit_edge95..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.398.unr = phi double [ %129, %._crit_edge95..lr.ph_crit_edge ], [ %138, %.lr.ph.prol.loopexit.unr-lcssa ]
  %139 = icmp ult i64 %127, 3
  br i1 %139, label %._crit_edge100.loopexit, label %._crit_edge95..lr.ph_crit_edge.new

._crit_edge95..lr.ph_crit_edge.new:               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge95..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %._crit_edge95..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.398 = phi double [ %.398.unr, %._crit_edge95..lr.ph_crit_edge.new ], [ %161, %.lr.ph ]
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %141 = bitcast double* %140 to <2 x double>*
  %142 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %143 = bitcast double* %142 to <2 x double>*
  %144 = load <2 x double>, <2 x double>* %141, align 8
  %145 = load <2 x double>, <2 x double>* %143, align 8
  %146 = fmul <2 x double> %144, %145
  %147 = extractelement <2 x double> %146, i32 0
  %148 = extractelement <2 x double> %146, i32 1
  %149 = fsub double %.398, %147
  %150 = fsub double %149, %148
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %152 = bitcast double* %151 to <2 x double>*
  %153 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %154 = bitcast double* %153 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %155 = load <2 x double>, <2 x double>* %152, align 8
  %156 = load <2 x double>, <2 x double>* %154, align 8
  %157 = fmul <2 x double> %155, %156
  %158 = extractelement <2 x double> %157, i32 0
  %159 = extractelement <2 x double> %157, i32 1
  %160 = fsub double %150, %158
  %161 = fsub double %160, %159
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge100.loopexit.unr-lcssa, label %.lr.ph

._crit_edge100.loopexit.unr-lcssa:                ; preds = %.lr.ph
  br label %._crit_edge100.loopexit

._crit_edge100.loopexit:                          ; preds = %.lr.ph.prol.loopexit, %._crit_edge100.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %161, %._crit_edge100.loopexit.unr-lcssa ]
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %._crit_edge95
  %.3.lcssa = phi double [ %129, %._crit_edge95 ], [ %.lcssa, %._crit_edge100.loopexit ]
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %163 = load double, double* %162, align 8
  %164 = fdiv double %.3.lcssa, %163
  %165 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %164, double* %165, align 8
  %166 = icmp sgt i64 %indvars.iv138, 0
  br i1 %166, label %._crit_edge100.._crit_edge95_crit_edge, label %167

._crit_edge100.._crit_edge95_crit_edge:           ; preds = %._crit_edge100
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next221 = add i32 %indvars.iv220, -1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next223 = add i2 %indvars.iv222, 1
  br label %._crit_edge95

; <label>:167:                                    ; preds = %._crit_edge100
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge6, label %16

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
