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
.preheader13.preheader.lr.ph:
  br label %.preheader13.preheader

.preheader13.preheader:                           ; preds = %._crit_edge92..preheader13.preheader_crit_edge, %.preheader13.preheader.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader13.preheader.lr.ph ], [ %indvars.iv.next113, %._crit_edge92..preheader13.preheader_crit_edge ]
  %indvars.iv4596 = phi [2000 x double]* [ %0, %.preheader13.preheader.lr.ph ], [ %14, %._crit_edge92..preheader13.preheader_crit_edge ]
  %indvars.iv5093 = phi i64 [ 0, %.preheader13.preheader.lr.ph ], [ %indvars.iv.next51, %._crit_edge92..preheader13.preheader_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv5093, 2001
  %2 = add nuw nsw i64 %1, 1
  %scevgep111 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13, %.preheader13.preheader
  %indvars.iv3386 = phi i64 [ 0, %.preheader13.preheader ], [ %indvars.iv.next34, %.preheader13 ]
  %3 = sub nsw i64 0, %indvars.iv3386
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 2000
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.000000e+03
  %8 = fadd double %7, 1.000000e+00
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5093, i64 %indvars.iv3386
  store double %8, double* %9, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3386, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv
  br i1 %exitcond38, label %10, label %.preheader13

; <label>:10:                                     ; preds = %.preheader13
  %11 = mul nsw i64 %indvars.iv5093, -8
  %scevgep111112 = bitcast double* %scevgep111 to i8*
  %12 = add nsw i64 %11, 15992
  %exitcond8788 = icmp eq i64 %indvars.iv, 2000
  br i1 %exitcond8788, label %._crit_edge92, label %._crit_edge92.loopexit

._crit_edge92.loopexit:                           ; preds = %10
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep111112, i8 0, i64 %12, i32 8, i1 false)
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %10, %._crit_edge92.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv5093, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv4596, i64 0, i64 %indvars.iv5093
  store double 1.000000e+00, double* %13, align 8
  %exitcond114 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond114, label %.preheader12.preheader.preheader, label %._crit_edge92..preheader13.preheader_crit_edge

._crit_edge92..preheader13.preheader_crit_edge:   ; preds = %._crit_edge92
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv4596, i64 1, i64 0
  %14 = bitcast double* %scevgep to [2000 x double]*
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader13.preheader

.preheader12.preheader.preheader:                 ; preds = %._crit_edge92
  %15 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader12._crit_edge

.preheader12._crit_edge:                          ; preds = %.preheader12._crit_edge, %.preheader12.preheader.preheader
  %indvars.iv3184 = phi i64 [ 0, %.preheader12.preheader.preheader ], [ %indvars.iv.next32.7, %.preheader12._crit_edge ]
  %16 = mul nuw nsw i64 %indvars.iv3184, 16000
  %scevgep109 = getelementptr i8, i8* %15, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep109, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32 = or i64 %indvars.iv3184, 1
  %17 = mul nuw nsw i64 %indvars.iv.next32, 16000
  %scevgep109.1 = getelementptr i8, i8* %15, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.1 = or i64 %indvars.iv3184, 2
  %18 = mul nuw nsw i64 %indvars.iv.next32.1, 16000
  %scevgep109.2 = getelementptr i8, i8* %15, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.2 = or i64 %indvars.iv3184, 3
  %19 = mul nuw nsw i64 %indvars.iv.next32.2, 16000
  %scevgep109.3 = getelementptr i8, i8* %15, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.3 = or i64 %indvars.iv3184, 4
  %20 = mul nuw nsw i64 %indvars.iv.next32.3, 16000
  %scevgep109.4 = getelementptr i8, i8* %15, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.4 = or i64 %indvars.iv3184, 5
  %21 = mul nuw nsw i64 %indvars.iv.next32.4, 16000
  %scevgep109.5 = getelementptr i8, i8* %15, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.5 = or i64 %indvars.iv3184, 6
  %22 = mul nuw nsw i64 %indvars.iv.next32.5, 16000
  %scevgep109.6 = getelementptr i8, i8* %15, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.6 = or i64 %indvars.iv3184, 7
  %23 = mul nuw nsw i64 %indvars.iv.next32.6, 16000
  %scevgep109.7 = getelementptr i8, i8* %15, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep109.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.7 = add nuw nsw i64 %indvars.iv3184, 8
  %exitcond110.7 = icmp eq i64 %indvars.iv.next32.7, 2000
  br i1 %exitcond110.7, label %.preheader9.preheader.preheader.preheader, label %.preheader12._crit_edge

.preheader9.preheader.preheader.preheader:        ; preds = %.preheader12._crit_edge
  %24 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %.preheader9.preheader.preheader

.preheader9.preheader.preheader:                  ; preds = %.preheader9.preheader.preheader.preheader, %.preheader10._crit_edge
  %indvars.iv2564 = phi i64 [ %indvars.iv.next26, %.preheader10._crit_edge ], [ 0, %.preheader9.preheader.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv2564
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %25 = add nuw nsw i64 %indvars.iv2564, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %25
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %.preheader10, %.preheader9.preheader.preheader
  %indvars.iv2162 = phi i64 [ 0, %.preheader9.preheader.preheader ], [ %indvars.iv.next22, %.preheader10 ]
  %26 = mul nuw nsw i64 %indvars.iv2162, 16000
  %scevgep1 = getelementptr i8, i8* %15, i64 %26
  %27 = add nuw nsw i64 %26, 16000
  %scevgep2 = getelementptr i8, i8* %15, i64 %27
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2162, i64 %indvars.iv2564
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %28 to i8*
  %bc7 = bitcast double* %28 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %.preheader9.preheader42, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.preheader
  %29 = load double, double* %28, align 8, !alias.scope !1
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x double> undef, double %29, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

.preheader9.preheader42:                          ; preds = %.preheader9.preheader
  br label %.preheader9

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %34 = or i64 %index, 1
  %35 = or i64 %index, 2
  %36 = or i64 %index, 3
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv2564
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %34, i64 %indvars.iv2564
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv2564
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv2564
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = fmul <2 x double> %31, %46
  %50 = fmul <2 x double> %33, %48
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv2162, i64 %index
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !6, !noalias !8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = fadd <2 x double> %wide.load, %49
  %56 = fadd <2 x double> %wide.load12, %50
  %57 = bitcast double* %51 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %58 = bitcast double* %53 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %59 = icmp eq i64 %index.next, 2000
  br i1 %59, label %.preheader10.loopexit43, label %vector.body, !llvm.loop !9

.preheader9:                                      ; preds = %.preheader9, %.preheader9.preheader42
  %indvars.iv1758 = phi i64 [ 0, %.preheader9.preheader42 ], [ %indvars.iv.next18.1, %.preheader9 ]
  %60 = load double, double* %28, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1758, i64 %indvars.iv2564
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv2162, i64 %indvars.iv1758
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next18 = or i64 %indvars.iv1758, 1
  %67 = load double, double* %28, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next18, i64 %indvars.iv2564
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv2162, i64 %indvars.iv.next18
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv1758, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond.1, label %.preheader10.loopexit, label %.preheader9, !llvm.loop !12

.preheader10.loopexit:                            ; preds = %.preheader9
  br label %.preheader10

.preheader10.loopexit43:                          ; preds = %vector.body
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit43, %.preheader10.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2162, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond60, label %.preheader10._crit_edge, label %.preheader9.preheader

.preheader10._crit_edge:                          ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2564, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond108, label %.preheader.preheader.preheader, label %.preheader9.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader10._crit_edge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader._crit_edge
  %indvars.iv1555 = phi i64 [ %indvars.iv.next16, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %74 = add nuw nsw i64 %indvars.iv1555, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %74, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %75 = mul nuw nsw i64 %indvars.iv1555, 16000
  %scevgep22 = getelementptr i8, i8* %15, i64 %75
  %76 = add nuw nsw i64 %75, 16000
  %scevgep23 = getelementptr i8, i8* %15, i64 %76
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %.preheader.preheader40, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader.preheader
  br label %vector.body13

.preheader.preheader40:                           ; preds = %.preheader.preheader
  br label %.preheader

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %index30
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %index30
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %82, align 8, !alias.scope !16, !noalias !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %index.next31
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !13
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %index.next31
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %90, align 8, !alias.scope !16, !noalias !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nuw nsw i64 %index30, 8
  %93 = icmp eq i64 %index.next31.1, 2000
  br i1 %93, label %.preheader._crit_edge.loopexit41, label %vector.body13, !llvm.loop !18

.preheader:                                       ; preds = %.preheader, %.preheader.preheader40
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader40 ], [ %indvars.iv.next.4, %.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %indvars.iv54
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %indvars.iv54
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv54, 1
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %indvars.iv.next
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv54, 2
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %indvars.iv.next.1
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv54, 3
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %indvars.iv.next.2
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv54, 4
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv1555, i64 %indvars.iv.next.3
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1555, i64 %indvars.iv.next.3
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv54, 5
  %exitcond52.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond52.4, label %.preheader._crit_edge.loopexit, label %.preheader, !llvm.loop !19

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge.loopexit41:                 ; preds = %vector.body13
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit41, %.preheader._crit_edge.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1555, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond107, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  tail call void @free(i8* nonnull %15) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader.preheader:
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader3._crit_edge..preheader4.preheader_crit_edge, %.preheader4.preheader.preheader
  %indvars.iv = phi i2 [ %indvars.iv.next10, %.preheader3._crit_edge..preheader4.preheader_crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %indvars.iv1632 = phi [2000 x double]* [ %55, %.preheader3._crit_edge..preheader4.preheader_crit_edge ], [ %0, %.preheader4.preheader.preheader ]
  %indvars.iv2030 = phi i64 [ %indvars.iv.next21, %.preheader3._crit_edge..preheader4.preheader_crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %1 = zext i2 %indvars.iv to i64
  %2 = add nsw i64 %indvars.iv2030, -1
  %exitcond1324 = icmp eq i64 %indvars.iv2030, 0
  br i1 %exitcond1324, label %.preheader3._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 0
  %.pre3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 0
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 0
  br label %.preheader.preheader

.lr.ph29:                                         ; preds = %.preheader4
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv2030
  %.pre2 = load double, double* %4, align 8
  %xtraiter4 = and i64 %indvars.iv2030, 3
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod5, label %.preheader3.prol.loopexit, label %.preheader3.prol.preheader

.preheader3.prol.preheader:                       ; preds = %.lr.ph29
  br label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.preheader3.prol, %.preheader3.prol.preheader
  %5 = phi double [ %.pre2, %.preheader3.prol.preheader ], [ %9, %.preheader3.prol ]
  %indvars.iv1428.prol = phi i64 [ 0, %.preheader3.prol.preheader ], [ %indvars.iv.next15.prol, %.preheader3.prol ]
  %prol.iter = phi i64 [ %xtraiter4, %.preheader3.prol.preheader ], [ %prol.iter.sub, %.preheader3.prol ]
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv1428.prol
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fsub double %5, %8
  store double %9, double* %4, align 8
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv1428.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader3.prol.loopexit.unr-lcssa, label %.preheader3.prol, !llvm.loop !20

.preheader3.prol.loopexit.unr-lcssa:              ; preds = %.preheader3.prol
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.lr.ph29, %.preheader3.prol.loopexit.unr-lcssa
  %.unr6 = phi double [ %.pre2, %.lr.ph29 ], [ %9, %.preheader3.prol.loopexit.unr-lcssa ]
  %indvars.iv1428.unr = phi i64 [ 0, %.lr.ph29 ], [ %1, %.preheader3.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %2, 3
  br i1 %10, label %.preheader3._crit_edge.loopexit, label %.lr.ph29.new

.lr.ph29.new:                                     ; preds = %.preheader3.prol.loopexit
  br label %.preheader3

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader4
  %indvars.iv825 = phi i64 [ %indvars.iv.next9, %.preheader4 ], [ 0, %.preheader.preheader.preheader ]
  %exitcond22 = icmp eq i64 %indvars.iv825, 0
  br i1 %exitcond22, label %.preheader.preheader..preheader4_crit_edge, label %.lr.ph

.preheader.preheader..preheader4_crit_edge:       ; preds = %.preheader.preheader
  %.pre1 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader4

.lr.ph:                                           ; preds = %.preheader.preheader
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv825
  %.pre = load double, double* %11, align 8
  %xtraiter = and i64 %indvars.iv825, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %12 = load double, double* %3, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv825, i64 0
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre, %15
  store double %16, double* %11, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %16, %.preheader.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %16, %.preheader.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv23.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %indvars.iv825, 1
  br i1 %17, label %.preheader4.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph.new
  %18 = phi double [ %.unr.ph, %.lr.ph.new ], [ %30, %.preheader ]
  %indvars.iv23 = phi i64 [ %indvars.iv23.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv23
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv825, i64 %indvars.iv23
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv23, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv825, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %11, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv825
  br i1 %exitcond.1, label %.preheader4.loopexit.unr-lcssa, label %.preheader

.preheader4.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.preheader.prol.loopexit, %.preheader4.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %30, %.preheader4.loopexit.unr-lcssa ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.preheader..preheader4_crit_edge
  %.pre-phi = phi double* [ %.pre3, %.preheader.preheader..preheader4_crit_edge ], [ %11, %.preheader4.loopexit ]
  %31 = phi double [ %.pre1, %.preheader.preheader..preheader4_crit_edge ], [ %.lcssa, %.preheader4.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv825, i64 %indvars.iv825
  %33 = load double, double* %32, align 8
  %34 = fdiv double %31, %33
  store double %34, double* %.pre-phi, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv825, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next9, %indvars.iv2030
  br i1 %exitcond13, label %.lr.ph29, label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3, %.lr.ph29.new
  %35 = phi double [ %.unr6, %.lr.ph29.new ], [ %51, %.preheader3 ]
  %indvars.iv1428 = phi i64 [ %indvars.iv1428.unr, %.lr.ph29.new ], [ %indvars.iv.next15.3, %.preheader3 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv1428
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fsub double %35, %38
  store double %39, double* %4, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1428, 1
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv.next15
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %4, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv1428, 2
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv.next15.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %4, align 8
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv1428, 3
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2030, i64 %indvars.iv.next15.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %4, align 8
  %indvars.iv.next15.3 = add nuw nsw i64 %indvars.iv1428, 4
  %exitcond19.3 = icmp eq i64 %indvars.iv.next15.3, %indvars.iv2030
  br i1 %exitcond19.3, label %.preheader3._crit_edge.loopexit.unr-lcssa, label %.preheader3

.preheader3._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader3
  br label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3.prol.loopexit, %.preheader3._crit_edge.loopexit.unr-lcssa
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %.preheader4.preheader
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv1632, i64 0, i64 %indvars.iv2030
  %53 = load double, double* %52, align 8
  %54 = tail call double @sqrt(double %53) #3
  store double %54, double* %52, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2030, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next21, 2000
  br i1 %exitcond33, label %._crit_edge, label %.preheader3._crit_edge..preheader4.preheader_crit_edge

.preheader3._crit_edge..preheader4.preheader_crit_edge: ; preds = %.preheader3._crit_edge
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv1632, i64 1, i64 0
  %55 = bitcast double* %scevgep to [2000 x double]*
  %indvars.iv.next10 = add i2 %indvars.iv, 1
  br label %.preheader4.preheader

._crit_edge:                                      ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %16, %.preheader.preheader.preheader
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %16 ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next7, %16 ], [ 0, %.preheader.preheader.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv69, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %6 = add nuw nsw i64 %indvars.iv8, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %.preheader

; <label>:10:                                     ; preds = %.preheader._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv8
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv410
  br i1 %exitcond, label %16, label %.preheader._crit_edge

; <label>:16:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 2000
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  br i1 %exitcond11, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %16
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
