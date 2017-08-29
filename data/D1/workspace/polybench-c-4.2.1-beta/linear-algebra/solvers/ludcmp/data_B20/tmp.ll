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
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %4
  %indvars.iv140 = phi i64 [ 0, %4 ], [ %indvars.iv.next141.1, %._crit_edge102 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv140
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next141 = or i64 %indvars.iv140, 1
  %7 = trunc i64 %indvars.iv.next141 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv140
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next141
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %15 = trunc i64 %indvars.iv.next141.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next141
  store double %19, double* %20, align 8
  %exitcond142.1 = icmp eq i64 %indvars.iv.next141, 1999
  br i1 %exitcond142.1, label %.lr.ph.preheader, label %._crit_edge102

.lr.ph.preheader:                                 ; preds = %._crit_edge102
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader87_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge..preheader87_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %21 = sub i64 1998, %indvars.iv138
  %22 = shl i64 %21, 3
  %23 = and i64 %22, 34359738360
  %24 = add nuw nsw i64 %23, 8
  br label %26

.preheader86:                                     ; preds = %26
  %25 = icmp slt i64 %indvars.iv.next139, 2000
  br i1 %25, label %._crit_edge..preheader87_crit_edge, label %35

; <label>:26:                                     ; preds = %26, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %26 ], [ 0, %.lr.ph ]
  %27 = sub nsw i64 0, %indvars.iv122
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv122
  store double %32, double* %33, align 8
  %exitcond130 = icmp eq i64 %indvars.iv122, %indvars.iv138
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond130, label %.preheader86, label %26

._crit_edge..preheader87_crit_edge:               ; preds = %.preheader86
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next139
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %24, i32 8, i1 false)
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %34, align 8
  br label %.lr.ph

; <label>:35:                                     ; preds = %.preheader86
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %36, align 8
  %37 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader85_crit_edge

.preheader84:                                     ; preds = %..preheader85_crit_edge
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %.preheader83

..preheader85_crit_edge:                          ; preds = %..preheader85_crit_edge, %35
  %indvars.iv120 = phi i64 [ 0, %35 ], [ %indvars.iv.next121.7, %..preheader85_crit_edge ]
  %39 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %40 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %41 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %42 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %43 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %37, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %44 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %37, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %45 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %37, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %46 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %37, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  %47 = icmp slt i64 %indvars.iv.next121.7, 2000
  br i1 %47, label %..preheader85_crit_edge, label %.preheader84

.preheader83:                                     ; preds = %94, %.preheader84
  %indvars.iv115 = phi i64 [ 0, %.preheader84 ], [ %48, %94 ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv115
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %48 = add i64 %indvars.iv115, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %48
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader82

.preheader82:                                     ; preds = %middle.block, %.preheader83
  %indvars.iv113 = phi i64 [ 0, %.preheader83 ], [ %indvars.iv.next114, %middle.block ]
  %49 = mul i64 %indvars.iv113, 16000
  %scevgep1 = getelementptr i8, i8* %37, i64 %49
  %50 = add i64 %49, 16000
  %scevgep2 = getelementptr i8, i8* %37, i64 %50
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %51 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader82
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader82
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = or i64 %index, 1
  %53 = or i64 %index, 2
  %54 = or i64 %index, 3
  %55 = load double, double* %51, align 8, !alias.scope !1
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv115
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv115
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv115
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv115
  %62 = load double, double* %58, align 8, !alias.scope !4
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = fmul <2 x double> %57, %67
  %71 = fmul <2 x double> %57, %69
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %index
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = fadd <2 x double> %wide.load, %70
  %77 = fadd <2 x double> %wide.load12, %71
  store <2 x double> %76, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %77, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block.loopexit42, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %79 = load double, double* %51, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv115
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %86 = load double, double* %51, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next111, i64 %indvars.iv115
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  br i1 %exitcond112.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit42:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit42, %middle.block.loopexit
  %indvars.iv.next114 = add nuw i64 %indvars.iv113, 1
  %93 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %93, label %.preheader82, label %94

; <label>:94:                                     ; preds = %middle.block
  %95 = icmp slt i64 %48, 2000
  br i1 %95, label %.preheader83, label %.preheader.preheader

.preheader.preheader:                             ; preds = %94
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block14
  %indvars.iv108 = phi i64 [ %96, %middle.block14 ], [ 0, %.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %96 = add i64 %indvars.iv108, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %96, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %97 = mul i64 %indvars.iv108, 16000
  %scevgep22 = getelementptr i8, i8* %37, i64 %97
  %98 = add i64 %97, 16000
  %scevgep23 = getelementptr i8, i8* %37, i64 %98
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %index30
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index30
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %index.next31
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index.next31
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %115 = icmp eq i64 %index.next31.1, 2000
  br i1 %115, label %middle.block14.loopexit41, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block14.loopexit, label %scalar.ph15, !llvm.loop !19

middle.block14.loopexit:                          ; preds = %scalar.ph15
  br label %middle.block14

middle.block14.loopexit41:                        ; preds = %vector.body13
  br label %middle.block14

middle.block14:                                   ; preds = %middle.block14.loopexit41, %middle.block14.loopexit
  %141 = icmp slt i64 %96, 2000
  br i1 %141, label %.preheader, label %142

; <label>:142:                                    ; preds = %middle.block14
  call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge128, %4
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge128 ], [ 0, %4 ]
  %indvars.iv173 = phi i32 [ %indvars.iv.next174, %._crit_edge128 ], [ -1, %4 ]
  %5 = add i64 %indvars.iv181, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 1999, %indvars.iv181
  %8 = icmp sgt i64 %indvars.iv181, 0
  br i1 %8, label %.lr.ph118.preheader, label %.lr.ph127.split.preheader

.lr.ph118.preheader:                              ; preds = %.preheader95
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 0
  br label %.lr.ph118

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %.preheader95
  %10 = sub i64 0, %indvars.iv181
  %xtraiter17 = and i64 %10, 7
  %lcmp.mod18 = icmp eq i64 %xtraiter17, 0
  br i1 %lcmp.mod18, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127.split.preheader
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol, %.lr.ph127.split.prol.preheader
  %indvars.iv164.prol = phi i64 [ %indvars.iv.next165.prol, %.lr.ph127.split.prol ], [ %indvars.iv181, %.lr.ph127.split.prol.preheader ]
  %prol.iter19 = phi i64 [ %prol.iter19.sub, %.lr.ph127.split.prol ], [ %xtraiter17, %.lr.ph127.split.prol.preheader ]
  %indvars.iv.next165.prol = add nuw i64 %indvars.iv164.prol, 1
  %prol.iter19.sub = add i64 %prol.iter19, -1
  %prol.iter19.cmp = icmp eq i64 %prol.iter19.sub, 0
  br i1 %prol.iter19.cmp, label %.lr.ph127.split.prol.loopexit.unr-lcssa, label %.lr.ph127.split.prol, !llvm.loop !20

.lr.ph127.split.prol.loopexit.unr-lcssa:          ; preds = %.lr.ph127.split.prol
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127.split.preheader, %.lr.ph127.split.prol.loopexit.unr-lcssa
  %indvars.iv164.unr = phi i64 [ %indvars.iv181, %.lr.ph127.split.preheader ], [ %indvars.iv.next165.prol, %.lr.ph127.split.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %7, 7
  br i1 %11, label %._crit_edge128.loopexit5, label %.lr.ph127.split.preheader.new

.lr.ph127.split.preheader.new:                    ; preds = %.lr.ph127.split.prol.loopexit
  br label %.lr.ph127.split

.lr.ph127:                                        ; preds = %._crit_edge115
  br i1 true, label %.lr.ph127.split.us.preheader, label %.lr.ph127..lr.ph127.split.preheader_crit_edge

.lr.ph127..lr.ph127.split.preheader_crit_edge:    ; preds = %.lr.ph127
  br label %.lr.ph127.split.preheader

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %wide.trip.count175 = zext i32 %indvars.iv173 to i64
  %12 = and i64 %5, 1
  %lcmp.mod21 = icmp eq i64 %12, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 0
  %14 = icmp eq i64 %6, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge123.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge123.us ], [ %indvars.iv181, %.lr.ph127.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv179
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod21, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %17

; <label>:17:                                     ; preds = %.prol.preheader
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv179
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %17
  %.lcssa11.unr.ph = phi double [ %22, %17 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %17 ], [ 0, %.lr.ph127.split.us ]
  %.1120.us.unr.ph = phi double [ %22, %17 ], [ %16, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %14, label %._crit_edge123.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph127.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next169.1, %23 ]
  %.1120.us = phi double [ %.1120.us.unr.ph, %.lr.ph127.split.us.new ], [ %35, %23 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv168
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv168, i64 %indvars.iv179
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %.1120.us, %28
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv.next169
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next169, i64 %indvars.iv179
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge123.us.unr-lcssa, label %23

._crit_edge123.us.unr-lcssa:                      ; preds = %23
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %.prol.loopexit, %._crit_edge123.us.unr-lcssa
  %.lcssa11 = phi double [ %.lcssa11.unr.ph, %.prol.loopexit ], [ %35, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa11, double* %15, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %36 = icmp slt i64 %indvars.iv.next180, 2000
  br i1 %36, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph118:                                        ; preds = %.lr.ph118.preheader, %._crit_edge115
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %37 = add i64 %indvars.iv160, 4294967295
  %38 = and i64 %37, 4294967295
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv160
  %40 = load double, double* %39, align 8
  %41 = icmp sgt i64 %indvars.iv160, 0
  br i1 %41, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %42 = and i64 %37, 1
  %lcmp.mod16 = icmp eq i64 %42, 0
  br i1 %lcmp.mod16, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %43 = load double, double* %9, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv160
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %40, %46
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa10.unr.ph = phi double [ %47, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %47, %.lr.ph114.prol ], [ %40, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %48 = icmp eq i64 %38, 0
  br i1 %48, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %60, %.lr.ph114 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv151
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv160
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %.0112, %53
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv.next152
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next152, i64 %indvars.iv160
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %54, %59
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa10 = phi double [ %.lcssa10.unr.ph, %.lr.ph114.prol.loopexit ], [ %60, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %40, %.lr.ph118 ], [ %.lcssa10, %._crit_edge115.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv160, i64 %indvars.iv160
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.0.lcssa, %62
  store double %63, double* %39, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %64 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  br i1 %64, label %.lr.ph118, label %.lr.ph127

.lr.ph127.split:                                  ; preds = %.lr.ph127.split, %.lr.ph127.split.preheader.new
  %indvars.iv164 = phi i64 [ %indvars.iv164.unr, %.lr.ph127.split.preheader.new ], [ %indvars.iv.next165.7, %.lr.ph127.split ]
  %exitcond166.7 = icmp eq i64 %indvars.iv164, 1992
  %indvars.iv.next165.7 = add i64 %indvars.iv164, 8
  br i1 %exitcond166.7, label %._crit_edge128.loopexit5.unr-lcssa, label %.lr.ph127.split

._crit_edge128.loopexit:                          ; preds = %._crit_edge123.us
  br label %._crit_edge128

._crit_edge128.loopexit5.unr-lcssa:               ; preds = %.lr.ph127.split
  br label %._crit_edge128.loopexit5

._crit_edge128.loopexit5:                         ; preds = %.lr.ph127.split.prol.loopexit, %._crit_edge128.loopexit5.unr-lcssa
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit5, %._crit_edge128.loopexit
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %65 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  br i1 %65, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge107
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %66 = add i64 %indvars.iv149, 4294967295
  %67 = and i64 %66, 4294967295
  %68 = getelementptr inbounds double, double* %1, i64 %indvars.iv149
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv149, 0
  br i1 %70, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter12 = and i64 %indvars.iv149, 3
  %lcmp.mod13 = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %76, %.lr.ph106.prol ], [ %69, %.lr.ph106.prol.preheader ]
  %prol.iter14 = phi i64 [ %prol.iter14.sub, %.lr.ph106.prol ], [ %xtraiter12, %.lr.ph106.prol.preheader ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv140.prol
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fsub double %.2104.prol, %75
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter14.sub = add i64 %prol.iter14, -1
  %prol.iter14.cmp = icmp eq i64 %prol.iter14.sub, 0
  br i1 %prol.iter14.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !22

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa9.unr = phi double [ undef, %.lr.ph106.preheader ], [ %76, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %69, %.lr.ph106.preheader ], [ %76, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %77 = icmp ult i64 %67, 3
  br i1 %77, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %101, %.lr.ph106 ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv140
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fsub double %.2104, %82
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv.next141
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fsub double %83, %88
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141.1
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fsub double %89, %94
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv.next141.2
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141.2
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fsub double %95, %100
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa9 = phi double [ %.lcssa9.unr, %.lr.ph106.prol.loopexit ], [ %101, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %69, %.preheader93 ], [ %.lcssa9, %._crit_edge107.loopexit ]
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv149
  store double %.2.lcssa, double* %102, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %103 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  br i1 %103, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %104 = sub i32 2000, %indvar
  %105 = sext i32 %104 to i64
  %106 = sub nsw i64 1999, %105
  %107 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  %108 = load double, double* %107, align 8
  %109 = icmp slt i32 %indvars.iv, 2000
  br i1 %109, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %110 = sext i32 %indvars.iv to i64
  %111 = sub nsw i64 0, %105
  %xtraiter = and i64 %111, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %110, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %117, %.lr.ph.prol ], [ %108, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %2, i64 %indvars.iv136.prol
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %.399.prol, %116
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %117, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %110, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %108, %.preheader..lr.ph_crit_edge ], [ %117, %.lr.ph.prol.loopexit.unr-lcssa ]
  %118 = icmp ult i64 %106, 3
  br i1 %118, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %142, %.lr.ph ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv136
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %2, i64 %indvars.iv136
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fsub double %.399, %123
  %indvars.iv.next137 = add nsw i64 %indvars.iv136, 1
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next137
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next137
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fsub double %124, %129
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next137.1
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fsub double %130, %135
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next137.2
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next137.2
  %140 = load double, double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fsub double %136, %141
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %142, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %108, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  %144 = load double, double* %143, align 8
  %145 = fdiv double %.3.lcssa, %144
  %146 = getelementptr inbounds double, double* %2, i64 %indvars.iv138
  store double %145, double* %146, align 8
  %147 = icmp sgt i64 %indvars.iv138, 0
  br i1 %147, label %._crit_edge..preheader_crit_edge, label %148

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:148:                                    ; preds = %._crit_edge
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
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge6, label %16

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
