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
  %22 = sub i64 1998, %indvars.iv137
  %23 = shl i64 %22, 3
  br label %25

.preheader86:                                     ; preds = %25
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %24 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %24, label %._crit_edge..preheader87_crit_edge, label %38

; <label>:25:                                     ; preds = %25, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %25 ], [ 0, %.lr.ph ]
  %26 = sub nsw i64 0, %indvars.iv120
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv120
  store double %31, double* %32, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %.preheader86, label %25

._crit_edge..preheader87_crit_edge:               ; preds = %.preheader86
  %33 = and i64 %23, 34359738360
  %34 = ashr exact i64 %sext, 32
  %35 = add nuw nsw i64 %33, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %34
  %36 = bitcast double* %scevgep135 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %36, i8 0, i64 %35, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %.preheader86
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %39, align 8
  %40 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader85_crit_edge

.preheader84:                                     ; preds = %..preheader85_crit_edge
  %41 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.preheader83

..preheader85_crit_edge:                          ; preds = %..preheader85_crit_edge, %38
  %indvars.iv118 = phi i64 [ 0, %38 ], [ %indvars.iv.next119.7, %..preheader85_crit_edge ]
  %42 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %43 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %44 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %45 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %46 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %47 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %48 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %49 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %exitcond145.7 = icmp eq i64 %indvars.iv.next119.7, 2000
  br i1 %exitcond145.7, label %.preheader84, label %..preheader85_crit_edge

.preheader83:                                     ; preds = %95, %.preheader84
  %indvars.iv113 = phi i64 [ 0, %.preheader84 ], [ %50, %95 ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  %50 = add i64 %indvars.iv113, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %50
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  br label %.preheader82

.preheader81:                                     ; preds = %95
  br label %.preheader

.preheader82:                                     ; preds = %middle.block, %.preheader83
  %indvars.iv111 = phi i64 [ 0, %.preheader83 ], [ %indvars.iv.next112, %middle.block ]
  %51 = mul i64 %indvars.iv111, 16000
  %scevgep146 = getelementptr i8, i8* %40, i64 %51
  %52 = add i64 %51, 16000
  %scevgep147 = getelementptr i8, i8* %40, i64 %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep146, %scevgep150151
  %bound1 = icmp ult i8* %scevgep148149, %scevgep147
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %53 to i8*
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
  %54 = or i64 %index, 1
  %55 = or i64 %index, 2
  %56 = or i64 %index, 3
  %57 = load double, double* %53, align 8, !alias.scope !1
  %58 = insertelement <2 x double> undef, double %57, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv113
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv113
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %59, %69
  %73 = fmul <2 x double> %59, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load157, %73
  store <2 x double> %78, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %79, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %middle.block.loopexit187, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %81 = load double, double* %53, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %88 = load double, double* %53, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
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
  br i1 %exitcond143, label %95, label %.preheader82

; <label>:95:                                     ; preds = %middle.block
  %exitcond144 = icmp eq i64 %50, 2000
  br i1 %exitcond144, label %.preheader81, label %.preheader83

.preheader:                                       ; preds = %middle.block159, %.preheader81
  %indvars.iv106 = phi i64 [ 0, %.preheader81 ], [ %96, %middle.block159 ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %96 = add i64 %indvars.iv106, 1
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %1, i64 %96, i64 0
  %scevgep165166 = bitcast double* %scevgep165 to i8*
  %97 = mul i64 %indvars.iv106, 16000
  %scevgep167 = getelementptr i8, i8* %40, i64 %97
  %98 = add i64 %97, 16000
  %scevgep168 = getelementptr i8, i8* %40, i64 %98
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
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %index175
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load184 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index175
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load184, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %index.next176 = or i64 %index175, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %index.next176
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load184.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next176
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load184.1, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %index.next176.1 = add nsw i64 %index175, 8
  %115 = icmp eq i64 %index.next176.1, 2000
  br i1 %115, label %middle.block159.loopexit186, label %vector.body158, !llvm.loop !18

scalar.ph160:                                     ; preds = %scalar.ph160, %scalar.ph160.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph160.preheader ], [ %indvars.iv.next.4, %scalar.ph160 ]
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block159.loopexit, label %scalar.ph160, !llvm.loop !19

middle.block159.loopexit:                         ; preds = %scalar.ph160
  br label %middle.block159

middle.block159.loopexit186:                      ; preds = %vector.body158
  br label %middle.block159

middle.block159:                                  ; preds = %middle.block159.loopexit186, %middle.block159.loopexit
  %exitcond142 = icmp eq i64 %96, 2000
  br i1 %exitcond142, label %141, label %.preheader

; <label>:141:                                    ; preds = %middle.block159
  call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %5
  %indvars.iv201 = phi i64 [ %indvars.iv.next202, %._crit_edge125 ], [ 0, %5 ]
  %indvars.iv192 = phi i32 [ %indvars.iv.next193, %._crit_edge125 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv201, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv201
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv201
  %12 = zext i32 %indvars.iv192 to i64
  %13 = icmp sgt i64 %indvars.iv201, 0
  br i1 %13, label %.lr.ph115.preheader, label %.lr.ph124.split.preheader

.lr.ph115.preheader:                              ; preds = %.preheader94
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 0
  br label %.lr.ph115

.lr.ph124.split.preheader:                        ; preds = %.lr.ph124..lr.ph124.split.preheader_crit_edge, %.preheader94
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph124.split.preheader207, label %min.iters.checked

.lr.ph124.split.preheader207:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph124.split.preheader
  %indvars.iv163.ph = phi i64 [ %indvars.iv201, %min.iters.checked ], [ %indvars.iv201, %.lr.ph124.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph124.split

min.iters.checked:                                ; preds = %.lr.ph124.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv201, %n.vec
  br i1 %cmp.zero, label %.lr.ph124.split.preheader207, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %15 = and i64 %10, 1
  %lcmp.mod221 = icmp eq i64 %15, 0
  br i1 %lcmp.mod221, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %indvars.iv201
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load206.prol = load <2 x i64>, <2 x i64>* %19, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load206.prol, <2 x i64>* %19, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %10, 0
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %21 = add i64 %indvars.iv201, %index
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %21
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load206 = load <2 x i64>, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load206, <2 x i64>* %25, align 8
  %index.next = add i64 %index, 4
  %26 = add i64 %indvars.iv201, %index.next
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %26
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load206.1 = load <2 x i64>, <2 x i64>* %30, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load206.1, <2 x i64>* %30, align 8
  %index.next.1 = add i64 %index, 8
  %31 = icmp eq i64 %index.next.1, %n.vec
  br i1 %31, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge125, label %.lr.ph124.split.preheader207

.lr.ph124:                                        ; preds = %._crit_edge112
  br i1 true, label %.lr.ph124.split.us.preheader, label %.lr.ph124..lr.ph124.split.preheader_crit_edge

.lr.ph124..lr.ph124.split.preheader_crit_edge:    ; preds = %.lr.ph124
  br label %.lr.ph124.split.preheader

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %32 = and i64 %6, 1
  %lcmp.mod223 = icmp eq i64 %32, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 0
  %34 = icmp eq i64 %7, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge120.us
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge120.us ], [ %indvars.iv201, %.lr.ph124.split.us.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %indvars.iv178
  %36 = load double, double* %35, align 8
  br i1 %lcmp.mod223, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  br label %37

; <label>:37:                                     ; preds = %.prol.preheader
  %38 = load double, double* %33, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv178
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph124.split.us, %37
  %.lcssa214.unr.ph = phi double [ %42, %37 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv167.unr.ph = phi i64 [ 1, %37 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %42, %37 ], [ %36, %.lr.ph124.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %34, label %._crit_edge120.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph124.split.us.new
  %indvars.iv167 = phi i64 [ %indvars.iv167.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next168.1, %43 ]
  %.1117.us = phi double [ %.1117.us.unr.ph, %.lr.ph124.split.us.new ], [ %57, %43 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %indvars.iv167
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv178
  %47 = load double, double* %46, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next168, i64 %indvars.iv178
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.1117.us, %54
  %57 = fsub double %56, %55
  %exitcond194.1 = icmp eq i64 %indvars.iv.next168, %12
  %indvars.iv.next168.1 = add nsw i64 %indvars.iv167, 2
  br i1 %exitcond194.1, label %._crit_edge120.us.unr-lcssa, label %43

._crit_edge120.us.unr-lcssa:                      ; preds = %43
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %.prol.loopexit, %._crit_edge120.us.unr-lcssa
  %.lcssa214 = phi double [ %.lcssa214.unr.ph, %.prol.loopexit ], [ %57, %._crit_edge120.us.unr-lcssa ]
  store double %.lcssa214, double* %35, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond195 = icmp eq i64 %indvars.iv.next179, 2000
  br i1 %exitcond195, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %._crit_edge112
  %indvars.iv189 = phi i32 [ %indvars.iv.next190, %._crit_edge112 ], [ -1, %.lr.ph115.preheader ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge112 ], [ 0, %.lr.ph115.preheader ]
  %58 = add i64 %indvars.iv159, 4294967295
  %59 = and i64 %58, 4294967295
  %60 = zext i32 %indvars.iv189 to i64
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %indvars.iv159
  %62 = load double, double* %61, align 8
  %63 = icmp sgt i64 %indvars.iv159, 0
  br i1 %63, label %.lr.ph111.preheader, label %._crit_edge112

.lr.ph111.preheader:                              ; preds = %.lr.ph115
  %64 = and i64 %58, 1
  %lcmp.mod219 = icmp eq i64 %64, 0
  br i1 %lcmp.mod219, label %.lr.ph111.prol.preheader, label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.preheader:                         ; preds = %.lr.ph111.preheader
  br label %.lr.ph111.prol

.lr.ph111.prol:                                   ; preds = %.lr.ph111.prol.preheader
  %65 = load double, double* %14, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv159
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %62, %68
  br label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph111.preheader, %.lr.ph111.prol
  %.lcssa213.unr.ph = phi double [ %69, %.lr.ph111.prol ], [ undef, %.lr.ph111.preheader ]
  %indvars.iv150.unr.ph = phi i64 [ 1, %.lr.ph111.prol ], [ 0, %.lr.ph111.preheader ]
  %.0109.unr.ph = phi double [ %69, %.lr.ph111.prol ], [ %62, %.lr.ph111.preheader ]
  br label %.lr.ph111.prol.loopexit

.lr.ph111.prol.loopexit:                          ; preds = %.lr.ph111.prol.loopexit.unr-lcssa
  %70 = icmp eq i64 %59, 0
  br i1 %70, label %._crit_edge112.loopexit, label %.lr.ph111.preheader.new

.lr.ph111.preheader.new:                          ; preds = %.lr.ph111.prol.loopexit
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111, %.lr.ph111.preheader.new
  %indvars.iv150 = phi i64 [ %indvars.iv150.unr.ph, %.lr.ph111.preheader.new ], [ %indvars.iv.next151.1, %.lr.ph111 ]
  %.0109 = phi double [ %.0109.unr.ph, %.lr.ph111.preheader.new ], [ %84, %.lr.ph111 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv201, i64 %indvars.iv150
  %72 = bitcast double* %71 to <2 x double>*
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv159
  %74 = load double, double* %73, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %75 = load <2 x double>, <2 x double>* %72, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next151, i64 %indvars.iv159
  %77 = load double, double* %76, align 8
  %78 = insertelement <2 x double> undef, double %74, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fmul <2 x double> %75, %79
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = fsub double %.0109, %81
  %84 = fsub double %83, %82
  %exitcond191.1 = icmp eq i64 %indvars.iv.next151, %60
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  br i1 %exitcond191.1, label %._crit_edge112.loopexit.unr-lcssa, label %.lr.ph111

._crit_edge112.loopexit.unr-lcssa:                ; preds = %.lr.ph111
  br label %._crit_edge112.loopexit

._crit_edge112.loopexit:                          ; preds = %.lr.ph111.prol.loopexit, %._crit_edge112.loopexit.unr-lcssa
  %.lcssa213 = phi double [ %.lcssa213.unr.ph, %.lr.ph111.prol.loopexit ], [ %84, %._crit_edge112.loopexit.unr-lcssa ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %62, %.lr.ph115 ], [ %.lcssa213, %._crit_edge112.loopexit ]
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv159, i64 %indvars.iv159
  %86 = load double, double* %85, align 8
  %87 = fdiv double %.0.lcssa, %86
  store double %87, double* %61, align 8
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %indvars.iv.next190 = add nsw i32 %indvars.iv189, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next160, %indvars.iv201
  br i1 %exitcond203, label %.lr.ph124, label %.lr.ph115

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader207, %.lr.ph124.split
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %.lr.ph124.split ], [ %indvars.iv163.ph, %.lr.ph124.split.preheader207 ]
  %exitcond165 = icmp eq i64 %indvars.iv163, 1999
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  br i1 %exitcond165, label %._crit_edge125.loopexit208, label %.lr.ph124.split, !llvm.loop !21

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125.loopexit208:                       ; preds = %.lr.ph124.split
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit208, %._crit_edge125.loopexit, %middle.block
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %indvars.iv.next193 = add nsw i32 %indvars.iv192, 1
  %exitcond204 = icmp eq i64 %indvars.iv.next202, 2000
  br i1 %exitcond204, label %.preheader.preheader, label %.preheader94

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv186 = phi i32 [ %indvars.iv.next187, %._crit_edge104 ], [ -1, %.preheader.preheader ]
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %88 = add i64 %indvars.iv148, 4294967295
  %89 = and i64 %88, 4294967295
  %90 = zext i32 %indvars.iv186 to i64
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv148
  %92 = load double, double* %91, align 8
  %93 = icmp sgt i64 %indvars.iv148, 0
  br i1 %93, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader
  %xtraiter215 = and i64 %indvars.iv148, 3
  %lcmp.mod216 = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod216, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv139.prol = phi i64 [ %indvars.iv.next140.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %99, %.lr.ph103.prol ], [ %92, %.lr.ph103.prol.preheader ]
  %prol.iter217 = phi i64 [ %prol.iter217.sub, %.lr.ph103.prol ], [ %xtraiter215, %.lr.ph103.prol.preheader ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv139.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv139.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %.2101.prol, %98
  %indvars.iv.next140.prol = add nuw nsw i64 %indvars.iv139.prol, 1
  %prol.iter217.sub = add i64 %prol.iter217, -1
  %prol.iter217.cmp = icmp eq i64 %prol.iter217.sub, 0
  br i1 %prol.iter217.cmp, label %.lr.ph103.prol.loopexit.unr-lcssa, label %.lr.ph103.prol, !llvm.loop !23

.lr.ph103.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.preheader, %.lr.ph103.prol.loopexit.unr-lcssa
  %.lcssa212.unr = phi double [ undef, %.lr.ph103.preheader ], [ %99, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %indvars.iv139.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next140.prol, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %.2101.unr = phi double [ %92, %.lr.ph103.preheader ], [ %99, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %100 = icmp ult i64 %89, 3
  br i1 %100, label %._crit_edge104.loopexit, label %.lr.ph103.preheader.new

.lr.ph103.preheader.new:                          ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.lr.ph103.preheader.new
  %indvars.iv139 = phi i64 [ %indvars.iv139.unr, %.lr.ph103.preheader.new ], [ %indvars.iv.next140.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.lr.ph103.preheader.new ], [ %122, %.lr.ph103 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv139
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %.2101, %108
  %111 = fsub double %110, %109
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv.next140.1
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next140.1
  %115 = bitcast double* %114 to <2 x double>*
  %indvars.iv.next140.2 = add nsw i64 %indvars.iv139, 3
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %exitcond188.3 = icmp eq i64 %indvars.iv.next140.2, %90
  %indvars.iv.next140.3 = add nsw i64 %indvars.iv139, 4
  br i1 %exitcond188.3, label %._crit_edge104.loopexit.unr-lcssa, label %.lr.ph103

._crit_edge104.loopexit.unr-lcssa:                ; preds = %.lr.ph103
  br label %._crit_edge104.loopexit

._crit_edge104.loopexit:                          ; preds = %.lr.ph103.prol.loopexit, %._crit_edge104.loopexit.unr-lcssa
  %.lcssa212 = phi double [ %.lcssa212.unr, %.lr.ph103.prol.loopexit ], [ %122, %._crit_edge104.loopexit.unr-lcssa ]
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.preheader
  %.2.lcssa = phi double [ %92, %.preheader ], [ %.lcssa212, %._crit_edge104.loopexit ]
  %123 = getelementptr inbounds double, double* %4, i64 %indvars.iv148
  store double %.2.lcssa, double* %123, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %indvars.iv.next187 = add nsw i32 %indvars.iv186, 1
  %exitcond200 = icmp eq i64 %indvars.iv.next149, 2000
  br i1 %exitcond200, label %._crit_edge104._crit_edge.preheader, label %.preheader

._crit_edge104._crit_edge.preheader:              ; preds = %._crit_edge104
  br label %._crit_edge104._crit_edge

._crit_edge104._crit_edge:                        ; preds = %._crit_edge104._crit_edge.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge104._crit_edge.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv137 = phi i64 [ 1999, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next138, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv137
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv137, 1
  %130 = icmp slt i64 %129, 2000
  br i1 %130, label %..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge104._crit_edge
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  %132 = load double, double* %131, align 8
  %133 = fdiv double %128, %132
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
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
  %indvars.iv135.prol = phi i64 [ %indvars.iv.next136.prol, %.lr.ph.prol ], [ %135, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %142, %.lr.ph.prol ], [ %128, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135.prol
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv135.prol
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fsub double %.397.prol, %141
  %indvars.iv.next136.prol = add nsw i64 %indvars.iv135.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv135.unr = phi i64 [ %135, %..lr.ph_crit_edge ], [ %indvars.iv.next136.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %128, %..lr.ph_crit_edge ], [ %142, %.lr.ph.prol.loopexit.unr-lcssa ]
  %143 = icmp ult i64 %126, 3
  br i1 %143, label %._crit_edge, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv135 = phi i64 [ %indvars.iv135.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next136.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %165, %.lr.ph ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %145 = bitcast double* %144 to <2 x double>*
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv135
  %147 = bitcast double* %146 to <2 x double>*
  %148 = load <2 x double>, <2 x double>* %145, align 8
  %149 = load <2 x double>, <2 x double>* %147, align 8
  %150 = fmul <2 x double> %148, %149
  %151 = extractelement <2 x double> %150, i32 0
  %152 = extractelement <2 x double> %150, i32 1
  %153 = fsub double %.397, %151
  %154 = fsub double %153, %152
  %indvars.iv.next136.1 = add nsw i64 %indvars.iv135, 2
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv.next136.1
  %156 = bitcast double* %155 to <2 x double>*
  %157 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next136.1
  %158 = bitcast double* %157 to <2 x double>*
  %indvars.iv.next136.2 = add nsw i64 %indvars.iv135, 3
  %159 = load <2 x double>, <2 x double>* %156, align 8
  %160 = load <2 x double>, <2 x double>* %158, align 8
  %161 = fmul <2 x double> %159, %160
  %162 = extractelement <2 x double> %161, i32 0
  %163 = extractelement <2 x double> %161, i32 1
  %164 = fsub double %154, %162
  %165 = fsub double %164, %163
  %exitcond.3 = icmp eq i64 %indvars.iv.next136.2, 1999
  %indvars.iv.next136.3 = add nsw i64 %indvars.iv135, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %.lr.ph

._crit_edge.unr-lcssa:                            ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %165, %._crit_edge.unr-lcssa ]
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  %167 = load double, double* %166, align 8
  %168 = fdiv double %.lcssa, %167
  %169 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  store double %168, double* %169, align 8
  %170 = icmp sgt i64 %indvars.iv137, 0
  br i1 %170, label %._crit_edge._crit_edge, label %171

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next138 = add i64 %indvars.iv137, -1
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
