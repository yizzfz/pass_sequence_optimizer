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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
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
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %5
  %indvars.iv139 = phi i64 [ 0, %5 ], [ %indvars.iv.next140.1, %._crit_edge ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next140 = or i64 %indvars.iv139, 1
  %10 = trunc i64 %indvars.iv.next140 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %13 = trunc i64 %indvars.iv.next140.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond141.1 = icmp eq i64 %indvars.iv.next140, 1999
  br i1 %exitcond141.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge98.._crit_edge81_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge98.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv137, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %22
  %23 = sub i64 1998, %indvars.iv137
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

._crit_edge82:                                    ; preds = %28
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %27 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %27, label %._crit_edge98.._crit_edge81_crit_edge, label %38

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv120
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv120
  store double %34, double* %35, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %._crit_edge82, label %28

._crit_edge98.._crit_edge81_crit_edge:            ; preds = %._crit_edge82
  %36 = bitcast double* %scevgep135 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %36, i8 0, i64 %26, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge82
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %39, align 8
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %.._crit_edge83_crit_edge

.._crit_edge83_crit_edge:                         ; preds = %.._crit_edge83_crit_edge, %38
  %indvars.iv118 = phi i64 [ 0, %38 ], [ %indvars.iv.next119.7, %.._crit_edge83_crit_edge ]
  %41 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %42 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %43 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %44 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %45 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %46 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %47 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %48 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %49 = icmp slt i64 %indvars.iv.next119.7, 2000
  br i1 %49, label %.._crit_edge83_crit_edge, label %._crit_edge85.preheader

._crit_edge85.preheader:                          ; preds = %.._crit_edge83_crit_edge
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %99
  %indvars.iv113 = phi i64 [ %53, %99 ], [ 0, %._crit_edge85.preheader ]
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  %53 = add i64 %indvars.iv113, 1
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %53
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block, %._crit_edge85
  %indvars.iv111 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next112, %middle.block ]
  %54 = mul i64 %indvars.iv111, 16000
  %scevgep142 = getelementptr i8, i8* %40, i64 %54
  %55 = add i64 %54, 16000
  %scevgep143 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep142, %scevgep146147
  %bound1 = icmp ult i8* %scevgep144145, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound0149 = icmp ult i8* %scevgep142, %bc
  %bound1150 = icmp ult i8* %bc, %scevgep143
  %found.conflict151 = and i1 %bound0149, %bound1150
  %conflict.rdx = or i1 %found.conflict, %found.conflict151
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
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv113
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv113
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv113
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
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv111, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load153, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit183, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %84 = load double, double* %56, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %91 = load double, double* %56, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit183:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit183, %middle.block.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %98 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %98, label %._crit_edge87, label %99

; <label>:99:                                     ; preds = %middle.block
  %100 = icmp slt i64 %53, 2000
  br i1 %100, label %._crit_edge85, label %._crit_edge88.preheader

._crit_edge88.preheader:                          ; preds = %99
  %101 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %107 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block155
  %indvars.iv106 = phi i64 [ %108, %middle.block155 ], [ 0, %._crit_edge88.preheader ]
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep159160 = bitcast double* %scevgep159 to i8*
  %108 = add i64 %indvars.iv106, 1
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %1, i64 %108, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %109 = mul i64 %indvars.iv106, 16000
  %scevgep163 = getelementptr i8, i8* %40, i64 %109
  %110 = add i64 %109, 16000
  %scevgep164 = getelementptr i8, i8* %40, i64 %110
  %bound0165 = icmp ult i8* %scevgep159160, %scevgep164
  %bound1166 = icmp ult i8* %scevgep163, %scevgep161162
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %scalar.ph156.preheader, label %vector.body154.preheader

vector.body154.preheader:                         ; preds = %._crit_edge88
  br label %vector.body154

scalar.ph156.preheader:                           ; preds = %._crit_edge88
  br label %scalar.ph156

vector.body154:                                   ; preds = %vector.body154, %vector.body154.preheader
  %index171 = phi i64 [ 0, %vector.body154.preheader ], [ %index.next172.1, %vector.body154 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv106, i64 %index171
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index171
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next172 = or i64 %index171, 4
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv106, i64 %index.next172
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !13
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next172
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %126, align 8, !alias.scope !16, !noalias !13
  %index.next172.1 = add nsw i64 %index171, 8
  %127 = icmp eq i64 %index.next172.1, 2000
  br i1 %127, label %middle.block155.loopexit182, label %vector.body154, !llvm.loop !18

scalar.ph156:                                     ; preds = %scalar.ph156, %scalar.ph156.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph156.preheader ], [ %indvars.iv.next.4, %scalar.ph156 ]
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %147 = bitcast double* %146 to i64*
  store i64 %145, i64* %147, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %148 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %152 = bitcast double* %151 to i64*
  store i64 %150, i64* %152, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block155.loopexit, label %scalar.ph156, !llvm.loop !19

middle.block155.loopexit:                         ; preds = %scalar.ph156
  br label %middle.block155

middle.block155.loopexit182:                      ; preds = %vector.body154
  br label %middle.block155

middle.block155:                                  ; preds = %middle.block155.loopexit182, %middle.block155.loopexit
  %153 = icmp slt i64 %108, 2000
  br i1 %153, label %._crit_edge88, label %154

; <label>:154:                                    ; preds = %middle.block155
  tail call void @free(i8* nonnull %40) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge127, %5
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge127 ], [ 0, %5 ]
  %indvars.iv173 = phi i32 [ %indvars.iv.next174, %._crit_edge127 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv181, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv181
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv181
  %12 = icmp sgt i64 %indvars.iv181, 0
  br i1 %12, label %.lr.ph117.preheader, label %.lr.ph126.split.preheader

.lr.ph117.preheader:                              ; preds = %._crit_edge
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  br label %.lr.ph117

.lr.ph126.split.preheader:                        ; preds = %.lr.ph126..lr.ph126.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph126.split.preheader195, label %min.iters.checked

.lr.ph126.split.preheader195:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph126.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv181, %min.iters.checked ], [ %indvars.iv181, %.lr.ph126.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph126.split

min.iters.checked:                                ; preds = %.lr.ph126.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv181, %n.vec
  br i1 %cmp.zero, label %.lr.ph126.split.preheader195, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod209 = icmp eq i64 %14, 0
  br i1 %lcmp.mod209, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv181
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load194.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load194.prol, <2 x i64>* %18, align 8
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
  %20 = add i64 %indvars.iv181, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load194 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load194, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv181, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load194.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load194.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge127, label %.lr.ph126.split.preheader195

.lr.ph126:                                        ; preds = %._crit_edge114
  br i1 true, label %.lr.ph126.split.us.preheader, label %.lr.ph126..lr.ph126.split.preheader_crit_edge

.lr.ph126..lr.ph126.split.preheader_crit_edge:    ; preds = %.lr.ph126
  br label %.lr.ph126.split.preheader

.lr.ph126.split.us.preheader:                     ; preds = %.lr.ph126
  %wide.trip.count175 = zext i32 %indvars.iv173 to i64
  %31 = and i64 %6, 1
  %lcmp.mod211 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %.lr.ph126.split.us.preheader, %._crit_edge122.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge122.us ], [ %indvars.iv181, %.lr.ph126.split.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv179
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod211, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph126.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv179
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph126.split.us, %36
  %.lcssa202.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph126.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph126.split.us ]
  %.1119.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph126.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge122.us, label %.lr.ph126.split.us.new

.lr.ph126.split.us.new:                           ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph126.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph126.split.us.new ], [ %indvars.iv.next169.1, %42 ]
  %.1119.us = phi double [ %.1119.us.unr.ph, %.lr.ph126.split.us.new ], [ %56, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv168
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
  %55 = fsub double %.1119.us, %53
  %56 = fsub double %55, %54
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge122.us.unr-lcssa, label %42

._crit_edge122.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge122.us

._crit_edge122.us:                                ; preds = %.prol.loopexit, %._crit_edge122.us.unr-lcssa
  %.lcssa202 = phi double [ %.lcssa202.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge122.us.unr-lcssa ]
  store double %.lcssa202, double* %34, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %57 = icmp slt i64 %indvars.iv.next180, 2000
  br i1 %57, label %.lr.ph126.split.us, label %._crit_edge127.loopexit

.lr.ph117:                                        ; preds = %.lr.ph117.preheader, %._crit_edge114
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge114 ], [ 0, %.lr.ph117.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge114 ], [ -1, %.lr.ph117.preheader ]
  %58 = add i64 %indvars.iv160, 4294967295
  %59 = and i64 %58, 4294967295
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv160
  %61 = load double, double* %60, align 8
  %62 = icmp sgt i64 %indvars.iv160, 0
  br i1 %62, label %.lr.ph113.preheader, label %._crit_edge114

.lr.ph113.preheader:                              ; preds = %.lr.ph117
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %63 = and i64 %58, 1
  %lcmp.mod207 = icmp eq i64 %63, 0
  br i1 %lcmp.mod207, label %.lr.ph113.prol.preheader, label %.lr.ph113.prol.loopexit.unr-lcssa

.lr.ph113.prol.preheader:                         ; preds = %.lr.ph113.preheader
  br label %.lr.ph113.prol

.lr.ph113.prol:                                   ; preds = %.lr.ph113.prol.preheader
  %64 = load double, double* %13, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %61, %67
  br label %.lr.ph113.prol.loopexit.unr-lcssa

.lr.ph113.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph113.preheader, %.lr.ph113.prol
  %.lcssa201.unr.ph = phi double [ %68, %.lr.ph113.prol ], [ undef, %.lr.ph113.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph113.prol ], [ 0, %.lr.ph113.preheader ]
  %.0111.unr.ph = phi double [ %68, %.lr.ph113.prol ], [ %61, %.lr.ph113.preheader ]
  br label %.lr.ph113.prol.loopexit

.lr.ph113.prol.loopexit:                          ; preds = %.lr.ph113.prol.loopexit.unr-lcssa
  %69 = icmp eq i64 %59, 0
  br i1 %69, label %._crit_edge114.loopexit, label %.lr.ph113.preheader.new

.lr.ph113.preheader.new:                          ; preds = %.lr.ph113.prol.loopexit
  br label %.lr.ph113

.lr.ph113:                                        ; preds = %.lr.ph113, %.lr.ph113.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph113.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph113 ]
  %.0111 = phi double [ %.0111.unr.ph, %.lr.ph113.preheader.new ], [ %83, %.lr.ph113 ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv151
  %71 = bitcast double* %70 to <2 x double>*
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %73 = load double, double* %72, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %74 = load <2 x double>, <2 x double>* %71, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %76 = load double, double* %75, align 8
  %77 = insertelement <2 x double> undef, double %73, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %74, %78
  %80 = extractelement <2 x double> %79, i32 0
  %81 = extractelement <2 x double> %79, i32 1
  %82 = fsub double %.0111, %80
  %83 = fsub double %82, %81
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge114.loopexit.unr-lcssa, label %.lr.ph113

._crit_edge114.loopexit.unr-lcssa:                ; preds = %.lr.ph113
  br label %._crit_edge114.loopexit

._crit_edge114.loopexit:                          ; preds = %.lr.ph113.prol.loopexit, %._crit_edge114.loopexit.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr.ph, %.lr.ph113.prol.loopexit ], [ %83, %._crit_edge114.loopexit.unr-lcssa ]
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit, %.lr.ph117
  %.0.lcssa = phi double [ %61, %.lr.ph117 ], [ %.lcssa201, %._crit_edge114.loopexit ]
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %85 = load double, double* %84, align 8
  %86 = fdiv double %.0.lcssa, %85
  store double %86, double* %60, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %87 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  br i1 %87, label %.lr.ph117, label %.lr.ph126

.lr.ph126.split:                                  ; preds = %.lr.ph126.split.preheader195, %.lr.ph126.split
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.lr.ph126.split ], [ %indvars.iv164.ph, %.lr.ph126.split.preheader195 ]
  %exitcond166 = icmp eq i64 %indvars.iv164, 1999
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  br i1 %exitcond166, label %._crit_edge127.loopexit196, label %.lr.ph126.split, !llvm.loop !21

._crit_edge127.loopexit:                          ; preds = %._crit_edge122.us
  br label %._crit_edge127

._crit_edge127.loopexit196:                       ; preds = %.lr.ph126.split
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127.loopexit196, %._crit_edge127.loopexit, %middle.block
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %88 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  br i1 %88, label %._crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge127
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge106
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge106 ], [ 0, %._crit_edge93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge106 ], [ -1, %._crit_edge93.preheader ]
  %89 = add i64 %indvars.iv149, 4294967295
  %90 = and i64 %89, 4294967295
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %92 = load double, double* %91, align 8
  %93 = icmp sgt i64 %indvars.iv149, 0
  br i1 %93, label %.lr.ph105.preheader, label %._crit_edge106

.lr.ph105.preheader:                              ; preds = %._crit_edge93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter203 = and i64 %indvars.iv149, 3
  %lcmp.mod204 = icmp eq i64 %xtraiter203, 0
  br i1 %lcmp.mod204, label %.lr.ph105.prol.loopexit, label %.lr.ph105.prol.preheader

.lr.ph105.prol.preheader:                         ; preds = %.lr.ph105.preheader
  br label %.lr.ph105.prol

.lr.ph105.prol:                                   ; preds = %.lr.ph105.prol, %.lr.ph105.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph105.prol ], [ 0, %.lr.ph105.prol.preheader ]
  %.2103.prol = phi double [ %99, %.lr.ph105.prol ], [ %92, %.lr.ph105.prol.preheader ]
  %prol.iter205 = phi i64 [ %prol.iter205.sub, %.lr.ph105.prol ], [ %xtraiter203, %.lr.ph105.prol.preheader ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %.2103.prol, %98
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter205.sub = add i64 %prol.iter205, -1
  %prol.iter205.cmp = icmp eq i64 %prol.iter205.sub, 0
  br i1 %prol.iter205.cmp, label %.lr.ph105.prol.loopexit.unr-lcssa, label %.lr.ph105.prol, !llvm.loop !23

.lr.ph105.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph105.prol
  br label %.lr.ph105.prol.loopexit

.lr.ph105.prol.loopexit:                          ; preds = %.lr.ph105.preheader, %.lr.ph105.prol.loopexit.unr-lcssa
  %.lcssa200.unr = phi double [ undef, %.lr.ph105.preheader ], [ %99, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph105.preheader ], [ %indvars.iv.next141.prol, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %.2103.unr = phi double [ %92, %.lr.ph105.preheader ], [ %99, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %100 = icmp ult i64 %90, 3
  br i1 %100, label %._crit_edge106.loopexit, label %.lr.ph105.preheader.new

.lr.ph105.preheader.new:                          ; preds = %.lr.ph105.prol.loopexit
  br label %.lr.ph105

.lr.ph105:                                        ; preds = %.lr.ph105, %.lr.ph105.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph105.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph105 ]
  %.2103 = phi double [ %.2103.unr, %.lr.ph105.preheader.new ], [ %122, %.lr.ph105 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %.2103, %108
  %111 = fsub double %110, %109
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %115 = bitcast double* %114 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge106.loopexit.unr-lcssa, label %.lr.ph105

._crit_edge106.loopexit.unr-lcssa:                ; preds = %.lr.ph105
  br label %._crit_edge106.loopexit

._crit_edge106.loopexit:                          ; preds = %.lr.ph105.prol.loopexit, %._crit_edge106.loopexit.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr, %.lr.ph105.prol.loopexit ], [ %122, %._crit_edge106.loopexit.unr-lcssa ]
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %92, %._crit_edge93 ], [ %.lcssa200, %._crit_edge106.loopexit ]
  %123 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %123, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %124 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  br i1 %124, label %._crit_edge93, label %._crit_edge106._crit_edge.preheader

._crit_edge106._crit_edge.preheader:              ; preds = %._crit_edge106
  br label %._crit_edge106._crit_edge

._crit_edge106._crit_edge:                        ; preds = %._crit_edge106._crit_edge.preheader, %._crit_edge99._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge106._crit_edge.preheader ], [ %indvar.next, %._crit_edge99._crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %._crit_edge106._crit_edge.preheader ], [ %indvars.iv.next139, %._crit_edge99._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge106._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge99._crit_edge ]
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv138, 1
  %131 = icmp slt i64 %130, 2000
  br i1 %131, label %..lr.ph_crit_edge, label %._crit_edge99.thread

._crit_edge99.thread:                             ; preds = %._crit_edge106._crit_edge
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %133 = load double, double* %132, align 8
  %134 = fdiv double %129, %133
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %134, double* %135, align 8
  br label %._crit_edge99._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge106._crit_edge
  %136 = sext i32 %indvars.iv to i64
  %137 = sub nsw i64 0, %126
  %xtraiter = and i64 %137, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %136, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %143, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fsub double %.397.prol, %142
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %143, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %136, %..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %129, %..lr.ph_crit_edge ], [ %143, %.lr.ph.prol.loopexit.unr-lcssa ]
  %144 = icmp ult i64 %127, 3
  br i1 %144, label %._crit_edge99, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %166, %.lr.ph ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %146 = bitcast double* %145 to <2 x double>*
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %146, align 8
  %150 = load <2 x double>, <2 x double>* %148, align 8
  %151 = fmul <2 x double> %149, %150
  %152 = extractelement <2 x double> %151, i32 0
  %153 = extractelement <2 x double> %151, i32 1
  %154 = fsub double %.397, %152
  %155 = fsub double %154, %153
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %157 = bitcast double* %156 to <2 x double>*
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %159 = bitcast double* %158 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %160 = load <2 x double>, <2 x double>* %157, align 8
  %161 = load <2 x double>, <2 x double>* %159, align 8
  %162 = fmul <2 x double> %160, %161
  %163 = extractelement <2 x double> %162, i32 0
  %164 = extractelement <2 x double> %162, i32 1
  %165 = fsub double %155, %163
  %166 = fsub double %165, %164
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge99.unr-lcssa, label %.lr.ph

._crit_edge99.unr-lcssa:                          ; preds = %.lr.ph
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge99.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %166, %._crit_edge99.unr-lcssa ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %168 = load double, double* %167, align 8
  %169 = fdiv double %.lcssa, %168
  %170 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %169, double* %170, align 8
  %171 = icmp sgt i64 %indvars.iv138, 0
  br i1 %171, label %._crit_edge99._crit_edge, label %172

._crit_edge99._crit_edge:                         ; preds = %._crit_edge99.thread, %._crit_edge99
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge106._crit_edge

; <label>:172:                                    ; preds = %._crit_edge99
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
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
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
