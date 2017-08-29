; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_lu([2000 x double]* %4)
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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]*) #0 {
.preheader6.lr.ph:
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %.preheader6.lr.ph, %._crit_edge22..preheader6_crit_edge
  %indvars.iv56 = phi i64 [ %1, %._crit_edge22..preheader6_crit_edge ], [ 0, %.preheader6.lr.ph ]
  %1 = add i64 %indvars.iv56, 1
  %sext = shl i64 %1, 32
  %2 = ashr exact i64 %sext, 32
  %3 = sub nsw i64 2000, %2
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph18
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %4 ], [ 0, %.lr.ph18 ]
  %5 = sub nsw i64 0, %indvars.iv44
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv44
  store double %10, double* %11, align 8
  %exitcond49 = icmp eq i64 %indvars.iv44, %indvars.iv56
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br i1 %exitcond49, label %._crit_edge19, label %4

._crit_edge19:                                    ; preds = %4
  %12 = icmp slt i64 %1, 2000
  br i1 %12, label %._crit_edge22..preheader6_crit_edge, label %._crit_edge23

._crit_edge22..preheader6_crit_edge:              ; preds = %._crit_edge19
  %13 = shl nsw i64 %3, 3
  %scevgep60 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %2
  %14 = bitcast double* %scevgep60 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %14, i8 0, i64 %13, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv56
  store double 1.000000e+00, double* %15, align 8
  br label %.lr.ph18

._crit_edge23:                                    ; preds = %._crit_edge19
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv56
  store double 1.000000e+00, double* %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us, %._crit_edge23
  %indvars.iv42 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next43.7, %.preheader5.us ]
  %18 = mul nuw nsw i64 %indvars.iv42, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %19 = mul nuw nsw i64 %indvars.iv.next43, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.1 = or i64 %indvars.iv42, 2
  %20 = mul nuw nsw i64 %indvars.iv.next43.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.2 = or i64 %indvars.iv42, 3
  %21 = mul nuw nsw i64 %indvars.iv.next43.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.3 = or i64 %indvars.iv42, 4
  %22 = mul nuw nsw i64 %indvars.iv.next43.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.4 = or i64 %indvars.iv42, 5
  %23 = mul nuw nsw i64 %indvars.iv.next43.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.5 = or i64 %indvars.iv42, 6
  %24 = mul nuw nsw i64 %indvars.iv.next43.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.6 = or i64 %indvars.iv42, 7
  %25 = mul nuw nsw i64 %indvars.iv.next43.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next43.7 = add nsw i64 %indvars.iv42, 8
  %exitcond6.7 = icmp eq i64 %indvars.iv.next43.7, 2000
  br i1 %exitcond6.7, label %.preheader2.us.us.preheader.preheader, label %.preheader5.us

.preheader2.us.us.preheader.preheader:            ; preds = %.preheader5.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %._crit_edge10.us, %.preheader2.us.us.preheader.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge10.us ], [ 0, %.preheader2.us.us.preheader.preheader ]
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv36
  %29 = add nuw nsw i64 %indvars.iv36, 1
  %scevgep70 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %29
  %30 = bitcast double* %scevgep70 to i8*
  %31 = bitcast double* %scevgep68 to i8*
  br label %.preheader2.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond5, label %.preheader.us.preheader, label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  %32 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %._crit_edge9.us.us, %.preheader2.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge9.us.us ]
  %39 = mul nuw nsw i64 %indvars.iv34, 16000
  %scevgep66 = getelementptr i8, i8* %17, i64 %39
  %40 = add nuw nsw i64 %39, 16000
  %scevgep67 = getelementptr i8, i8* %17, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv36
  %bound0 = icmp ult i8* %scevgep66, %30
  %bound1 = icmp ult i8* %31, %scevgep67
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc72 = bitcast double* %41 to i8*
  %bound073 = icmp ult i8* %scevgep66, %bc72
  %bound174 = icmp ult i8* %bc, %scevgep67
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader2.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader2.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = or i64 %index, 1
  %43 = or i64 %index, 2
  %44 = or i64 %index, 3
  %45 = load double, double* %41, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %45, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv36
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv36
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv36
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv36
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fmul <2 x double> %47, %59
  %63 = fmul <2 x double> %49, %61
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv34, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = fadd <2 x double> %wide.load, %62
  %69 = fadd <2 x double> %wide.load77, %63
  %70 = bitcast double* %64 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = bitcast double* %66 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %72 = icmp eq i64 %index.next, 2000
  br i1 %72, label %._crit_edge9.us.us.loopexit2, label %vector.body, !llvm.loop !9

._crit_edge9.us.us.loopexit:                      ; preds = %scalar.ph
  br label %._crit_edge9.us.us

._crit_edge9.us.us.loopexit2:                     ; preds = %vector.body
  br label %._crit_edge9.us.us

._crit_edge9.us.us:                               ; preds = %._crit_edge9.us.us.loopexit2, %._crit_edge9.us.us.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond4, label %._crit_edge10.us, label %.preheader2.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv30 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next31.1, %scalar.ph ]
  %73 = load double, double* %41, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv36
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv34, i64 %indvars.iv30
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next31, i64 %indvars.iv36
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv34, i64 %indvars.iv.next31
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31, 1999
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond33.1, label %._crit_edge9.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %87 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %0, i64 %87, i64 0
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %88 = mul nuw nsw i64 %indvars.iv28, 16000
  %scevgep87 = getelementptr i8, i8* %17, i64 %88
  %89 = add nuw nsw i64 %88, 16000
  %scevgep88 = getelementptr i8, i8* %17, i64 %89
  %bound089 = icmp ult i8* %scevgep8384, %scevgep88
  %bound190 = icmp ult i8* %scevgep87, %scevgep8586
  %memcheck.conflict92 = and i1 %bound089, %bound190
  br i1 %memcheck.conflict92, label %scalar.ph80.preheader, label %vector.body78.preheader

vector.body78.preheader:                          ; preds = %.preheader.us
  br label %vector.body78

scalar.ph80.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph80

vector.body78:                                    ; preds = %vector.body78, %vector.body78.preheader
  %index95 = phi i64 [ 0, %vector.body78.preheader ], [ %index.next96.1, %vector.body78 ]
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv28, i64 %index95
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load103 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index95
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load103, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load104, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %index.next96 = or i64 %index95, 4
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv28, i64 %index.next96
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load103.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index.next96
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load103.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load104.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next96.1 = add nsw i64 %index95, 8
  %106 = icmp eq i64 %index.next96.1, 2000
  br i1 %106, label %._crit_edge.us.loopexit1, label %vector.body78, !llvm.loop !18

scalar.ph80:                                      ; preds = %scalar.ph80, %scalar.ph80.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph80.preheader ], [ %indvars.iv.next.4, %scalar.ph80 ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph80, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph80
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body78
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond3, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  tail call void @free(i8* %17) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_lu([2000 x double]*) #0 {
.preheader3.preheader:
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge6, %.preheader3.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge6 ], [ 0, %.preheader3.preheader ]
  %indvars.iv18 = phi i32 [ %indvars.iv.next19, %._crit_edge6 ], [ -1, %.preheader3.preheader ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader1.preheader, label %._crit_edge6

.preheader1.preheader:                            ; preds = %.preheader3
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader1

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %5 = icmp sgt i64 %indvars.iv1, 0
  br i1 %5, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count20 = zext i32 %indvars.iv18 to i64
  %6 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %6, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %8 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us, %.preheader.us.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge5.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv24
  %.pre29 = load double, double* %9, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader6
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv24
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre29, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %10
  %.unr10.ph = phi double [ %15, %10 ], [ %.pre29, %.preheader.us ]
  %indvars.iv16.unr.ph = phi i64 [ 1, %10 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %8, label %._crit_edge5.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader.us.new
  %17 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %29, %16 ]
  %indvars.iv16 = phi i64 [ %indvars.iv16.unr.ph, %.preheader.us.new ], [ %indvars.iv.next17.1, %16 ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv16
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv24
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %9, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next17
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next17, i64 %indvars.iv24
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %9, align 8
  %exitcond21.1 = icmp eq i64 %indvars.iv.next17, %wide.trip.count20
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  br i1 %exitcond21.1, label %._crit_edge5.us.unr-lcssa, label %16

._crit_edge5.us.unr-lcssa:                        ; preds = %16
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.prol.loopexit7, %._crit_edge5.us.unr-lcssa
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond4, label %._crit_edge6.loopexit, label %.preheader.us

.preheader1:                                      ; preds = %._crit_edge, %.preheader1.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge ], [ 0, %.preheader1.preheader ]
  %indvars.iv11 = phi i32 [ %indvars.iv.next12, %._crit_edge ], [ -1, %.preheader1.preheader ]
  %30 = add i64 %indvars.iv13, 4294967295
  %31 = and i64 %30, 4294967295
  %32 = icmp sgt i64 %indvars.iv13, 0
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv13
  %.pre = load double, double* %33, align 8
  br i1 %32, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader1
  %wide.trip.count = zext i32 %indvars.iv11 to i64
  %34 = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %34, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %35

; <label>:35:                                     ; preds = %.prol.preheader
  %36 = load double, double* %4, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv13
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %33, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %35
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %31, 0
  br i1 %41, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph.new
  %43 = phi double [ %.unr.ph, %.lr.ph.new ], [ %55, %42 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %42 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv13
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv13
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %33, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %42

._crit_edge.loopexit.unr-lcssa:                   ; preds = %42
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %55, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1
  %56 = phi double [ %.pre, %.preheader1 ], [ %.lcssa, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv13
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %33, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %indvars.iv.next12 = add nsw i32 %indvars.iv11, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next14, %indvars.iv1
  br i1 %exitcond3, label %.preheader.lr.ph, label %.preheader1

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader3, %.preheader.lr.ph
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next19 = add nsw i32 %indvars.iv18, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge7, label %.preheader3

._crit_edge7:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2000 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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
