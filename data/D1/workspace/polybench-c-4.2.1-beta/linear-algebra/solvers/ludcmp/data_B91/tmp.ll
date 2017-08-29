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
  %indvars.iv137 = phi i64 [ 0, %4 ], [ %indvars.iv.next138.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next138 = or i64 %indvars.iv137, 1
  %9 = trunc i64 %indvars.iv.next138 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv137
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %12 = trunc i64 %indvars.iv.next138.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next138, 1999
  br i1 %exitcond139.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge100.._crit_edge81_crit_edge
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge100.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv135, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %21
  %22 = sub i64 1998, %indvars.iv135
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge82:                                    ; preds = %27
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %26 = icmp slt i64 %indvars.iv.next136, 2000
  br i1 %26, label %._crit_edge100.._crit_edge81_crit_edge, label %37

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv122
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv122
  store double %33, double* %34, align 8
  %exitcond126 = icmp eq i64 %indvars.iv122, %indvars.iv135
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond126, label %._crit_edge82, label %27

._crit_edge100.._crit_edge81_crit_edge:           ; preds = %._crit_edge82
  %35 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge82
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %40

; <label>:40:                                     ; preds = %40, %37
  %indvars.iv120 = phi i64 [ 0, %37 ], [ %indvars.iv.next121.7, %40 ]
  %41 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %42 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %43 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %44 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %45 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %46 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %47 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %48 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond140.7 = icmp eq i64 %indvars.iv.next121.6, 1999
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  br i1 %exitcond140.7, label %._crit_edge85.preheader, label %40

._crit_edge85.preheader:                          ; preds = %40
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %98
  %indvars.iv115 = phi i64 [ %52, %98 ], [ 0, %._crit_edge85.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv115
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %52 = add i64 %indvars.iv115, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block, %._crit_edge85
  %indvars.iv113 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next114, %middle.block ]
  %53 = mul i64 %indvars.iv113, 16000
  %scevgep1 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep2 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge87
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge87
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv115
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv115
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv115
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv115
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv113, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load12, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit42, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv115
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next111, i64 %indvars.iv115
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  br i1 %exitcond112.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit42:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit42, %middle.block.loopexit
  %indvars.iv.next114 = add nuw i64 %indvars.iv113, 1
  %97 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %97, label %._crit_edge87, label %98

; <label>:98:                                     ; preds = %middle.block
  %99 = icmp slt i64 %52, 2000
  br i1 %99, label %._crit_edge85, label %._crit_edge88.preheader

._crit_edge88.preheader:                          ; preds = %98
  %100 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block14
  %indvars.iv108 = phi i64 [ %107, %middle.block14 ], [ 0, %._crit_edge88.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %107 = add i64 %indvars.iv108, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %107, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %108 = mul i64 %indvars.iv108, 16000
  %scevgep22 = getelementptr i8, i8* %39, i64 %108
  %109 = add i64 %108, 16000
  %scevgep23 = getelementptr i8, i8* %39, i64 %109
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %._crit_edge88
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %._crit_edge88
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv108, i64 %index30
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index30
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv108, i64 %index.next31
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %121, align 8, !alias.scope !13
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index.next31
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %125, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %126 = icmp eq i64 %index.next31.1, 2000
  br i1 %126, label %middle.block14.loopexit41, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %148 = bitcast double* %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %151 = bitcast double* %150 to i64*
  store i64 %149, i64* %151, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block14.loopexit, label %scalar.ph15, !llvm.loop !19

middle.block14.loopexit:                          ; preds = %scalar.ph15
  br label %middle.block14

middle.block14.loopexit41:                        ; preds = %vector.body13
  br label %middle.block14

middle.block14:                                   ; preds = %middle.block14.loopexit41, %middle.block14.loopexit
  %152 = icmp slt i64 %107, 2000
  br i1 %152, label %._crit_edge88, label %153

; <label>:153:                                    ; preds = %middle.block14
  call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge125, %4
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %._crit_edge125 ], [ 4294967295, %4 ]
  %indvars.iv161 = phi i64 [ %indvars.iv.next162, %._crit_edge125 ], [ 0, %4 ]
  %5 = and i64 %indvars.iv169, 4294967295
  %6 = icmp sgt i64 %indvars.iv161, 0
  br i1 %6, label %.lr.ph116.preheader, label %._crit_edge125

.lr.ph116.preheader:                              ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 0
  br label %.lr.ph116

.lr.ph124:                                        ; preds = %._crit_edge113
  br i1 true, label %.lr.ph124.split.us.preheader, label %.lr.ph124.._crit_edge125_crit_edge

.lr.ph124.._crit_edge125_crit_edge:               ; preds = %.lr.ph124
  br label %._crit_edge125

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %8 = and i64 %indvars.iv169, 1
  %lcmp.mod16 = icmp eq i64 %8, 0
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 0
  %10 = icmp eq i64 %5, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge121.us
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge121.us ], [ %indvars.iv161, %.lr.ph124.split.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 %indvars.iv159
  %12 = load double, double* %11, align 8
  br i1 %lcmp.mod16, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  br label %13

; <label>:13:                                     ; preds = %.prol.preheader
  %14 = load double, double* %9, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv159
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %12, %17
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph124.split.us, %13
  %.lcssa9.unr.ph = phi double [ %18, %13 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %13 ], [ 0, %.lr.ph124.split.us ]
  %.1118.us.unr.ph = phi double [ %18, %13 ], [ %12, %.lr.ph124.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %10, label %._crit_edge121.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph124.split.us.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next152.1, %19 ]
  %.1118.us = phi double [ %.1118.us.unr.ph, %.lr.ph124.split.us.new ], [ %33, %19 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 %indvars.iv151
  %21 = bitcast double* %20 to <2 x double>*
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv159
  %23 = load double, double* %22, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %24 = load <2 x double>, <2 x double>* %21, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next152, i64 %indvars.iv159
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %24, %28
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %.1118.us, %30
  %33 = fsub double %32, %31
  %exitcond171.1 = icmp eq i64 %indvars.iv.next152, %5
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond171.1, label %._crit_edge121.us.unr-lcssa, label %19

._crit_edge121.us.unr-lcssa:                      ; preds = %19
  br label %._crit_edge121.us

._crit_edge121.us:                                ; preds = %.prol.loopexit, %._crit_edge121.us.unr-lcssa
  %.lcssa9 = phi double [ %.lcssa9.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge121.us.unr-lcssa ]
  store double %.lcssa9, double* %11, align 8
  %indvars.iv.next160 = add nuw i64 %indvars.iv159, 1
  %34 = icmp slt i64 %indvars.iv.next160, 2000
  br i1 %34, label %.lr.ph124.split.us, label %._crit_edge125.loopexit

.lr.ph116:                                        ; preds = %.lr.ph116.preheader, %._crit_edge113
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %._crit_edge113 ], [ 4294967295, %.lr.ph116.preheader ]
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %._crit_edge113 ], [ 0, %.lr.ph116.preheader ]
  %35 = and i64 %indvars.iv166, 4294967295
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 %indvars.iv148
  %37 = load double, double* %36, align 8
  %38 = icmp sgt i64 %indvars.iv148, 0
  br i1 %38, label %.lr.ph112.preheader, label %._crit_edge113

.lr.ph112.preheader:                              ; preds = %.lr.ph116
  %39 = and i64 %indvars.iv166, 1
  %lcmp.mod14 = icmp eq i64 %39, 0
  br i1 %lcmp.mod14, label %.lr.ph112.prol.preheader, label %.lr.ph112.prol.loopexit.unr-lcssa

.lr.ph112.prol.preheader:                         ; preds = %.lr.ph112.preheader
  br label %.lr.ph112.prol

.lr.ph112.prol:                                   ; preds = %.lr.ph112.prol.preheader
  %40 = load double, double* %7, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv148
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %37, %43
  br label %.lr.ph112.prol.loopexit.unr-lcssa

.lr.ph112.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph112.preheader, %.lr.ph112.prol
  %.lcssa8.unr.ph = phi double [ %44, %.lr.ph112.prol ], [ undef, %.lr.ph112.preheader ]
  %indvars.iv142.unr.ph = phi i64 [ 1, %.lr.ph112.prol ], [ 0, %.lr.ph112.preheader ]
  %.0110.unr.ph = phi double [ %44, %.lr.ph112.prol ], [ %37, %.lr.ph112.preheader ]
  br label %.lr.ph112.prol.loopexit

.lr.ph112.prol.loopexit:                          ; preds = %.lr.ph112.prol.loopexit.unr-lcssa
  %45 = icmp eq i64 %35, 0
  br i1 %45, label %._crit_edge113.loopexit, label %.lr.ph112.preheader.new

.lr.ph112.preheader.new:                          ; preds = %.lr.ph112.prol.loopexit
  br label %.lr.ph112

.lr.ph112:                                        ; preds = %.lr.ph112, %.lr.ph112.preheader.new
  %indvars.iv142 = phi i64 [ %indvars.iv142.unr.ph, %.lr.ph112.preheader.new ], [ %indvars.iv.next143.1, %.lr.ph112 ]
  %.0110 = phi double [ %.0110.unr.ph, %.lr.ph112.preheader.new ], [ %59, %.lr.ph112 ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv161, i64 %indvars.iv142
  %47 = bitcast double* %46 to <2 x double>*
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv142, i64 %indvars.iv148
  %49 = load double, double* %48, align 8
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %50 = load <2 x double>, <2 x double>* %47, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next143, i64 %indvars.iv148
  %52 = load double, double* %51, align 8
  %53 = insertelement <2 x double> undef, double %49, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %50, %54
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  %58 = fsub double %.0110, %56
  %59 = fsub double %58, %57
  %exitcond168.1 = icmp eq i64 %indvars.iv.next143, %35
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  br i1 %exitcond168.1, label %._crit_edge113.loopexit.unr-lcssa, label %.lr.ph112

._crit_edge113.loopexit.unr-lcssa:                ; preds = %.lr.ph112
  br label %._crit_edge113.loopexit

._crit_edge113.loopexit:                          ; preds = %.lr.ph112.prol.loopexit, %._crit_edge113.loopexit.unr-lcssa
  %.lcssa8 = phi double [ %.lcssa8.unr.ph, %.lr.ph112.prol.loopexit ], [ %59, %._crit_edge113.loopexit.unr-lcssa ]
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph116
  %.0.lcssa = phi double [ %37, %.lr.ph116 ], [ %.lcssa8, %._crit_edge113.loopexit ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv148, i64 %indvars.iv148
  %61 = load double, double* %60, align 8
  %62 = fdiv double %.0.lcssa, %61
  store double %62, double* %36, align 8
  %indvars.iv.next149 = add nuw i64 %indvars.iv148, 1
  %63 = icmp slt i64 %indvars.iv.next149, %indvars.iv161
  %indvars.iv.next167 = add nuw nsw i64 %35, 1
  br i1 %63, label %.lr.ph116, label %.lr.ph124

._crit_edge125.loopexit:                          ; preds = %._crit_edge121.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %.lr.ph124.._crit_edge125_crit_edge, %._crit_edge125.loopexit, %._crit_edge
  %indvars.iv.next162 = add nuw i64 %indvars.iv161, 1
  %64 = icmp slt i64 %indvars.iv.next162, 2000
  %indvars.iv.next170 = add nuw nsw i64 %5, 1
  br i1 %64, label %._crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge125
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge106
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %._crit_edge106 ], [ 4294967295, %._crit_edge93.preheader ]
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge106 ], [ 0, %._crit_edge93.preheader ]
  %65 = and i64 %indvars.iv163, 4294967295
  %66 = getelementptr inbounds double, double* %1, i64 %indvars.iv140
  %67 = load double, double* %66, align 8
  %68 = icmp sgt i64 %indvars.iv140, 0
  br i1 %68, label %.lr.ph105.preheader, label %._crit_edge106

.lr.ph105.preheader:                              ; preds = %._crit_edge93
  %69 = add nsw i64 %indvars.iv163, 1
  %xtraiter10 = and i64 %69, 3
  %lcmp.mod11 = icmp eq i64 %xtraiter10, 0
  br i1 %lcmp.mod11, label %.lr.ph105.prol.loopexit, label %.lr.ph105.prol.preheader

.lr.ph105.prol.preheader:                         ; preds = %.lr.ph105.preheader
  br label %.lr.ph105.prol

.lr.ph105.prol:                                   ; preds = %.lr.ph105.prol, %.lr.ph105.prol.preheader
  %indvars.iv135.prol = phi i64 [ %indvars.iv.next136.prol, %.lr.ph105.prol ], [ 0, %.lr.ph105.prol.preheader ]
  %.2103.prol = phi double [ %75, %.lr.ph105.prol ], [ %67, %.lr.ph105.prol.preheader ]
  %prol.iter12 = phi i64 [ %prol.iter12.sub, %.lr.ph105.prol ], [ %xtraiter10, %.lr.ph105.prol.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv135.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv135.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %.2103.prol, %74
  %indvars.iv.next136.prol = add nuw nsw i64 %indvars.iv135.prol, 1
  %prol.iter12.sub = add i64 %prol.iter12, -1
  %prol.iter12.cmp = icmp eq i64 %prol.iter12.sub, 0
  br i1 %prol.iter12.cmp, label %.lr.ph105.prol.loopexit.unr-lcssa, label %.lr.ph105.prol, !llvm.loop !20

.lr.ph105.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph105.prol
  br label %.lr.ph105.prol.loopexit

.lr.ph105.prol.loopexit:                          ; preds = %.lr.ph105.preheader, %.lr.ph105.prol.loopexit.unr-lcssa
  %.lcssa7.unr = phi double [ undef, %.lr.ph105.preheader ], [ %75, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %indvars.iv135.unr = phi i64 [ 0, %.lr.ph105.preheader ], [ %indvars.iv.next136.prol, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %.2103.unr = phi double [ %67, %.lr.ph105.preheader ], [ %75, %.lr.ph105.prol.loopexit.unr-lcssa ]
  %76 = icmp ult i64 %65, 3
  br i1 %76, label %._crit_edge106.loopexit, label %.lr.ph105.preheader.new

.lr.ph105.preheader.new:                          ; preds = %.lr.ph105.prol.loopexit
  br label %.lr.ph105

.lr.ph105:                                        ; preds = %.lr.ph105, %.lr.ph105.preheader.new
  %indvars.iv135 = phi i64 [ %indvars.iv135.unr, %.lr.ph105.preheader.new ], [ %indvars.iv.next136.3, %.lr.ph105 ]
  %.2103 = phi double [ %.2103.unr, %.lr.ph105.preheader.new ], [ %98, %.lr.ph105 ]
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv135
  %78 = bitcast double* %77 to <2 x double>*
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv135
  %80 = bitcast double* %79 to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %78, align 8
  %82 = load <2 x double>, <2 x double>* %80, align 8
  %83 = fmul <2 x double> %81, %82
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %86 = fsub double %.2103, %84
  %87 = fsub double %86, %85
  %indvars.iv.next136.1 = add nsw i64 %indvars.iv135, 2
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv140, i64 %indvars.iv.next136.1
  %89 = bitcast double* %88 to <2 x double>*
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next136.1
  %91 = bitcast double* %90 to <2 x double>*
  %indvars.iv.next136.2 = add nsw i64 %indvars.iv135, 3
  %92 = load <2 x double>, <2 x double>* %89, align 8
  %93 = load <2 x double>, <2 x double>* %91, align 8
  %94 = fmul <2 x double> %92, %93
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fsub double %87, %95
  %98 = fsub double %97, %96
  %exitcond165.3 = icmp eq i64 %indvars.iv.next136.2, %65
  %indvars.iv.next136.3 = add nsw i64 %indvars.iv135, 4
  br i1 %exitcond165.3, label %._crit_edge106.loopexit.unr-lcssa, label %.lr.ph105

._crit_edge106.loopexit.unr-lcssa:                ; preds = %.lr.ph105
  br label %._crit_edge106.loopexit

._crit_edge106.loopexit:                          ; preds = %.lr.ph105.prol.loopexit, %._crit_edge106.loopexit.unr-lcssa
  %.lcssa7 = phi double [ %.lcssa7.unr, %.lr.ph105.prol.loopexit ], [ %98, %._crit_edge106.loopexit.unr-lcssa ]
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %67, %._crit_edge93 ], [ %.lcssa7, %._crit_edge106.loopexit ]
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  store double %.2.lcssa, double* %99, align 8
  %indvars.iv.next141 = add nuw i64 %indvars.iv140, 1
  %100 = icmp slt i64 %indvars.iv.next141, 2000
  %indvars.iv.next164 = add nuw nsw i64 %65, 1
  br i1 %100, label %._crit_edge93, label %._crit_edge95.preheader

._crit_edge95.preheader:                          ; preds = %._crit_edge106
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95.preheader, %._crit_edge99.._crit_edge95_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge95.preheader ], [ %indvar.next, %._crit_edge99.._crit_edge95_crit_edge ]
  %indvars.iv133 = phi i64 [ 1999, %._crit_edge95.preheader ], [ %indvars.iv.next134, %._crit_edge99.._crit_edge95_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge95.preheader ], [ %indvars.iv.next, %._crit_edge99.._crit_edge95_crit_edge ]
  %101 = sub i32 2000, %indvar
  %102 = sext i32 %101 to i64
  %103 = sub nsw i64 1999, %102
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv133
  %105 = load double, double* %104, align 8
  %106 = icmp slt i32 %indvars.iv, 2000
  br i1 %106, label %._crit_edge95..lr.ph_crit_edge, label %._crit_edge99

._crit_edge95..lr.ph_crit_edge:                   ; preds = %._crit_edge95
  %107 = sext i32 %indvars.iv to i64
  %108 = sub nsw i64 0, %102
  %xtraiter = and i64 %108, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %._crit_edge95..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv131.prol = phi i64 [ %indvars.iv.next132.prol, %.lr.ph.prol ], [ %107, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %114, %.lr.ph.prol ], [ %105, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv133, i64 %indvars.iv131.prol
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %2, i64 %indvars.iv131.prol
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fsub double %.397.prol, %113
  %indvars.iv.next132.prol = add nsw i64 %indvars.iv131.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge95..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge95..lr.ph_crit_edge ], [ %114, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv131.unr = phi i64 [ %107, %._crit_edge95..lr.ph_crit_edge ], [ %indvars.iv.next132.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %105, %._crit_edge95..lr.ph_crit_edge ], [ %114, %.lr.ph.prol.loopexit.unr-lcssa ]
  %115 = icmp ult i64 %103, 3
  br i1 %115, label %._crit_edge99.loopexit, label %._crit_edge95..lr.ph_crit_edge.new

._crit_edge95..lr.ph_crit_edge.new:               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %._crit_edge95..lr.ph_crit_edge.new
  %indvars.iv131 = phi i64 [ %indvars.iv131.unr, %._crit_edge95..lr.ph_crit_edge.new ], [ %indvars.iv.next132.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %._crit_edge95..lr.ph_crit_edge.new ], [ %137, %.lr.ph ]
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv133, i64 %indvars.iv131
  %117 = bitcast double* %116 to <2 x double>*
  %118 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  %119 = bitcast double* %118 to <2 x double>*
  %120 = load <2 x double>, <2 x double>* %117, align 8
  %121 = load <2 x double>, <2 x double>* %119, align 8
  %122 = fmul <2 x double> %120, %121
  %123 = extractelement <2 x double> %122, i32 0
  %124 = extractelement <2 x double> %122, i32 1
  %125 = fsub double %.397, %123
  %126 = fsub double %125, %124
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv133, i64 %indvars.iv.next132.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next132.1
  %130 = bitcast double* %129 to <2 x double>*
  %indvars.iv.next132.2 = add nsw i64 %indvars.iv131, 3
  %131 = load <2 x double>, <2 x double>* %128, align 8
  %132 = load <2 x double>, <2 x double>* %130, align 8
  %133 = fmul <2 x double> %131, %132
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fsub double %126, %134
  %137 = fsub double %136, %135
  %exitcond.3 = icmp eq i64 %indvars.iv.next132.2, 1999
  %indvars.iv.next132.3 = add nsw i64 %indvars.iv131, 4
  br i1 %exitcond.3, label %._crit_edge99.loopexit.unr-lcssa, label %.lr.ph

._crit_edge99.loopexit.unr-lcssa:                 ; preds = %.lr.ph
  br label %._crit_edge99.loopexit

._crit_edge99.loopexit:                           ; preds = %.lr.ph.prol.loopexit, %._crit_edge99.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %137, %._crit_edge99.loopexit.unr-lcssa ]
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.loopexit, %._crit_edge95
  %.3.lcssa = phi double [ %105, %._crit_edge95 ], [ %.lcssa, %._crit_edge99.loopexit ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv133, i64 %indvars.iv133
  %139 = load double, double* %138, align 8
  %140 = fdiv double %.3.lcssa, %139
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv133
  store double %140, double* %141, align 8
  %142 = icmp sgt i64 %indvars.iv133, 0
  br i1 %142, label %._crit_edge99.._crit_edge95_crit_edge, label %143

._crit_edge99.._crit_edge95_crit_edge:            ; preds = %._crit_edge99
  %indvars.iv.next134 = add i64 %indvars.iv133, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge95

; <label>:143:                                    ; preds = %._crit_edge99
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
