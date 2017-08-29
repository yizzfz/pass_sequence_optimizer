; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader62.lr.ph:
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv137 = phi i64 [ 0, %.preheader62.lr.ph ], [ %indvars.iv.next138, %._crit_edge88 ]
  %indvars.iv135 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next136, %._crit_edge88 ]
  %1 = mul nuw nsw i64 %indvars.iv137, 2001
  %2 = add nuw nsw i64 %1, 1
  %3 = sub nsw i64 1998, %indvars.iv137
  %4 = shl i64 %3, 3
  br label %._crit_edge

.preheader61:                                     ; preds = %._crit_edge
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %5 = and i64 %4, 34359738360
  %scevgep131132 = bitcast double* %scevgep131 to i8*
  %6 = add nuw nsw i64 %5, 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %7 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %7, label %._crit_edge88.loopexit, label %._crit_edge88

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv119 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next120, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv119
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv119
  store double %13, double* %14, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next120, %indvars.iv135
  br i1 %exitcond126, label %.preheader61, label %._crit_edge

._crit_edge88.loopexit:                           ; preds = %.preheader61
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep131132, i8 0, i64 %6, i32 8, i1 false)
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %.preheader61, %._crit_edge88.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %15, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 2000
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  br i1 %exitcond140, label %._crit_edge90, label %.lr.ph84

._crit_edge90:                                    ; preds = %._crit_edge88
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us, %._crit_edge90
  %indvars.iv115 = phi i64 [ 0, %._crit_edge90 ], [ %indvars.iv.next116.7, %._crit_edge81.us ]
  %17 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116 = or i64 %indvars.iv115, 1
  %18 = mul nuw nsw i64 %indvars.iv.next116, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.1 = or i64 %indvars.iv115, 2
  %19 = mul nuw nsw i64 %indvars.iv.next116.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.2 = or i64 %indvars.iv115, 3
  %20 = mul nuw nsw i64 %indvars.iv.next116.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.3 = or i64 %indvars.iv115, 4
  %21 = mul nuw nsw i64 %indvars.iv.next116.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.4 = or i64 %indvars.iv115, 5
  %22 = mul nuw nsw i64 %indvars.iv.next116.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.5 = or i64 %indvars.iv115, 6
  %23 = mul nuw nsw i64 %indvars.iv.next116.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.6 = or i64 %indvars.iv115, 7
  %24 = mul nuw nsw i64 %indvars.iv.next116.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.7 = add nuw nsw i64 %indvars.iv115, 8
  %exitcond118.7 = icmp eq i64 %indvars.iv.next116.7, 2000
  br i1 %exitcond118.7, label %.preheader57.us.us.preheader.preheader, label %._crit_edge81.us

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge81.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv107
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %26 = add nuw nsw i64 %indvars.iv107, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %26
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond110, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  br label %.preheader.us

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next104, %._crit_edge68.us.us ]
  %27 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %27
  %28 = add nuw nsw i64 %27, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %28
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv107
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %29 to i8*
  %bc7 = bitcast double* %29 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %._crit_edge141.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader57.us.us
  %30 = load double, double* %29, align 8, !alias.scope !1
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = insertelement <2 x double> undef, double %30, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

._crit_edge141.preheader:                         ; preds = %.preheader57.us.us
  br label %._crit_edge141

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = or i64 %index, 1
  %36 = or i64 %index, 2
  %37 = or i64 %index, 3
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv107
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv107
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv107
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv107
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %32, %47
  %51 = fmul <2 x double> %34, %49
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = fadd <2 x double> %wide.load, %50
  %57 = fadd <2 x double> %wide.load12, %51
  %58 = bitcast double* %52 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %59 = bitcast double* %54 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %60 = icmp eq i64 %index.next, 2000
  br i1 %60, label %._crit_edge68.us.us.loopexit41, label %vector.body, !llvm.loop !9

._crit_edge68.us.us.loopexit:                     ; preds = %._crit_edge141
  br label %._crit_edge68.us.us

._crit_edge68.us.us.loopexit41:                   ; preds = %vector.body
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit41, %._crit_edge68.us.us.loopexit
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond106, label %._crit_edge70.us, label %.preheader57.us.us

._crit_edge141:                                   ; preds = %._crit_edge141, %._crit_edge141.preheader
  %indvars.iv99 = phi i64 [ 0, %._crit_edge141.preheader ], [ %indvars.iv.next100.1, %._crit_edge141 ]
  %61 = load double, double* %29, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv107
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %68 = load double, double* %29, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next100, i64 %indvars.iv107
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, 2000
  br i1 %exitcond102.1, label %._crit_edge68.us.us.loopexit, label %._crit_edge141, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %75 = add nuw nsw i64 %indvars.iv95, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %75, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %76 = mul nuw nsw i64 %indvars.iv95, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %76
  %77 = add nuw nsw i64 %76, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %77
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %._crit_edge142.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader.us
  br label %vector.body13

._crit_edge142.preheader:                         ; preds = %.preheader.us
  br label %._crit_edge142

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %index30
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %index30
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %index.next31
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %index.next31
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nuw nsw i64 %index30, 8
  %94 = icmp eq i64 %index.next31.1, 2000
  br i1 %94, label %._crit_edge.us.loopexit40, label %vector.body13, !llvm.loop !18

._crit_edge142:                                   ; preds = %._crit_edge142, %._crit_edge142.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge142.preheader ], [ %indvars.iv.next.4, %._crit_edge142 ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %101 = bitcast double* %100 to i64*
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.3
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv.next.3
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond94.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond94.4, label %._crit_edge.us.loopexit, label %._crit_edge142, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %._crit_edge142
  br label %._crit_edge.us

._crit_edge.us.loopexit40:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit40, %._crit_edge.us.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond98, label %._crit_edge65, label %.preheader.us

._crit_edge65:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %16) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.preheader33.preheader:
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge39
  %indvars.iv8 = phi i2 [ 0, %.preheader33.preheader ], [ %indvars.iv.next9, %._crit_edge39 ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge39 ], [ 0, %.preheader33.preheader ]
  %1 = zext i2 %indvars.iv8 to i64
  %2 = add nsw i64 %indvars.iv65, -1
  %3 = icmp sgt i64 %indvars.iv65, 0
  br i1 %3, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %.preheader33
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 0
  br label %.preheader

.lr.ph38:                                         ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %.pre2 = load double, double* %5, align 8
  %xtraiter3 = and i64 %indvars.iv65, 3
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %._crit_edge70.prol.loopexit, label %._crit_edge70.prol.preheader

._crit_edge70.prol.preheader:                     ; preds = %.lr.ph38
  br label %._crit_edge70.prol

._crit_edge70.prol:                               ; preds = %._crit_edge70.prol, %._crit_edge70.prol.preheader
  %6 = phi double [ %.pre2, %._crit_edge70.prol.preheader ], [ %10, %._crit_edge70.prol ]
  %indvars.iv57.prol = phi i64 [ 0, %._crit_edge70.prol.preheader ], [ %indvars.iv.next58.prol, %._crit_edge70.prol ]
  %prol.iter = phi i64 [ %xtraiter3, %._crit_edge70.prol.preheader ], [ %prol.iter.sub, %._crit_edge70.prol ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv57.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge70.prol.loopexit.unr-lcssa, label %._crit_edge70.prol, !llvm.loop !20

._crit_edge70.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge70.prol
  br label %._crit_edge70.prol.loopexit

._crit_edge70.prol.loopexit:                      ; preds = %.lr.ph38, %._crit_edge70.prol.loopexit.unr-lcssa
  %.unr5 = phi double [ %.pre2, %.lr.ph38 ], [ %10, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %indvars.iv57.unr = phi i64 [ 0, %.lr.ph38 ], [ %1, %._crit_edge70.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %2, 3
  br i1 %11, label %._crit_edge39.loopexit, label %.lr.ph38.new

.lr.ph38.new:                                     ; preds = %._crit_edge70.prol.loopexit
  br label %._crit_edge70

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge ], [ 0, %.preheader.preheader ]
  %12 = icmp sgt i64 %indvars.iv49, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv49
  %.pre = load double, double* %13, align 8
  br i1 %12, label %._crit_edge69.preheader, label %._crit_edge

._crit_edge69.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge69.prol.loopexit.unr-lcssa, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %._crit_edge69.preheader
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  %14 = load double, double* %4, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %._crit_edge69.prol.loopexit.unr-lcssa

._crit_edge69.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge69.preheader, %._crit_edge69.prol
  %.lcssa.unr.ph = phi double [ %18, %._crit_edge69.prol ], [ undef, %._crit_edge69.preheader ]
  %.unr.ph = phi double [ %18, %._crit_edge69.prol ], [ %.pre, %._crit_edge69.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge69.prol ], [ 0, %._crit_edge69.preheader ]
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %._crit_edge69.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv49, 1
  br i1 %19, label %._crit_edge.loopexit, label %._crit_edge69.preheader.new

._crit_edge69.preheader.new:                      ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader.new
  %20 = phi double [ %.unr.ph, %._crit_edge69.preheader.new ], [ %32, %._crit_edge69 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge69.preheader.new ], [ %indvars.iv.next.1, %._crit_edge69 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond48.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge69

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge69
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge69.prol.loopexit ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %33 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %13, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next50, %indvars.iv65
  br i1 %exitcond56, label %.lr.ph38, label %.preheader

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph38.new
  %37 = phi double [ %.unr5, %.lr.ph38.new ], [ %53, %._crit_edge70 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.lr.ph38.new ], [ %indvars.iv.next58.3, %._crit_edge70 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv57
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %5, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %5, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %5, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv.next58.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %5, align 8
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv65
  br i1 %exitcond64.3, label %._crit_edge39.loopexit.unr-lcssa, label %._crit_edge70

._crit_edge39.loopexit.unr-lcssa:                 ; preds = %._crit_edge70
  br label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %._crit_edge70.prol.loopexit, %._crit_edge39.loopexit.unr-lcssa
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  %indvars.iv.next9 = add i2 %indvars.iv8, 1
  br i1 %exitcond68, label %._crit_edge42, label %.preheader33

._crit_edge42:                                    ; preds = %._crit_edge39
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %indvars.iv19 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next20, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv21, 2000
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge25 ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge25

; <label>:10:                                     ; preds = %._crit_edge26
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge26, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %indvars.iv19
  br i1 %exitcond18, label %._crit_edge, label %._crit_edge26

._crit_edge:                                      ; preds = %._crit_edge25
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond24, label %._crit_edge12, label %.lr.ph

._crit_edge12:                                    ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
