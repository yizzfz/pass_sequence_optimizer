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
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100, %5
  %indvars.iv139 = phi i64 [ 0, %5 ], [ %indvars.iv.next140.1, %._crit_edge100 ]
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
  br i1 %exitcond141.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader87_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge..preheader87_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv137, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %22
  %23 = sub i64 1998, %indvars.iv137
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  br label %27

.preheader86:                                     ; preds = %27
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %26 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %26, label %._crit_edge..preheader87_crit_edge, label %37

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv120
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv120
  store double %33, double* %34, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %.preheader86, label %27

._crit_edge..preheader87_crit_edge:               ; preds = %.preheader86
  %35 = add nuw nsw i64 %25, 8
  %scevgep135136 = bitcast double* %scevgep135 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %35, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader86
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader85_crit_edge

.preheader84:                                     ; preds = %..preheader85_crit_edge
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader83

..preheader85_crit_edge:                          ; preds = %..preheader85_crit_edge, %37
  %indvars.iv118 = phi i64 [ 0, %37 ], [ %indvars.iv.next119.7, %..preheader85_crit_edge ]
  %41 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %42 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %43 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %44 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %45 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %46 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %47 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %48 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %exitcond145.7 = icmp eq i64 %indvars.iv.next119.7, 2000
  br i1 %exitcond145.7, label %.preheader84, label %..preheader85_crit_edge

.preheader83:                                     ; preds = %94, %.preheader84
  %indvars.iv113 = phi i64 [ 0, %.preheader84 ], [ %49, %94 ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  %49 = add i64 %indvars.iv113, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %49
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  br label %.preheader82

.preheader81:                                     ; preds = %94
  br label %.preheader

.preheader82:                                     ; preds = %middle.block, %.preheader83
  %indvars.iv111 = phi i64 [ 0, %.preheader83 ], [ %indvars.iv.next112, %middle.block ]
  %50 = mul i64 %indvars.iv111, 16000
  %scevgep146 = getelementptr i8, i8* %39, i64 %50
  %51 = add i64 %50, 16000
  %scevgep147 = getelementptr i8, i8* %39, i64 %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep146, %scevgep150151
  %bound1 = icmp ult i8* %scevgep148149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %52 to i8*
  %bound0153 = icmp ult i8* %scevgep146, %bc
  %bound1154 = icmp ult i8* %bc, %scevgep147
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader82
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader82
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = load double, double* %52, align 8, !alias.scope !1
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv113
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv113
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %58, %68
  %72 = fmul <2 x double> %58, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load157, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %middle.block.loopexit187, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %80 = load double, double* %52, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %87 = load double, double* %52, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit187:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit187, %middle.block.loopexit
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond143, label %94, label %.preheader82

; <label>:94:                                     ; preds = %middle.block
  %exitcond144 = icmp eq i64 %49, 2000
  br i1 %exitcond144, label %.preheader81, label %.preheader83

.preheader:                                       ; preds = %middle.block159, %.preheader81
  %indvars.iv106 = phi i64 [ 0, %.preheader81 ], [ %95, %middle.block159 ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %95 = add i64 %indvars.iv106, 1
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %1, i64 %95, i64 0
  %scevgep165166 = bitcast double* %scevgep165 to i8*
  %96 = mul i64 %indvars.iv106, 16000
  %scevgep167 = getelementptr i8, i8* %39, i64 %96
  %97 = add i64 %96, 16000
  %scevgep168 = getelementptr i8, i8* %39, i64 %97
  %bound0169 = icmp ult i8* %scevgep163164, %scevgep168
  %bound1170 = icmp ult i8* %scevgep167, %scevgep165166
  %memcheck.conflict172 = and i1 %bound0169, %bound1170
  br i1 %memcheck.conflict172, label %scalar.ph160.preheader, label %vector.body158.preheader

vector.body158.preheader:                         ; preds = %.preheader
  br label %vector.body158

scalar.ph160.preheader:                           ; preds = %.preheader
  br label %scalar.ph160

vector.body158:                                   ; preds = %vector.body158, %vector.body158.preheader
  %index175 = phi i64 [ 0, %vector.body158.preheader ], [ %index.next176.1, %vector.body158 ]
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %index175
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load184 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index175
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load184, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next176 = or i64 %index175, 4
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %index.next176
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load184.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next176
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %111, align 8, !alias.scope !16, !noalias !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load184.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %index.next176.1 = add nsw i64 %index175, 8
  %114 = icmp eq i64 %index.next176.1, 2000
  br i1 %114, label %middle.block159.loopexit186, label %vector.body158, !llvm.loop !18

scalar.ph160:                                     ; preds = %scalar.ph160, %scalar.ph160.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph160.preheader ], [ %indvars.iv.next.4, %scalar.ph160 ]
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block159.loopexit, label %scalar.ph160, !llvm.loop !19

middle.block159.loopexit:                         ; preds = %scalar.ph160
  br label %middle.block159

middle.block159.loopexit186:                      ; preds = %vector.body158
  br label %middle.block159

middle.block159:                                  ; preds = %middle.block159.loopexit186, %middle.block159.loopexit
  %exitcond142 = icmp eq i64 %95, 2000
  br i1 %exitcond142, label %140, label %.preheader

; <label>:140:                                    ; preds = %middle.block159
  call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %5
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge125 ], [ 0, %5 ]
  %indvars.iv170 = phi i32 [ %indvars.iv.next171, %._crit_edge125 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv178, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv178
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv178
  %12 = icmp sgt i64 %indvars.iv178, 0
  br i1 %12, label %.lr.ph115.preheader, label %.lr.ph124.split.preheader

.lr.ph115.preheader:                              ; preds = %.preheader94
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 0
  br label %.lr.ph115

.lr.ph124.split.preheader:                        ; preds = %.lr.ph124..lr.ph124.split.preheader_crit_edge, %.preheader94
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph124.split.preheader193, label %min.iters.checked

.lr.ph124.split.preheader193:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph124.split.preheader
  %indvars.iv161.ph = phi i64 [ %indvars.iv178, %min.iters.checked ], [ %indvars.iv178, %.lr.ph124.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph124.split

min.iters.checked:                                ; preds = %.lr.ph124.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv178, %n.vec
  br i1 %cmp.zero, label %.lr.ph124.split.preheader193, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod207 = icmp eq i64 %14, 0
  br i1 %lcmp.mod207, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv178
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load192.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load192.prol, <2 x i64>* %18, align 8
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
  %20 = add i64 %indvars.iv178, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load192, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv178, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load192.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load192.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge125, label %.lr.ph124.split.preheader193

.lr.ph124:                                        ; preds = %._crit_edge112
  br i1 true, label %.lr.ph124.split.us.preheader, label %.lr.ph124..lr.ph124.split.preheader_crit_edge

.lr.ph124..lr.ph124.split.preheader_crit_edge:    ; preds = %.lr.ph124
  br label %.lr.ph124.split.preheader

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %wide.trip.count172 = zext i32 %indvars.iv170 to i64
  %31 = and i64 %6, 1
  %lcmp.mod209 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %._crit_edge120.us, %.lr.ph124.split.us.preheader
  %indvars.iv176 = phi i64 [ %indvars.iv.next177, %._crit_edge120.us ], [ %indvars.iv178, %.lr.ph124.split.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv176
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod209, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv176
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph124.split.us, %36
  %.lcssa200.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv165.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph124.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge120.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph124.split.us.new
  %indvars.iv165 = phi i64 [ %indvars.iv165.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next166.1, %42 ]
  %.1117.us = phi double [ %.1117.us.unr.ph, %.lr.ph124.split.us.new ], [ %56, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv165
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv165, i64 %indvars.iv176
  %46 = load double, double* %45, align 8
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next166, i64 %indvars.iv176
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.1117.us, %53
  %56 = fsub double %55, %54
  %exitcond173.1 = icmp eq i64 %indvars.iv.next166, %wide.trip.count172
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  br i1 %exitcond173.1, label %._crit_edge120.us.unr-lcssa, label %42

._crit_edge120.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %.prol.loopexit, %._crit_edge120.us.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge120.us.unr-lcssa ]
  store double %.lcssa200, double* %34, align 8
  %indvars.iv.next177 = add nuw i64 %indvars.iv176, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next177, 2000
  br i1 %exitcond187, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %._crit_edge112
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %._crit_edge112 ], [ 0, %.lr.ph115.preheader ]
  %indvars.iv153 = phi i32 [ %indvars.iv.next154, %._crit_edge112 ], [ -1, %.lr.ph115.preheader ]
  %57 = add i64 %indvars.iv157, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv157
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv157, 0
  br i1 %61, label %.lr.ph111.preheader, label %._crit_edge112

.lr.ph111.preheader:                              ; preds = %.lr.ph115
  %wide.trip.count155 = zext i32 %indvars.iv153 to i64
  %62 = and i64 %57, 1
  %lcmp.mod205 = icmp eq i64 %62, 0
  br i1 %lcmp.mod205, label %.lr.ph111.prol.preheader, label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.preheader:                         ; preds = %.lr.ph111.preheader
  br label %.lr.ph111.prol

.lr.ph111.prol:                                   ; preds = %.lr.ph111.prol.preheader
  %63 = load double, double* %13, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv157
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph111.preheader, %.lr.ph111.prol
  %.lcssa199.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ undef, %.lr.ph111.preheader ]
  %indvars.iv148.unr.ph = phi i64 [ 1, %.lr.ph111.prol ], [ 0, %.lr.ph111.preheader ]
  %.0109.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ %60, %.lr.ph111.preheader ]
  br label %.lr.ph111.prol.loopexit

.lr.ph111.prol.loopexit:                          ; preds = %.lr.ph111.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge112.loopexit, label %.lr.ph111.preheader.new

.lr.ph111.preheader.new:                          ; preds = %.lr.ph111.prol.loopexit
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111, %.lr.ph111.preheader.new
  %indvars.iv148 = phi i64 [ %indvars.iv148.unr.ph, %.lr.ph111.preheader.new ], [ %indvars.iv.next149.1, %.lr.ph111 ]
  %.0109 = phi double [ %.0109.unr.ph, %.lr.ph111.preheader.new ], [ %82, %.lr.ph111 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv148
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv157
  %72 = load double, double* %71, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next149, i64 %indvars.iv157
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %73, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.0109, %79
  %82 = fsub double %81, %80
  %exitcond156.1 = icmp eq i64 %indvars.iv.next149, %wide.trip.count155
  %indvars.iv.next149.1 = add nsw i64 %indvars.iv148, 2
  br i1 %exitcond156.1, label %._crit_edge112.loopexit.unr-lcssa, label %.lr.ph111

._crit_edge112.loopexit.unr-lcssa:                ; preds = %.lr.ph111
  br label %._crit_edge112.loopexit

._crit_edge112.loopexit:                          ; preds = %.lr.ph111.prol.loopexit, %._crit_edge112.loopexit.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.lr.ph111.prol.loopexit ], [ %82, %._crit_edge112.loopexit.unr-lcssa ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %60, %.lr.ph115 ], [ %.lcssa199, %._crit_edge112.loopexit ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv157, i64 %indvars.iv157
  %84 = load double, double* %83, align 8
  %85 = fdiv double %.0.lcssa, %84
  store double %85, double* %59, align 8
  %indvars.iv.next158 = add nuw i64 %indvars.iv157, 1
  %86 = icmp slt i64 %indvars.iv.next158, %indvars.iv178
  %indvars.iv.next154 = add nsw i32 %indvars.iv153, 1
  br i1 %86, label %.lr.ph115, label %.lr.ph124

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader193, %.lr.ph124.split
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %.lr.ph124.split ], [ %indvars.iv161.ph, %.lr.ph124.split.preheader193 ]
  %exitcond163 = icmp eq i64 %indvars.iv161, 1999
  %indvars.iv.next162 = add nuw i64 %indvars.iv161, 1
  br i1 %exitcond163, label %._crit_edge125.loopexit194, label %.lr.ph124.split, !llvm.loop !21

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125.loopexit194:                       ; preds = %.lr.ph124.split
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit194, %._crit_edge125.loopexit, %middle.block
  %indvars.iv.next179 = add nuw i64 %indvars.iv178, 1
  %87 = icmp slt i64 %indvars.iv.next179, 2000
  %indvars.iv.next171 = add nsw i32 %indvars.iv170, 1
  br i1 %87, label %.preheader94, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %indvars.iv142 = phi i32 [ %indvars.iv.next143, %._crit_edge104 ], [ -1, %.preheader.preheader ]
  %88 = add i64 %indvars.iv146, 4294967295
  %89 = and i64 %88, 4294967295
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv146
  %91 = load double, double* %90, align 8
  %92 = icmp sgt i64 %indvars.iv146, 0
  br i1 %92, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader
  %wide.trip.count144 = zext i32 %indvars.iv142 to i64
  %xtraiter201 = and i64 %indvars.iv146, 3
  %lcmp.mod202 = icmp eq i64 %xtraiter201, 0
  br i1 %lcmp.mod202, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %98, %.lr.ph103.prol ], [ %91, %.lr.ph103.prol.preheader ]
  %prol.iter203 = phi i64 [ %prol.iter203.sub, %.lr.ph103.prol ], [ %xtraiter201, %.lr.ph103.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv137.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv137.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.2101.prol, %97
  %indvars.iv.next138.prol = add nuw nsw i64 %indvars.iv137.prol, 1
  %prol.iter203.sub = add i64 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i64 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %.lr.ph103.prol.loopexit.unr-lcssa, label %.lr.ph103.prol, !llvm.loop !23

.lr.ph103.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.preheader, %.lr.ph103.prol.loopexit.unr-lcssa
  %.lcssa198.unr = phi double [ undef, %.lr.ph103.preheader ], [ %98, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next138.prol, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %.2101.unr = phi double [ %91, %.lr.ph103.preheader ], [ %98, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %._crit_edge104.loopexit, label %.lr.ph103.preheader.new

.lr.ph103.preheader.new:                          ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.lr.ph103.preheader.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph103.preheader.new ], [ %indvars.iv.next138.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.lr.ph103.preheader.new ], [ %121, %.lr.ph103 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv137
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv137
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.2101, %107
  %110 = fsub double %109, %108
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.next138.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next138.1
  %114 = bitcast double* %113 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %exitcond145.3 = icmp eq i64 %indvars.iv.next138.2, %wide.trip.count144
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond145.3, label %._crit_edge104.loopexit.unr-lcssa, label %.lr.ph103

._crit_edge104.loopexit.unr-lcssa:                ; preds = %.lr.ph103
  br label %._crit_edge104.loopexit

._crit_edge104.loopexit:                          ; preds = %.lr.ph103.prol.loopexit, %._crit_edge104.loopexit.unr-lcssa
  %.lcssa198 = phi double [ %.lcssa198.unr, %.lr.ph103.prol.loopexit ], [ %121, %._crit_edge104.loopexit.unr-lcssa ]
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.preheader
  %.2.lcssa = phi double [ %91, %.preheader ], [ %.lcssa198, %._crit_edge104.loopexit ]
  %122 = getelementptr inbounds double, double* %4, i64 %indvars.iv146
  store double %.2.lcssa, double* %122, align 8
  %indvars.iv.next147 = add nuw i64 %indvars.iv146, 1
  %123 = icmp slt i64 %indvars.iv.next147, 2000
  %indvars.iv.next143 = add nsw i32 %indvars.iv142, 1
  br i1 %123, label %.preheader, label %._crit_edge104._crit_edge.preheader

._crit_edge104._crit_edge.preheader:              ; preds = %._crit_edge104
  br label %._crit_edge104._crit_edge

._crit_edge104._crit_edge:                        ; preds = %._crit_edge104._crit_edge.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge104._crit_edge.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv135 = phi i64 [ 1999, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next136, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv135
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv135, 1
  %130 = icmp slt i64 %129, 2000
  br i1 %130, label %..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge104._crit_edge
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv135
  %132 = load double, double* %131, align 8
  %133 = fdiv double %128, %132
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv135
  store double %133, double* %134, align 8
  br label %._crit_edge._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge104._crit_edge
  %135 = sext i32 %indvars.iv to i64
  %136 = sub nsw i64 0, %125
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.lr.ph.prol ], [ %135, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %142, %.lr.ph.prol ], [ %128, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv133.prol
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv133.prol
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fsub double %.397.prol, %141
  %indvars.iv.next134.prol = add nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv133.unr = phi i64 [ %135, %..lr.ph_crit_edge ], [ %indvars.iv.next134.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %128, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.unr-lcssa ]
  %143 = icmp ult i64 %126, 3
  br i1 %143, label %._crit_edge, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next134.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %165, %.lr.ph ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv133
  %145 = bitcast double* %144 to <2 x double>*
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv133
  %147 = bitcast double* %146 to <2 x double>*
  %148 = load <2 x double>, <2 x double>* %145, align 8
  %149 = load <2 x double>, <2 x double>* %147, align 8
  %150 = fmul <2 x double> %148, %149
  %151 = extractelement <2 x double> %150, i32 0
  %152 = extractelement <2 x double> %150, i32 1
  %153 = fsub double %.397, %151
  %154 = fsub double %153, %152
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv.next134.1
  %156 = bitcast double* %155 to <2 x double>*
  %157 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134.1
  %158 = bitcast double* %157 to <2 x double>*
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %159 = load <2 x double>, <2 x double>* %156, align 8
  %160 = load <2 x double>, <2 x double>* %158, align 8
  %161 = fmul <2 x double> %159, %160
  %162 = extractelement <2 x double> %161, i32 0
  %163 = extractelement <2 x double> %161, i32 1
  %164 = fsub double %154, %162
  %165 = fsub double %164, %163
  %exitcond.3 = icmp eq i64 %indvars.iv.next134.2, 1999
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %.lr.ph

._crit_edge.unr-lcssa:                            ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %165, %._crit_edge.unr-lcssa ]
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv135
  %167 = load double, double* %166, align 8
  %168 = fdiv double %.lcssa, %167
  %169 = getelementptr inbounds double, double* %3, i64 %indvars.iv135
  store double %168, double* %169, align 8
  %170 = icmp sgt i64 %indvars.iv135, 0
  br i1 %170, label %._crit_edge._crit_edge, label %171

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next136 = add i64 %indvars.iv135, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge104._crit_edge

; <label>:171:                                    ; preds = %._crit_edge
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
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge6

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
