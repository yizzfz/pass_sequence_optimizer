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
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100, %4
  %indvars.iv139 = phi i64 [ 0, %4 ], [ %indvars.iv.next140.1, %._crit_edge100 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next140 = or i64 %indvars.iv139, 1
  %9 = trunc i64 %indvars.iv.next140 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv139
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %12 = trunc i64 %indvars.iv.next140.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond141.1 = icmp eq i64 %indvars.iv.next140, 1999
  br i1 %exitcond141.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge97..preheader84_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge97..preheader84_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv137, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %21
  %scevgep135136 = bitcast double* %scevgep135 to i8*
  %22 = sub i64 1998, %indvars.iv137
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

.preheader83:                                     ; preds = %27
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %26 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %26, label %._crit_edge97..preheader84_crit_edge, label %36

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv120
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv120
  store double %33, double* %34, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %.preheader83, label %27

._crit_edge97..preheader84_crit_edge:             ; preds = %.preheader83
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %25, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph

; <label>:36:                                     ; preds = %.preheader83
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  %38 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader82_crit_edge

.preheader81:                                     ; preds = %..preheader82_crit_edge
  %39 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

..preheader82_crit_edge:                          ; preds = %..preheader82_crit_edge, %36
  %indvars.iv118 = phi i64 [ 0, %36 ], [ %indvars.iv.next119.7, %..preheader82_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %38, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %41 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %38, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %42 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %38, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %43 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %38, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %44 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %38, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %45 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %38, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %46 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %38, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %47 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %38, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %48 = icmp slt i64 %indvars.iv.next119.7, 2000
  br i1 %48, label %..preheader82_crit_edge, label %.preheader81

._crit_edge.preheader:                            ; preds = %95, %.preheader81
  %indvars.iv113 = phi i64 [ 0, %.preheader81 ], [ %49, %95 ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv113
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %49 = add i64 %indvars.iv113, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %49
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader80

.preheader80:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv111 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next112, %._crit_edge ]
  %50 = mul i64 %indvars.iv111, 16000
  %scevgep1 = getelementptr i8, i8* %38, i64 %50
  %51 = add i64 %50, 16000
  %scevgep2 = getelementptr i8, i8* %38, i64 %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %52 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader80
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader80
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = load double, double* %52, align 8, !alias.scope !1
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv113
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv113
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %55, i64 %indvars.iv113
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
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv111, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load12, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %._crit_edge.loopexit41, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %80 = load double, double* %52, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv113
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %87 = load double, double* %52, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next109, i64 %indvars.iv113
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit41:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit41, %._crit_edge.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %94 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %94, label %.preheader80, label %95

; <label>:95:                                     ; preds = %._crit_edge
  %96 = icmp slt i64 %49, 2000
  br i1 %96, label %._crit_edge.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %95
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge1
  %indvars.iv106 = phi i64 [ %97, %._crit_edge1 ], [ 0, %.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %97 = add i64 %indvars.iv106, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %97, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %98 = mul i64 %indvars.iv106, 16000
  %scevgep22 = getelementptr i8, i8* %38, i64 %98
  %99 = add i64 %98, 16000
  %scevgep23 = getelementptr i8, i8* %38, i64 %99
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %found.conflict26 = and i1 %bound024, %bound125
  br i1 %found.conflict26, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %index30
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %index30
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %index.next31
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %index.next31
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %116 = icmp eq i64 %index.next31.1, 2000
  br i1 %116, label %._crit_edge1.loopexit40, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge1.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge1.loopexit:                            ; preds = %scalar.ph15
  br label %._crit_edge1

._crit_edge1.loopexit40:                          ; preds = %vector.body13
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit40, %._crit_edge1.loopexit
  %142 = icmp slt i64 %97, 2000
  br i1 %142, label %.preheader, label %143

; <label>:143:                                    ; preds = %._crit_edge1
  tail call void @free(i8* nonnull %38) #4
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
  %7 = sub i64 2000, %indvars.iv181
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv181
  %11 = icmp sgt i64 %indvars.iv181, 0
  br i1 %11, label %.lr.ph118.preheader, label %.lr.ph127.split.preheader

.lr.ph118.preheader:                              ; preds = %.preheader95
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 0
  br label %.lr.ph118

.lr.ph127.split.preheader:                        ; preds = %.preheader95
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader3, label %min.iters.checked

.lr.ph127.split.preheader3:                       ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv181, %min.iters.checked ], [ %indvars.iv181, %.lr.ph127.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv181, %n.vec
  br i1 %cmp.zero, label %.lr.ph127.split.preheader3, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %13 = and i64 %9, 1
  %lcmp.mod15 = icmp eq i64 %13, 0
  br i1 %lcmp.mod15, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv181
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load2.prol = load <2 x i64>, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %15, align 8
  store <2 x i64> %wide.load2.prol, <2 x i64>* %17, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %9, 0
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = add i64 %indvars.iv181, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %offset.idx
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load2 = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load2, <2 x i64>* %22, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %indvars.iv181, %index.next
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %offset.idx.1
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  %wide.load2.1 = load <2 x i64>, <2 x i64>* %26, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load2.1, <2 x i64>* %26, align 8
  %index.next.1 = add i64 %index, 8
  %27 = icmp eq i64 %index.next.1, %n.vec
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge128, label %.lr.ph127.split.preheader3

.lr.ph127.split.us.preheader:                     ; preds = %._crit_edge115
  %wide.trip.count175 = zext i32 %indvars.iv173 to i64
  %28 = and i64 %5, 1
  %lcmp.mod19 = icmp eq i64 %28, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 0
  %30 = icmp eq i64 %6, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge123.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge123.us ], [ %indvars.iv181, %.lr.ph127.split.us.preheader ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv179
  %32 = load double, double* %31, align 8
  br i1 %lcmp.mod19, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %33

; <label>:33:                                     ; preds = %.prol.preheader
  %34 = load double, double* %29, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv179
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %33
  %.lcssa10.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph127.split.us ]
  %.1120.us.unr.ph = phi double [ %38, %33 ], [ %32, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %30, label %._crit_edge123.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph127.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next169.1, %39 ]
  %.1120.us = phi double [ %.1120.us.unr.ph, %.lr.ph127.split.us.new ], [ %53, %39 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv168
  %41 = bitcast double* %40 to <2 x double>*
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv168, i64 %indvars.iv179
  %43 = load double, double* %42, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %44 = load <2 x double>, <2 x double>* %41, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next169, i64 %indvars.iv179
  %46 = load double, double* %45, align 8
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %44, %48
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = fsub double %.1120.us, %50
  %53 = fsub double %52, %51
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge123.us.unr-lcssa, label %39

._crit_edge123.us.unr-lcssa:                      ; preds = %39
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %.prol.loopexit, %._crit_edge123.us.unr-lcssa
  %.lcssa10 = phi double [ %.lcssa10.unr.ph, %.prol.loopexit ], [ %53, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa10, double* %31, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %54 = icmp slt i64 %indvars.iv.next180, 2000
  br i1 %54, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph118:                                        ; preds = %.lr.ph118.preheader, %._crit_edge115
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %55 = add i64 %indvars.iv160, 4294967295
  %56 = and i64 %55, 4294967295
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv160
  %58 = load double, double* %57, align 8
  %59 = icmp sgt i64 %indvars.iv160, 0
  br i1 %59, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %60 = and i64 %55, 1
  %lcmp.mod17 = icmp eq i64 %60, 0
  br i1 %lcmp.mod17, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %61 = load double, double* %12, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv160
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %58, %64
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa9.unr.ph = phi double [ %65, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %65, %.lr.ph114.prol ], [ %58, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %66 = icmp eq i64 %56, 0
  br i1 %66, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %80, %.lr.ph114 ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv181, i64 %indvars.iv151
  %68 = bitcast double* %67 to <2 x double>*
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv151, i64 %indvars.iv160
  %70 = load double, double* %69, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %71 = load <2 x double>, <2 x double>* %68, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next152, i64 %indvars.iv160
  %73 = load double, double* %72, align 8
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fmul <2 x double> %71, %75
  %77 = extractelement <2 x double> %76, i32 0
  %78 = extractelement <2 x double> %76, i32 1
  %79 = fsub double %.0112, %77
  %80 = fsub double %79, %78
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa9 = phi double [ %.lcssa9.unr.ph, %.lr.ph114.prol.loopexit ], [ %80, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %58, %.lr.ph118 ], [ %.lcssa9, %._crit_edge115.loopexit ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv160, i64 %indvars.iv160
  %82 = load double, double* %81, align 8
  %83 = fdiv double %.0.lcssa, %82
  store double %83, double* %57, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %84 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  br i1 %84, label %.lr.ph118, label %.lr.ph127.split.us.preheader

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader3, %.lr.ph127.split
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.lr.ph127.split ], [ %indvars.iv164.ph, %.lr.ph127.split.preheader3 ]
  %exitcond166 = icmp eq i64 %indvars.iv164, 1999
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  br i1 %exitcond166, label %._crit_edge128.loopexit4, label %.lr.ph127.split, !llvm.loop !21

._crit_edge128.loopexit:                          ; preds = %._crit_edge123.us
  br label %._crit_edge128

._crit_edge128.loopexit4:                         ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit4, %._crit_edge128.loopexit, %middle.block
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %85 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  br i1 %85, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge107
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %86 = add i64 %indvars.iv149, 4294967295
  %87 = and i64 %86, 4294967295
  %88 = getelementptr inbounds double, double* %1, i64 %indvars.iv149
  %89 = load double, double* %88, align 8
  %90 = icmp sgt i64 %indvars.iv149, 0
  br i1 %90, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter11 = and i64 %indvars.iv149, 3
  %lcmp.mod12 = icmp eq i64 %xtraiter11, 0
  br i1 %lcmp.mod12, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %96, %.lr.ph106.prol ], [ %89, %.lr.ph106.prol.preheader ]
  %prol.iter13 = phi i64 [ %prol.iter13.sub, %.lr.ph106.prol ], [ %xtraiter11, %.lr.ph106.prol.preheader ]
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %3, i64 %indvars.iv140.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %.2104.prol, %95
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter13.sub = add i64 %prol.iter13, -1
  %prol.iter13.cmp = icmp eq i64 %prol.iter13.sub, 0
  br i1 %prol.iter13.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !23

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa8.unr = phi double [ undef, %.lr.ph106.preheader ], [ %96, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %89, %.lr.ph106.preheader ], [ %96, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %97 = icmp ult i64 %87, 3
  br i1 %97, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %119, %.lr.ph106 ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv140
  %99 = bitcast double* %98 to <2 x double>*
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  %101 = bitcast double* %100 to <2 x double>*
  %102 = load <2 x double>, <2 x double>* %99, align 8
  %103 = load <2 x double>, <2 x double>* %101, align 8
  %104 = fmul <2 x double> %102, %103
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fsub double %.2104, %105
  %108 = fsub double %107, %106
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %110 = bitcast double* %109 to <2 x double>*
  %111 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141.1
  %112 = bitcast double* %111 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %113 = load <2 x double>, <2 x double>* %110, align 8
  %114 = load <2 x double>, <2 x double>* %112, align 8
  %115 = fmul <2 x double> %113, %114
  %116 = extractelement <2 x double> %115, i32 0
  %117 = extractelement <2 x double> %115, i32 1
  %118 = fsub double %108, %116
  %119 = fsub double %118, %117
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa8 = phi double [ %.lcssa8.unr, %.lr.ph106.prol.loopexit ], [ %119, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %89, %.preheader93 ], [ %.lcssa8, %._crit_edge107.loopexit ]
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv149
  store double %.2.lcssa, double* %120, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %121 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  br i1 %121, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %122 = sub i32 2000, %indvar
  %123 = sext i32 %122 to i64
  %124 = sub nsw i64 1999, %123
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  %126 = load double, double* %125, align 8
  %127 = icmp slt i32 %indvars.iv, 2000
  br i1 %127, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %128 = sext i32 %indvars.iv to i64
  %129 = sub nsw i64 0, %123
  %xtraiter = and i64 %129, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %128, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %135, %.lr.ph.prol ], [ %126, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %2, i64 %indvars.iv136.prol
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fsub double %.399.prol, %134
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %135, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %128, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %126, %.preheader..lr.ph_crit_edge ], [ %135, %.lr.ph.prol.loopexit.unr-lcssa ]
  %136 = icmp ult i64 %124, 3
  br i1 %136, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %158, %.lr.ph ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv136
  %138 = bitcast double* %137 to <2 x double>*
  %139 = getelementptr inbounds double, double* %2, i64 %indvars.iv136
  %140 = bitcast double* %139 to <2 x double>*
  %141 = load <2 x double>, <2 x double>* %138, align 8
  %142 = load <2 x double>, <2 x double>* %140, align 8
  %143 = fmul <2 x double> %141, %142
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fsub double %.399, %144
  %147 = fsub double %146, %145
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %149 = bitcast double* %148 to <2 x double>*
  %150 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next137.1
  %151 = bitcast double* %150 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %152 = load <2 x double>, <2 x double>* %149, align 8
  %153 = load <2 x double>, <2 x double>* %151, align 8
  %154 = fmul <2 x double> %152, %153
  %155 = extractelement <2 x double> %154, i32 0
  %156 = extractelement <2 x double> %154, i32 1
  %157 = fsub double %147, %155
  %158 = fsub double %157, %156
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %158, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %126, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  %160 = load double, double* %159, align 8
  %161 = fdiv double %.3.lcssa, %160
  %162 = getelementptr inbounds double, double* %2, i64 %indvars.iv138
  store double %161, double* %162, align 8
  %163 = icmp sgt i64 %indvars.iv138, 0
  br i1 %163, label %._crit_edge..preheader_crit_edge, label %164

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:164:                                    ; preds = %._crit_edge
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
