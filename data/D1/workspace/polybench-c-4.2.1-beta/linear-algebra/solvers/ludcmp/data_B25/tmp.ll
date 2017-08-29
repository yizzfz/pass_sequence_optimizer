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
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %4
  %indvars.iv63 = phi i64 [ 0, %4 ], [ %indvars.iv.next64.1, %._crit_edge22 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv63
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv63
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next64 = or i64 %indvars.iv63, 1
  %9 = trunc i64 %indvars.iv.next64 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv63
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %12 = trunc i64 %indvars.iv.next64.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond65.1 = icmp eq i64 %indvars.iv.next64, 1999
  br i1 %exitcond65.1, label %.lr.ph.preheader, label %._crit_edge22

.lr.ph.preheader:                                 ; preds = %._crit_edge22
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader7_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge..preheader7_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv61, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep59 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %21
  %scevgep5960 = bitcast double* %scevgep59 to i8*
  %22 = sub i64 1998, %indvars.iv61
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

.preheader6:                                      ; preds = %27
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %26 = icmp slt i64 %indvars.iv.next62, 2000
  br i1 %26, label %._crit_edge..preheader7_crit_edge, label %36

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv44
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv44
  store double %33, double* %34, align 8
  %exitcond52 = icmp eq i64 %indvars.iv44, %indvars.iv61
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br i1 %exitcond52, label %.preheader6, label %27

._crit_edge..preheader7_crit_edge:                ; preds = %.preheader6
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep5960, i8 0, i64 %25, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv61
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph

; <label>:36:                                     ; preds = %.preheader6
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv61
  store double 1.000000e+00, double* %37, align 8
  %38 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader5_crit_edge

..preheader5_crit_edge:                           ; preds = %..preheader5_crit_edge, %36
  %indvars.iv42 = phi i64 [ 0, %36 ], [ %indvars.iv.next43.7, %..preheader5_crit_edge ]
  %39 = mul nuw nsw i64 %indvars.iv42, 16000
  %scevgep = getelementptr i8, i8* %38, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %40 = mul nuw nsw i64 %indvars.iv.next43, 16000
  %scevgep.1 = getelementptr i8, i8* %38, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.1 = or i64 %indvars.iv42, 2
  %41 = mul nuw nsw i64 %indvars.iv.next43.1, 16000
  %scevgep.2 = getelementptr i8, i8* %38, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.2 = or i64 %indvars.iv42, 3
  %42 = mul nuw nsw i64 %indvars.iv.next43.2, 16000
  %scevgep.3 = getelementptr i8, i8* %38, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.3 = or i64 %indvars.iv42, 4
  %43 = mul nuw nsw i64 %indvars.iv.next43.3, 16000
  %scevgep.4 = getelementptr i8, i8* %38, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.4 = or i64 %indvars.iv42, 5
  %44 = mul nuw nsw i64 %indvars.iv.next43.4, 16000
  %scevgep.5 = getelementptr i8, i8* %38, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.5 = or i64 %indvars.iv42, 6
  %45 = mul nuw nsw i64 %indvars.iv.next43.5, 16000
  %scevgep.6 = getelementptr i8, i8* %38, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.6 = or i64 %indvars.iv42, 7
  %46 = mul nuw nsw i64 %indvars.iv.next43.6, 16000
  %scevgep.7 = getelementptr i8, i8* %38, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.7 = add nsw i64 %indvars.iv42, 8
  %47 = icmp slt i64 %indvars.iv.next43.7, 2000
  br i1 %47, label %..preheader5_crit_edge, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %..preheader5_crit_edge
  %48 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %.preheader3

.preheader3:                                      ; preds = %95, %..preheader3_crit_edge
  %indvars.iv37 = phi i64 [ 0, %..preheader3_crit_edge ], [ %49, %95 ]
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv37
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  %49 = add i64 %indvars.iv37, 1
  %scevgep70 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %49
  %scevgep7071 = bitcast double* %scevgep70 to i8*
  br label %.preheader2

.preheader2:                                      ; preds = %middle.block, %.preheader3
  %indvars.iv35 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next36, %middle.block ]
  %50 = mul i64 %indvars.iv35, 16000
  %scevgep66 = getelementptr i8, i8* %38, i64 %50
  %51 = add i64 %50, 16000
  %scevgep67 = getelementptr i8, i8* %38, i64 %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv37
  %bound0 = icmp ult i8* %scevgep66, %scevgep7071
  %bound1 = icmp ult i8* %scevgep6869, %scevgep67
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %52 to i8*
  %bound073 = icmp ult i8* %scevgep66, %bc
  %bound174 = icmp ult i8* %bc, %scevgep67
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader2
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader2
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = load double, double* %52, align 8, !alias.scope !1
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv37
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv37
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv37
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %55, i64 %indvars.iv37
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
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv35, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load77, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %middle.block.loopexit107, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv32 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next33.1, %scalar.ph ]
  %80 = load double, double* %52, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv37
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv35, i64 %indvars.iv32
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next33 = or i64 %indvars.iv32, 1
  %87 = load double, double* %52, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next33, i64 %indvars.iv37
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv35, i64 %indvars.iv.next33
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %exitcond34.1 = icmp eq i64 %indvars.iv.next33, 1999
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  br i1 %exitcond34.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit107:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit107, %middle.block.loopexit
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %94 = icmp slt i64 %indvars.iv.next36, 2000
  br i1 %94, label %.preheader2, label %95

; <label>:95:                                     ; preds = %middle.block
  %96 = icmp slt i64 %49, 2000
  br i1 %96, label %.preheader3, label %.preheader.preheader

.preheader.preheader:                             ; preds = %95
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block79
  %indvars.iv30 = phi i64 [ %97, %middle.block79 ], [ 0, %.preheader.preheader ]
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %97 = add i64 %indvars.iv30, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %0, i64 %97, i64 0
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %98 = mul i64 %indvars.iv30, 16000
  %scevgep87 = getelementptr i8, i8* %38, i64 %98
  %99 = add i64 %98, 16000
  %scevgep88 = getelementptr i8, i8* %38, i64 %99
  %bound089 = icmp ult i8* %scevgep8384, %scevgep88
  %bound190 = icmp ult i8* %scevgep87, %scevgep8586
  %memcheck.conflict92 = and i1 %bound089, %bound190
  br i1 %memcheck.conflict92, label %scalar.ph80.preheader, label %vector.body78.preheader

vector.body78.preheader:                          ; preds = %.preheader
  br label %vector.body78

scalar.ph80.preheader:                            ; preds = %.preheader
  br label %scalar.ph80

vector.body78:                                    ; preds = %vector.body78, %vector.body78.preheader
  %index95 = phi i64 [ 0, %vector.body78.preheader ], [ %index.next96.1, %vector.body78 ]
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %index95
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load103 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %index95
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load103, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load104, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next96 = or i64 %index95, 4
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %index.next96
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load103.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %index.next96
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load103.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load104.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %index.next96.1 = add nsw i64 %index95, 8
  %116 = icmp eq i64 %index.next96.1, 2000
  br i1 %116, label %middle.block79.loopexit106, label %vector.body78, !llvm.loop !18

scalar.ph80:                                      ; preds = %scalar.ph80, %scalar.ph80.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph80.preheader ], [ %indvars.iv.next.4, %scalar.ph80 ]
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv.next
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv.next.1
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv.next.2
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.3
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv.next.3
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block79.loopexit, label %scalar.ph80, !llvm.loop !19

middle.block79.loopexit:                          ; preds = %scalar.ph80
  br label %middle.block79

middle.block79.loopexit106:                       ; preds = %vector.body78
  br label %middle.block79

middle.block79:                                   ; preds = %middle.block79.loopexit106, %middle.block79.loopexit
  %142 = icmp slt i64 %97, 2000
  br i1 %142, label %.preheader, label %143

; <label>:143:                                    ; preds = %middle.block79
  call void @free(i8* nonnull %38) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge34, %4
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge34 ], [ 0, %4 ]
  %indvars.iv79 = phi i32 [ %indvars.iv.next80, %._crit_edge34 ], [ -1, %4 ]
  %5 = add i64 %indvars.iv87, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 2000, %indvars.iv87
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv87
  %11 = icmp sgt i64 %indvars.iv87, 0
  br i1 %11, label %.lr.ph25.preheader, label %.lr.ph33.split.preheader

.lr.ph25.preheader:                               ; preds = %.preheader3
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 0
  br label %.lr.ph25

.lr.ph33.split.preheader:                         ; preds = %.lr.ph33..lr.ph33.split.preheader_crit_edge, %.preheader3
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph33.split.preheader99, label %min.iters.checked

.lr.ph33.split.preheader99:                       ; preds = %middle.block, %min.iters.checked, %.lr.ph33.split.preheader
  %indvars.iv70.ph = phi i64 [ %indvars.iv87, %min.iters.checked ], [ %indvars.iv87, %.lr.ph33.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph33.split

min.iters.checked:                                ; preds = %.lr.ph33.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv87, %n.vec
  br i1 %cmp.zero, label %.lr.ph33.split.preheader99, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %13 = and i64 %9, 1
  %lcmp.mod113 = icmp eq i64 %13, 0
  br i1 %lcmp.mod113, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv87
  %15 = bitcast double* %14 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  %wide.load98.prol = load <2 x i64>, <2 x i64>* %17, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %15, align 8
  store <2 x i64> %wide.load98.prol, <2 x i64>* %17, align 8
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
  %19 = add i64 %indvars.iv87, %index
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %19
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load98 = load <2 x i64>, <2 x i64>* %23, align 8
  store <2 x i64> %wide.load, <2 x i64>* %21, align 8
  store <2 x i64> %wide.load98, <2 x i64>* %23, align 8
  %index.next = add i64 %index, 4
  %24 = add i64 %indvars.iv87, %index.next
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %24
  %26 = bitcast double* %25 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load98.1 = load <2 x i64>, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %26, align 8
  store <2 x i64> %wide.load98.1, <2 x i64>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %29 = icmp eq i64 %index.next.1, %n.vec
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge34, label %.lr.ph33.split.preheader99

.lr.ph33:                                         ; preds = %._crit_edge22
  br i1 true, label %.lr.ph33.split.us.preheader, label %.lr.ph33..lr.ph33.split.preheader_crit_edge

.lr.ph33..lr.ph33.split.preheader_crit_edge:      ; preds = %.lr.ph33
  br label %.lr.ph33.split.preheader

.lr.ph33.split.us.preheader:                      ; preds = %.lr.ph33
  %wide.trip.count81 = zext i32 %indvars.iv79 to i64
  %30 = and i64 %5, 1
  %lcmp.mod115 = icmp eq i64 %30, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 0
  %32 = icmp eq i64 %6, 0
  br label %.lr.ph33.split.us

.lr.ph33.split.us:                                ; preds = %.lr.ph33.split.us.preheader, %._crit_edge30.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge30.us ], [ %indvars.iv87, %.lr.ph33.split.us.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv85
  %34 = load double, double* %33, align 8
  br i1 %lcmp.mod115, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph33.split.us
  br label %35

; <label>:35:                                     ; preds = %.prol.preheader
  %36 = load double, double* %31, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv85
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %34, %39
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph33.split.us, %35
  %.lcssa106.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph33.split.us ]
  %indvars.iv74.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph33.split.us ]
  %.127.us.unr.ph = phi double [ %40, %35 ], [ %34, %.lr.ph33.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %32, label %._crit_edge30.us, label %.lr.ph33.split.us.new

.lr.ph33.split.us.new:                            ; preds = %.prol.loopexit
  br label %41

; <label>:41:                                     ; preds = %41, %.lr.ph33.split.us.new
  %indvars.iv74 = phi i64 [ %indvars.iv74.unr.ph, %.lr.ph33.split.us.new ], [ %indvars.iv.next75.1, %41 ]
  %.127.us = phi double [ %.127.us.unr.ph, %.lr.ph33.split.us.new ], [ %55, %41 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv74
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv85
  %45 = load double, double* %44, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next75, i64 %indvars.iv85
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.127.us, %52
  %55 = fsub double %54, %53
  %exitcond82.1 = icmp eq i64 %indvars.iv.next75, %wide.trip.count81
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  br i1 %exitcond82.1, label %._crit_edge30.us.unr-lcssa, label %41

._crit_edge30.us.unr-lcssa:                       ; preds = %41
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %.prol.loopexit, %._crit_edge30.us.unr-lcssa
  %.lcssa106 = phi double [ %.lcssa106.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge30.us.unr-lcssa ]
  store double %.lcssa106, double* %33, align 8
  %indvars.iv.next86 = add nuw i64 %indvars.iv85, 1
  %56 = icmp slt i64 %indvars.iv.next86, 2000
  br i1 %56, label %.lr.ph33.split.us, label %._crit_edge34.loopexit

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %._crit_edge22
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge22 ], [ 0, %.lr.ph25.preheader ]
  %indvars.iv62 = phi i32 [ %indvars.iv.next63, %._crit_edge22 ], [ -1, %.lr.ph25.preheader ]
  %57 = add i64 %indvars.iv66, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv66
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv66, 0
  br i1 %61, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.lr.ph25
  %wide.trip.count64 = zext i32 %indvars.iv62 to i64
  %62 = and i64 %57, 1
  %lcmp.mod111 = icmp eq i64 %62, 0
  br i1 %lcmp.mod111, label %.lr.ph21.prol.preheader, label %.lr.ph21.prol.loopexit.unr-lcssa

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader
  %63 = load double, double* %12, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv66
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph21.prol.loopexit.unr-lcssa

.lr.ph21.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph21.preheader, %.lr.ph21.prol
  %.lcssa105.unr.ph = phi double [ %67, %.lr.ph21.prol ], [ undef, %.lr.ph21.preheader ]
  %indvars.iv57.unr.ph = phi i64 [ 1, %.lr.ph21.prol ], [ 0, %.lr.ph21.preheader ]
  %.019.unr.ph = phi double [ %67, %.lr.ph21.prol ], [ %60, %.lr.ph21.preheader ]
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge22.loopexit, label %.lr.ph21.preheader.new

.lr.ph21.preheader.new:                           ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21, %.lr.ph21.preheader.new
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr.ph, %.lr.ph21.preheader.new ], [ %indvars.iv.next58.1, %.lr.ph21 ]
  %.019 = phi double [ %.019.unr.ph, %.lr.ph21.preheader.new ], [ %82, %.lr.ph21 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv57
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv66
  %72 = load double, double* %71, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next58, i64 %indvars.iv66
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %73, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.019, %79
  %82 = fsub double %81, %80
  %exitcond65.1 = icmp eq i64 %indvars.iv.next58, %wide.trip.count64
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  br i1 %exitcond65.1, label %._crit_edge22.loopexit.unr-lcssa, label %.lr.ph21

._crit_edge22.loopexit.unr-lcssa:                 ; preds = %.lr.ph21
  br label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %.lr.ph21.prol.loopexit, %._crit_edge22.loopexit.unr-lcssa
  %.lcssa105 = phi double [ %.lcssa105.unr.ph, %.lr.ph21.prol.loopexit ], [ %82, %._crit_edge22.loopexit.unr-lcssa ]
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph25
  %.0.lcssa = phi double [ %60, %.lr.ph25 ], [ %.lcssa105, %._crit_edge22.loopexit ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv66
  %84 = load double, double* %83, align 8
  %85 = fdiv double %.0.lcssa, %84
  store double %85, double* %59, align 8
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %86 = icmp slt i64 %indvars.iv.next67, %indvars.iv87
  %indvars.iv.next63 = add nsw i32 %indvars.iv62, 1
  br i1 %86, label %.lr.ph25, label %.lr.ph33

.lr.ph33.split:                                   ; preds = %.lr.ph33.split.preheader99, %.lr.ph33.split
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %.lr.ph33.split ], [ %indvars.iv70.ph, %.lr.ph33.split.preheader99 ]
  %exitcond72 = icmp eq i64 %indvars.iv70, 1999
  %indvars.iv.next71 = add nuw i64 %indvars.iv70, 1
  br i1 %exitcond72, label %._crit_edge34.loopexit100, label %.lr.ph33.split, !llvm.loop !21

._crit_edge34.loopexit:                           ; preds = %._crit_edge30.us
  br label %._crit_edge34

._crit_edge34.loopexit100:                        ; preds = %.lr.ph33.split
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit100, %._crit_edge34.loopexit, %middle.block
  %indvars.iv.next88 = add nuw i64 %indvars.iv87, 1
  %87 = icmp slt i64 %indvars.iv.next88, 2000
  %indvars.iv.next80 = add nsw i32 %indvars.iv79, 1
  br i1 %87, label %.preheader3, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %._crit_edge34
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %._crit_edge14
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge14 ], [ 0, %.preheader1.preheader ]
  %indvars.iv51 = phi i32 [ %indvars.iv.next52, %._crit_edge14 ], [ -1, %.preheader1.preheader ]
  %88 = add i64 %indvars.iv55, 4294967295
  %89 = and i64 %88, 4294967295
  %90 = getelementptr inbounds double, double* %1, i64 %indvars.iv55
  %91 = load double, double* %90, align 8
  %92 = icmp sgt i64 %indvars.iv55, 0
  br i1 %92, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %.preheader1
  %wide.trip.count53 = zext i32 %indvars.iv51 to i64
  %xtraiter107 = and i64 %indvars.iv55, 3
  %lcmp.mod108 = icmp eq i64 %xtraiter107, 0
  br i1 %lcmp.mod108, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol, %.lr.ph13.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph13.prol ], [ 0, %.lr.ph13.prol.preheader ]
  %.211.prol = phi double [ %98, %.lr.ph13.prol ], [ %91, %.lr.ph13.prol.preheader ]
  %prol.iter109 = phi i64 [ %prol.iter109.sub, %.lr.ph13.prol ], [ %xtraiter107, %.lr.ph13.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv46.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv46.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.211.prol, %97
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter109.sub = add i64 %prol.iter109, -1
  %prol.iter109.cmp = icmp eq i64 %prol.iter109.sub, 0
  br i1 %prol.iter109.cmp, label %.lr.ph13.prol.loopexit.unr-lcssa, label %.lr.ph13.prol, !llvm.loop !23

.lr.ph13.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph13.prol
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.preheader, %.lr.ph13.prol.loopexit.unr-lcssa
  %.lcssa104.unr = phi double [ undef, %.lr.ph13.preheader ], [ %98, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %indvars.iv46.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next47.prol, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %.211.unr = phi double [ %91, %.lr.ph13.preheader ], [ %98, %.lr.ph13.prol.loopexit.unr-lcssa ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %._crit_edge14.loopexit, label %.lr.ph13.preheader.new

.lr.ph13.preheader.new:                           ; preds = %.lr.ph13.prol.loopexit
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %.lr.ph13.preheader.new ], [ %indvars.iv.next47.3, %.lr.ph13 ]
  %.211 = phi double [ %.211.unr, %.lr.ph13.preheader.new ], [ %121, %.lr.ph13 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv46
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.211, %107
  %110 = fsub double %109, %108
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv.next47.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next47.1
  %114 = bitcast double* %113 to <2 x double>*
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %exitcond54.3 = icmp eq i64 %indvars.iv.next47.2, %wide.trip.count53
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  br i1 %exitcond54.3, label %._crit_edge14.loopexit.unr-lcssa, label %.lr.ph13

._crit_edge14.loopexit.unr-lcssa:                 ; preds = %.lr.ph13
  br label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.prol.loopexit, %._crit_edge14.loopexit.unr-lcssa
  %.lcssa104 = phi double [ %.lcssa104.unr, %.lr.ph13.prol.loopexit ], [ %121, %._crit_edge14.loopexit.unr-lcssa ]
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader1
  %.2.lcssa = phi double [ %91, %.preheader1 ], [ %.lcssa104, %._crit_edge14.loopexit ]
  %122 = getelementptr inbounds double, double* %3, i64 %indvars.iv55
  store double %.2.lcssa, double* %122, align 8
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %123 = icmp slt i64 %indvars.iv.next56, 2000
  %indvars.iv.next52 = add nsw i32 %indvars.iv51, 1
  br i1 %123, label %.preheader1, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge14
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv44 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next45, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv44
  %128 = load double, double* %127, align 8
  %129 = icmp slt i32 %indvars.iv, 2000
  br i1 %129, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %130 = sext i32 %indvars.iv to i64
  %131 = sub nsw i64 0, %125
  %xtraiter = and i64 %131, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.lr.ph.prol ], [ %130, %.lr.ph.prol.preheader ]
  %.36.prol = phi double [ %137, %.lr.ph.prol ], [ %128, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv42.prol
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %2, i64 %indvars.iv42.prol
  %135 = load double, double* %134, align 8
  %136 = fmul double %133, %135
  %137 = fsub double %.36.prol, %136
  %indvars.iv.next43.prol = add nsw i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %137, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv42.unr = phi i64 [ %130, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next43.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.36.unr = phi double [ %128, %.preheader..lr.ph_crit_edge ], [ %137, %.lr.ph.prol.loopexit.unr-lcssa ]
  %138 = icmp ult i64 %126, 3
  br i1 %138, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next43.3, %.lr.ph ]
  %.36 = phi double [ %.36.unr, %.preheader..lr.ph_crit_edge.new ], [ %160, %.lr.ph ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv42
  %140 = bitcast double* %139 to <2 x double>*
  %141 = getelementptr inbounds double, double* %2, i64 %indvars.iv42
  %142 = bitcast double* %141 to <2 x double>*
  %143 = load <2 x double>, <2 x double>* %140, align 8
  %144 = load <2 x double>, <2 x double>* %142, align 8
  %145 = fmul <2 x double> %143, %144
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fsub double %.36, %146
  %149 = fsub double %148, %147
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next43.1
  %151 = bitcast double* %150 to <2 x double>*
  %152 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next43.1
  %153 = bitcast double* %152 to <2 x double>*
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %154 = load <2 x double>, <2 x double>* %151, align 8
  %155 = load <2 x double>, <2 x double>* %153, align 8
  %156 = fmul <2 x double> %154, %155
  %157 = extractelement <2 x double> %156, i32 0
  %158 = extractelement <2 x double> %156, i32 1
  %159 = fsub double %149, %157
  %160 = fsub double %159, %158
  %exitcond.3 = icmp eq i64 %indvars.iv.next43.2, 1999
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %160, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %128, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv44
  %162 = load double, double* %161, align 8
  %163 = fdiv double %.3.lcssa, %162
  %164 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  store double %163, double* %164, align 8
  %165 = icmp sgt i64 %indvars.iv44, 0
  br i1 %165, label %._crit_edge..preheader_crit_edge, label %166

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next45 = add i64 %indvars.iv44, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:166:                                    ; preds = %._crit_edge
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
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge._crit_edge, label %16

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
