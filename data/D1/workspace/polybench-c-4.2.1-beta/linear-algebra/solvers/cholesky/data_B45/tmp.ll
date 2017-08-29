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
.preheader14.preheader.lr.ph:
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader13._crit_edge..preheader14.preheader_crit_edge, %.preheader14.preheader.lr.ph
  %indvars.iv4587 = phi i64 [ 1, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next46, %.preheader13._crit_edge..preheader14.preheader_crit_edge ]
  %indvars.iv4786 = phi i64 [ 0, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader13._crit_edge..preheader14.preheader_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv4786, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep98 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %4 = mul nsw i64 %indvars.iv4786, -8
  br label %.preheader14

.preheader13.preheader:                           ; preds = %.preheader14
  %scevgep9899 = bitcast double* %scevgep98 to i8*
  %5 = add nsw i64 %4, 15992
  %exitcond4483 = icmp eq i64 %indvars.iv4786, 1999
  br i1 %exitcond4483, label %.preheader13.preheader..preheader13._crit_edge_crit_edge, label %.preheader13._crit_edge.loopexit

.preheader13.preheader..preheader13._crit_edge_crit_edge: ; preds = %.preheader13.preheader
  br label %.preheader13._crit_edge

.preheader14:                                     ; preds = %.preheader14..preheader14_crit_edge, %.preheader14.preheader
  %indvars.iv3381 = phi i64 [ 0, %.preheader14.preheader ], [ %indvars.iv.next34, %.preheader14..preheader14_crit_edge ]
  %6 = sub nsw i64 0, %indvars.iv3381
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 2000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fadd double %10, 1.000000e+00
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv3381
  store double %11, double* %12, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3381, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv4587
  br i1 %exitcond38, label %.preheader13.preheader, label %.preheader14..preheader14_crit_edge

.preheader14..preheader14_crit_edge:              ; preds = %.preheader14
  br label %.preheader14

.preheader13._crit_edge.loopexit:                 ; preds = %.preheader13.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9899, i8 0, i64 %5, i32 8, i1 false)
  br label %.preheader13._crit_edge

.preheader13._crit_edge:                          ; preds = %.preheader13.preheader..preheader13._crit_edge_crit_edge, %.preheader13._crit_edge.loopexit
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv4786
  store double 1.000000e+00, double* %13, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4786, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next48, 2000
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4587, 1
  br i1 %exitcond100, label %._crit_edge88, label %.preheader13._crit_edge..preheader14.preheader_crit_edge

.preheader13._crit_edge..preheader14.preheader_crit_edge: ; preds = %.preheader13._crit_edge
  br label %.preheader14.preheader

._crit_edge88:                                    ; preds = %.preheader13._crit_edge
  %14 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader12._crit_edge

.preheader12._crit_edge:                          ; preds = %.preheader12._crit_edge..preheader12._crit_edge_crit_edge, %._crit_edge88
  %indvars.iv3179 = phi i64 [ 0, %._crit_edge88 ], [ %indvars.iv.next32.7, %.preheader12._crit_edge..preheader12._crit_edge_crit_edge ]
  %15 = mul nuw nsw i64 %indvars.iv3179, 16000
  %scevgep = getelementptr i8, i8* %14, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32 = or i64 %indvars.iv3179, 1
  %16 = mul nuw nsw i64 %indvars.iv.next32, 16000
  %scevgep.1 = getelementptr i8, i8* %14, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.1 = or i64 %indvars.iv3179, 2
  %17 = mul nuw nsw i64 %indvars.iv.next32.1, 16000
  %scevgep.2 = getelementptr i8, i8* %14, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.2 = or i64 %indvars.iv3179, 3
  %18 = mul nuw nsw i64 %indvars.iv.next32.2, 16000
  %scevgep.3 = getelementptr i8, i8* %14, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.3 = or i64 %indvars.iv3179, 4
  %19 = mul nuw nsw i64 %indvars.iv.next32.3, 16000
  %scevgep.4 = getelementptr i8, i8* %14, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.4 = or i64 %indvars.iv3179, 5
  %20 = mul nuw nsw i64 %indvars.iv.next32.4, 16000
  %scevgep.5 = getelementptr i8, i8* %14, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.5 = or i64 %indvars.iv3179, 6
  %21 = mul nuw nsw i64 %indvars.iv.next32.5, 16000
  %scevgep.6 = getelementptr i8, i8* %14, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.6 = or i64 %indvars.iv3179, 7
  %22 = mul nuw nsw i64 %indvars.iv.next32.6, 16000
  %scevgep.7 = getelementptr i8, i8* %14, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.7 = add nuw nsw i64 %indvars.iv3179, 8
  %exitcond97.7 = icmp eq i64 %indvars.iv.next32.7, 2000
  br i1 %exitcond97.7, label %.preheader9.preheader.preheader.preheader, label %.preheader12._crit_edge..preheader12._crit_edge_crit_edge

.preheader12._crit_edge..preheader12._crit_edge_crit_edge: ; preds = %.preheader12._crit_edge
  br label %.preheader12._crit_edge

.preheader9.preheader.preheader.preheader:        ; preds = %.preheader12._crit_edge
  %23 = bitcast i8* %14 to [2000 x [2000 x double]]*
  br label %.preheader9.preheader.preheader

.preheader9.preheader.preheader:                  ; preds = %.preheader10._crit_edge..preheader9.preheader.preheader_crit_edge, %.preheader9.preheader.preheader.preheader
  %indvars.iv2559 = phi i64 [ %indvars.iv.next26, %.preheader10._crit_edge..preheader9.preheader.preheader_crit_edge ], [ 0, %.preheader9.preheader.preheader.preheader ]
  %scevgep106 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2559
  %scevgep106107 = bitcast double* %scevgep106 to i8*
  %24 = add nuw nsw i64 %indvars.iv2559, 1
  %scevgep108 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %24
  %scevgep108109 = bitcast double* %scevgep108 to i8*
  br label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %.preheader10..preheader9.preheader_crit_edge, %.preheader9.preheader.preheader
  %indvars.iv2157 = phi i64 [ 0, %.preheader9.preheader.preheader ], [ %indvars.iv.next22, %.preheader10..preheader9.preheader_crit_edge ]
  %25 = mul nuw nsw i64 %indvars.iv2157, 16000
  %scevgep104 = getelementptr i8, i8* %14, i64 %25
  %26 = add nuw nsw i64 %25, 16000
  %scevgep105 = getelementptr i8, i8* %14, i64 %26
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2157, i64 %indvars.iv2559
  %bound0 = icmp ult i8* %scevgep104, %scevgep108109
  %bound1 = icmp ult i8* %scevgep106107, %scevgep105
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %27 to i8*
  %bc110 = bitcast double* %27 to i8*
  %bound0111 = icmp ult i8* %scevgep104, %bc110
  %bound1112 = icmp ult i8* %bc, %scevgep105
  %found.conflict113 = and i1 %bound0111, %bound1112
  %conflict.rdx = or i1 %found.conflict, %found.conflict113
  br i1 %conflict.rdx, label %.preheader9.preheader145, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.preheader
  %28 = load double, double* %27, align 8, !alias.scope !1
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

.preheader9.preheader145:                         ; preds = %.preheader9.preheader
  br label %.preheader9

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %33 = or i64 %index, 1
  %34 = or i64 %index, 2
  %35 = or i64 %index, 3
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv2559
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %33, i64 %indvars.iv2559
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %34, i64 %indvars.iv2559
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %35, i64 %indvars.iv2559
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = insertelement <2 x double> undef, double %40, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = fmul <2 x double> %30, %45
  %49 = fmul <2 x double> %32, %47
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv2157, i64 %index
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = fadd <2 x double> %wide.load, %48
  %55 = fadd <2 x double> %wide.load115, %49
  %56 = bitcast double* %50 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = bitcast double* %52 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %58 = icmp eq i64 %index.next, 2000
  br i1 %58, label %.preheader10.loopexit146, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.preheader9:                                      ; preds = %.preheader9..preheader9_crit_edge, %.preheader9.preheader145
  %indvars.iv1754 = phi i64 [ 0, %.preheader9.preheader145 ], [ %indvars.iv.next18.1, %.preheader9..preheader9_crit_edge ]
  %59 = load double, double* %27, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1754, i64 %indvars.iv2559
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv2157, i64 %indvars.iv1754
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next18 = or i64 %indvars.iv1754, 1
  %66 = load double, double* %27, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next18, i64 %indvars.iv2559
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv2157, i64 %indvars.iv.next18
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv1754, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond20.1, label %.preheader10.loopexit, label %.preheader9..preheader9_crit_edge, !llvm.loop !12

.preheader9..preheader9_crit_edge:                ; preds = %.preheader9
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %.preheader9
  br label %.preheader10

.preheader10.loopexit146:                         ; preds = %vector.body
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit146, %.preheader10.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2157, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond24, label %.preheader10._crit_edge, label %.preheader10..preheader9.preheader_crit_edge

.preheader10..preheader9.preheader_crit_edge:     ; preds = %.preheader10
  br label %.preheader9.preheader

.preheader10._crit_edge:                          ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2559, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond96, label %.preheader.preheader.preheader, label %.preheader10._crit_edge..preheader9.preheader.preheader_crit_edge

.preheader10._crit_edge..preheader9.preheader.preheader_crit_edge: ; preds = %.preheader10._crit_edge
  br label %.preheader9.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader10._crit_edge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv1551 = phi i64 [ %indvars.iv.next16, %.preheader._crit_edge..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %scevgep121 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 0
  %scevgep121122 = bitcast double* %scevgep121 to i8*
  %73 = add nuw nsw i64 %indvars.iv1551, 1
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %1, i64 %73, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  %74 = mul nuw nsw i64 %indvars.iv1551, 16000
  %scevgep125 = getelementptr i8, i8* %14, i64 %74
  %75 = add nuw nsw i64 %74, 16000
  %scevgep126 = getelementptr i8, i8* %14, i64 %75
  %bound0127 = icmp ult i8* %scevgep121122, %scevgep126
  %bound1128 = icmp ult i8* %scevgep125, %scevgep123124
  %memcheck.conflict130 = and i1 %bound0127, %bound1128
  br i1 %memcheck.conflict130, label %.preheader.preheader143, label %vector.body116.preheader

vector.body116.preheader:                         ; preds = %.preheader.preheader
  br label %vector.body116

.preheader.preheader143:                          ; preds = %.preheader.preheader
  br label %.preheader

vector.body116:                                   ; preds = %vector.body116.vector.body116_crit_edge, %vector.body116.preheader
  %index133 = phi i64 [ 0, %vector.body116.preheader ], [ %index.next134.1, %vector.body116.vector.body116_crit_edge ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %index133
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load141 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load142 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %index133
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load141, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load142, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next134 = or i64 %index133, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %index.next134
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load141.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load142.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %index.next134
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load141.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load142.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %index.next134.1 = add nuw nsw i64 %index133, 8
  %92 = icmp eq i64 %index.next134.1, 2000
  br i1 %92, label %.preheader._crit_edge.loopexit144, label %vector.body116.vector.body116_crit_edge, !llvm.loop !18

vector.body116.vector.body116_crit_edge:          ; preds = %vector.body116
  br label %vector.body116

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader143
  %indvars.iv50 = phi i64 [ 0, %.preheader.preheader143 ], [ %indvars.iv.next.4, %.preheader..preheader_crit_edge ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv50, 2
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv50, 3
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv50, 4
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.3
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv50, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %.preheader._crit_edge.loopexit, label %.preheader..preheader_crit_edge, !llvm.loop !19

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge.loopexit144:                ; preds = %vector.body116
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit144, %.preheader._crit_edge.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1551, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond95, label %._crit_edge, label %.preheader._crit_edge..preheader.preheader_crit_edge

.preheader._crit_edge..preheader.preheader_crit_edge: ; preds = %.preheader._crit_edge
  br label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  tail call void @free(i8* %14) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader.preheader:
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader3._crit_edge..preheader4.preheader_crit_edge, %.preheader4.preheader.preheader
  %indvars.iv = phi i2 [ 0, %.preheader4.preheader.preheader ], [ %indvars.iv.next38, %.preheader3._crit_edge..preheader4.preheader_crit_edge ]
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %.preheader3._crit_edge..preheader4.preheader_crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %2 = zext i2 %indvars.iv to i64
  %3 = add nsw i64 %indvars.iv1827, -1
  %exitcond1222 = icmp eq i64 %indvars.iv1827, 0
  br i1 %exitcond1222, label %.preheader4.preheader..preheader3._crit_edge_crit_edge, label %.preheader.preheader.preheader

.preheader4.preheader..preheader3._crit_edge_crit_edge: ; preds = %.preheader4.preheader
  br label %.preheader3._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  br label %.preheader.preheader

.lr.ph26:                                         ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %.pre31 = load double, double* %5, align 8
  %xtraiter33 = and i64 %indvars.iv1827, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.lr.ph26..preheader3.prol.loopexit_crit_edge, label %.preheader3.prol.preheader

.lr.ph26..preheader3.prol.loopexit_crit_edge:     ; preds = %.lr.ph26
  br label %.preheader3.prol.loopexit

.preheader3.prol.preheader:                       ; preds = %.lr.ph26
  br label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.preheader3.prol..preheader3.prol_crit_edge, %.preheader3.prol.preheader
  %6 = phi double [ %.pre31, %.preheader3.prol.preheader ], [ %10, %.preheader3.prol..preheader3.prol_crit_edge ]
  %indvars.iv1325.prol = phi i64 [ 0, %.preheader3.prol.preheader ], [ %indvars.iv.next14.prol, %.preheader3.prol..preheader3.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter33, %.preheader3.prol.preheader ], [ %prol.iter.sub, %.preheader3.prol..preheader3.prol_crit_edge ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv1325.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader3.prol.loopexit.unr-lcssa, label %.preheader3.prol..preheader3.prol_crit_edge, !llvm.loop !20

.preheader3.prol..preheader3.prol_crit_edge:      ; preds = %.preheader3.prol
  br label %.preheader3.prol

.preheader3.prol.loopexit.unr-lcssa:              ; preds = %.preheader3.prol
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.lr.ph26..preheader3.prol.loopexit_crit_edge, %.preheader3.prol.loopexit.unr-lcssa
  %.unr35 = phi double [ %.pre31, %.lr.ph26..preheader3.prol.loopexit_crit_edge ], [ %10, %.preheader3.prol.loopexit.unr-lcssa ]
  %indvars.iv1325.unr = phi i64 [ 0, %.lr.ph26..preheader3.prol.loopexit_crit_edge ], [ %2, %.preheader3.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %3, 3
  br i1 %11, label %.preheader3.prol.loopexit..preheader3._crit_edge.loopexit_crit_edge, label %.lr.ph26.new

.preheader3.prol.loopexit..preheader3._crit_edge.loopexit_crit_edge: ; preds = %.preheader3.prol.loopexit
  br label %.preheader3._crit_edge.loopexit

.lr.ph26.new:                                     ; preds = %.preheader3.prol.loopexit
  br label %.preheader3

.preheader.preheader:                             ; preds = %.preheader4..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %.preheader4..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %exitcond20 = icmp eq i64 %indvars.iv723, 0
  br i1 %exitcond20, label %.preheader.preheader..preheader4_crit_edge, label %.lr.ph

.preheader.preheader..preheader4_crit_edge:       ; preds = %.preheader.preheader
  %.pre30 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader4

.lr.ph:                                           ; preds = %.preheader.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv723
  %.pre = load double, double* %12, align 8
  %xtraiter = and i64 %indvars.iv723, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge, label %.preheader.prol.preheader

.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.preheader:                        ; preds = %.lr.ph
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %13 = load double, double* %4, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %12, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %17, %.preheader.prol ], [ undef, %.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %17, %.preheader.prol ], [ %.pre, %.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv21.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph..preheader.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %indvars.iv723, 1
  br i1 %18, label %.preheader.prol.loopexit..preheader4.loopexit_crit_edge, label %.lr.ph.new

.preheader.prol.loopexit..preheader4.loopexit_crit_edge: ; preds = %.preheader.prol.loopexit
  br label %.preheader4.loopexit

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.lr.ph.new
  %19 = phi double [ %.unr.ph, %.lr.ph.new ], [ %31, %.preheader..preheader_crit_edge ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader..preheader_crit_edge ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv21
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv21
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv723
  br i1 %exitcond.1, label %.preheader4.loopexit.unr-lcssa, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.preheader4.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.preheader.prol.loopexit..preheader4.loopexit_crit_edge, %.preheader4.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit..preheader4.loopexit_crit_edge ], [ %31, %.preheader4.loopexit.unr-lcssa ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.preheader..preheader4_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader.preheader..preheader4_crit_edge ], [ %12, %.preheader4.loopexit ]
  %32 = phi double [ %.pre30, %.preheader.preheader..preheader4_crit_edge ], [ %.lcssa, %.preheader4.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv723
  %34 = load double, double* %33, align 8
  %35 = fdiv double %32, %34
  store double %35, double* %.pre-phi, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1827
  br i1 %exitcond12, label %.lr.ph26, label %.preheader4..preheader.preheader_crit_edge

.preheader4..preheader.preheader_crit_edge:       ; preds = %.preheader4
  br label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3..preheader3_crit_edge, %.lr.ph26.new
  %36 = phi double [ %.unr35, %.lr.ph26.new ], [ %52, %.preheader3..preheader3_crit_edge ]
  %indvars.iv1325 = phi i64 [ %indvars.iv1325.unr, %.lr.ph26.new ], [ %indvars.iv.next14.3, %.preheader3..preheader3_crit_edge ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fsub double %36, %39
  store double %40, double* %5, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1325, 1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fsub double %40, %43
  store double %44, double* %5, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1325, 2
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fsub double %44, %47
  store double %48, double* %5, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv1325, 3
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fsub double %48, %51
  store double %52, double* %5, align 8
  %indvars.iv.next14.3 = add nuw nsw i64 %indvars.iv1325, 4
  %exitcond17.3 = icmp eq i64 %indvars.iv.next14.3, %indvars.iv1827
  br i1 %exitcond17.3, label %.preheader3._crit_edge.loopexit.unr-lcssa, label %.preheader3..preheader3_crit_edge

.preheader3..preheader3_crit_edge:                ; preds = %.preheader3
  br label %.preheader3

.preheader3._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader3
  br label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3.prol.loopexit..preheader3._crit_edge.loopexit_crit_edge, %.preheader3._crit_edge.loopexit.unr-lcssa
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader4.preheader..preheader3._crit_edge_crit_edge, %.preheader3._crit_edge.loopexit
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %54 = load double, double* %53, align 8
  %55 = tail call double @sqrt(double %54) #3
  store double %55, double* %53, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next19, 2000
  %indvars.iv.next38 = add i2 %indvars.iv, 1
  br i1 %exitcond28, label %._crit_edge, label %.preheader3._crit_edge..preheader4.preheader_crit_edge

.preheader3._crit_edge..preheader4.preheader_crit_edge: ; preds = %.preheader3._crit_edge
  br label %.preheader4.preheader

._crit_edge:                                      ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %..preheader.preheader_crit_edge, %.preheader.preheader.preheader
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %..preheader.preheader_crit_edge ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next7, %..preheader.preheader_crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv69, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader..preheader._crit_edge_crit_edge, %.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader..preheader._crit_edge_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv8, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.preheader._crit_edge..preheader_crit_edge

.preheader._crit_edge..preheader_crit_edge:       ; preds = %.preheader._crit_edge
  br label %.preheader

; <label>:11:                                     ; preds = %.preheader._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge..preheader_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv8
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv410
  br i1 %exitcond, label %17, label %.preheader..preheader._crit_edge_crit_edge

.preheader..preheader._crit_edge_crit_edge:       ; preds = %.preheader
  br label %.preheader._crit_edge

; <label>:17:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 2000
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  br i1 %exitcond11, label %._crit_edge, label %..preheader.preheader_crit_edge

..preheader.preheader_crit_edge:                  ; preds = %17
  br label %.preheader.preheader

._crit_edge:                                      ; preds = %17
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
