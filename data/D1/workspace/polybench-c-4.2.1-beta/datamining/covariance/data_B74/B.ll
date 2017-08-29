; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  br i1 %14, label %15, label %.._crit_edge_crit_edge14

.._crit_edge_crit_edge14:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge14, %.._crit_edge_crit_edge, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.._crit_edge3_crit_edge, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %.._crit_edge3_crit_edge ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge3
  %indvars.iv = phi i64 [ 0, %._crit_edge3 ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %10 = trunc i64 %indvars.iv to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %19, label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %18
  br label %._crit_edge3

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph88.split.us.preheader:
  %sunkaddr144 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph88.split.us

.lr.ph88.split.us:                                ; preds = %._crit_edge84.us..lr.ph88.split.us_crit_edge, %.lr.ph88.split.us.preheader
  %indvars.iv128 = phi i64 [ 0, %.lr.ph88.split.us.preheader ], [ %indvars.iv.next129, %._crit_edge84.us..lr.ph88.split.us_crit_edge ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv128
  store double 0.000000e+00, double* %4, align 8
  %sunkaddr145 = shl i64 %indvars.iv128, 3
  %sunkaddr146 = add i64 %sunkaddr144, %sunkaddr145
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph88.split.us
  %indvars.iv125 = phi i64 [ 0, %.lr.ph88.split.us ], [ %indvars.iv.next126.4, %._crit_edge.._crit_edge_crit_edge ]
  %5 = phi double [ 0.000000e+00, %.lr.ph88.split.us ], [ %20, %._crit_edge.._crit_edge_crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv128
  %7 = load double, double* %6, align 8
  %8 = fadd double %5, %7
  store double %8, double* %sunkaddr147, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next126, i64 %indvars.iv128
  %10 = load double, double* %9, align 8
  %11 = fadd double %8, %10
  store double %11, double* %sunkaddr147, align 8
  %indvars.iv.next126.1 = add nuw nsw i64 %indvars.iv125, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next126.1, i64 %indvars.iv128
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr147, align 8
  %indvars.iv.next126.2 = add nuw nsw i64 %indvars.iv125, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next126.2, i64 %indvars.iv128
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr147, align 8
  %indvars.iv.next126.3 = add nuw nsw i64 %indvars.iv125, 4
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next126.3, i64 %indvars.iv128
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr147, align 8
  %indvars.iv.next126.4 = add nuw nsw i64 %indvars.iv125, 5
  %exitcond127.4 = icmp eq i64 %indvars.iv.next126.4, 1400
  br i1 %exitcond127.4, label %._crit_edge84.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge84.us:                                 ; preds = %._crit_edge
  %21 = fdiv double %20, %0
  %sunkaddr28 = shl i64 %indvars.iv128, 3
  %sunkaddr29 = add i64 %sunkaddr, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  store double %21, double* %sunkaddr30, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next129, 1200
  br i1 %exitcond130, label %._crit_edge84.us..lr.ph79.split.us_crit_edge, label %._crit_edge84.us..lr.ph88.split.us_crit_edge

._crit_edge84.us..lr.ph88.split.us_crit_edge:     ; preds = %._crit_edge84.us
  br label %.lr.ph88.split.us

._crit_edge84.us..lr.ph79.split.us_crit_edge:     ; preds = %._crit_edge84.us
  %scevgep14 = getelementptr double, double* %3, i64 1200
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %._crit_edge76.us..lr.ph79.split.us_crit_edge, %._crit_edge84.us..lr.ph79.split.us_crit_edge
  %indvars.iv121 = phi i64 [ 0, %._crit_edge84.us..lr.ph79.split.us_crit_edge ], [ %22, %._crit_edge76.us..lr.ph79.split.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 0
  %22 = add nuw nsw i64 %indvars.iv121, 1
  %scevgep12 = getelementptr [1200 x double], [1200 x double]* %1, i64 %22, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep14
  %bound1 = icmp ugt double* %scevgep12, %3
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph79.split.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph79.split.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %23 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec19 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <8 x double> %wide.vec19, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %30 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %31 = or i64 %offset.idx, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %31
  %33 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %38 = icmp eq i64 %index.next, 300
  br i1 %38, label %._crit_edge76.us.loopexit31, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.3, %scalar.ph.scalar.ph_crit_edge ], [ 0, %scalar.ph.preheader ]
  %39 = getelementptr inbounds double, double* %3, i64 %indvars.iv118
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv118
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next119
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next119
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next119.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next119.1
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %54 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next119.2
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next119.2
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next119.3 = add nuw nsw i64 %indvars.iv118, 4
  %exitcond120.3 = icmp eq i64 %indvars.iv.next119.3, 1200
  br i1 %exitcond120.3, label %._crit_edge76.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !9

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge76.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge76.us

._crit_edge76.us.loopexit31:                      ; preds = %vector.body
  br label %._crit_edge76.us

._crit_edge76.us:                                 ; preds = %._crit_edge76.us.loopexit31, %._crit_edge76.us.loopexit
  %exitcond123 = icmp eq i64 %22, 1400
  br i1 %exitcond123, label %.lr.ph71.split.us.preheader, label %._crit_edge76.us..lr.ph79.split.us_crit_edge

._crit_edge76.us..lr.ph79.split.us_crit_edge:     ; preds = %._crit_edge76.us
  br label %.lr.ph79.split.us

.lr.ph71.split.us.preheader:                      ; preds = %._crit_edge76.us
  %59 = fadd double %0, -1.000000e+00
  br label %.lr.ph67.us

.lr.ph67.us:                                      ; preds = %._crit_edge68.us-lcssa.us.us..lr.ph67.us_crit_edge, %.lr.ph71.split.us.preheader
  %indvars.iv107 = phi i64 [ 0, %.lr.ph71.split.us.preheader ], [ %indvars.iv.next108, %._crit_edge68.us-lcssa.us.us..lr.ph67.us_crit_edge ]
  br label %.lr.ph.us.us

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next108, 1200
  br i1 %exitcond109, label %._crit_edge72, label %._crit_edge68.us-lcssa.us.us..lr.ph67.us_crit_edge

._crit_edge68.us-lcssa.us.us..lr.ph67.us_crit_edge: ; preds = %._crit_edge68.us-lcssa.us.us
  br label %.lr.ph67.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph67.us
  %indvars.iv104 = phi i64 [ %indvars.iv107, %.lr.ph67.us ], [ %indvars.iv.next105, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv107, i64 %indvars.iv104
  store double 0.000000e+00, double* %60, align 8
  br label %._crit_edge25

._crit_edge.us.us:                                ; preds = %._crit_edge25
  %61 = fdiv double %75, %59
  store double %61, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv107
  store double %61, double* %62, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next105, 1200
  br i1 %exitcond106, label %._crit_edge68.us-lcssa.us.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

._crit_edge25:                                    ; preds = %._crit_edge25.._crit_edge25_crit_edge, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge25.._crit_edge25_crit_edge ]
  %63 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %75, %._crit_edge25.._crit_edge25_crit_edge ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv107
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv104
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %60, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv107
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv104
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge25.._crit_edge25_crit_edge

._crit_edge25.._crit_edge25_crit_edge:            ; preds = %._crit_edge25
  br label %._crit_edge25

._crit_edge72:                                    ; preds = %._crit_edge68.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph13.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge.us..lr.ph13.split.us_crit_edge, %.lr.ph13.split.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us..lr.ph13.split.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge.._crit_edge3_crit_edge, %.lr.ph13.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge3_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge3.._crit_edge_crit_edge

._crit_edge3.._crit_edge_crit_edge:               ; preds = %._crit_edge3
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge3_crit_edge

._crit_edge.._crit_edge3_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge14, label %._crit_edge.us..lr.ph13.split.us_crit_edge

._crit_edge.us..lr.ph13.split.us_crit_edge:       ; preds = %._crit_edge.us
  br label %.lr.ph13.split.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
