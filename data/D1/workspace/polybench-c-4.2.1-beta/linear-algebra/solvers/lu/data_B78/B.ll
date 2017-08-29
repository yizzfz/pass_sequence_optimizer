; ModuleID = 'A.ll'
source_filename = "lu.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu([2000 x double]* %4)
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
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %1, %._crit_edge..preheader14_crit_edge
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge..preheader14_crit_edge ], [ 0, %1 ]
  %2 = sub i64 1998, %indvars.iv28
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %6

.preheader13:                                     ; preds = %6
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %5 = icmp slt i64 %indvars.iv.next29, 2000
  br i1 %5, label %._crit_edge..preheader14_crit_edge, label %16

; <label>:6:                                      ; preds = %6, %.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %6 ], [ 0, %.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv16
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv16
  store double %12, double* %13, align 8
  %exitcond20 = icmp eq i64 %indvars.iv16, %indvars.iv28
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond20, label %.preheader13, label %6

._crit_edge..preheader14_crit_edge:               ; preds = %.preheader13
  %14 = add nuw nsw i64 %4, 8
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next29
  %scevgep2627 = bitcast double* %scevgep26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2627, i8 0, i64 %14, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  store double 1.000000e+00, double* %15, align 8
  br label %.lr.ph

; <label>:16:                                     ; preds = %.preheader13
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %..preheader12_crit_edge

..preheader12_crit_edge:                          ; preds = %..preheader12_crit_edge, %16
  %indvars.iv14 = phi i64 [ 0, %16 ], [ %indvars.iv.next15.7, %..preheader12_crit_edge ]
  %19 = mul nuw nsw i64 %indvars.iv14, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %20 = mul nuw nsw i64 %indvars.iv.next15, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %21 = mul nuw nsw i64 %indvars.iv.next15.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.2 = or i64 %indvars.iv14, 3
  %22 = mul nuw nsw i64 %indvars.iv.next15.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.3 = or i64 %indvars.iv14, 4
  %23 = mul nuw nsw i64 %indvars.iv.next15.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.4 = or i64 %indvars.iv14, 5
  %24 = mul nuw nsw i64 %indvars.iv.next15.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.5 = or i64 %indvars.iv14, 6
  %25 = mul nuw nsw i64 %indvars.iv.next15.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.6 = or i64 %indvars.iv14, 7
  %26 = mul nuw nsw i64 %indvars.iv.next15.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.7 = add nsw i64 %indvars.iv14, 8
  %exitcond33.7 = icmp eq i64 %indvars.iv.next15.7, 2000
  br i1 %exitcond33.7, label %.preheader10.preheader, label %..preheader12_crit_edge

.preheader10.preheader:                           ; preds = %..preheader12_crit_edge
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader10

.preheader10:                                     ; preds = %73, %.preheader10.preheader
  %indvars.iv9 = phi i64 [ %28, %73 ], [ 0, %.preheader10.preheader ]
  %scevgep36 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv9
  %scevgep3637 = bitcast double* %scevgep36 to i8*
  %28 = add i64 %indvars.iv9, 1
  %scevgep38 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %scevgep3839 = bitcast double* %scevgep38 to i8*
  br label %.preheader9

.preheader9:                                      ; preds = %middle.block, %.preheader10
  %indvars.iv7 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next8, %middle.block ]
  %29 = mul i64 %indvars.iv7, 16000
  %scevgep34 = getelementptr i8, i8* %18, i64 %29
  %30 = add i64 %29, 16000
  %scevgep35 = getelementptr i8, i8* %18, i64 %30
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv9
  %bound0 = icmp ult i8* %scevgep34, %scevgep3839
  %bound1 = icmp ult i8* %scevgep3637, %scevgep35
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %31 to i8*
  %bound041 = icmp ult i8* %scevgep34, %bc
  %bound142 = icmp ult i8* %bc, %scevgep35
  %found.conflict43 = and i1 %bound041, %bound142
  %conflict.rdx = or i1 %found.conflict, %found.conflict43
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader9
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %32 = or i64 %index, 1
  %33 = or i64 %index, 2
  %34 = or i64 %index, 3
  %35 = load double, double* %31, align 8, !alias.scope !1
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv9
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %32, i64 %indvars.iv9
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %33, i64 %indvars.iv9
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %34, i64 %indvars.iv9
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %37, %47
  %51 = fmul <2 x double> %37, %49
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv7, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = fadd <2 x double> %wide.load, %50
  %57 = fadd <2 x double> %wide.load45, %51
  store <2 x double> %56, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %57, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %58 = icmp eq i64 %index.next, 2000
  br i1 %58, label %middle.block.loopexit75, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv4 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next5.1, %scalar.ph ]
  %59 = load double, double* %31, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv9
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %66 = load double, double* %31, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv9
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5, 1999
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  br i1 %exitcond6.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit75:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit75, %middle.block.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond31, label %73, label %.preheader9

; <label>:73:                                     ; preds = %middle.block
  %exitcond32 = icmp eq i64 %28, 2000
  br i1 %exitcond32, label %.preheader.preheader, label %.preheader10

.preheader.preheader:                             ; preds = %73
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block47
  %indvars.iv2 = phi i64 [ %74, %middle.block47 ], [ 0, %.preheader.preheader ]
  %scevgep51 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 0
  %scevgep5152 = bitcast double* %scevgep51 to i8*
  %74 = add i64 %indvars.iv2, 1
  %scevgep53 = getelementptr [2000 x double], [2000 x double]* %0, i64 %74, i64 0
  %scevgep5354 = bitcast double* %scevgep53 to i8*
  %75 = mul i64 %indvars.iv2, 16000
  %scevgep55 = getelementptr i8, i8* %18, i64 %75
  %76 = add i64 %75, 16000
  %scevgep56 = getelementptr i8, i8* %18, i64 %76
  %bound057 = icmp ult i8* %scevgep5152, %scevgep56
  %bound158 = icmp ult i8* %scevgep55, %scevgep5354
  %memcheck.conflict60 = and i1 %bound057, %bound158
  br i1 %memcheck.conflict60, label %scalar.ph48.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %.preheader
  br label %vector.body46

scalar.ph48.preheader:                            ; preds = %.preheader
  br label %scalar.ph48

vector.body46:                                    ; preds = %vector.body46, %vector.body46.preheader
  %index63 = phi i64 [ 0, %vector.body46.preheader ], [ %index.next64.1, %vector.body46 ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %index63
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load71 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load72 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %index63
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load71, <2 x i64>* %82, align 8, !alias.scope !16, !noalias !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load72, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %index.next64 = or i64 %index63, 4
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %index.next64
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load71.1 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !13
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load72.1 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %index.next64
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load71.1, <2 x i64>* %90, align 8, !alias.scope !16, !noalias !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load72.1, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %index.next64.1 = add nsw i64 %index63, 8
  %93 = icmp eq i64 %index.next64.1, 2000
  br i1 %93, label %middle.block47.loopexit74, label %vector.body46, !llvm.loop !18

scalar.ph48:                                      ; preds = %scalar.ph48, %scalar.ph48.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph48.preheader ], [ %indvars.iv.next.4, %scalar.ph48 ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %indvars.iv
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block47.loopexit, label %scalar.ph48, !llvm.loop !19

middle.block47.loopexit:                          ; preds = %scalar.ph48
  br label %middle.block47

middle.block47.loopexit74:                        ; preds = %vector.body46
  br label %middle.block47

middle.block47:                                   ; preds = %middle.block47.loopexit74, %middle.block47.loopexit
  %exitcond30 = icmp eq i64 %74, 2000
  br i1 %exitcond30, label %119, label %.preheader

; <label>:119:                                    ; preds = %middle.block47
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #0 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %1
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge13 ], [ 0, %1 ]
  %indvars.iv8 = phi i32 [ %indvars.iv.next9, %._crit_edge13 ], [ -1, %1 ]
  %2 = add i64 %indvars.iv16, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv16, 0
  br i1 %4, label %.preheader4.preheader, label %._crit_edge13

.preheader4.preheader:                            ; preds = %.preheader6
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 0
  br label %.preheader4

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count10 = zext i32 %indvars.iv8 to i64
  %6 = and i64 %2, 1
  %lcmp.mod22 = icmp eq i64 %6, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 0
  %8 = icmp eq i64 %3, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge11.us ], [ %indvars.iv16, %.preheader.us.preheader ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv14
  %.pre21 = load double, double* %9, align 8
  br i1 %lcmp.mod22, label %.prol.preheader19, label %.prol.loopexit20.unr-lcssa

.prol.preheader19:                                ; preds = %.preheader.us
  %10 = load double, double* %7, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv14
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre21, %13
  store double %14, double* %9, align 8
  br label %.prol.loopexit20.unr-lcssa

.prol.loopexit20.unr-lcssa:                       ; preds = %.preheader.us, %.prol.preheader19
  %indvars.iv6.unr.ph = phi i64 [ 1, %.prol.preheader19 ], [ 0, %.preheader.us ]
  %.unr23.ph = phi double [ %14, %.prol.preheader19 ], [ %.pre21, %.preheader.us ]
  br i1 %8, label %._crit_edge11.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit20.unr-lcssa
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader.us.new
  %indvars.iv6 = phi i64 [ %indvars.iv6.unr.ph, %.preheader.us.new ], [ %indvars.iv.next7.1, %15 ]
  %16 = phi double [ %.unr23.ph, %.preheader.us.new ], [ %28, %15 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv6
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv14
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv.next7
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next7, i64 %indvars.iv14
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %9, align 8
  %exitcond11.1 = icmp eq i64 %indvars.iv.next7, %wide.trip.count10
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  br i1 %exitcond11.1, label %._crit_edge11.us.unr-lcssa, label %15

._crit_edge11.us.unr-lcssa:                       ; preds = %15
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %.prol.loopexit20.unr-lcssa, %._crit_edge11.us.unr-lcssa
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond18, label %._crit_edge13.loopexit, label %.preheader.us

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge ], [ 0, %.preheader4.preheader ]
  %indvars.iv1 = phi i32 [ %indvars.iv.next2, %._crit_edge ], [ -1, %.preheader4.preheader ]
  %29 = add i64 %indvars.iv3, 4294967295
  %30 = and i64 %29, 4294967295
  %31 = icmp sgt i64 %indvars.iv3, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv3
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader4
  %wide.trip.count = zext i32 %indvars.iv1 to i64
  %33 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %33, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  %34 = load double, double* %5, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.pre, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %38, %.prol.preheader ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %38, %.prol.preheader ], [ %.pre, %.lr.ph ]
  %39 = icmp eq i64 %30, 0
  br i1 %39, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %40 ]
  %41 = phi double [ %.unr.ph, %.lr.ph.new ], [ %53, %40 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv3
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv3
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %32, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %40

._crit_edge.loopexit.unr-lcssa:                   ; preds = %40
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.unr-lcssa ], [ %53, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader4
  %54 = phi double [ %.pre, %.preheader4 ], [ %.lcssa, %._crit_edge.loopexit ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %56 = load double, double* %55, align 8
  %57 = fdiv double %54, %56
  store double %57, double* %32, align 8
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %58 = icmp slt i64 %indvars.iv.next4, %indvars.iv16
  %indvars.iv.next2 = add nsw i32 %indvars.iv1, 1
  br i1 %58, label %.preheader4, label %.preheader.us.preheader

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader6
  %indvars.iv.next17 = add nuw i64 %indvars.iv16, 1
  %59 = icmp slt i64 %indvars.iv.next17, 2000
  %indvars.iv.next9 = add nsw i32 %indvars.iv8, 1
  br i1 %59, label %.preheader6, label %60

; <label>:60:                                     ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

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
