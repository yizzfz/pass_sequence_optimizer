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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(double* %16)
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
..lr.ph92_crit_edge:
  br label %.lr.ph92

.lr.ph92:                                         ; preds = %.lr.ph92, %..lr.ph92_crit_edge
  %indvars.iv146 = phi i64 [ 0, %..lr.ph92_crit_edge ], [ %indvars.iv.next147.1, %.lr.ph92 ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv146
  %5 = bitcast double* %4 to <2 x double>*
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv146
  %7 = bitcast double* %6 to <2 x double>*
  %indvars.iv.next147 = or i64 %indvars.iv146, 1
  %8 = trunc i64 %indvars.iv.next147 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv146
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %indvars.iv.next147.1 = add nsw i64 %indvars.iv146, 2
  %11 = trunc i64 %indvars.iv.next147.1 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %16 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %17 = fadd <2 x double> %16, <double 4.000000e+00, double 4.000000e+00>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %exitcond155.1 = icmp eq i64 %indvars.iv.next147, 1999
  br i1 %exitcond155.1, label %.lr.ph75.preheader, label %.lr.ph92

.lr.ph75.preheader:                               ; preds = %.lr.ph92
  br label %.lr.ph75

.lr.ph75:                                         ; preds = %.lr.ph75.preheader, %._crit_edge83
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge83 ], [ 0, %.lr.ph75.preheader ]
  %19 = shl i64 %indvars.iv144, 32
  %sext = add nuw nsw i64 %19, 4294967296
  %20 = ashr exact i64 %sext, 32
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %20
  %21 = sub nsw i64 2000, %20
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph75
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %22 ], [ 0, %.lr.ph75 ]
  %23 = sub nsw i64 0, %indvars.iv132
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2000
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 2.000000e+03
  %28 = fadd double %27, 1.000000e+00
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv132
  store double %28, double* %29, align 8
  %exitcond137 = icmp eq i64 %indvars.iv132, %indvars.iv144
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  br i1 %exitcond137, label %._crit_edge76, label %22

._crit_edge76:                                    ; preds = %22
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %30 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %30, label %.lr.ph82.._crit_edge83_crit_edge, label %._crit_edge83

.lr.ph82.._crit_edge83_crit_edge:                 ; preds = %._crit_edge76
  %31 = shl nsw i64 %21, 3
  %scevgep153154 = bitcast double* %scevgep153 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep153154, i8 0, i64 %31, i32 8, i1 false)
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge76, %.lr.ph82.._crit_edge83_crit_edge
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %32, align 8
  %exitcond163 = icmp eq i64 %indvars.iv.next145, 2000
  br i1 %exitcond163, label %.._crit_edge12.us_crit_edge, label %.lr.ph75

.._crit_edge12.us_crit_edge:                      ; preds = %._crit_edge83
  %33 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge61.us, %.._crit_edge12.us_crit_edge
  %indvars.iv130 = phi i64 [ 0, %.._crit_edge12.us_crit_edge ], [ %indvars.iv.next131.7, %._crit_edge61.us ]
  %34 = mul nuw nsw i64 %indvars.iv130, 16000
  %scevgep = getelementptr i8, i8* %33, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131 = or i64 %indvars.iv130, 1
  %35 = mul nuw nsw i64 %indvars.iv.next131, 16000
  %scevgep.1 = getelementptr i8, i8* %33, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.1 = or i64 %indvars.iv130, 2
  %36 = mul nuw nsw i64 %indvars.iv.next131.1, 16000
  %scevgep.2 = getelementptr i8, i8* %33, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.2 = or i64 %indvars.iv130, 3
  %37 = mul nuw nsw i64 %indvars.iv.next131.2, 16000
  %scevgep.3 = getelementptr i8, i8* %33, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.3 = or i64 %indvars.iv130, 4
  %38 = mul nuw nsw i64 %indvars.iv.next131.3, 16000
  %scevgep.4 = getelementptr i8, i8* %33, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.4 = or i64 %indvars.iv130, 5
  %39 = mul nuw nsw i64 %indvars.iv.next131.4, 16000
  %scevgep.5 = getelementptr i8, i8* %33, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.5 = or i64 %indvars.iv130, 6
  %40 = mul nuw nsw i64 %indvars.iv.next131.5, 16000
  %scevgep.6 = getelementptr i8, i8* %33, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.6 = or i64 %indvars.iv130, 7
  %41 = mul nuw nsw i64 %indvars.iv.next131.6, 16000
  %scevgep.7 = getelementptr i8, i8* %33, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next131.7 = add nsw i64 %indvars.iv130, 8
  %exitcond162.7 = icmp eq i64 %indvars.iv.next131.7, 2000
  br i1 %exitcond162.7, label %._crit_edge14.us.._crit_edge16.us.us_crit_edge.preheader, label %._crit_edge61.us

._crit_edge14.us.._crit_edge16.us.us_crit_edge.preheader: ; preds = %._crit_edge61.us
  br label %._crit_edge14.us.._crit_edge16.us.us_crit_edge

._crit_edge14.us.._crit_edge16.us.us_crit_edge:   ; preds = %._crit_edge14.us.._crit_edge16.us.us_crit_edge.preheader, %._crit_edge46.us
  %indvars.iv124 = phi i64 [ %42, %._crit_edge46.us ], [ 0, %._crit_edge14.us.._crit_edge16.us.us_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv124
  %42 = add i64 %indvars.iv124, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %42
  br label %._crit_edge16.us.us

._crit_edge46.us:                                 ; preds = %._crit_edge40.us.us
  %exitcond161 = icmp eq i64 %42, 2000
  br i1 %exitcond161, label %._crit_edge17.us.preheader, label %._crit_edge14.us.._crit_edge16.us.us_crit_edge

._crit_edge17.us.preheader:                       ; preds = %._crit_edge46.us
  br label %._crit_edge17.us

._crit_edge16.us.us:                              ; preds = %._crit_edge40.us.us, %._crit_edge14.us.._crit_edge16.us.us_crit_edge
  %indvars.iv122 = phi i64 [ 0, %._crit_edge14.us.._crit_edge16.us.us_crit_edge ], [ %indvars.iv.next123, %._crit_edge40.us.us ]
  %43 = bitcast double* %scevgep5 to i8*
  %44 = bitcast double* %scevgep3 to i8*
  %45 = mul i64 %indvars.iv122, 16000
  %scevgep1 = getelementptr i8, i8* %33, i64 %45
  %46 = add i64 %45, 16000
  %scevgep2 = getelementptr i8, i8* %33, i64 %46
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv124
  %bound0 = icmp ult i8* %scevgep1, %43
  %bound1 = icmp ult i8* %44, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %47 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge16.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge16.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %48 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %49 = or i64 %index, 1
  %50 = or i64 %index, 2
  %51 = or i64 %index, 3
  %52 = load double, double* %47, align 8, !alias.scope !1
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv124
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %49, i64 %indvars.iv124
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %50, i64 %indvars.iv124
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %51, i64 %indvars.iv124
  %59 = load double, double* %55, align 8, !alias.scope !4
  %60 = load double, double* %56, align 8, !alias.scope !4
  %61 = load double, double* %57, align 8, !alias.scope !4
  %62 = load double, double* %58, align 8, !alias.scope !4
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = fmul <2 x double> %54, %64
  %68 = fmul <2 x double> %54, %66
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv122, i64 %index
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !6, !noalias !8
  %73 = fadd <2 x double> %67, %wide.load
  %74 = fadd <2 x double> %68, %wide.load12
  store <2 x double> %73, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %74, <2 x double>* %72, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %75 = icmp eq i64 %index.next, 2000
  br i1 %75, label %._crit_edge40.us.us.loopexit43, label %vector.body, !llvm.loop !9

._crit_edge40.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge40.us.us

._crit_edge40.us.us.loopexit43:                   ; preds = %vector.body
  br label %._crit_edge40.us.us

._crit_edge40.us.us:                              ; preds = %._crit_edge40.us.us.loopexit43, %._crit_edge40.us.us.loopexit
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond160, label %._crit_edge46.us, label %._crit_edge16.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv118 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next119.1, %scalar.ph ]
  %76 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %77 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %78 = load double, double* %47, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv118, i64 %indvars.iv124
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv122, i64 %indvars.iv118
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %82, align 8
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %85 = load double, double* %47, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next119, i64 %indvars.iv124
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv122, i64 %indvars.iv.next119
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  store double %91, double* %89, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next119, 1999
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  br i1 %exitcond.1, label %._crit_edge40.us.us.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.preheader, %._crit_edge32.us
  %indvars.iv116 = phi i64 [ %92, %._crit_edge32.us ], [ 0, %._crit_edge17.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %92 = add i64 %indvars.iv116, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %92, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %93 = mul i64 %indvars.iv116, 16000
  %scevgep22 = getelementptr i8, i8* %33, i64 %93
  %94 = add i64 %93, 16000
  %scevgep23 = getelementptr i8, i8* %33, i64 %94
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %._crit_edge17.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %._crit_edge17.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %95 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %96 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv116, i64 %index30
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %index30
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %95, i64 0, i64 %indvars.iv116, i64 %index.next31
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !13
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %index.next31
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %110, align 8, !alias.scope !16, !noalias !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %113 = icmp eq i64 %index.next31.1, 2000
  br i1 %113, label %._crit_edge32.us.loopexit42, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %114 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %115 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %116 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %117 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %118 = bitcast i8* %33 to [2000 x [2000 x double]]*
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %118, i64 0, i64 %indvars.iv116, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %117, i64 0, i64 %indvars.iv116, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv.next
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %116, i64 0, i64 %indvars.iv116, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv.next.1
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv116, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv.next.2
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %114, i64 0, i64 %indvars.iv116, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv.next.3
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %exitcond151.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond151.4, label %._crit_edge32.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge32.us.loopexit:                        ; preds = %scalar.ph15
  br label %._crit_edge32.us

._crit_edge32.us.loopexit42:                      ; preds = %vector.body13
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit42, %._crit_edge32.us.loopexit
  %exitcond159 = icmp eq i64 %92, 2000
  br i1 %exitcond159, label %._crit_edge15._crit_edge, label %._crit_edge17.us

._crit_edge15._crit_edge:                         ; preds = %._crit_edge32.us
  tail call void @free(i8* %33) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge54, %._crit_edge.lr.ph
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %._crit_edge54 ], [ 4294967295, %._crit_edge.lr.ph ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge54 ], [ 0, %._crit_edge.lr.ph ]
  %4 = and i64 %indvars.iv116, 4294967295
  %5 = icmp sgt i64 %indvars.iv108, 0
  br i1 %5, label %.lr.ph41.preheader, label %._crit_edge54

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge67
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %._crit_edge67 ], [ 4294967295, %.lr.ph41.preheader ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge67 ], [ 0, %.lr.ph41.preheader ]
  %7 = and i64 %indvars.iv113, 4294967295
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv95
  %9 = load double, double* %8, align 8
  %10 = icmp sgt i64 %indvars.iv95, 0
  br i1 %10, label %.lr.ph36.preheader, label %._crit_edge67

.lr.ph36.preheader:                               ; preds = %.lr.ph41
  %11 = and i64 %indvars.iv113, 1
  %lcmp.mod22 = icmp eq i64 %11, 0
  br i1 %lcmp.mod22, label %.lr.ph36.prol, label %.lr.ph36.prol.loopexit

.lr.ph36.prol:                                    ; preds = %.lr.ph36.preheader
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv95
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %9, %15
  br label %.lr.ph36.prol.loopexit

.lr.ph36.prol.loopexit:                           ; preds = %.lr.ph36.prol, %.lr.ph36.preheader
  %.lcssa15.unr.ph = phi double [ %16, %.lr.ph36.prol ], [ undef, %.lr.ph36.preheader ]
  %indvars.iv89.unr.ph = phi i64 [ 1, %.lr.ph36.prol ], [ 0, %.lr.ph36.preheader ]
  %.unr23.ph = phi double [ %16, %.lr.ph36.prol ], [ %9, %.lr.ph36.preheader ]
  %17 = icmp eq i64 %7, 0
  br i1 %17, label %._crit_edge67, label %.lr.ph36.preheader.new

.lr.ph36.preheader.new:                           ; preds = %.lr.ph36.prol.loopexit
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader.new
  %indvars.iv89 = phi i64 [ %indvars.iv89.unr.ph, %.lr.ph36.preheader.new ], [ %indvars.iv.next90.1, %.lr.ph36 ]
  %18 = phi double [ %.unr23.ph, %.lr.ph36.preheader.new ], [ %32, %.lr.ph36 ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv89
  %20 = bitcast double* %19 to <2 x double>*
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv95
  %22 = load double, double* %21, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %23 = load <2 x double>, <2 x double>* %20, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next90, i64 %indvars.iv95
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %22, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %23, %27
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %31 = fsub double %18, %29
  %32 = fsub double %31, %30
  %exitcond115.1 = icmp eq i64 %indvars.iv.next90, %7
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  br i1 %exitcond115.1, label %._crit_edge67.loopexit, label %.lr.ph36

._crit_edge67.loopexit:                           ; preds = %.lr.ph36
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67.loopexit, %.lr.ph36.prol.loopexit, %.lr.ph41
  %.lcssa11 = phi double [ %9, %.lr.ph41 ], [ %.lcssa15.unr.ph, %.lr.ph36.prol.loopexit ], [ %32, %._crit_edge67.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv95, i64 %indvars.iv95
  %34 = load double, double* %33, align 8
  %35 = fdiv double %.lcssa11, %34
  store double %35, double* %8, align 8
  %indvars.iv.next96 = add nuw i64 %indvars.iv95, 1
  %36 = icmp slt i64 %indvars.iv.next96, %indvars.iv108
  %indvars.iv.next114 = add nuw nsw i64 %7, 1
  br i1 %36, label %.lr.ph41, label %.lr.ph53.split.us.preheader

.lr.ph53.split.us.preheader:                      ; preds = %._crit_edge67
  %37 = and i64 %indvars.iv116, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge48.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge48.us ], [ %indvars.iv108, %.lr.ph53.split.us.preheader ]
  %39 = icmp eq i64 %37, 0
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv106
  %41 = load double, double* %40, align 8
  br i1 %39, label %42, label %.prol.loopexit

; <label>:42:                                     ; preds = %.lr.ph53.split.us
  %43 = load double, double* %38, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv106
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %42, %.lr.ph53.split.us
  %.lcssa16.unr.ph = phi double [ %47, %42 ], [ undef, %.lr.ph53.split.us ]
  %indvars.iv98.unr.ph = phi i64 [ 1, %42 ], [ 0, %.lr.ph53.split.us ]
  %.unr26.ph = phi double [ %47, %42 ], [ %41, %.lr.ph53.split.us ]
  %48 = icmp eq i64 %4, 0
  br i1 %48, label %._crit_edge48.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit
  br label %49

; <label>:49:                                     ; preds = %49, %.lr.ph53.split.us.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next99.1, %49 ]
  %50 = phi double [ %.unr26.ph, %.lr.ph53.split.us.new ], [ %64, %49 ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv98
  %52 = bitcast double* %51 to <2 x double>*
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv106
  %54 = load double, double* %53, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next99, i64 %indvars.iv106
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %55, %59
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %50, %61
  %64 = fsub double %63, %62
  %exitcond118.1 = icmp eq i64 %indvars.iv.next99, %4
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  br i1 %exitcond118.1, label %._crit_edge48.us.loopexit, label %49

._crit_edge48.us.loopexit:                        ; preds = %49
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit
  %.lcssa16 = phi double [ %.lcssa16.unr.ph, %.prol.loopexit ], [ %64, %._crit_edge48.us.loopexit ]
  store double %.lcssa16, double* %40, align 8
  %indvars.iv.next107 = add nuw i64 %indvars.iv106, 1
  %65 = icmp slt i64 %indvars.iv.next107, 2000
  br i1 %65, label %.lr.ph53.split.us, label %._crit_edge54.loopexit

._crit_edge54.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %._crit_edge
  %indvars.iv.next109 = add nuw i64 %indvars.iv108, 1
  %66 = icmp slt i64 %indvars.iv.next109, 2000
  %indvars.iv.next117 = add nuw nsw i64 %4, 1
  br i1 %66, label %._crit_edge, label %.lr.ph31.preheader

.lr.ph31.preheader:                               ; preds = %._crit_edge54
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31.preheader, %._crit_edge70
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge70 ], [ 4294967295, %.lr.ph31.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge70 ], [ 0, %.lr.ph31.preheader ]
  %67 = and i64 %indvars.iv110, 4294967295
  %68 = getelementptr inbounds double, double* %1, i64 %indvars.iv87
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = icmp sgt i64 %indvars.iv87, 0
  br i1 %71, label %..lr.ph26_crit_edge, label %._crit_edge70

..lr.ph26_crit_edge:                              ; preds = %.lr.ph31
  %72 = bitcast i64 %70 to double
  %73 = add nsw i64 %indvars.iv110, 1
  %xtraiter17 = and i64 %73, 3
  %lcmp.mod18 = icmp eq i64 %xtraiter17, 0
  br i1 %lcmp.mod18, label %.lr.ph26.prol.loopexit, label %.lr.ph26.prol.preheader

.lr.ph26.prol.preheader:                          ; preds = %..lr.ph26_crit_edge
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol, %.lr.ph26.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph26.prol ], [ 0, %.lr.ph26.prol.preheader ]
  %74 = phi double [ %80, %.lr.ph26.prol ], [ %72, %.lr.ph26.prol.preheader ]
  %prol.iter19 = phi i64 [ %prol.iter19.sub, %.lr.ph26.prol ], [ %xtraiter17, %.lr.ph26.prol.preheader ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv.prol
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %74, %79
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter19.sub = add i64 %prol.iter19, -1
  %prol.iter19.cmp = icmp eq i64 %prol.iter19.sub, 0
  br i1 %prol.iter19.cmp, label %.lr.ph26.prol.loopexit.loopexit, label %.lr.ph26.prol, !llvm.loop !20

.lr.ph26.prol.loopexit.loopexit:                  ; preds = %.lr.ph26.prol
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.loopexit, %..lr.ph26_crit_edge
  %.lcssa14.unr = phi double [ undef, %..lr.ph26_crit_edge ], [ %80, %.lr.ph26.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %..lr.ph26_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph26.prol.loopexit.loopexit ]
  %.unr20 = phi double [ %72, %..lr.ph26_crit_edge ], [ %80, %.lr.ph26.prol.loopexit.loopexit ]
  %81 = icmp ult i64 %67, 3
  br i1 %81, label %._crit_edge27, label %..lr.ph26_crit_edge.new

..lr.ph26_crit_edge.new:                          ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %..lr.ph26_crit_edge.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %..lr.ph26_crit_edge.new ], [ %indvars.iv.next.3, %.lr.ph26 ]
  %82 = phi double [ %.unr20, %..lr.ph26_crit_edge.new ], [ %104, %.lr.ph26 ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv
  %84 = bitcast double* %83 to <2 x double>*
  %85 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %86 = bitcast double* %85 to <2 x double>*
  %87 = load <2 x double>, <2 x double>* %84, align 8
  %88 = load <2 x double>, <2 x double>* %86, align 8
  %89 = fmul <2 x double> %87, %88
  %90 = extractelement <2 x double> %89, i32 0
  %91 = extractelement <2 x double> %89, i32 1
  %92 = fsub double %82, %90
  %93 = fsub double %92, %91
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to <2 x double>*
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %97 = bitcast double* %96 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %98 = load <2 x double>, <2 x double>* %95, align 8
  %99 = load <2 x double>, <2 x double>* %97, align 8
  %100 = fmul <2 x double> %98, %99
  %101 = extractelement <2 x double> %100, i32 0
  %102 = extractelement <2 x double> %100, i32 1
  %103 = fsub double %93, %101
  %104 = fsub double %103, %102
  %exitcond112.3 = icmp eq i64 %indvars.iv.next.2, %67
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond112.3, label %._crit_edge27.loopexit, label %.lr.ph26

._crit_edge27.loopexit:                           ; preds = %.lr.ph26
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph26.prol.loopexit
  %.lcssa14 = phi double [ %.lcssa14.unr, %.lr.ph26.prol.loopexit ], [ %104, %._crit_edge27.loopexit ]
  %105 = bitcast double %.lcssa14 to i64
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %.lr.ph31, %._crit_edge27
  %.lcssa10 = phi i64 [ %105, %._crit_edge27 ], [ %70, %.lr.ph31 ]
  %106 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %107 = bitcast double* %106 to i64*
  store i64 %.lcssa10, i64* %107, align 8
  %indvars.iv.next88 = add nuw i64 %indvars.iv87, 1
  %108 = icmp slt i64 %indvars.iv.next88, 2000
  %indvars.iv.next111 = add nuw nsw i64 %67, 1
  br i1 %108, label %.lr.ph31, label %._crit_edge18._crit_edge.preheader

._crit_edge18._crit_edge.preheader:               ; preds = %._crit_edge70
  br label %._crit_edge18._crit_edge

._crit_edge18._crit_edge:                         ; preds = %._crit_edge18._crit_edge.preheader, %._crit_edge18
  %indvar = phi i64 [ 0, %._crit_edge18._crit_edge.preheader ], [ %indvar.next, %._crit_edge18 ]
  %indvars.iv81 = phi i64 [ 2000, %._crit_edge18._crit_edge.preheader ], [ %indvars.iv.next82, %._crit_edge18 ]
  %109 = add i64 %indvar, -1
  %indvars.iv.next82 = add nsw i64 %indvars.iv81, -1
  %110 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next82
  %111 = load double, double* %110, align 8
  %112 = icmp slt i64 %indvars.iv81, 2000
  br i1 %112, label %.lr.ph.preheader, label %._crit_edge18

.lr.ph.preheader:                                 ; preds = %._crit_edge18._crit_edge
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv79.prol = phi i64 [ %indvars.iv.next80.prol, %.lr.ph.prol ], [ %indvars.iv81, %.lr.ph.prol.preheader ]
  %113 = phi double [ %119, %.lr.ph.prol ], [ %111, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next82, i64 %indvars.iv79.prol
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv79.prol
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fsub double %113, %118
  %indvars.iv.next80.prol = add i64 %indvars.iv79.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa13.unr = phi double [ undef, %.lr.ph.preheader ], [ %119, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv79.unr = phi i64 [ %indvars.iv81, %.lr.ph.preheader ], [ %indvars.iv.next80.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.unr = phi double [ %111, %.lr.ph.preheader ], [ %119, %.lr.ph.prol.loopexit.loopexit ]
  %120 = icmp ult i64 %109, 3
  br i1 %120, label %._crit_edge18, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next80.3, %.lr.ph ]
  %121 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %143, %.lr.ph ]
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next82, i64 %indvars.iv79
  %123 = bitcast double* %122 to <2 x double>*
  %124 = getelementptr inbounds double, double* %2, i64 %indvars.iv79
  %125 = bitcast double* %124 to <2 x double>*
  %126 = load <2 x double>, <2 x double>* %123, align 8
  %127 = load <2 x double>, <2 x double>* %125, align 8
  %128 = fmul <2 x double> %126, %127
  %129 = extractelement <2 x double> %128, i32 0
  %130 = extractelement <2 x double> %128, i32 1
  %131 = fsub double %121, %129
  %132 = fsub double %131, %130
  %indvars.iv.next80.1 = add i64 %indvars.iv79, 2
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next82, i64 %indvars.iv.next80.1
  %134 = bitcast double* %133 to <2 x double>*
  %135 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next80.1
  %136 = bitcast double* %135 to <2 x double>*
  %indvars.iv.next80.2 = add i64 %indvars.iv79, 3
  %137 = load <2 x double>, <2 x double>* %134, align 8
  %138 = load <2 x double>, <2 x double>* %136, align 8
  %139 = fmul <2 x double> %137, %138
  %140 = extractelement <2 x double> %139, i32 0
  %141 = extractelement <2 x double> %139, i32 1
  %142 = fsub double %132, %140
  %143 = fsub double %142, %141
  %exitcond.3 = icmp eq i64 %indvars.iv.next80.2, 1999
  %indvars.iv.next80.3 = add i64 %indvars.iv79, 4
  br i1 %exitcond.3, label %._crit_edge18.loopexit, label %.lr.ph

._crit_edge18.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.lr.ph.prol.loopexit, %._crit_edge18._crit_edge
  %.lcssa = phi double [ %111, %._crit_edge18._crit_edge ], [ %.lcssa13.unr, %.lr.ph.prol.loopexit ], [ %143, %._crit_edge18.loopexit ]
  %144 = ptrtoint double* %2 to i64
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next82, i64 %indvars.iv.next82
  %146 = load double, double* %145, align 8
  %147 = fdiv double %.lcssa, %146
  %sunkaddr1 = shl i64 %indvars.iv81, 3
  %sunkaddr2 = add i64 %144, %sunkaddr1
  %sunkaddr3 = add i64 %sunkaddr2, -8
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  store double %147, double* %sunkaddr4, align 8
  %148 = icmp sgt i64 %indvars.iv81, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %148, label %._crit_edge18._crit_edge, label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge18
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
..lr.ph_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
