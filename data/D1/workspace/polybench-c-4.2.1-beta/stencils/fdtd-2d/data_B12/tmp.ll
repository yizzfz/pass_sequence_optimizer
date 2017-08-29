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
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %19

; <label>:19:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) #2 {
.lr.ph8.preheader:
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.preheader, %.lr.ph8.prol
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %.lr.ph8.prol ], [ 0, %.lr.ph8.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph8.prol ], [ 4, %.lr.ph8.preheader ]
  %7 = trunc i64 %indvars.iv15.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv15.prol
  store double %8, double* %9, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph8.preheader20, label %.lr.ph8.prol, !llvm.loop !1

.lr.ph8.preheader20:                              ; preds = %.lr.ph8.prol
  br label %.lr.ph8

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv10 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %18 = add nuw nsw i64 %indvars.iv, 2
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %13, %22
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.200000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %17, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %11, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv10, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %._crit_edge6, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8.preheader20, %.lr.ph8
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.7, %.lr.ph8 ], [ %indvars.iv.next16.prol, %.lr.ph8.preheader20 ]
  %34 = trunc i64 %indvars.iv15 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv15
  %37 = bitcast double* %36 to <2 x double>*
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %38 = trunc i64 %indvars.iv.next16 to i32
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %35, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  store <2 x double> %41, <2 x double>* %37, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %42 = trunc i64 %indvars.iv.next16.1 to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.1
  %45 = bitcast double* %44 to <2 x double>*
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %46 = trunc i64 %indvars.iv.next16.2 to i32
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  store <2 x double> %49, <2 x double>* %45, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %50 = trunc i64 %indvars.iv.next16.3 to i32
  %51 = sitofp i32 %50 to double
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.3
  %53 = bitcast double* %52 to <2 x double>*
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %54 = trunc i64 %indvars.iv.next16.4 to i32
  %55 = sitofp i32 %54 to double
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  store <2 x double> %57, <2 x double>* %53, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %58 = trunc i64 %indvars.iv.next16.5 to i32
  %59 = sitofp i32 %58 to double
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.5
  %61 = bitcast double* %60 to <2 x double>*
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %62 = trunc i64 %indvars.iv.next16.6 to i32
  %63 = sitofp i32 %62 to double
  %64 = insertelement <2 x double> undef, double %59, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  store <2 x double> %65, <2 x double>* %61, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, 500
  br i1 %exitcond18.7, label %.preheader.us.preheader, label %.lr.ph8

.preheader.us.preheader:                          ; preds = %.lr.ph8
  br label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader13.lr.ph:
  %sunkaddr = ptrtoint double* %6 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge22, %.preheader13.lr.ph
  %indvars.iv61 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next62, %._crit_edge22 ]
  %sunkaddr208 = shl i64 %indvars.iv61, 3
  %sunkaddr209 = add i64 %sunkaddr, %sunkaddr208
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %7 = add i64 %indvar, 1
  %8 = add nsw i64 %indvars.iv36, -1
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 1200
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %5, i64 %7, i64 1200
  %bound0154 = icmp ult double* %scevgep143, %scevgep152
  %bound1155 = icmp ult double* %scevgep149, %scevgep146
  %memcheck.conflict157 = and i1 %bound0154, %bound1155
  br i1 %memcheck.conflict157, label %.preheader9.us.new.preheader, label %vector.body133.preheader

vector.body133.preheader:                         ; preds = %.preheader9.us
  br label %vector.body133

vector.body133:                                   ; preds = %vector.body133.preheader, %vector.body133
  %index160 = phi i64 [ %index.next161, %vector.body133 ], [ 0, %vector.body133.preheader ]
  %9 = shl i64 %index160, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %9
  %11 = bitcast double* %10 to <4 x double>*
  %wide.vec169 = load <4 x double>, <4 x double>* %11, align 8, !alias.scope !3, !noalias !6
  %strided.vec170 = shufflevector <4 x double> %wide.vec169, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec171 = shufflevector <4 x double> %wide.vec169, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %9
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec172 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !6
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %9
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec175 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = fsub <4 x double> %wide.vec172, %wide.vec175
  %17 = shufflevector <4 x double> %16, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fsub <2 x double> %strided.vec170, %18
  %20 = or i64 %9, 1
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %20
  %22 = fsub <4 x double> %wide.vec172, %wide.vec175
  %23 = shufflevector <4 x double> %22, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %24 = fmul <2 x double> %23, <double 5.000000e-01, double 5.000000e-01>
  %25 = fsub <2 x double> %strided.vec171, %24
  %26 = getelementptr double, double* %21, i64 -1
  %27 = bitcast double* %26 to <4 x double>*
  %interleaved.vec178 = shufflevector <2 x double> %19, <2 x double> %25, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec178, <4 x double>* %27, align 8, !alias.scope !3, !noalias !6
  %index.next161 = add i64 %index160, 2
  %28 = icmp eq i64 %index.next161, 600
  br i1 %28, label %middle.block134, label %vector.body133, !llvm.loop !8

middle.block134:                                  ; preds = %vector.body133
  br i1 true, label %._crit_edge.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %middle.block134, %.preheader9.us
  %indvars.iv28.ph = phi i64 [ 0, %.preheader9.us ], [ 1200, %middle.block134 ]
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new.preheader, %.preheader9.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.preheader9.us.new ], [ %indvars.iv28.ph, %.preheader9.us.new.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv28
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %indvars.iv28
  %34 = load double, double* %33, align 8
  %35 = fsub double %32, %34
  %36 = fmul double %35, 5.000000e-01
  %37 = fsub double %30, %36
  store double %37, double* %29, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next29
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv.next29
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %indvars.iv.next29
  %43 = load double, double* %42, align 8
  %44 = fsub double %41, %43
  %45 = fmul double %44, 5.000000e-01
  %46 = fsub double %39, %45
  store double %46, double* %38, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next29.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader9.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader9.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block134
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.preheader13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader13 ]
  %47 = load i64, i64* %sunkaddr210, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %50 = load i64, i64* %sunkaddr210, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %53 = load i64, i64* %sunkaddr210, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %56 = load i64, i64* %sunkaddr210, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %59 = load i64, i64* %sunkaddr210, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %62 = load i64, i64* %sunkaddr210, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %65 = load i64, i64* %sunkaddr210, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %68 = load i64, i64* %sunkaddr210, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader9.us.preheader, label %.lr.ph.new

.preheader9.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge17.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge17.us ], [ 0, %.preheader8.us.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 1
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 0
  %76 = load double, double* %75, align 8
  %77 = fsub double %74, %76
  %78 = fmul double %77, 5.000000e-01
  %79 = fsub double %72, %78
  store double %79, double* %71, align 8
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 2
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 1200
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1200
  %bound0113 = icmp ult double* %scevgep102, %scevgep111
  %bound1114 = icmp ult double* %scevgep108, %scevgep105
  %memcheck.conflict116 = and i1 %bound0113, %bound1114
  br i1 %memcheck.conflict116, label %.preheader8.us.new.preheader, label %vector.body96.preheader

vector.body96.preheader:                          ; preds = %.preheader8.us
  br label %vector.body96

vector.body96:                                    ; preds = %vector.body96.preheader, %vector.body96
  %index119 = phi i64 [ %index.next120, %vector.body96 ], [ 0, %vector.body96.preheader ]
  %80 = shl i64 %index119, 1
  %offset.idx = or i64 %80, 2
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec126 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %offset.idx
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %wide.vec127 = load <4 x double>, <4 x double>* %85, align 8, !alias.scope !15
  %strided.vec128 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec129 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %86 = fsub <2 x double> %strided.vec129, %strided.vec128
  %87 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %strided.vec, %87
  %89 = or i64 %80, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %89
  %92 = getelementptr double, double* %91, i64 -1
  %93 = bitcast double* %92 to <4 x double>*
  %wide.vec130 = load <4 x double>, <4 x double>* %93, align 8, !alias.scope !15
  %strided.vec131 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec132 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %94 = fsub <2 x double> %strided.vec132, %strided.vec131
  %95 = fmul <2 x double> %94, <double 5.000000e-01, double 5.000000e-01>
  %96 = fsub <2 x double> %strided.vec126, %95
  %97 = getelementptr double, double* %90, i64 -1
  %98 = bitcast double* %97 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %88, <2 x double> %96, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %98, align 8, !alias.scope !12, !noalias !15
  %index.next120 = add i64 %index119, 2
  %99 = icmp eq i64 %index.next120, 598
  br i1 %99, label %middle.block97, label %vector.body96, !llvm.loop !17

middle.block97:                                   ; preds = %vector.body96
  br i1 false, label %._crit_edge17.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %middle.block97, %.preheader8.us
  %indvars.iv40.ph = phi i64 [ 2, %.preheader8.us ], [ 1198, %middle.block97 ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %.preheader8.us.new ], [ %indvars.iv40.ph, %.preheader8.us.new.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv40
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv40
  %103 = load double, double* %102, align 8
  %104 = add nsw i64 %indvars.iv40, -1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fsub double %103, %106
  %108 = fmul double %107, 5.000000e-01
  %109 = fsub double %101, %108
  store double %109, double* %100, align 8
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv.next41
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.next41
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv40
  %115 = load double, double* %114, align 8
  %116 = fsub double %113, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fsub double %111, %117
  store double %118, double* %110, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, 1200
  br i1 %exitcond43.1, label %._crit_edge17.us.loopexit, label %.preheader8.us.new, !llvm.loop !18

._crit_edge17.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block97
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond51, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge20.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge20.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 0
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 1199
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 0
  %119 = add i64 %indvars.iv57, 1
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %3, i64 %119, i64 0
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 0
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %4, i64 %119, i64 1199
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %bound0 = icmp ult double* %scevgep, %scevgep77
  %bound1 = icmp ult double* %scevgep75, %scevgep73
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ult double* %scevgep, %scevgep81
  %bound184 = icmp ult double* %scevgep79, %scevgep73
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = or i64 %index, 1
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %index
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = fsub <2 x double> %wide.load88, %wide.load90
  %134 = fsub <2 x double> %wide.load89, %wide.load91
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next58, i64 %index
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = fadd <2 x double> %133, %wide.load92
  %140 = fadd <2 x double> %134, %wide.load93
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %index
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = fsub <2 x double> %139, %wide.load94
  %146 = fsub <2 x double> %140, %wide.load95
  %147 = fmul <2 x double> %145, <double 7.000000e-01, double 7.000000e-01>
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fsub <2 x double> %wide.load, %147
  %150 = fsub <2 x double> %wide.load87, %148
  %151 = bitcast double* %120 to <2 x double>*
  store <2 x double> %149, <2 x double>* %151, align 8, !alias.scope !19, !noalias !22
  %152 = bitcast double* %122 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %153 = icmp eq i64 %index.next, 1196
  br i1 %153, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv53.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph ], [ %indvars.iv53.ph, %scalar.ph.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv53
  %155 = load double, double* %154, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv.next54
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv53
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next58, i64 %indvars.iv53
  %162 = load double, double* %161, align 8
  %163 = fadd double %160, %162
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv53
  %165 = load double, double* %164, align 8
  %166 = fsub double %163, %165
  %167 = fmul double %166, 7.000000e-01
  %168 = fsub double %155, %167
  store double %168, double* %154, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1199
  br i1 %exitcond56, label %._crit_edge20.us, label %scalar.ph, !llvm.loop !28

._crit_edge20.us:                                 ; preds = %scalar.ph
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
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader13.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge21.us, %.preheader13.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next46, %._crit_edge21.us ]
  %9 = mul nsw i64 %indvars.iv45, 1000
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader13.us
  %indvars.iv41 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next42, %17 ]
  %11 = add nsw i64 %indvars.iv41, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %._crit_edge21.us, label %10

._crit_edge21.us:                                 ; preds = %17
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond48, label %._crit_edge23, label %.preheader13.us

._crit_edge23:                                    ; preds = %._crit_edge21.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge17.us, %._crit_edge23
  %indvars.iv36 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next37, %._crit_edge17.us ]
  %28 = mul nsw i64 %indvars.iv36, 1000
  br label %29

; <label>:29:                                     ; preds = %36, %.preheader12.us
  %indvars.iv32 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next33, %36 ]
  %30 = add nsw i64 %indvars.iv32, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv32
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond35, label %._crit_edge17.us, label %29

._crit_edge17.us:                                 ; preds = %36
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond39, label %._crit_edge19, label %.preheader12.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge19
  %indvars.iv27 = phi i64 [ 0, %._crit_edge19 ], [ %indvars.iv.next28, %._crit_edge.us ]
  %45 = mul nsw i64 %indvars.iv27, 1000
  br label %46

; <label>:46:                                     ; preds = %53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %53 ]
  %47 = add nsw i64 %indvars.iv, %45
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %46
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #5
  br label %53

; <label>:53:                                     ; preds = %51, %46
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond30, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
