; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph12.preheader:
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.preheader, %.lr.ph12.prol
  %indvars.iv410.prol = phi i64 [ %indvars.iv.next5.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph12.prol ], [ 4, %.lr.ph12.preheader ]
  %4 = trunc i64 %indvars.iv410.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv410.prol
  store double %5, double* %6, align 8
  %indvars.iv.next5.prol = add nuw nsw i64 %indvars.iv410.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph12.preheader21, label %.lr.ph12.prol, !llvm.loop !1

.lr.ph12.preheader21:                             ; preds = %.lr.ph12.prol
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader21, %.lr.ph12
  %indvars.iv410 = phi i64 [ %indvars.iv.next5.7, %.lr.ph12 ], [ %indvars.iv.next5.prol, %.lr.ph12.preheader21 ]
  %7 = trunc i64 %indvars.iv410 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv410
  %10 = bitcast double* %9 to <2 x double>*
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %11 = trunc i64 %indvars.iv.next5 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  store <2 x double> %14, <2 x double>* %10, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv410, 2
  %15 = trunc i64 %indvars.iv.next5.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.1
  %18 = bitcast double* %17 to <2 x double>*
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv410, 3
  %19 = trunc i64 %indvars.iv.next5.2 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  store <2 x double> %22, <2 x double>* %18, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv410, 4
  %23 = trunc i64 %indvars.iv.next5.3 to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.3
  %26 = bitcast double* %25 to <2 x double>*
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv410, 5
  %27 = trunc i64 %indvars.iv.next5.4 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  store <2 x double> %30, <2 x double>* %26, align 8
  %indvars.iv.next5.5 = add nsw i64 %indvars.iv410, 6
  %31 = trunc i64 %indvars.iv.next5.5 to i32
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.5
  %34 = bitcast double* %33 to <2 x double>*
  %indvars.iv.next5.6 = add nsw i64 %indvars.iv410, 7
  %35 = trunc i64 %indvars.iv.next5.6 to i32
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %32, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  store <2 x double> %38, <2 x double>* %34, align 8
  %indvars.iv.next5.7 = add nsw i64 %indvars.iv410, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next5.7, 500
  br i1 %exitcond18.7, label %.preheader.us.preheader, label %.lr.ph12

.preheader.us.preheader:                          ; preds = %.lr.ph12
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv27.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %39 = trunc i64 %indvars.iv27.us to i32
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %43

; <label>:43:                                     ; preds = %43, %.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %43 ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %44 = trunc i64 %indvars.iv.next.us to i32
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  %47 = add nuw nsw i64 %indvars.iv6.us, 2
  %48 = trunc i64 %47 to i32
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %45, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %42, %51
  %53 = fdiv <2 x double> %52, <double 1.000000e+03, double 1.200000e+03>
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  store double %54, double* %46, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  store double %55, double* %56, align 8
  %57 = add nuw nsw i64 %indvars.iv6.us, 3
  %58 = trunc i64 %57 to i32
  %59 = sitofp i32 %58 to double
  %60 = fmul double %40, %59
  %61 = fdiv double %60, 1.000000e+03
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  store double %61, double* %62, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %43

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv27.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond16, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
.preheader24.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader24

.preheader24:                                     ; preds = %._crit_edge40, %.preheader24.lr.ph
  %indvars.iv1741 = phi i64 [ 0, %.preheader24.lr.ph ], [ %indvars.iv.next18, %._crit_edge40 ]
  %sunkaddr46 = shl nuw nsw i64 %indvars.iv1741, 3
  %sunkaddr47 = add i64 %sunkaddr, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i64*
  br label %.lr.ph.new

.preheader20.us:                                  ; preds = %.preheader20.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %4, %._crit_edge.us ], [ 0, %.preheader20.us.preheader ]
  %indvars.iv728.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge.us ], [ 1, %.preheader20.us.preheader ]
  %4 = add i64 %indvar, 1
  %scevgep129 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add i64 %indvar, 2
  %scevgep131 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv728.us, -1
  %bound0137 = icmp ult double* %scevgep129, %scevgep135
  %bound1138 = icmp ult double* %scevgep133, %scevgep131
  %found.conflict139 = and i1 %bound0137, %bound1138
  br i1 %found.conflict139, label %.preheader20.us.new.preheader, label %vector.body124.preheader

vector.body124.preheader:                         ; preds = %.preheader20.us
  br label %vector.body124

.preheader20.us.new.preheader:                    ; preds = %.preheader20.us
  br label %.preheader20.us.new

vector.body124:                                   ; preds = %vector.body124.preheader, %vector.body124
  %index143 = phi i64 [ %index.next144, %vector.body124 ], [ 0, %vector.body124.preheader ]
  %offset.idx147 = shl i64 %index143, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv728.us, i64 %offset.idx147
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec151 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !3, !noalias !6
  %strided.vec152 = shufflevector <4 x double> %wide.vec151, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec153 = shufflevector <4 x double> %wide.vec151, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv728.us, i64 %offset.idx147
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec154 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !6
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %offset.idx147
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec157 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = fsub <4 x double> %wide.vec154, %wide.vec157
  %14 = shufflevector <4 x double> %13, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec152, %15
  %17 = or i64 %offset.idx147, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv728.us, i64 %17
  %19 = fsub <4 x double> %wide.vec154, %wide.vec157
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec153, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec160 = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec160, <4 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %index.next144 = add i64 %index143, 2
  %25 = icmp eq i64 %index.next144, 600
  br i1 %25, label %._crit_edge.us.loopexit161, label %vector.body124, !llvm.loop !8

.preheader20.us.new:                              ; preds = %.preheader20.us.new.preheader, %.preheader20.us.new
  %indvars.iv526.us = phi i64 [ %indvars.iv.next6.us.1, %.preheader20.us.new ], [ 0, %.preheader20.us.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv728.us, i64 %indvars.iv526.us
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv728.us, i64 %indvars.iv526.us
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv526.us
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next6.us = or i64 %indvars.iv526.us, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv728.us, i64 %indvars.iv.next6.us
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv728.us, i64 %indvars.iv.next6.us
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next6.us
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv526.us, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next6.us.1, 1200
  br i1 %exitcond53.1, label %._crit_edge.us.loopexit, label %.preheader20.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader20.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit161:                       ; preds = %vector.body124
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit161, %._crit_edge.us.loopexit
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv728.us, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond54, label %.preheader19.us.preheader, label %.preheader20.us

.preheader19.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader19.us

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader24
  %indvars.iv25 = phi i64 [ 0, %.preheader24 ], [ %indvars.iv.next.3.1, %.lr.ph.new ]
  %44 = load i64, i64* %sunkaddr48, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv25
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = or i64 %indvars.iv25, 1
  %47 = load i64, i64* %sunkaddr48, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv25, 2
  %50 = load i64, i64* %sunkaddr48, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv25, 3
  %53 = load i64, i64* %sunkaddr48, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv25, 4
  %56 = load i64, i64* %sunkaddr48, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.1162 = or i64 %indvars.iv25, 5
  %59 = load i64, i64* %sunkaddr48, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1162
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv25, 6
  %62 = load i64, i64* %sunkaddr48, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1.1
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.2.1 = or i64 %indvars.iv25, 7
  %65 = load i64, i64* %sunkaddr48, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2.1
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv25, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %.preheader20.us.preheader, label %.lr.ph.new

.preheader20.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader20.us

.preheader19.us:                                  ; preds = %.preheader19.us.preheader, %._crit_edge32.us
  %indvars.iv1133.us = phi i64 [ %68, %._crit_edge32.us ], [ 0, %.preheader19.us.preheader ]
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 2
  %68 = add i64 %indvars.iv1133.us, 1
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %0, i64 %68, i64 0
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 1
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %2, i64 %68, i64 0
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 1
  %70 = load double, double* %69, align 8
  %71 = load double, double* %scevgep100, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 0
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %70, %75
  store double %76, double* %69, align 8
  %bound0104 = icmp ult double* %scevgep96, %scevgep102
  %bound1105 = icmp ult double* %scevgep100, %scevgep98
  %found.conflict106 = and i1 %bound0104, %bound1105
  br i1 %found.conflict106, label %.preheader19.us.new.preheader, label %vector.body91.preheader

vector.body91.preheader:                          ; preds = %.preheader19.us
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91.preheader, %vector.body91
  %index110 = phi i64 [ %index.next111, %vector.body91 ], [ 0, %vector.body91.preheader ]
  %77 = shl i64 %index110, 1
  %offset.idx = or i64 %77, 2
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec117 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 %offset.idx
  %81 = getelementptr double, double* %80, i64 -1
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec118 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !15
  %strided.vec119 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec120 = shufflevector <4 x double> %wide.vec118, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fsub <2 x double> %strided.vec120, %strided.vec119
  %84 = fmul <2 x double> %83, <double 5.000000e-01, double 5.000000e-01>
  %85 = fsub <2 x double> %strided.vec, %84
  %86 = or i64 %77, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 %86
  %89 = getelementptr double, double* %88, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec121 = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !15
  %strided.vec122 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec123 = shufflevector <4 x double> %wide.vec121, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fsub <2 x double> %strided.vec123, %strided.vec122
  %92 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %93 = fsub <2 x double> %strided.vec117, %92
  %94 = getelementptr double, double* %87, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %85, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %95, align 8, !alias.scope !12, !noalias !15
  %index.next111 = add i64 %index110, 2
  %96 = icmp eq i64 %index.next111, 598
  br i1 %96, label %.preheader19.us.new.preheader.loopexit, label %vector.body91, !llvm.loop !17

.preheader19.us.new.preheader.loopexit:           ; preds = %vector.body91
  br label %.preheader19.us.new.preheader

.preheader19.us.new.preheader:                    ; preds = %.preheader19.us.new.preheader.loopexit, %.preheader19.us
  %indvars.iv930.us.ph = phi i64 [ 2, %.preheader19.us ], [ 1198, %.preheader19.us.new.preheader.loopexit ]
  br label %.preheader19.us.new

.preheader19.us.new:                              ; preds = %.preheader19.us.new.preheader, %.preheader19.us.new
  %indvars.iv930.us = phi i64 [ %indvars.iv.next10.us.1, %.preheader19.us.new ], [ %indvars.iv930.us.ph, %.preheader19.us.new.preheader ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 %indvars.iv930.us
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 %indvars.iv930.us
  %100 = load double, double* %99, align 8
  %101 = add nsw i64 %indvars.iv930.us, -1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fsub double %100, %103
  %105 = fmul double %104, 5.000000e-01
  %106 = fsub double %98, %105
  store double %106, double* %97, align 8
  %indvars.iv.next10.us = or i64 %indvars.iv930.us, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1133.us, i64 %indvars.iv.next10.us
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1133.us, i64 %indvars.iv.next10.us
  %110 = load double, double* %109, align 8
  %111 = load double, double* %99, align 8
  %112 = fsub double %110, %111
  %113 = fmul double %112, 5.000000e-01
  %114 = fsub double %108, %113
  store double %114, double* %107, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv930.us, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next10.us.1, 1200
  br i1 %exitcond56.1, label %._crit_edge32.us, label %.preheader19.us.new, !llvm.loop !18

._crit_edge32.us:                                 ; preds = %.preheader19.us.new
  %exitcond57 = icmp eq i64 %68, 1000
  br i1 %exitcond57, label %.preheader.us.preheader, label %.preheader19.us

.preheader.us.preheader:                          ; preds = %._crit_edge32.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge37.us
  %indvars.iv1538.us = phi i64 [ %115, %._crit_edge37.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1538.us, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1538.us, i64 1199
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1538.us, i64 0
  %115 = add i64 %indvars.iv1538.us, 1
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %0, i64 %115, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1538.us, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %1, i64 %115, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound078 = icmp ult double* %scevgep, %scevgep76
  %bound179 = icmp ult double* %scevgep74, %scevgep68
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx = or i1 %found.conflict, %found.conflict80
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1538.us, i64 %index
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !19, !noalias !22
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !19, !noalias !22
  %120 = or i64 %index, 1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1538.us, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !25
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !25
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1538.us, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = fsub <2 x double> %wide.load83, %wide.load85
  %130 = fsub <2 x double> %wide.load84, %wide.load86
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %115, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !26
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !26
  %135 = fadd <2 x double> %129, %wide.load87
  %136 = fadd <2 x double> %130, %wide.load88
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1538.us, i64 %index
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = fsub <2 x double> %135, %wide.load89
  %142 = fsub <2 x double> %136, %wide.load90
  %143 = fmul <2 x double> %141, <double 7.000000e-01, double 7.000000e-01>
  %144 = fmul <2 x double> %142, <double 7.000000e-01, double 7.000000e-01>
  %145 = fsub <2 x double> %wide.load, %143
  %146 = fsub <2 x double> %wide.load82, %144
  store <2 x double> %145, <2 x double>* %117, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %146, <2 x double>* %119, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %147 = icmp eq i64 %index.next, 1196
  br i1 %147, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv1335.us.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1335.us = phi i64 [ %indvars.iv.next14.us, %scalar.ph ], [ %indvars.iv1335.us.ph, %scalar.ph.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %149 = load double, double* %148, align 8
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1335.us, 1
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1538.us, i64 %indvars.iv.next14.us
  %151 = load double, double* %150, align 8
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %153 = load double, double* %152, align 8
  %154 = fsub double %151, %153
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %115, i64 %indvars.iv1335.us
  %156 = load double, double* %155, align 8
  %157 = fadd double %154, %156
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 7.000000e-01
  %162 = fsub double %149, %161
  store double %162, double* %148, align 8
  %163 = icmp slt i64 %indvars.iv.next14.us, 1199
  br i1 %163, label %scalar.ph, label %._crit_edge37.us, !llvm.loop !28

._crit_edge37.us:                                 ; preds = %scalar.ph
  %164 = icmp slt i64 %115, 999
  br i1 %164, label %.preheader.us, label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge37.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1741, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next18, 500
  br i1 %exitcond58, label %._crit_edge42, label %.preheader24

._crit_edge42:                                    ; preds = %._crit_edge40
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader21.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader21.us

.preheader21.us:                                  ; preds = %.preheader21.lr.ph, %._crit_edge34.us
  %indvars.iv1235.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge34.us ], [ 0, %.preheader21.lr.ph ]
  %7 = mul nsw i64 %indvars.iv1235.us, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader21.us
  %indvars.iv1032.us = phi i64 [ 0, %.preheader21.us ], [ %indvars.iv.next11.us, %15 ]
  %9 = add nsw i64 %indvars.iv1032.us, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1235.us, i64 %indvars.iv1032.us
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1032.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next11.us, 1200
  br i1 %exitcond49, label %._crit_edge34.us, label %8

._crit_edge34.us:                                 ; preds = %15
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1235.us, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next13.us, 1000
  br i1 %exitcond50, label %._crit_edge37, label %.preheader21.us

._crit_edge37:                                    ; preds = %._crit_edge34.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %._crit_edge37, %._crit_edge28.us
  %indvars.iv829.us = phi i64 [ %indvars.iv.next9.us, %._crit_edge28.us ], [ 0, %._crit_edge37 ]
  %26 = mul nsw i64 %indvars.iv829.us, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader20.us
  %indvars.iv626.us = phi i64 [ 0, %.preheader20.us ], [ %indvars.iv.next7.us, %34 ]
  %28 = add nsw i64 %indvars.iv626.us, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc16.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv829.us, i64 %indvars.iv626.us
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv626.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next7.us, 1200
  br i1 %exitcond46, label %._crit_edge28.us, label %27

._crit_edge28.us:                                 ; preds = %34
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv829.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond47, label %._crit_edge31, label %.preheader20.us

._crit_edge31:                                    ; preds = %._crit_edge28.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge31, %._crit_edge.us
  %indvars.iv423.us = phi i64 [ %indvars.iv.next5.us, %._crit_edge.us ], [ 0, %._crit_edge31 ]
  %43 = mul nsw i64 %indvars.iv423.us, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv22.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %51 ]
  %45 = add nsw i64 %indvars.iv22.us, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv423.us, i64 %indvars.iv22.us
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv22.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv423.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond44, label %._crit_edge25, label %.preheader.us

._crit_edge25:                                    ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
