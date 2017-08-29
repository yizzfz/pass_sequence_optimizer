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
define i32 @main(i32, i8**) #0 {
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
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph7.preheader:
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %7, align 8
  store [1200 x double]* %5, [1200 x double]** %8, align 8
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.preheader, %.lr.ph7.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph7.prol ], [ 0, %.lr.ph7.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph7.prol ], [ 4, %.lr.ph7.preheader ]
  %9 = trunc i64 %indvars.iv11.prol to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %6, i64 %indvars.iv11.prol
  store double %10, double* %11, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph7.preheader16, label %.lr.ph7.prol, !llvm.loop !1

.lr.ph7.preheader16:                              ; preds = %.lr.ph7.prol
  br label %.lr.ph7

.preheader.lr.ph:                                 ; preds = %.lr.ph7
  %12 = load [1200 x double]*, [1200 x double]** %7, align 8
  %13 = load [1200 x double]*, [1200 x double]** %8, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %storemerge14.us = phi i32 [ %38, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %14 = sitofp i32 %storemerge14.us to double
  %15 = sext i32 %storemerge14.us to i64
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %18

; <label>:18:                                     ; preds = %18, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %18 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = trunc i64 %indvars.iv.next to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %15, i64 %indvars.iv
  %22 = add nuw nsw i64 %indvars.iv, 2
  %23 = trunc i64 %22 to i32
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %20, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fmul <2 x double> %17, %26
  %28 = fdiv <2 x double> %27, <double 1.000000e+03, double 1.200000e+03>
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  store double %29, double* %21, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %15, i64 %indvars.iv
  store double %30, double* %31, align 8
  %32 = add nuw nsw i64 %indvars.iv, 3
  %33 = trunc i64 %32 to i32
  %34 = sitofp i32 %33 to double
  %35 = fmul double %14, %34
  %36 = fdiv double %35, 1.000000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %13, i64 %15, i64 %indvars.iv
  store double %36, double* %37, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %18

._crit_edge.us:                                   ; preds = %18
  %38 = add nsw i32 %storemerge14.us, 1
  %39 = icmp slt i32 %38, 1000
  br i1 %39, label %.preheader.us, label %._crit_edge5

.lr.ph7:                                          ; preds = %.lr.ph7.preheader16, %.lr.ph7
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph7 ], [ %indvars.iv.next12.prol, %.lr.ph7.preheader16 ]
  %40 = trunc i64 %indvars.iv11 to i32
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %43 = bitcast double* %42 to <2 x double>*
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %44 = trunc i64 %indvars.iv.next12 to i32
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %41, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  store <2 x double> %47, <2 x double>* %43, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %48 = trunc i64 %indvars.iv.next12.1 to i32
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %51 = bitcast double* %50 to <2 x double>*
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %52 = trunc i64 %indvars.iv.next12.2 to i32
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  store <2 x double> %55, <2 x double>* %51, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %56 = trunc i64 %indvars.iv.next12.3 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  %59 = bitcast double* %58 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %60 = trunc i64 %indvars.iv.next12.4 to i32
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %57, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  store <2 x double> %63, <2 x double>* %59, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %64 = trunc i64 %indvars.iv.next12.5 to i32
  %65 = sitofp i32 %64 to double
  %66 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.5
  %67 = bitcast double* %66 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %68 = trunc i64 %indvars.iv.next12.6 to i32
  %69 = sitofp i32 %68 to double
  %70 = insertelement <2 x double> undef, double %65, i32 0
  %71 = insertelement <2 x double> %70, double %69, i32 1
  store <2 x double> %71, <2 x double>* %67, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, 500
  br i1 %exitcond14.7, label %.preheader.lr.ph, label %.lr.ph7

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader13.lr.ph:
  %sunkaddr63 = ptrtoint double* %6 to i64
  %sunkaddr67 = ptrtoint double* %6 to i64
  %sunkaddr71 = ptrtoint double* %6 to i64
  %sunkaddr75 = ptrtoint double* %6 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge22, %.preheader13.lr.ph
  %indvars.iv54 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next55, %._crit_edge22 ]
  %sunkaddr64 = shl i64 %indvars.iv54, 3
  %sunkaddr65 = add i64 %sunkaddr63, %sunkaddr64
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i64*
  %sunkaddr68 = shl i64 %indvars.iv54, 3
  %sunkaddr69 = add i64 %sunkaddr67, %sunkaddr68
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i64*
  %sunkaddr72 = shl i64 %indvars.iv54, 3
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i64*
  %sunkaddr76 = shl i64 %indvars.iv54, 3
  %sunkaddr77 = add i64 %sunkaddr75, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge.us
  %indvar151 = phi i64 [ %indvar.next152, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %storemerge215.us = phi i32 [ %49, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %7 = add i64 %indvar151, 1
  %8 = sext i32 %storemerge215.us to i64
  %9 = add nsw i32 %storemerge215.us, -1
  %10 = sext i32 %9 to i64
  %scevgep154 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %scevgep157 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 1200
  %scevgep160 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar151, i64 0
  %scevgep163 = getelementptr [1200 x double], [1200 x double]* %5, i64 %7, i64 1200
  %bound0165 = icmp ult double* %scevgep154, %scevgep163
  %bound1166 = icmp ult double* %scevgep160, %scevgep157
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %.preheader9.us.new.preheader, label %vector.body142.preheader

vector.body142.preheader:                         ; preds = %.preheader9.us
  br label %vector.body142

vector.body142:                                   ; preds = %vector.body142.preheader, %vector.body142
  %index171 = phi i64 [ %index.next172, %vector.body142 ], [ 0, %vector.body142.preheader ]
  %11 = shl i64 %index171, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %8, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec180 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec181 = shufflevector <4 x double> %wide.vec180, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec182 = shufflevector <4 x double> %wide.vec180, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec183 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec186 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec183, %wide.vec186
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec181, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %8, i64 %22
  %24 = fsub <4 x double> %wide.vec183, %wide.vec186
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec182, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec189 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec189, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next172 = add i64 %index171, 2
  %30 = icmp eq i64 %index.next172, 600
  br i1 %30, label %middle.block143, label %vector.body142, !llvm.loop !8

middle.block143:                                  ; preds = %vector.body142
  br i1 true, label %._crit_edge.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %middle.block143, %.preheader9.us
  %indvars.iv34.ph = phi i64 [ 0, %.preheader9.us ], [ 1200, %middle.block143 ]
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new.preheader, %.preheader9.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.preheader9.us.new ], [ %indvars.iv34.ph, %.preheader9.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %8, i64 %indvars.iv34
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %indvars.iv34
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv34
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next35 = or i64 %indvars.iv34, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %8, i64 %indvars.iv.next35
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %8, i64 %indvars.iv.next35
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next35
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next35.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader9.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader9.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block143
  %49 = add nsw i32 %storemerge215.us, 1
  %50 = icmp slt i32 %49, 1000
  %indvar.next152 = add i64 %indvar151, 1
  br i1 %50, label %.preheader9.us, label %.preheader8.us.preheader

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.preheader13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader13 ]
  %51 = load i64, i64* %sunkaddr66, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %54 = load i64, i64* %sunkaddr70, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %57 = load i64, i64* %sunkaddr74, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %60 = load i64, i64* %sunkaddr78, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1200
  br i1 %exitcond.3, label %.preheader9.us.preheader, label %.lr.ph.new

.preheader9.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge17.us
  %indvar108 = phi i64 [ %indvar.next109, %._crit_edge17.us ], [ 0, %.preheader8.us.preheader ]
  %storemerge318.us = phi i32 [ %112, %._crit_edge17.us ], [ 0, %.preheader8.us.preheader ]
  %63 = sext i32 %storemerge318.us to i64
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %63, i64 1
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 1
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 0
  %69 = load double, double* %68, align 8
  %70 = fsub double %67, %69
  %71 = fmul double %70, 5.000000e-01
  %72 = fsub double %65, %71
  store double %72, double* %64, align 8
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar108, i64 2
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar108, i64 1200
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar108, i64 1
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar108, i64 1200
  %bound0122 = icmp ult double* %scevgep111, %scevgep120
  %bound1123 = icmp ult double* %scevgep117, %scevgep114
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  br i1 %memcheck.conflict125, label %.preheader8.us.new.preheader, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %.preheader8.us
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index128 = phi i64 [ %index.next129, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %73 = shl i64 %index128, 1
  %offset.idx = or i64 %73, 2
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %63, i64 %offset.idx
  %75 = bitcast double* %74 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %75, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec135 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %offset.idx
  %77 = getelementptr double, double* %76, i64 -1
  %78 = bitcast double* %77 to <4 x double>*
  %wide.vec136 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !15
  %strided.vec137 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fsub <2 x double> %strided.vec138, %strided.vec137
  %80 = fmul <2 x double> %79, <double 5.000000e-01, double 5.000000e-01>
  %81 = fsub <2 x double> %strided.vec, %80
  %82 = or i64 %73, 3
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %63, i64 %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %82
  %85 = getelementptr double, double* %84, i64 -1
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !15
  %strided.vec140 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fsub <2 x double> %strided.vec141, %strided.vec140
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %strided.vec135, %88
  %90 = getelementptr double, double* %83, i64 -1
  %91 = bitcast double* %90 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %81, <2 x double> %89, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %91, align 8, !alias.scope !12, !noalias !15
  %index.next129 = add i64 %index128, 2
  %92 = icmp eq i64 %index.next129, 598
  br i1 %92, label %middle.block104, label %vector.body103, !llvm.loop !17

middle.block104:                                  ; preds = %vector.body103
  br i1 false, label %._crit_edge17.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %middle.block104, %.preheader8.us
  %indvars.iv42.ph = phi i64 [ 2, %.preheader8.us ], [ 1198, %middle.block104 ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %.preheader8.us.new ], [ %indvars.iv42.ph, %.preheader8.us.new.preheader ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %63, i64 %indvars.iv42
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %indvars.iv42
  %96 = load double, double* %95, align 8
  %97 = add nsw i64 %indvars.iv42, -1
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fsub double %96, %99
  %101 = fmul double %100, 5.000000e-01
  %102 = fsub double %94, %101
  store double %102, double* %93, align 8
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %63, i64 %indvars.iv.next43
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %indvars.iv.next43
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %63, i64 %indvars.iv42
  %108 = load double, double* %107, align 8
  %109 = fsub double %106, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %104, %110
  store double %111, double* %103, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond.150 = icmp eq i64 %indvars.iv.next43.1, 1200
  br i1 %exitcond.150, label %._crit_edge17.us.loopexit, label %.preheader8.us.new, !llvm.loop !18

._crit_edge17.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block104
  %112 = add nsw i32 %storemerge318.us, 1
  %113 = icmp slt i32 %112, 1000
  %indvar.next109 = add i64 %indvar108, 1
  br i1 %113, label %.preheader8.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge20.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge20.us ], [ 0, %.preheader.us.preheader ]
  %storemerge421.us = phi i32 [ %167, %._crit_edge20.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 1199
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar, i64 0
  %114 = add i64 %indvar, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %3, i64 %114, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %4, i64 %114, i64 1199
  %115 = sext i32 %storemerge421.us to i64
  %116 = add nuw nsw i32 %storemerge421.us, 1
  %117 = sext i32 %116 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ult double* %scevgep82, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %scevgep88
  %bound191 = icmp ult double* %scevgep86, %scevgep80
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %115, i64 %index
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !19, !noalias !22
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = or i64 %index, 1
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %115, i64 %122
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !25
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %115, i64 %index
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = fsub <2 x double> %wide.load95, %wide.load97
  %132 = fsub <2 x double> %wide.load96, %wide.load98
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %117, i64 %index
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !26
  %135 = getelementptr double, double* %133, i64 2
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = fadd <2 x double> %131, %wide.load99
  %138 = fadd <2 x double> %132, %wide.load100
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %115, i64 %index
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = getelementptr double, double* %139, i64 2
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = fsub <2 x double> %137, %wide.load101
  %144 = fsub <2 x double> %138, %wide.load102
  %145 = fmul <2 x double> %143, <double 7.000000e-01, double 7.000000e-01>
  %146 = fmul <2 x double> %144, <double 7.000000e-01, double 7.000000e-01>
  %147 = fsub <2 x double> %wide.load, %145
  %148 = fsub <2 x double> %wide.load94, %146
  %149 = bitcast double* %118 to <2 x double>*
  store <2 x double> %147, <2 x double>* %149, align 8, !alias.scope !19, !noalias !22
  %150 = bitcast double* %120 to <2 x double>*
  store <2 x double> %148, <2 x double>* %150, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %151 = icmp eq i64 %index.next, 1196
  br i1 %151, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv51.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %scalar.ph ], [ %indvars.iv51.ph, %scalar.ph.preheader ]
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %115, i64 %indvars.iv51
  %153 = load double, double* %152, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %115, i64 %indvars.iv.next52
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %115, i64 %indvars.iv51
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %117, i64 %indvars.iv51
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %115, i64 %indvars.iv51
  %163 = load double, double* %162, align 8
  %164 = fsub double %161, %163
  %165 = fmul double %164, 7.000000e-01
  %166 = fsub double %153, %165
  store double %166, double* %152, align 8
  %exitcond = icmp eq i64 %indvars.iv.next52, 1199
  br i1 %exitcond, label %._crit_edge20.us, label %scalar.ph, !llvm.loop !28

._crit_edge20.us:                                 ; preds = %scalar.ph
  %167 = add nsw i32 %storemerge421.us, 1
  %168 = icmp slt i32 %167, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %168, label %.preheader.us, label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge20.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 500
  br i1 %exitcond57, label %._crit_edge24, label %.preheader13

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader13.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %.preheader13.us.preheader, %._crit_edge21.us
  %storemerge22.us = phi i32 [ %24, %._crit_edge21.us ], [ 0, %.preheader13.us.preheader ]
  %9 = mul nsw i32 %storemerge22.us, 1000
  %10 = sext i32 %storemerge22.us to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader13.us
  %indvars.iv36 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next37, %19 ]
  %13 = add i64 %indvars.iv36, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %10, i64 %indvars.iv36
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond39, label %._crit_edge21.us, label %12

._crit_edge21.us:                                 ; preds = %19
  %24 = add nsw i32 %storemerge22.us, 1
  %25 = icmp slt i32 %24, 1000
  br i1 %25, label %.preheader13.us, label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge21.us
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge23, %._crit_edge17.us
  %storemerge118.us = phi i32 [ %47, %._crit_edge17.us ], [ 0, %._crit_edge23 ]
  %32 = mul nsw i32 %storemerge118.us, 1000
  %33 = sext i32 %storemerge118.us to i64
  %34 = zext i32 %32 to i64
  br label %35

; <label>:35:                                     ; preds = %42, %.preheader12.us
  %indvars.iv31 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next32, %42 ]
  %36 = add i64 %indvars.iv31, %34
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 20
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %35
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %41) #5
  br label %42

; <label>:42:                                     ; preds = %40, %35
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %33, i64 %indvars.iv31
  %45 = load double, double* %44, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %45) #6
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond34, label %._crit_edge17.us, label %35

._crit_edge17.us:                                 ; preds = %42
  %47 = add nsw i32 %storemerge118.us, 1
  %48 = icmp slt i32 %47, 1000
  br i1 %48, label %.preheader12.us, label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge19, %._crit_edge.us
  %storemerge214.us = phi i32 [ %68, %._crit_edge.us ], [ 0, %._crit_edge19 ]
  %53 = mul nsw i32 %storemerge214.us, 1000
  %54 = sext i32 %storemerge214.us to i64
  %55 = zext i32 %53 to i64
  br label %56

; <label>:56:                                     ; preds = %63, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %63 ]
  %57 = add i64 %indvars.iv, %55
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 20
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %56
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %62) #5
  br label %63

; <label>:63:                                     ; preds = %61, %56
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %54, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %66) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %56

._crit_edge.us:                                   ; preds = %63
  %68 = add nsw i32 %storemerge214.us, 1
  %69 = icmp slt i32 %68, 1000
  br i1 %69, label %.preheader.us, label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge.us
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %71 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
