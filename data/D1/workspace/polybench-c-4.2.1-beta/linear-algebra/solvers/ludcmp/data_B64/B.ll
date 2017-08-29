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
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.._crit_edge23_crit_edge, %4
  %indvars.iv11422 = phi i64 [ 0, %4 ], [ %indvars.iv.next115.1, %._crit_edge23.._crit_edge23_crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv11422
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv11422
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next115 = or i64 %indvars.iv11422, 1
  %9 = trunc i64 %indvars.iv.next115 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv11422
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv11422, 2
  %12 = trunc i64 %indvars.iv.next115.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond116.1 = icmp eq i64 %indvars.iv.next115.1, 2000
  br i1 %exitcond116.1, label %.preheader7.preheader, label %._crit_edge23.._crit_edge23_crit_edge

._crit_edge23.._crit_edge23_crit_edge:            ; preds = %._crit_edge23
  br label %._crit_edge23

.preheader7.preheader:                            ; preds = %._crit_edge23
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge..preheader7_crit_edge, %.preheader7.preheader
  %indvars.iv10921 = phi i64 [ %indvars.iv.next110, %._crit_edge..preheader7_crit_edge ], [ 1, %.preheader7.preheader ]
  %indvars.iv11119 = phi i64 [ %indvars.iv.next112, %._crit_edge..preheader7_crit_edge ], [ 0, %.preheader7.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv11119, 2001
  %21 = add nuw nsw i64 %20, 1
  %22 = mul nsw i64 %indvars.iv11119, -8
  br label %._crit_edge24

.preheader6:                                      ; preds = %._crit_edge24
  %exitcond10817 = icmp eq i64 %indvars.iv10921, 2000
  br i1 %exitcond10817, label %.preheader6.._crit_edge_crit_edge, label %.lr.ph.._crit_edge_crit_edge

.preheader6.._crit_edge_crit_edge:                ; preds = %.preheader6
  br label %._crit_edge

._crit_edge24:                                    ; preds = %._crit_edge24.._crit_edge24_crit_edge, %.preheader7
  %indvars.iv9916 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next100, %._crit_edge24.._crit_edge24_crit_edge ]
  %23 = sub nsw i64 0, %indvars.iv9916
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2000
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 2.000000e+03
  %28 = fadd double %27, 1.000000e+00
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11119, i64 %indvars.iv9916
  store double %28, double* %29, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv9916, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next100, %indvars.iv10921
  br i1 %exitcond103, label %.preheader6, label %._crit_edge24.._crit_edge24_crit_edge

._crit_edge24.._crit_edge24_crit_edge:            ; preds = %._crit_edge24
  br label %._crit_edge24

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.preheader6
  %30 = add nsw i64 %22, 15992
  %scevgep29 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %21
  %31 = bitcast double* %scevgep29 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %31, i8 0, i64 %30, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader6.._crit_edge_crit_edge, %.lr.ph.._crit_edge_crit_edge
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11119, i64 %indvars.iv11119
  store double 1.000000e+00, double* %32, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv11119, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next112, 2000
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv10921, 1
  br i1 %exitcond113, label %33, label %._crit_edge..preheader7_crit_edge

._crit_edge..preheader7_crit_edge:                ; preds = %._crit_edge
  br label %.preheader7

; <label>:33:                                     ; preds = %._crit_edge
  %34 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader5_crit_edge

..preheader5_crit_edge:                           ; preds = %..preheader5_crit_edge...preheader5_crit_edge_crit_edge, %33
  %indvars.iv9615 = phi i64 [ 0, %33 ], [ %indvars.iv.next97.7, %..preheader5_crit_edge...preheader5_crit_edge_crit_edge ]
  %35 = mul nuw nsw i64 %indvars.iv9615, 16000
  %scevgep = getelementptr i8, i8* %34, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97 = or i64 %indvars.iv9615, 1
  %36 = mul nuw nsw i64 %indvars.iv.next97, 16000
  %scevgep.1 = getelementptr i8, i8* %34, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.1 = or i64 %indvars.iv9615, 2
  %37 = mul nuw nsw i64 %indvars.iv.next97.1, 16000
  %scevgep.2 = getelementptr i8, i8* %34, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.2 = or i64 %indvars.iv9615, 3
  %38 = mul nuw nsw i64 %indvars.iv.next97.2, 16000
  %scevgep.3 = getelementptr i8, i8* %34, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.3 = or i64 %indvars.iv9615, 4
  %39 = mul nuw nsw i64 %indvars.iv.next97.3, 16000
  %scevgep.4 = getelementptr i8, i8* %34, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.4 = or i64 %indvars.iv9615, 5
  %40 = mul nuw nsw i64 %indvars.iv.next97.4, 16000
  %scevgep.5 = getelementptr i8, i8* %34, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.5 = or i64 %indvars.iv9615, 6
  %41 = mul nuw nsw i64 %indvars.iv.next97.5, 16000
  %scevgep.6 = getelementptr i8, i8* %34, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.6 = or i64 %indvars.iv9615, 7
  %42 = mul nuw nsw i64 %indvars.iv.next97.6, 16000
  %scevgep.7 = getelementptr i8, i8* %34, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.7 = add nsw i64 %indvars.iv9615, 8
  %exitcond98.7 = icmp eq i64 %indvars.iv.next97.7, 2000
  br i1 %exitcond98.7, label %.preheader3.preheader, label %..preheader5_crit_edge...preheader5_crit_edge_crit_edge

..preheader5_crit_edge...preheader5_crit_edge_crit_edge: ; preds = %..preheader5_crit_edge
  br label %..preheader5_crit_edge

.preheader3.preheader:                            ; preds = %..preheader5_crit_edge
  %43 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %45 = bitcast i8* %34 to [2000 x [2000 x double]]*
  br label %.preheader3

.preheader3:                                      ; preds = %..preheader3_crit_edge, %.preheader3.preheader
  %indvars.iv9013 = phi i64 [ %46, %..preheader3_crit_edge ], [ 0, %.preheader3.preheader ]
  %scevgep33 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv9013
  %scevgep3334 = bitcast double* %scevgep33 to i8*
  %46 = add nuw nsw i64 %indvars.iv9013, 1
  %scevgep35 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %46
  %scevgep3536 = bitcast double* %scevgep35 to i8*
  br label %.preheader2

.preheader2:                                      ; preds = %middle.block..preheader2_crit_edge, %.preheader3
  %indvars.iv8712 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next88, %middle.block..preheader2_crit_edge ]
  %47 = mul nuw nsw i64 %indvars.iv8712, 16000
  %scevgep31 = getelementptr i8, i8* %34, i64 %47
  %48 = add nuw nsw i64 %47, 16000
  %scevgep32 = getelementptr i8, i8* %34, i64 %48
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8712, i64 %indvars.iv9013
  %bound0 = icmp ult i8* %scevgep31, %scevgep3536
  %bound1 = icmp ult i8* %scevgep3334, %scevgep32
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %49 to i8*
  %bound038 = icmp ult i8* %scevgep31, %bc
  %bound139 = icmp ult i8* %bc, %scevgep32
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx = or i1 %found.conflict, %found.conflict40
  br i1 %conflict.rdx, label %._crit_edge26.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader2
  br label %vector.body

._crit_edge26.preheader:                          ; preds = %.preheader2
  br label %._crit_edge26

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %50 = or i64 %index, 1
  %51 = or i64 %index, 2
  %52 = or i64 %index, 3
  %53 = load double, double* %49, align 8, !alias.scope !1
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv9013
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %50, i64 %indvars.iv9013
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %51, i64 %indvars.iv9013
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv9013
  %60 = load double, double* %56, align 8, !alias.scope !4
  %61 = load double, double* %57, align 8, !alias.scope !4
  %62 = load double, double* %58, align 8, !alias.scope !4
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = fmul <2 x double> %55, %65
  %69 = fmul <2 x double> %55, %67
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv8712, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %74 = fadd <2 x double> %wide.load, %68
  %75 = fadd <2 x double> %wide.load42, %69
  store <2 x double> %74, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %75, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %76 = icmp eq i64 %index.next, 2000
  br i1 %76, label %middle.block.loopexit72, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge26:                                    ; preds = %._crit_edge26.._crit_edge26_crit_edge, %._crit_edge26.preheader
  %indvars.iv8411 = phi i64 [ 0, %._crit_edge26.preheader ], [ %indvars.iv.next85.1, %._crit_edge26.._crit_edge26_crit_edge ]
  %77 = load double, double* %49, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8411, i64 %indvars.iv9013
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv8712, i64 %indvars.iv8411
  %82 = load double, double* %81, align 8
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8
  %indvars.iv.next85 = or i64 %indvars.iv8411, 1
  %84 = load double, double* %49, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next85, i64 %indvars.iv9013
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv8712, i64 %indvars.iv.next85
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv8411, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next85.1, 2000
  br i1 %exitcond86.1, label %middle.block.loopexit, label %._crit_edge26.._crit_edge26_crit_edge, !llvm.loop !12

._crit_edge26.._crit_edge26_crit_edge:            ; preds = %._crit_edge26
  br label %._crit_edge26

middle.block.loopexit:                            ; preds = %._crit_edge26
  br label %middle.block

middle.block.loopexit72:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit72, %middle.block.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv8712, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next88, 2000
  br i1 %exitcond89, label %91, label %middle.block..preheader2_crit_edge

middle.block..preheader2_crit_edge:               ; preds = %middle.block
  br label %.preheader2

; <label>:91:                                     ; preds = %middle.block
  %exitcond92 = icmp eq i64 %46, 2000
  br i1 %exitcond92, label %.preheader.preheader, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %91
  br label %.preheader3

.preheader.preheader:                             ; preds = %91
  %92 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %93 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %94 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %95 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %96 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %97 = bitcast i8* %34 to [2000 x [2000 x double]]*
  %98 = bitcast i8* %34 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %middle.block44..preheader_crit_edge, %.preheader.preheader
  %indvars.iv8110 = phi i64 [ %99, %middle.block44..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep48 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 0
  %scevgep4849 = bitcast double* %scevgep48 to i8*
  %99 = add nuw nsw i64 %indvars.iv8110, 1
  %scevgep50 = getelementptr [2000 x double], [2000 x double]* %0, i64 %99, i64 0
  %scevgep5051 = bitcast double* %scevgep50 to i8*
  %100 = mul nuw nsw i64 %indvars.iv8110, 16000
  %scevgep52 = getelementptr i8, i8* %34, i64 %100
  %101 = add nuw nsw i64 %100, 16000
  %scevgep53 = getelementptr i8, i8* %34, i64 %101
  %bound054 = icmp ult i8* %scevgep4849, %scevgep53
  %bound155 = icmp ult i8* %scevgep52, %scevgep5051
  %memcheck.conflict57 = and i1 %bound054, %bound155
  br i1 %memcheck.conflict57, label %._crit_edge27.preheader, label %vector.body43.preheader

vector.body43.preheader:                          ; preds = %.preheader
  br label %vector.body43

._crit_edge27.preheader:                          ; preds = %.preheader
  br label %._crit_edge27

vector.body43:                                    ; preds = %vector.body43.vector.body43_crit_edge, %vector.body43.preheader
  %index60 = phi i64 [ 0, %vector.body43.preheader ], [ %index.next61.1, %vector.body43.vector.body43_crit_edge ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv8110, i64 %index60
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load68 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load69 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %index60
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load68, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load69, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %index.next61 = or i64 %index60, 4
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv8110, i64 %index.next61
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load68.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load69.1 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %index.next61
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load68.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load69.1, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next61.1 = add nsw i64 %index60, 8
  %118 = icmp eq i64 %index.next61.1, 2000
  br i1 %118, label %middle.block44.loopexit71, label %vector.body43.vector.body43_crit_edge, !llvm.loop !18

vector.body43.vector.body43_crit_edge:            ; preds = %vector.body43
  br label %vector.body43

._crit_edge27:                                    ; preds = %._crit_edge27.._crit_edge27_crit_edge, %._crit_edge27.preheader
  %indvars.iv9 = phi i64 [ 0, %._crit_edge27.preheader ], [ %indvars.iv.next.4, %._crit_edge27.._crit_edge27_crit_edge ]
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %92, i64 0, i64 %indvars.iv8110, i64 %indvars.iv9
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %indvars.iv9
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv8110, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %indvars.iv.next
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv9, 2
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv8110, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %indvars.iv.next.1
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv9, 3
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %95, i64 0, i64 %indvars.iv8110, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %indvars.iv.next.2
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv9, 4
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv8110, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8110, i64 %indvars.iv.next.3
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv9, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block44.loopexit, label %._crit_edge27.._crit_edge27_crit_edge, !llvm.loop !19

._crit_edge27.._crit_edge27_crit_edge:            ; preds = %._crit_edge27
  br label %._crit_edge27

middle.block44.loopexit:                          ; preds = %._crit_edge27
  br label %middle.block44

middle.block44.loopexit71:                        ; preds = %vector.body43
  br label %middle.block44

middle.block44:                                   ; preds = %middle.block44.loopexit71, %middle.block44.loopexit
  %exitcond83 = icmp eq i64 %99, 2000
  br i1 %exitcond83, label %144, label %middle.block44..preheader_crit_edge

middle.block44..preheader_crit_edge:              ; preds = %middle.block44
  br label %.preheader

; <label>:144:                                    ; preds = %middle.block44
  call void @free(i8* nonnull %34) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge39..preheader3_crit_edge, %4
  %indvars.iv12640 = phi i64 [ 0, %4 ], [ %indvars.iv.next127, %._crit_edge39..preheader3_crit_edge ]
  %exitcond11526 = icmp eq i64 %indvars.iv12640, 0
  br i1 %exitcond11526, label %.preheader3.vector.body.preheader_crit_edge, label %.lr.ph28.preheader

.preheader3.vector.body.preheader_crit_edge:      ; preds = %.preheader3
  br label %vector.body.preheader

.lr.ph28.preheader:                               ; preds = %.preheader3
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 0
  br label %.lr.ph28

.lr.ph38:                                         ; preds = %._crit_edge24
  br i1 false, label %.lr.ph38.vector.body.preheader_crit_edge, label %.lr.ph38.split.preheader

.lr.ph38.vector.body.preheader_crit_edge:         ; preds = %.lr.ph38
  br label %vector.body.preheader

.lr.ph38.split.preheader:                         ; preds = %.lr.ph38
  %xtraiter75 = and i64 %indvars.iv12640, 1
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  %6 = icmp eq i64 %indvars.iv12640, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 0
  br label %.lr.ph38.split

vector.body.preheader:                            ; preds = %.preheader3.vector.body.preheader_crit_edge, %.lr.ph38.vector.body.preheader_crit_edge
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.3, %vector.body.vector.body_crit_edge ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %index
  %9 = bitcast double* %8 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x i64>*
  %wide.load62 = load <2 x i64>, <2 x i64>* %11, align 8
  store <2 x i64> %wide.load, <2 x i64>* %9, align 8
  store <2 x i64> %wide.load62, <2 x i64>* %11, align 8
  %index.next = or i64 %index, 4
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %index.next
  %13 = bitcast double* %12 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load62.1 = load <2 x i64>, <2 x i64>* %15, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %13, align 8
  store <2 x i64> %wide.load62.1, <2 x i64>* %15, align 8
  %index.next.1 = or i64 %index, 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %index.next.1
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load62.2 = load <2 x i64>, <2 x i64>* %19, align 8
  store <2 x i64> %wide.load.2, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load62.2, <2 x i64>* %19, align 8
  %index.next.2 = or i64 %index, 12
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %index.next.2
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load62.3 = load <2 x i64>, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load.3, <2 x i64>* %21, align 8
  store <2 x i64> %wide.load62.3, <2 x i64>* %23, align 8
  %index.next.3 = add nsw i64 %index, 16
  %24 = icmp eq i64 %index.next.3, 2000
  br i1 %24, label %._crit_edge39.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !20

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.lr.ph28:                                         ; preds = %._crit_edge24..lr.ph28_crit_edge, %.lr.ph28.preheader
  %indvars.iv11027 = phi i64 [ %indvars.iv.next111, %._crit_edge24..lr.ph28_crit_edge ], [ 0, %.lr.ph28.preheader ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %indvars.iv11027
  %26 = load double, double* %25, align 8
  %exitcond10919 = icmp eq i64 %indvars.iv11027, 0
  br i1 %exitcond10919, label %.lr.ph28.._crit_edge24_crit_edge, label %.lr.ph23.preheader

.lr.ph28.._crit_edge24_crit_edge:                 ; preds = %.lr.ph28
  br label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph28
  %xtraiter73 = and i64 %indvars.iv11027, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge, label %.lr.ph23.prol.preheader

.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol.loopexit.unr-lcssa

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol.preheader
  %27 = load double, double* %5, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv11027
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %26, %30
  br label %.lr.ph23.prol.loopexit.unr-lcssa

.lr.ph23.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph23.prol
  %.lcssa68.unr.ph = phi double [ %31, %.lr.ph23.prol ], [ undef, %.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge ]
  %.021.unr.ph = phi double [ %31, %.lr.ph23.prol ], [ %26, %.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv10520.unr.ph = phi i64 [ 1, %.lr.ph23.prol ], [ 0, %.lr.ph23.preheader..lr.ph23.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.unr-lcssa
  %32 = icmp eq i64 %indvars.iv11027, 1
  br i1 %32, label %.lr.ph23.prol.loopexit.._crit_edge24.loopexit_crit_edge, label %.lr.ph23.preheader.new

.lr.ph23.prol.loopexit.._crit_edge24.loopexit_crit_edge: ; preds = %.lr.ph23.prol.loopexit
  br label %._crit_edge24.loopexit

.lr.ph23.preheader.new:                           ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23..lr.ph23_crit_edge, %.lr.ph23.preheader.new
  %.021 = phi double [ %.021.unr.ph, %.lr.ph23.preheader.new ], [ %46, %.lr.ph23..lr.ph23_crit_edge ]
  %indvars.iv10520 = phi i64 [ %indvars.iv10520.unr.ph, %.lr.ph23.preheader.new ], [ %indvars.iv.next106.1, %.lr.ph23..lr.ph23_crit_edge ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %indvars.iv10520
  %34 = bitcast double* %33 to <2 x double>*
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10520, i64 %indvars.iv11027
  %36 = load double, double* %35, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv10520, 1
  %37 = load <2 x double>, <2 x double>* %34, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next106, i64 %indvars.iv11027
  %39 = load double, double* %38, align 8
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %37, %41
  %43 = extractelement <2 x double> %42, i32 0
  %44 = extractelement <2 x double> %42, i32 1
  %45 = fsub double %.021, %43
  %46 = fsub double %45, %44
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv10520, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next106.1, %indvars.iv11027
  br i1 %exitcond109.1, label %._crit_edge24.loopexit.unr-lcssa, label %.lr.ph23..lr.ph23_crit_edge

.lr.ph23..lr.ph23_crit_edge:                      ; preds = %.lr.ph23
  br label %.lr.ph23

._crit_edge24.loopexit.unr-lcssa:                 ; preds = %.lr.ph23
  br label %._crit_edge24.loopexit

._crit_edge24.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.._crit_edge24.loopexit_crit_edge, %._crit_edge24.loopexit.unr-lcssa
  %.lcssa68 = phi double [ %.lcssa68.unr.ph, %.lr.ph23.prol.loopexit.._crit_edge24.loopexit_crit_edge ], [ %46, %._crit_edge24.loopexit.unr-lcssa ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %.lr.ph28.._crit_edge24_crit_edge, %._crit_edge24.loopexit
  %.0.lcssa = phi double [ %26, %.lr.ph28.._crit_edge24_crit_edge ], [ %.lcssa68, %._crit_edge24.loopexit ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11027, i64 %indvars.iv11027
  %48 = load double, double* %47, align 8
  %49 = fdiv double %.0.lcssa, %48
  store double %49, double* %25, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv11027, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next111, %indvars.iv12640
  br i1 %exitcond115, label %.lr.ph38, label %._crit_edge24..lr.ph28_crit_edge

._crit_edge24..lr.ph28_crit_edge:                 ; preds = %._crit_edge24
  br label %.lr.ph28

.lr.ph38.split:                                   ; preds = %._crit_edge34..lr.ph38.split_crit_edge, %.lr.ph38.split.preheader
  %indvars.iv12337 = phi i64 [ %indvars.iv.next124, %._crit_edge34..lr.ph38.split_crit_edge ], [ %indvars.iv12640, %.lr.ph38.split.preheader ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %indvars.iv12337
  %51 = load double, double* %50, align 8
  br i1 %lcmp.mod76, label %.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge42.prol.preheader

.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph38.split
  br label %._crit_edge42.prol.loopexit.unr-lcssa

._crit_edge42.prol.preheader:                     ; preds = %.lr.ph38.split
  br label %._crit_edge42.prol

._crit_edge42.prol:                               ; preds = %._crit_edge42.prol.preheader
  %52 = load double, double* %7, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv12337
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %51, %55
  br label %._crit_edge42.prol.loopexit.unr-lcssa

._crit_edge42.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge42.prol
  %.lcssa69.unr.ph = phi double [ %56, %._crit_edge42.prol ], [ undef, %.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge ]
  %.131.unr.ph = phi double [ %56, %._crit_edge42.prol ], [ %51, %.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv11630.unr.ph = phi i64 [ 1, %._crit_edge42.prol ], [ 0, %.lr.ph38.split.._crit_edge42.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge42.prol.loopexit

._crit_edge42.prol.loopexit:                      ; preds = %._crit_edge42.prol.loopexit.unr-lcssa
  br i1 %6, label %._crit_edge42.prol.loopexit.._crit_edge34_crit_edge, label %.lr.ph38.split.new

._crit_edge42.prol.loopexit.._crit_edge34_crit_edge: ; preds = %._crit_edge42.prol.loopexit
  br label %._crit_edge34

.lr.ph38.split.new:                               ; preds = %._crit_edge42.prol.loopexit
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.._crit_edge42_crit_edge, %.lr.ph38.split.new
  %.131 = phi double [ %.131.unr.ph, %.lr.ph38.split.new ], [ %70, %._crit_edge42.._crit_edge42_crit_edge ]
  %indvars.iv11630 = phi i64 [ %indvars.iv11630.unr.ph, %.lr.ph38.split.new ], [ %indvars.iv.next117.1, %._crit_edge42.._crit_edge42_crit_edge ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv12640, i64 %indvars.iv11630
  %58 = bitcast double* %57 to <2 x double>*
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11630, i64 %indvars.iv12337
  %60 = load double, double* %59, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv11630, 1
  %61 = load <2 x double>, <2 x double>* %58, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next117, i64 %indvars.iv12337
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fmul <2 x double> %61, %65
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fsub double %.131, %67
  %70 = fsub double %69, %68
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv11630, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next117.1, %indvars.iv12640
  br i1 %exitcond120.1, label %._crit_edge34.unr-lcssa, label %._crit_edge42.._crit_edge42_crit_edge

._crit_edge42.._crit_edge42_crit_edge:            ; preds = %._crit_edge42
  br label %._crit_edge42

._crit_edge34.unr-lcssa:                          ; preds = %._crit_edge42
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge42.prol.loopexit.._crit_edge34_crit_edge, %._crit_edge34.unr-lcssa
  %.lcssa69 = phi double [ %.lcssa69.unr.ph, %._crit_edge42.prol.loopexit.._crit_edge34_crit_edge ], [ %70, %._crit_edge34.unr-lcssa ]
  store double %.lcssa69, double* %50, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv12337, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next124, 2000
  br i1 %exitcond125, label %._crit_edge39.loopexit63, label %._crit_edge34..lr.ph38.split_crit_edge

._crit_edge34..lr.ph38.split_crit_edge:           ; preds = %._crit_edge34
  br label %.lr.ph38.split

._crit_edge39.loopexit:                           ; preds = %vector.body
  br label %._crit_edge39

._crit_edge39.loopexit63:                         ; preds = %._crit_edge34
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit63, %._crit_edge39.loopexit
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv12640, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next127, 2000
  br i1 %exitcond128, label %.preheader1.preheader, label %._crit_edge39..preheader3_crit_edge

._crit_edge39..preheader3_crit_edge:              ; preds = %._crit_edge39
  br label %.preheader3

.preheader1.preheader:                            ; preds = %._crit_edge39
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.backedge, %.preheader1.preheader
  %indvars.iv10217 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv10217.be, %.preheader1.backedge ]
  %71 = getelementptr inbounds double, double* %1, i64 %indvars.iv10217
  %72 = load double, double* %71, align 8
  %exitcond10110 = icmp eq i64 %indvars.iv10217, 0
  br i1 %exitcond10110, label %._crit_edge15.thread, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %.preheader1
  %73 = add i64 %indvars.iv10217, -1
  %xtraiter70 = and i64 %indvars.iv10217, 3
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  br i1 %lcmp.mod71, label %.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge, label %.lr.ph14.prol.preheader

.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge: ; preds = %.lr.ph14.preheader
  br label %.lr.ph14.prol.loopexit

.lr.ph14.prol.preheader:                          ; preds = %.lr.ph14.preheader
  br label %.lr.ph14.prol

.lr.ph14.prol:                                    ; preds = %.lr.ph14.prol..lr.ph14.prol_crit_edge, %.lr.ph14.prol.preheader
  %.212.prol = phi double [ %79, %.lr.ph14.prol..lr.ph14.prol_crit_edge ], [ %72, %.lr.ph14.prol.preheader ]
  %indvars.iv9711.prol = phi i64 [ %indvars.iv.next98.prol, %.lr.ph14.prol..lr.ph14.prol_crit_edge ], [ 0, %.lr.ph14.prol.preheader ]
  %prol.iter72 = phi i64 [ %prol.iter72.sub, %.lr.ph14.prol..lr.ph14.prol_crit_edge ], [ %xtraiter70, %.lr.ph14.prol.preheader ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10217, i64 %indvars.iv9711.prol
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv9711.prol
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fsub double %.212.prol, %78
  %indvars.iv.next98.prol = add nuw nsw i64 %indvars.iv9711.prol, 1
  %prol.iter72.sub = add i64 %prol.iter72, -1
  %prol.iter72.cmp = icmp eq i64 %prol.iter72.sub, 0
  br i1 %prol.iter72.cmp, label %.lr.ph14.prol.loopexit.unr-lcssa, label %.lr.ph14.prol..lr.ph14.prol_crit_edge, !llvm.loop !21

.lr.ph14.prol..lr.ph14.prol_crit_edge:            ; preds = %.lr.ph14.prol
  br label %.lr.ph14.prol

.lr.ph14.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph14.prol
  br label %.lr.ph14.prol.loopexit

.lr.ph14.prol.loopexit:                           ; preds = %.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge, %.lr.ph14.prol.loopexit.unr-lcssa
  %.lcssa67.unr = phi double [ undef, %.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge ], [ %79, %.lr.ph14.prol.loopexit.unr-lcssa ]
  %.212.unr = phi double [ %72, %.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge ], [ %79, %.lr.ph14.prol.loopexit.unr-lcssa ]
  %indvars.iv9711.unr = phi i64 [ 0, %.lr.ph14.preheader..lr.ph14.prol.loopexit_crit_edge ], [ %indvars.iv.next98.prol, %.lr.ph14.prol.loopexit.unr-lcssa ]
  %80 = icmp ult i64 %73, 3
  br i1 %80, label %.lr.ph14.prol.loopexit.._crit_edge15_crit_edge, label %.lr.ph14.preheader.new

.lr.ph14.prol.loopexit.._crit_edge15_crit_edge:   ; preds = %.lr.ph14.prol.loopexit
  br label %._crit_edge15

.lr.ph14.preheader.new:                           ; preds = %.lr.ph14.prol.loopexit
  br label %.lr.ph14

._crit_edge15.thread:                             ; preds = %.preheader1
  store double %72, double* %3, align 8
  br label %.preheader1.backedge

.preheader1.backedge:                             ; preds = %._crit_edge15..preheader1.backedge_crit_edge, %._crit_edge15.thread
  %indvars.iv10217.be = phi i64 [ 1, %._crit_edge15.thread ], [ %indvars.iv.next103, %._crit_edge15..preheader1.backedge_crit_edge ]
  br label %.preheader1

.lr.ph14:                                         ; preds = %.lr.ph14..lr.ph14_crit_edge, %.lr.ph14.preheader.new
  %.212 = phi double [ %.212.unr, %.lr.ph14.preheader.new ], [ %102, %.lr.ph14..lr.ph14_crit_edge ]
  %indvars.iv9711 = phi i64 [ %indvars.iv9711.unr, %.lr.ph14.preheader.new ], [ %indvars.iv.next98.3, %.lr.ph14..lr.ph14_crit_edge ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10217, i64 %indvars.iv9711
  %82 = bitcast double* %81 to <2 x double>*
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv9711
  %84 = bitcast double* %83 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %82, align 8
  %86 = load <2 x double>, <2 x double>* %84, align 8
  %87 = fmul <2 x double> %85, %86
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = fsub double %.212, %88
  %91 = fsub double %90, %89
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv9711, 2
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10217, i64 %indvars.iv.next98.1
  %93 = bitcast double* %92 to <2 x double>*
  %94 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next98.1
  %95 = bitcast double* %94 to <2 x double>*
  %96 = load <2 x double>, <2 x double>* %93, align 8
  %97 = load <2 x double>, <2 x double>* %95, align 8
  %98 = fmul <2 x double> %96, %97
  %99 = extractelement <2 x double> %98, i32 0
  %100 = extractelement <2 x double> %98, i32 1
  %101 = fsub double %91, %99
  %102 = fsub double %101, %100
  %indvars.iv.next98.3 = add nsw i64 %indvars.iv9711, 4
  %exitcond101.3 = icmp eq i64 %indvars.iv.next98.3, %indvars.iv10217
  br i1 %exitcond101.3, label %._crit_edge15.unr-lcssa, label %.lr.ph14..lr.ph14_crit_edge

.lr.ph14..lr.ph14_crit_edge:                      ; preds = %.lr.ph14
  br label %.lr.ph14

._crit_edge15.unr-lcssa:                          ; preds = %.lr.ph14
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.lr.ph14.prol.loopexit.._crit_edge15_crit_edge, %._crit_edge15.unr-lcssa
  %.lcssa67 = phi double [ %.lcssa67.unr, %.lr.ph14.prol.loopexit.._crit_edge15_crit_edge ], [ %102, %._crit_edge15.unr-lcssa ]
  %103 = getelementptr inbounds double, double* %3, i64 %indvars.iv10217
  store double %.lcssa67, double* %103, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv10217, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond104, label %.preheader.preheader, label %._crit_edge15..preheader1.backedge_crit_edge

._crit_edge15..preheader1.backedge_crit_edge:     ; preds = %._crit_edge15
  br label %.preheader1.backedge

.preheader.preheader:                             ; preds = %._crit_edge15
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv9 = phi i64 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv957 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next96, %._crit_edge..preheader_crit_edge ]
  %104 = add i64 %indvar, -1
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv957
  %106 = load double, double* %105, align 8
  %exitcond4 = icmp eq i64 %indvars.iv9, 2000
  br i1 %exitcond4, label %.preheader.._crit_edge_crit_edge, label %.lr.ph.preheader

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol.preheader

.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge:  ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.prol.preheader
  %.36.prol = phi double [ %112, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %106, %.lr.ph.prol.preheader ]
  %indvars.iv935.prol = phi i64 [ %indvars.iv.next94.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %indvars.iv9, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv957, i64 %indvars.iv935.prol
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds double, double* %2, i64 %indvars.iv935.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fsub double %.36.prol, %111
  %indvars.iv.next94.prol = add nuw nsw i64 %indvars.iv935.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !23

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %112, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.36.unr = phi double [ %106, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %112, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv935.unr = phi i64 [ %indvars.iv9, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %indvars.iv.next94.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %113 = icmp ult i64 %104, 3
  br i1 %113, label %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge, label %.lr.ph.preheader.new

.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge.loopexit

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader.new
  %.36 = phi double [ %.36.unr, %.lr.ph.preheader.new ], [ %135, %.lr.ph..lr.ph_crit_edge ]
  %indvars.iv935 = phi i64 [ %indvars.iv935.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next94.3, %.lr.ph..lr.ph_crit_edge ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv957, i64 %indvars.iv935
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv935
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %.36, %121
  %124 = fsub double %123, %122
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv935, 2
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv957, i64 %indvars.iv.next94.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next94.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %124, %132
  %135 = fsub double %134, %133
  %indvars.iv.next94.3 = add nsw i64 %indvars.iv935, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next94.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %135, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %.3.lcssa = phi double [ %106, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv957, i64 %indvars.iv957
  %137 = load double, double* %136, align 8
  %138 = fdiv double %.3.lcssa, %137
  %139 = getelementptr inbounds double, double* %2, i64 %indvars.iv957
  store double %138, double* %139, align 8
  %140 = icmp sgt i64 %indvars.iv957, 0
  br i1 %140, label %._crit_edge..preheader_crit_edge, label %141

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next96 = add nsw i64 %indvars.iv957, -1
  %indvars.iv.next = add nsw i64 %indvars.iv9, -1
  %indvar.next = add i64 %indvar, 1
  br label %.preheader

; <label>:141:                                    ; preds = %._crit_edge
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
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge.._crit_edge2_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge.._crit_edge2_crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2.._crit_edge_crit_edge

._crit_edge2.._crit_edge_crit_edge:               ; preds = %._crit_edge2
  br label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge.._crit_edge2_crit_edge

._crit_edge.._crit_edge2_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge2

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !22}
