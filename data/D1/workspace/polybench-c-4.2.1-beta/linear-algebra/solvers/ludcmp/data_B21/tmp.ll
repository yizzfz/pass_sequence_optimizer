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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
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
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100, %5
  %indvars.iv141 = phi i64 [ 0, %5 ], [ %indvars.iv.next142.1, %._crit_edge100 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv141
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv141
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next142 = or i64 %indvars.iv141, 1
  %8 = trunc i64 %indvars.iv.next142 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv141
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next142
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next142
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %16 = trunc i64 %indvars.iv.next142.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next142
  store double %20, double* %21, align 8
  %exitcond143.1 = icmp eq i64 %indvars.iv.next142, 1999
  br i1 %exitcond143.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader87_crit_edge
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge..preheader87_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = shl i64 %indvars.iv139, 32
  %sext = add i64 %22, 4294967296
  %23 = ashr exact i64 %sext, 32
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %23
  %24 = sub i64 1998, %indvars.iv139
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %29

.preheader86:                                     ; preds = %29
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %28 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %28, label %._crit_edge..preheader87_crit_edge, label %39

; <label>:29:                                     ; preds = %29, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %29 ], [ 0, %.lr.ph ]
  %30 = sub nsw i64 0, %indvars.iv122
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = fadd double %34, 1.000000e+00
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv122
  store double %35, double* %36, align 8
  %exitcond130 = icmp eq i64 %indvars.iv122, %indvars.iv139
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond130, label %.preheader86, label %29

._crit_edge..preheader87_crit_edge:               ; preds = %.preheader86
  %37 = bitcast double* %scevgep137 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 %27, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph

; <label>:39:                                     ; preds = %.preheader86
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %40, align 8
  %41 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %..preheader85_crit_edge

..preheader85_crit_edge:                          ; preds = %..preheader85_crit_edge, %39
  %indvars.iv120 = phi i64 [ 0, %39 ], [ %indvars.iv.next121.7, %..preheader85_crit_edge ]
  %42 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %41, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %43 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %41, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %44 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %41, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %45 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %41, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %46 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %41, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %47 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %41, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %48 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %41, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %49 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %41, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  %50 = icmp slt i64 %indvars.iv.next121.7, 2000
  br i1 %50, label %..preheader85_crit_edge, label %..preheader83_crit_edge

..preheader83_crit_edge:                          ; preds = %..preheader85_crit_edge
  br label %.preheader83

.preheader83:                                     ; preds = %101, %..preheader83_crit_edge
  %indvars.iv115 = phi i64 [ 0, %..preheader83_crit_edge ], [ %51, %101 ]
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv115
  %51 = add i64 %indvars.iv115, 1
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %51
  br label %.preheader82

.preheader82:                                     ; preds = %middle.block, %.preheader83
  %indvars.iv113 = phi i64 [ 0, %.preheader83 ], [ %indvars.iv.next114, %middle.block ]
  %52 = bitcast double* %scevgep148 to i8*
  %53 = bitcast double* %scevgep146 to i8*
  %54 = mul i64 %indvars.iv113, 16000
  %scevgep144 = getelementptr i8, i8* %41, i64 %54
  %55 = add i64 %54, 16000
  %scevgep145 = getelementptr i8, i8* %41, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep144, %52
  %bound1 = icmp ult i8* %53, %scevgep145
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound0151 = icmp ult i8* %scevgep144, %bc
  %bound1152 = icmp ult i8* %bc, %scevgep145
  %found.conflict153 = and i1 %bound0151, %bound1152
  %conflict.rdx = or i1 %found.conflict, %found.conflict153
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader82
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader82
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = bitcast i8* %41 to [2000 x [2000 x double]]*
  %58 = or i64 %index, 1
  %59 = or i64 %index, 2
  %60 = or i64 %index, 3
  %61 = load double, double* %56, align 8, !alias.scope !1
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv115
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv115
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv115
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %60, i64 %indvars.iv115
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = load double, double* %66, align 8, !alias.scope !4
  %71 = load double, double* %67, align 8, !alias.scope !4
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = fmul <2 x double> %63, %73
  %77 = fmul <2 x double> %63, %75
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv113, i64 %index
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !6, !noalias !8
  %82 = fadd <2 x double> %wide.load, %76
  %83 = fadd <2 x double> %wide.load155, %77
  store <2 x double> %82, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %83, <2 x double>* %81, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %84 = icmp eq i64 %index.next, 2000
  br i1 %84, label %middle.block.loopexit187, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %85 = bitcast i8* %41 to [2000 x [2000 x double]]*
  %86 = load double, double* %56, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv115
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %93 = load double, double* %56, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next111, i64 %indvars.iv115
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %98 = load double, double* %97, align 8
  %99 = fadd double %98, %96
  store double %99, double* %97, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  br i1 %exitcond112.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit187:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit187, %middle.block.loopexit
  %indvars.iv.next114 = add nuw i64 %indvars.iv113, 1
  %100 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %100, label %.preheader82, label %101

; <label>:101:                                    ; preds = %middle.block
  %102 = icmp slt i64 %51, 2000
  br i1 %102, label %.preheader83, label %.preheader.preheader

.preheader.preheader:                             ; preds = %101
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block157
  %indvars.iv108 = phi i64 [ %103, %middle.block157 ], [ 0, %.preheader.preheader ]
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %103 = add i64 %indvars.iv108, 1
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 %103, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %104 = mul i64 %indvars.iv108, 16000
  %scevgep165 = getelementptr i8, i8* %41, i64 %104
  %105 = add i64 %104, 16000
  %scevgep166 = getelementptr i8, i8* %41, i64 %105
  %bound0167 = icmp ult i8* %scevgep161162, %scevgep166
  %bound1168 = icmp ult i8* %scevgep165, %scevgep163164
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %scalar.ph158.preheader, label %vector.body156.preheader

vector.body156.preheader:                         ; preds = %.preheader
  br label %vector.body156

scalar.ph158.preheader:                           ; preds = %.preheader
  br label %scalar.ph158

vector.body156:                                   ; preds = %vector.body156, %vector.body156.preheader
  %index173 = phi i64 [ 0, %vector.body156.preheader ], [ %index.next174.1, %vector.body156 ]
  %106 = bitcast i8* %41 to [2000 x [2000 x double]]*
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv108, i64 %index173
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index173
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %index.next174 = or i64 %index173, 4
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv108, i64 %index.next174
  %116 = bitcast double* %115 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %116, align 8, !alias.scope !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index.next174
  %120 = bitcast double* %119 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %120, align 8, !alias.scope !16, !noalias !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %index.next174.1 = add nsw i64 %index173, 8
  %123 = icmp eq i64 %index.next174.1, 2000
  br i1 %123, label %middle.block157.loopexit186, label %vector.body156, !llvm.loop !18

scalar.ph158:                                     ; preds = %scalar.ph158, %scalar.ph158.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph158.preheader ], [ %indvars.iv.next.4, %scalar.ph158 ]
  %124 = bitcast i8* %41 to [2000 x [2000 x double]]*
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block157.loopexit, label %scalar.ph158, !llvm.loop !19

middle.block157.loopexit:                         ; preds = %scalar.ph158
  br label %middle.block157

middle.block157.loopexit186:                      ; preds = %vector.body156
  br label %middle.block157

middle.block157:                                  ; preds = %middle.block157.loopexit186, %middle.block157.loopexit
  %150 = icmp slt i64 %103, 2000
  br i1 %150, label %.preheader, label %151

; <label>:151:                                    ; preds = %middle.block157
  tail call void @free(i8* nonnull %41) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %5
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge125 ], [ 0, %5 ]
  %indvars.iv171 = phi i32 [ %indvars.iv.next172, %._crit_edge125 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv179, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv179
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv179
  %12 = icmp sgt i64 %indvars.iv179, 0
  br i1 %12, label %.lr.ph115.preheader, label %.lr.ph124.split.preheader

.lr.ph115.preheader:                              ; preds = %.preheader94
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 0
  br label %.lr.ph115

.lr.ph124.split.preheader:                        ; preds = %.preheader94
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph124.split.preheader192, label %min.iters.checked

.lr.ph124.split.preheader192:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph124.split.preheader
  %indvars.iv162.ph = phi i64 [ %indvars.iv179, %min.iters.checked ], [ %indvars.iv179, %.lr.ph124.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph124.split

min.iters.checked:                                ; preds = %.lr.ph124.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv179, %n.vec
  br i1 %cmp.zero, label %.lr.ph124.split.preheader192, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod206 = icmp eq i64 %14, 0
  br i1 %lcmp.mod206, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv179
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load191.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load191.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %19 = icmp eq i64 %10, 0
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %20 = add i64 %indvars.iv179, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load191, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv179, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load191.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge125, label %.lr.ph124.split.preheader192

.lr.ph124.split.us.preheader:                     ; preds = %._crit_edge112
  %wide.trip.count173 = zext i32 %indvars.iv171 to i64
  %31 = and i64 %6, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge120.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge120.us ], [ %indvars.iv179, %.lr.ph124.split.us.preheader ]
  %33 = icmp eq i64 %31, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv177
  %35 = load double, double* %34, align 8
  br i1 %33, label %36, label %.prol.loopexit

; <label>:36:                                     ; preds = %.lr.ph124.split.us
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv177
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %36, %.lr.ph124.split.us
  %.lcssa199.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv166.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph124.split.us ]
  %42 = icmp eq i64 %7, 0
  br i1 %42, label %._crit_edge120.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph124.split.us.new
  %indvars.iv166 = phi i64 [ %indvars.iv166.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next167.1, %43 ]
  %.1117.us = phi double [ %.1117.us.unr.ph, %.lr.ph124.split.us.new ], [ %55, %43 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv166
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv177
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %.1117.us, %48
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv.next167
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next167, i64 %indvars.iv177
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  %exitcond174.1 = icmp eq i64 %indvars.iv.next167, %wide.trip.count173
  %indvars.iv.next167.1 = add nsw i64 %indvars.iv166, 2
  br i1 %exitcond174.1, label %._crit_edge120.us.loopexit, label %43

._crit_edge120.us.loopexit:                       ; preds = %43
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %._crit_edge120.us.loopexit, %.prol.loopexit
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge120.us.loopexit ]
  store double %.lcssa199, double* %34, align 8
  %indvars.iv.next178 = add nuw i64 %indvars.iv177, 1
  %56 = icmp slt i64 %indvars.iv.next178, 2000
  br i1 %56, label %.lr.ph124.split.us, label %._crit_edge125.loopexit

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %._crit_edge112
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112 ], [ 0, %.lr.ph115.preheader ]
  %indvars.iv154 = phi i32 [ %indvars.iv.next155, %._crit_edge112 ], [ -1, %.lr.ph115.preheader ]
  %57 = add i64 %indvars.iv158, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv158
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv158, 0
  br i1 %61, label %.lr.ph111.preheader, label %._crit_edge112

.lr.ph111.preheader:                              ; preds = %.lr.ph115
  %wide.trip.count156 = zext i32 %indvars.iv154 to i64
  %62 = and i64 %57, 1
  %lcmp.mod204 = icmp eq i64 %62, 0
  br i1 %lcmp.mod204, label %.lr.ph111.prol, label %.lr.ph111.prol.loopexit

.lr.ph111.prol:                                   ; preds = %.lr.ph111.preheader
  %63 = load double, double* %13, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv158
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph111.prol.loopexit

.lr.ph111.prol.loopexit:                          ; preds = %.lr.ph111.prol, %.lr.ph111.preheader
  %.lcssa198.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ undef, %.lr.ph111.preheader ]
  %indvars.iv149.unr.ph = phi i64 [ 1, %.lr.ph111.prol ], [ 0, %.lr.ph111.preheader ]
  %.0109.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ %60, %.lr.ph111.preheader ]
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge112, label %.lr.ph111.preheader.new

.lr.ph111.preheader.new:                          ; preds = %.lr.ph111.prol.loopexit
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111, %.lr.ph111.preheader.new
  %indvars.iv149 = phi i64 [ %indvars.iv149.unr.ph, %.lr.ph111.preheader.new ], [ %indvars.iv.next150.1, %.lr.ph111 ]
  %.0109 = phi double [ %.0109.unr.ph, %.lr.ph111.preheader.new ], [ %80, %.lr.ph111 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv149
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv158
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %.0109, %73
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv179, i64 %indvars.iv.next150
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next150, i64 %indvars.iv158
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %74, %79
  %exitcond157.1 = icmp eq i64 %indvars.iv.next150, %wide.trip.count156
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  br i1 %exitcond157.1, label %._crit_edge112.loopexit, label %.lr.ph111

._crit_edge112.loopexit:                          ; preds = %.lr.ph111
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph111.prol.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %60, %.lr.ph115 ], [ %.lcssa198.unr.ph, %.lr.ph111.prol.loopexit ], [ %80, %._crit_edge112.loopexit ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv158
  %82 = load double, double* %81, align 8
  %83 = fdiv double %.0.lcssa, %82
  store double %83, double* %59, align 8
  %indvars.iv.next159 = add nuw i64 %indvars.iv158, 1
  %84 = icmp slt i64 %indvars.iv.next159, %indvars.iv179
  %indvars.iv.next155 = add nsw i32 %indvars.iv154, 1
  br i1 %84, label %.lr.ph115, label %.lr.ph124.split.us.preheader

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader192, %.lr.ph124.split
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %.lr.ph124.split ], [ %indvars.iv162.ph, %.lr.ph124.split.preheader192 ]
  %exitcond164 = icmp eq i64 %indvars.iv162, 1999
  %indvars.iv.next163 = add nuw i64 %indvars.iv162, 1
  br i1 %exitcond164, label %._crit_edge125.loopexit215, label %.lr.ph124.split, !llvm.loop !21

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125.loopexit215:                       ; preds = %.lr.ph124.split
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit215, %._crit_edge125.loopexit, %middle.block
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %85 = icmp slt i64 %indvars.iv.next180, 2000
  %indvars.iv.next172 = add nsw i32 %indvars.iv171, 1
  br i1 %85, label %.preheader94, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %indvars.iv143 = phi i32 [ %indvars.iv.next144, %._crit_edge104 ], [ -1, %.preheader.preheader ]
  %86 = add i64 %indvars.iv147, 4294967295
  %87 = and i64 %86, 4294967295
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv147
  %89 = load double, double* %88, align 8
  %90 = icmp sgt i64 %indvars.iv147, 0
  br i1 %90, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader
  %wide.trip.count145 = zext i32 %indvars.iv143 to i64
  %xtraiter200 = and i64 %indvars.iv147, 3
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv138.prol = phi i64 [ %indvars.iv.next139.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %96, %.lr.ph103.prol ], [ %89, %.lr.ph103.prol.preheader ]
  %prol.iter202 = phi i64 [ %prol.iter202.sub, %.lr.ph103.prol ], [ %xtraiter200, %.lr.ph103.prol.preheader ]
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138.prol
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv138.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %.2101.prol, %95
  %indvars.iv.next139.prol = add nuw nsw i64 %indvars.iv138.prol, 1
  %prol.iter202.sub = add i64 %prol.iter202, -1
  %prol.iter202.cmp = icmp eq i64 %prol.iter202.sub, 0
  br i1 %prol.iter202.cmp, label %.lr.ph103.prol.loopexit.loopexit, label %.lr.ph103.prol, !llvm.loop !23

.lr.ph103.prol.loopexit.loopexit:                 ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.prol.loopexit.loopexit, %.lr.ph103.preheader
  %.lcssa197.unr = phi double [ undef, %.lr.ph103.preheader ], [ %96, %.lr.ph103.prol.loopexit.loopexit ]
  %indvars.iv138.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next139.prol, %.lr.ph103.prol.loopexit.loopexit ]
  %.2101.unr = phi double [ %89, %.lr.ph103.preheader ], [ %96, %.lr.ph103.prol.loopexit.loopexit ]
  %97 = icmp ult i64 %87, 3
  br i1 %97, label %._crit_edge104, label %.lr.ph103.preheader.new

.lr.ph103.preheader.new:                          ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.lr.ph103.preheader.new
  %indvars.iv138 = phi i64 [ %indvars.iv138.unr, %.lr.ph103.preheader.new ], [ %indvars.iv.next139.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.lr.ph103.preheader.new ], [ %121, %.lr.ph103 ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fsub double %.2101, %102
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fsub double %103, %108
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139.1
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139.1
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fsub double %109, %114
  %indvars.iv.next139.2 = add nsw i64 %indvars.iv138, 3
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139.2
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139.2
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fsub double %115, %120
  %exitcond146.3 = icmp eq i64 %indvars.iv.next139.2, %wide.trip.count145
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  br i1 %exitcond146.3, label %._crit_edge104.loopexit, label %.lr.ph103

._crit_edge104.loopexit:                          ; preds = %.lr.ph103
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.lr.ph103.prol.loopexit, %.preheader
  %.2.lcssa = phi double [ %89, %.preheader ], [ %.lcssa197.unr, %.lr.ph103.prol.loopexit ], [ %121, %._crit_edge104.loopexit ]
  %122 = getelementptr inbounds double, double* %4, i64 %indvars.iv147
  store double %.2.lcssa, double* %122, align 8
  %indvars.iv.next148 = add nuw i64 %indvars.iv147, 1
  %123 = icmp slt i64 %indvars.iv.next148, 2000
  %indvars.iv.next144 = add nsw i32 %indvars.iv143, 1
  br i1 %123, label %.preheader, label %.preheader181.preheader

.preheader181.preheader:                          ; preds = %._crit_edge104
  br label %.preheader181

.preheader181:                                    ; preds = %.preheader181.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %.preheader181.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv136 = phi i64 [ 1999, %.preheader181.preheader ], [ %indvars.iv.next137, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader181.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv136
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv136, 1
  %130 = icmp slt i64 %129, 2000
  br i1 %130, label %..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader181
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %132 = load double, double* %131, align 8
  %133 = fdiv double %128, %132
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %133, double* %134, align 8
  br label %._crit_edge._crit_edge

..lr.ph_crit_edge:                                ; preds = %.preheader181
  %135 = sext i32 %indvars.iv to i64
  %136 = sub nsw i64 0, %125
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.lr.ph.prol ], [ %135, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %142, %.lr.ph.prol ], [ %128, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134.prol
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv134.prol
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fsub double %.397.prol, %141
  %indvars.iv.next135.prol = add nsw i64 %indvars.iv134.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %..lr.ph_crit_edge
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv134.unr = phi i64 [ %135, %..lr.ph_crit_edge ], [ %indvars.iv.next135.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.397.unr = phi double [ %128, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.loopexit ]
  %143 = icmp ult i64 %126, 3
  br i1 %143, label %._crit_edge, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv134 = phi i64 [ %indvars.iv134.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next135.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %167, %.lr.ph ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv134
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fsub double %.397, %148
  %indvars.iv.next135 = add nsw i64 %indvars.iv134, 1
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135
  %151 = load double, double* %150, align 8
  %152 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135
  %153 = load double, double* %152, align 8
  %154 = fmul double %151, %153
  %155 = fsub double %149, %154
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135.1
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.1
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = fsub double %155, %160
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135.2
  %163 = load double, double* %162, align 8
  %164 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.2
  %165 = load double, double* %164, align 8
  %166 = fmul double %163, %165
  %167 = fsub double %161, %166
  %exitcond.3 = icmp eq i64 %indvars.iv.next135.2, 1999
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %167, %._crit_edge.loopexit ]
  %168 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %169 = load double, double* %168, align 8
  %170 = fdiv double %.lcssa, %169
  %171 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %170, double* %171, align 8
  %172 = icmp sgt i64 %indvars.iv136, 0
  br i1 %172, label %._crit_edge._crit_edge, label %173

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next137 = add i64 %indvars.iv136, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader181

; <label>:173:                                    ; preds = %._crit_edge
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
