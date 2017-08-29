; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) #2 {
.lr.ph7.preheader:
  %4 = alloca [1200 x double]*, align 8
  %5 = alloca [1200 x double]*, align 8
  store [1200 x double]* %1, [1200 x double]** %4, align 8
  store [1200 x double]* %2, [1200 x double]** %5, align 8
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.prol..lr.ph7.prol_crit_edge, %.lr.ph7.preheader
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next15.prol, %.lr.ph7.prol..lr.ph7.prol_crit_edge ], [ 0, %.lr.ph7.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph7.prol..lr.ph7.prol_crit_edge ], [ 4, %.lr.ph7.preheader ]
  %6 = trunc i64 %indvars.iv14.prol to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv14.prol
  store double %7, double* %8, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph7.prol..lr.ph7_crit_edge, label %.lr.ph7.prol..lr.ph7.prol_crit_edge, !llvm.loop !1

.lr.ph7.prol..lr.ph7.prol_crit_edge:              ; preds = %.lr.ph7.prol
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  br label %.lr.ph7.prol

.lr.ph7.prol..lr.ph7_crit_edge:                   ; preds = %.lr.ph7.prol
  br label %.lr.ph7

.preheader.lr.ph:                                 ; preds = %.lr.ph7
  %9 = load [1200 x double]*, [1200 x double]** %4, align 8
  %10 = load [1200 x double]*, [1200 x double]** %5, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next10, %._crit_edge.us ]
  %11 = trunc i64 %indvars.iv9 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv
  %18 = add nuw nsw i64 %indvars.iv, 2
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %14, %22
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.200000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %17, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv9, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %12, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv9, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond12, label %._crit_edge5, label %.preheader.us

.lr.ph7:                                          ; preds = %.lr.ph7, %.lr.ph7.prol..lr.ph7_crit_edge
  %indvars.iv14 = phi i64 [ 4, %.lr.ph7.prol..lr.ph7_crit_edge ], [ %indvars.iv.next15.7, %.lr.ph7 ]
  %34 = trunc i64 %indvars.iv14 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %37 = bitcast double* %36 to <2 x double>*
  %38 = trunc i64 %indvars.iv14 to i32
  %39 = or i32 %38, 1
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  store <2 x double> %42, <2 x double>* %37, align 8
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %43 = trunc i64 %indvars.iv.next15.1 to i32
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.1
  %46 = bitcast double* %45 to <2 x double>*
  %47 = trunc i64 %indvars.iv14 to i32
  %48 = or i32 %47, 3
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %44, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  store <2 x double> %51, <2 x double>* %46, align 8
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv14, 4
  %52 = trunc i64 %indvars.iv.next15.3 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.3
  %55 = bitcast double* %54 to <2 x double>*
  %indvars.iv.next15.4 = add nsw i64 %indvars.iv14, 5
  %56 = trunc i64 %indvars.iv.next15.4 to i32
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  store <2 x double> %59, <2 x double>* %55, align 8
  %indvars.iv.next15.5 = add nsw i64 %indvars.iv14, 6
  %60 = trunc i64 %indvars.iv.next15.5 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.5
  %63 = bitcast double* %62 to <2 x double>*
  %indvars.iv.next15.6 = add nsw i64 %indvars.iv14, 7
  %64 = trunc i64 %indvars.iv.next15.6 to i32
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %61, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %indvars.iv.next15.7 = add nsw i64 %indvars.iv14, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next15.7, 500
  br i1 %exitcond17.7, label %.preheader.lr.ph, label %.lr.ph7

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader13.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge22, %.preheader13.lr.ph
  %indvars.iv61 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next62, %._crit_edge22 ]
  %sunkaddr1 = mul i64 %indvars.iv61, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %.lr.ph.new..preheader9.us_crit_edge, %._crit_edge.us..preheader9.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us..preheader9.us_crit_edge ], [ 0, %.lr.ph.new..preheader9.us_crit_edge ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us..preheader9.us_crit_edge ], [ 1, %.lr.ph.new..preheader9.us_crit_edge ]
  %4 = add i64 %indvar, 1
  %5 = add nsw i64 %indvars.iv36, -1
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %scevgep150 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 1200
  %scevgep153 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %2, i64 %4, i64 1200
  %bound0158 = icmp ult double* %scevgep147, %scevgep156
  %bound1159 = icmp ult double* %scevgep153, %scevgep150
  %memcheck.conflict161 = and i1 %bound0158, %bound1159
  br i1 %memcheck.conflict161, label %.preheader9.us.new.preheader, label %.preheader9.us.vector.body137_crit_edge

.preheader9.us.vector.body137_crit_edge:          ; preds = %.preheader9.us
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137, %.preheader9.us.vector.body137_crit_edge
  %index164 = phi i64 [ 0, %.preheader9.us.vector.body137_crit_edge ], [ %index.next165, %vector.body137 ]
  %6 = shl i64 %index164, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %6
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec173 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !3, !noalias !6
  %strided.vec174 = shufflevector <4 x double> %wide.vec173, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec175 = shufflevector <4 x double> %wide.vec173, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %6
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec176 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !6
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %5, i64 %6
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec179 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = fsub <4 x double> %wide.vec176, %wide.vec179
  %14 = shufflevector <4 x double> %13, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec174, %15
  %17 = or i64 %6, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %17
  %19 = fsub <4 x double> %wide.vec176, %wide.vec179
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec175, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec182 = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec182, <4 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %index.next165 = add i64 %index164, 2
  %25 = icmp eq i64 %index.next165, 600
  br i1 %25, label %middle.block138, label %vector.body137, !llvm.loop !8

middle.block138:                                  ; preds = %vector.body137
  br label %._crit_edge.us

.preheader9.us.new.preheader:                     ; preds = %.preheader9.us
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.preheader9.us.new.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader9.us.new.preheader ], [ %indvars.iv.next29.1, %.preheader9.us.new ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv28
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %5, i64 %indvars.iv28
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next29
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %5, i64 %indvars.iv.next29
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next29.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader9.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader9.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block138
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond, label %._crit_edge.us..preheader8.us_crit_edge, label %._crit_edge.us..preheader9.us_crit_edge

._crit_edge.us..preheader9.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader9.us

._crit_edge.us..preheader8.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader13
  %indvars.iv = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next.7, %.lr.ph.new ]
  %44 = load i64, i64* %sunkaddr3, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = load i64, i64* %sunkaddr3, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %50 = load i64, i64* %sunkaddr3, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %53 = load i64, i64* %sunkaddr3, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %56 = load i64, i64* %sunkaddr3, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %59 = load i64, i64* %sunkaddr3, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %62 = load i64, i64* %sunkaddr3, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %65 = load i64, i64* %sunkaddr3, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.lr.ph.new..preheader9.us_crit_edge, label %.lr.ph.new

.lr.ph.new..preheader9.us_crit_edge:              ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %._crit_edge17.us, %._crit_edge.us..preheader8.us_crit_edge
  %indvars.iv48 = phi i64 [ 0, %._crit_edge.us..preheader8.us_crit_edge ], [ %indvars.iv.next49, %._crit_edge17.us ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 1
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 1
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 0
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 2
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 1200
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 1200
  %bound0117 = icmp ult double* %scevgep106, %scevgep115
  %bound1118 = icmp ult double* %scevgep112, %scevgep109
  %memcheck.conflict120 = and i1 %bound0117, %bound1118
  br i1 %memcheck.conflict120, label %.preheader8.us.new.preheader, label %.preheader8.us.vector.body100_crit_edge

.preheader8.us.vector.body100_crit_edge:          ; preds = %.preheader8.us
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %.preheader8.us.vector.body100_crit_edge
  %index123 = phi i64 [ 0, %.preheader8.us.vector.body100_crit_edge ], [ %index.next124, %vector.body100 ]
  %77 = shl i64 %index123, 1
  %offset.idx = or i64 %77, 2
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec130 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %offset.idx
  %81 = getelementptr double, double* %80, i64 -1
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec131 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !15
  %strided.vec132 = shufflevector <4 x double> %wide.vec131, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec133 = shufflevector <4 x double> %wide.vec131, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fsub <2 x double> %strided.vec133, %strided.vec132
  %84 = fmul <2 x double> %83, <double 5.000000e-01, double 5.000000e-01>
  %85 = fsub <2 x double> %strided.vec, %84
  %86 = or i64 %77, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %86
  %89 = getelementptr double, double* %88, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec134 = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !15
  %strided.vec135 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec136 = shufflevector <4 x double> %wide.vec134, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fsub <2 x double> %strided.vec136, %strided.vec135
  %92 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %93 = fsub <2 x double> %strided.vec130, %92
  %94 = getelementptr double, double* %87, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %85, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %95, align 8, !alias.scope !12, !noalias !15
  %index.next124 = add i64 %index123, 2
  %96 = icmp eq i64 %index.next124, 598
  br i1 %96, label %middle.block101, label %vector.body100, !llvm.loop !17

middle.block101:                                  ; preds = %vector.body100
  br label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %middle.block101, %.preheader8.us
  %indvars.iv40.ph = phi i64 [ 2, %.preheader8.us ], [ 1198, %middle.block101 ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new, %.preheader8.us.new.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv40.ph, %.preheader8.us.new.preheader ], [ %indvars.iv.next41.1, %.preheader8.us.new ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv40
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv40
  %100 = load double, double* %99, align 8
  %101 = add nsw i64 %indvars.iv40, -1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fsub double %100, %103
  %105 = fmul double %104, 5.000000e-01
  %106 = fsub double %98, %105
  store double %106, double* %97, align 8
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next41
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv.next41
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv40
  %112 = load double, double* %111, align 8
  %113 = fsub double %110, %112
  %114 = fmul double %113, 5.000000e-01
  %115 = fsub double %108, %114
  store double %115, double* %107, align 8
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, 1200
  br i1 %exitcond43.1, label %._crit_edge17.us, label %.preheader8.us.new, !llvm.loop !18

._crit_edge17.us:                                 ; preds = %.preheader8.us.new
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond51, label %._crit_edge17.us..preheader.us_crit_edge, label %.preheader8.us

._crit_edge17.us..preheader.us_crit_edge:         ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge20.us, %._crit_edge17.us..preheader.us_crit_edge
  %indvars.iv57 = phi i64 [ 0, %._crit_edge17.us..preheader.us_crit_edge ], [ %indvars.iv.next58, %._crit_edge20.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 0
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 1199
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 0
  %116 = add i64 %indvars.iv57, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %116, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %1, i64 %116, i64 1199
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %bound0 = icmp ult double* %scevgep, %scevgep81
  %bound1 = icmp ult double* %scevgep79, %scevgep77
  %found.conflict = and i1 %bound0, %bound1
  %bound087 = icmp ult double* %scevgep, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep77
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx = or i1 %found.conflict, %found.conflict89
  br i1 %conflict.rdx, label %._crit_edge68.preheader, label %.preheader.us.vector.body_crit_edge

.preheader.us.vector.body_crit_edge:              ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us.vector.body_crit_edge
  %index = phi i64 [ 0, %.preheader.us.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %index
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !19, !noalias !22
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !19, !noalias !22
  %121 = or i64 %index, 1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !25
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !25
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !25
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = fsub <2 x double> %wide.load92, %wide.load94
  %131 = fsub <2 x double> %wide.load93, %wide.load95
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next58, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !26
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !26
  %136 = fadd <2 x double> %130, %wide.load96
  %137 = fadd <2 x double> %131, %wide.load97
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %index
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %141, align 8, !alias.scope !26
  %142 = fsub <2 x double> %136, %wide.load98
  %143 = fsub <2 x double> %137, %wide.load99
  %144 = fmul <2 x double> %142, <double 7.000000e-01, double 7.000000e-01>
  %145 = fmul <2 x double> %143, <double 7.000000e-01, double 7.000000e-01>
  %146 = fsub <2 x double> %wide.load, %144
  %147 = fsub <2 x double> %wide.load91, %145
  %148 = bitcast double* %117 to <2 x double>*
  store <2 x double> %146, <2 x double>* %148, align 8, !alias.scope !19, !noalias !22
  %149 = bitcast double* %119 to <2 x double>*
  store <2 x double> %147, <2 x double>* %149, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %150 = icmp eq i64 %index.next, 1196
  br i1 %150, label %._crit_edge68.preheader.loopexit, label %vector.body, !llvm.loop !27

._crit_edge68.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge68.preheader

._crit_edge68.preheader:                          ; preds = %._crit_edge68.preheader.loopexit, %.preheader.us
  %indvars.iv53.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge68.preheader.loopexit ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %._crit_edge68.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv53.ph, %._crit_edge68.preheader ], [ %indvars.iv.next54, %._crit_edge68 ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv53
  %152 = load double, double* %151, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next54
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv53
  %156 = load double, double* %155, align 8
  %157 = fsub double %154, %156
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next58, i64 %indvars.iv53
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv53
  %162 = load double, double* %161, align 8
  %163 = fsub double %160, %162
  %164 = fmul double %163, 7.000000e-01
  %165 = fsub double %152, %164
  store double %165, double* %151, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1199
  br i1 %exitcond56, label %._crit_edge20.us, label %._crit_edge68, !llvm.loop !28

._crit_edge20.us:                                 ; preds = %._crit_edge68
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 999
  br i1 %exitcond60, label %._crit_edge22, label %.preheader.us

._crit_edge22:                                    ; preds = %._crit_edge20.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 500
  br i1 %exitcond64, label %._crit_edge24, label %.preheader13

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader13.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge21.us, %.preheader13.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next46, %._crit_edge21.us ]
  %7 = mul nuw nsw i64 %indvars.iv45, 1000
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge, %.preheader13.us
  %indvars.iv41 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next42, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv41, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge50
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge50, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv41
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %._crit_edge21.us, label %._crit_edge50

._crit_edge21.us:                                 ; preds = %._crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond48, label %._crit_edge23, label %.preheader13.us

._crit_edge23:                                    ; preds = %._crit_edge21.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge17.us, %._crit_edge23
  %indvars.iv36 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next37, %._crit_edge17.us ]
  %24 = mul nuw nsw i64 %indvars.iv36, 1000
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge51, %.preheader12.us
  %indvars.iv32 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next33, %._crit_edge51 ]
  %25 = add nuw nsw i64 %indvars.iv32, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge51

; <label>:29:                                     ; preds = %._crit_edge52
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge52, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv32
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond35, label %._crit_edge17.us, label %._crit_edge52

._crit_edge17.us:                                 ; preds = %._crit_edge51
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond39, label %._crit_edge19, label %.preheader12.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge19
  %indvars.iv27 = phi i64 [ 0, %._crit_edge19 ], [ %indvars.iv.next28, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv27, 1000
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge53 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge53

; <label>:44:                                     ; preds = %._crit_edge54
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge54, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge54

._crit_edge.us:                                   ; preds = %._crit_edge53
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond30, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}
