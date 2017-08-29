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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader13._crit_edge..preheader14.preheader_crit_edge, %2
  %indvars.iv4568 = phi i64 [ 1, %2 ], [ %indvars.iv.next46, %.preheader13._crit_edge..preheader14.preheader_crit_edge ]
  %indvars.iv4767 = phi i64 [ 0, %2 ], [ %indvars.iv.next48, %.preheader13._crit_edge..preheader14.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv4767, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  br label %.preheader14

.preheader13.preheader:                           ; preds = %.preheader14
  %5 = mul nsw i64 %indvars.iv4767, -8
  %exitcond5465 = icmp eq i64 %indvars.iv4767, 1999
  br i1 %exitcond5465, label %.preheader13._crit_edge.thread, label %.preheader13._crit_edge

.preheader13._crit_edge.thread:                   ; preds = %.preheader13.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 1999, i64 1999
  store double 1.000000e+00, double* %6, align 8
  br label %.preheader10.preheader.preheader

.preheader14:                                     ; preds = %.preheader14..preheader14_crit_edge, %.preheader14.preheader
  %indvars.iv3363 = phi i64 [ 0, %.preheader14.preheader ], [ %indvars.iv.next34, %.preheader14..preheader14_crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv3363
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4767, i64 %indvars.iv3363
  store double %12, double* %13, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3363, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv4568
  br i1 %exitcond38, label %.preheader13.preheader, label %.preheader14..preheader14_crit_edge

.preheader14..preheader14_crit_edge:              ; preds = %.preheader14
  br label %.preheader14

.preheader13._crit_edge:                          ; preds = %.preheader13.preheader
  %14 = add nsw i64 %5, 15992
  %scevgep71 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep71, i8 0, i64 %14, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4767, i64 %indvars.iv4767
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4767, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond55, label %.preheader10.preheader.preheader.loopexit, label %.preheader13._crit_edge..preheader14.preheader_crit_edge

.preheader13._crit_edge..preheader14.preheader_crit_edge: ; preds = %.preheader13._crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4568, 1
  br label %.preheader14.preheader

.preheader10.preheader.preheader.loopexit:        ; preds = %.preheader13._crit_edge
  br label %.preheader10.preheader.preheader

.preheader10.preheader.preheader:                 ; preds = %.preheader10.preheader.preheader.loopexit, %.preheader13._crit_edge.thread
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 32000000, i32 8, i1 false)
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader10.preheader

.preheader10.preheader:                           ; preds = %.preheader11..preheader10.preheader_crit_edge, %.preheader10.preheader.preheader
  %indvars.iv2560 = phi i64 [ 0, %.preheader10.preheader.preheader ], [ %indvars.iv.next26, %.preheader11..preheader10.preheader_crit_edge ]
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2560
  %scevgep7980 = bitcast double* %scevgep79 to i8*
  %18 = add nuw i64 %indvars.iv2560, 1
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %18
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  br label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %.preheader10..preheader9.preheader_crit_edge, %.preheader10.preheader
  %indvars.iv2159 = phi i64 [ 0, %.preheader10.preheader ], [ %indvars.iv.next22, %.preheader10..preheader9.preheader_crit_edge ]
  %19 = mul nuw nsw i64 %indvars.iv2159, 16000
  %scevgep77 = getelementptr i8, i8* %16, i64 %19
  %20 = add nuw i64 %19, 16000
  %scevgep78 = getelementptr i8, i8* %16, i64 %20
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2159, i64 %indvars.iv2560
  %bound0 = icmp ult i8* %scevgep77, %scevgep8182
  %bound1 = icmp ult i8* %scevgep7980, %scevgep78
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %21 to i8*
  %bc83 = bitcast double* %21 to i8*
  %bound084 = icmp ult i8* %scevgep77, %bc83
  %bound185 = icmp ult i8* %bc, %scevgep78
  %found.conflict86 = and i1 %bound084, %bound185
  %conflict.rdx = or i1 %found.conflict, %found.conflict86
  br i1 %conflict.rdx, label %.preheader9.preheader118, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.preheader
  %22 = load double, double* %21, align 8, !alias.scope !1
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

.preheader9.preheader118:                         ; preds = %.preheader9.preheader
  br label %.preheader9

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %27 = or i64 %index, 1
  %28 = or i64 %index, 2
  %29 = or i64 %index, 3
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv2560
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %27, i64 %indvars.iv2560
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %28, i64 %indvars.iv2560
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %29, i64 %indvars.iv2560
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %24, %39
  %43 = fmul <2 x double> %26, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv2159, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fadd <2 x double> %wide.load, %42
  %49 = fadd <2 x double> %wide.load88, %43
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %.preheader10.loopexit119, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.preheader9:                                      ; preds = %.preheader9..preheader9_crit_edge, %.preheader9.preheader118
  %indvars.iv1758 = phi i64 [ %indvars.iv.next18, %.preheader9..preheader9_crit_edge ], [ 0, %.preheader9.preheader118 ]
  %53 = load double, double* %21, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1758, i64 %indvars.iv2560
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv2159, i64 %indvars.iv1758
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1758, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond20, label %.preheader10.loopexit, label %.preheader9..preheader9_crit_edge, !llvm.loop !12

.preheader9..preheader9_crit_edge:                ; preds = %.preheader9
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %.preheader9
  br label %.preheader10

.preheader10.loopexit119:                         ; preds = %vector.body
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit119, %.preheader10.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2159, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond50, label %.preheader11, label %.preheader10..preheader9.preheader_crit_edge

.preheader10..preheader9.preheader_crit_edge:     ; preds = %.preheader10
  br label %.preheader9.preheader

.preheader11:                                     ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2560, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond51, label %.preheader.preheader.preheader, label %.preheader11..preheader10.preheader_crit_edge

.preheader11..preheader10.preheader_crit_edge:    ; preds = %.preheader11
  br label %.preheader10.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader11
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader8..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv1557 = phi i64 [ %indvars.iv.next16, %.preheader8..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %scevgep94 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1557, i64 0
  %scevgep9495 = bitcast double* %scevgep94 to i8*
  %60 = add nuw i64 %indvars.iv1557, 1
  %scevgep96 = getelementptr [2000 x double], [2000 x double]* %1, i64 %60, i64 0
  %scevgep9697 = bitcast double* %scevgep96 to i8*
  %61 = mul nuw nsw i64 %indvars.iv1557, 16000
  %scevgep98 = getelementptr i8, i8* %16, i64 %61
  %62 = add nuw i64 %61, 16000
  %scevgep99 = getelementptr i8, i8* %16, i64 %62
  %bound0100 = icmp ult i8* %scevgep9495, %scevgep99
  %bound1101 = icmp ult i8* %scevgep98, %scevgep9697
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  br i1 %memcheck.conflict103, label %.preheader.preheader116, label %vector.body89.preheader

vector.body89.preheader:                          ; preds = %.preheader.preheader
  br label %vector.body89

.preheader.preheader116:                          ; preds = %.preheader.preheader
  br label %.preheader

vector.body89:                                    ; preds = %vector.body89.vector.body89_crit_edge, %vector.body89.preheader
  %index106 = phi i64 [ %index.next107, %vector.body89.vector.body89_crit_edge ], [ 0, %vector.body89.preheader ]
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1557, i64 %index106
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load114 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load115 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1557, i64 %index106
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load114, <2 x i64>* %68, align 8, !alias.scope !16, !noalias !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load115, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %index.next107 = add nuw nsw i64 %index106, 4
  %71 = icmp eq i64 %index.next107, 2000
  br i1 %71, label %.preheader8.loopexit117, label %vector.body89.vector.body89_crit_edge, !llvm.loop !18

vector.body89.vector.body89_crit_edge:            ; preds = %vector.body89
  br label %vector.body89

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader116
  %indvars.iv56 = phi i64 [ %indvars.iv.next, %.preheader..preheader_crit_edge ], [ 0, %.preheader.preheader116 ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1557, i64 %indvars.iv56
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1557, i64 %indvars.iv56
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv56, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond49, label %.preheader8.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !19

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader8.loopexit:                             ; preds = %.preheader
  br label %.preheader8

.preheader8.loopexit117:                          ; preds = %vector.body89
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit117, %.preheader8.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1557, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond, label %77, label %.preheader8..preheader.preheader_crit_edge

.preheader8..preheader.preheader_crit_edge:       ; preds = %.preheader8
  br label %.preheader.preheader

; <label>:77:                                     ; preds = %.preheader8
  tail call void @free(i8* nonnull %16) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader3._crit_edge..preheader4.preheader_crit_edge, %2
  %indvars.iv1828 = phi i64 [ 0, %2 ], [ %indvars.iv.next19, %.preheader3._crit_edge..preheader4.preheader_crit_edge ]
  %exitcond1223 = icmp eq i64 %indvars.iv1828, 0
  br i1 %exitcond1223, label %.preheader4.preheader..preheader3._crit_edge_crit_edge, label %.preheader.preheader.preheader

.preheader4.preheader..preheader3._crit_edge_crit_edge: ; preds = %.preheader4.preheader
  br label %.preheader3._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 0
  %.pre32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 0
  br label %.preheader.preheader

.lr.ph27:                                         ; preds = %.preheader4
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 %indvars.iv1828
  %.pre31 = load double, double* %3, align 8
  br label %.preheader3

.preheader.preheader:                             ; preds = %.preheader4..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv724 = phi i64 [ %indvars.iv.next8, %.preheader4..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %exitcond21 = icmp eq i64 %indvars.iv724, 0
  br i1 %exitcond21, label %.preheader.preheader..preheader4_crit_edge, label %.lr.ph

.preheader.preheader..preheader4_crit_edge:       ; preds = %.preheader.preheader
  %.pre30 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader4

.lr.ph:                                           ; preds = %.preheader.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 %indvars.iv724
  %.pre = load double, double* %4, align 8
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.lr.ph
  %5 = phi double [ %.pre, %.lr.ph ], [ %11, %.preheader..preheader_crit_edge ]
  %indvars.iv22 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %.preheader..preheader_crit_edge ]
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 %indvars.iv22
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv724, i64 %indvars.iv22
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %5, %10
  store double %11, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv724
  br i1 %exitcond, label %.preheader4.loopexit, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader4.loopexit:                             ; preds = %.preheader
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.preheader..preheader4_crit_edge
  %.pre-phi = phi double* [ %.pre32, %.preheader.preheader..preheader4_crit_edge ], [ %4, %.preheader4.loopexit ]
  %12 = phi double [ %.pre30, %.preheader.preheader..preheader4_crit_edge ], [ %11, %.preheader4.loopexit ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv724, i64 %indvars.iv724
  %14 = load double, double* %13, align 8
  %15 = fdiv double %12, %14
  store double %15, double* %.pre-phi, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv724, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1828
  br i1 %exitcond12, label %.lr.ph27, label %.preheader4..preheader.preheader_crit_edge

.preheader4..preheader.preheader_crit_edge:       ; preds = %.preheader4
  br label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3..preheader3_crit_edge, %.lr.ph27
  %16 = phi double [ %.pre31, %.lr.ph27 ], [ %20, %.preheader3..preheader3_crit_edge ]
  %indvars.iv1326 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next14, %.preheader3..preheader3_crit_edge ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 %indvars.iv1326
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %18
  %20 = fsub double %16, %19
  store double %20, double* %3, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1326, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %indvars.iv1828
  br i1 %exitcond17, label %.preheader3._crit_edge.loopexit, label %.preheader3..preheader3_crit_edge

.preheader3..preheader3_crit_edge:                ; preds = %.preheader3
  br label %.preheader3

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader4.preheader..preheader3._crit_edge_crit_edge, %.preheader3._crit_edge.loopexit
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1828, i64 %indvars.iv1828
  %22 = load double, double* %21, align 8
  %23 = tail call double @sqrt(double %22) #3
  store double %23, double* %21, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1828, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond20, label %24, label %.preheader3._crit_edge..preheader4.preheader_crit_edge

.preheader3._crit_edge..preheader4.preheader_crit_edge: ; preds = %.preheader3._crit_edge
  br label %.preheader4.preheader

; <label>:24:                                     ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge, %2
  %indvars.iv411 = phi i64 [ 1, %2 ], [ %indvars.iv.next5, %..preheader.preheader_crit_edge ]
  %indvars.iv610 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %..preheader.preheader_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv610, 2000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv9, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv610, i64 %indvars.iv9
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv411
  br i1 %exitcond, label %18, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv610, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %19, label %..preheader.preheader_crit_edge

..preheader.preheader_crit_edge:                  ; preds = %18
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv411, 1
  br label %.preheader.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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
