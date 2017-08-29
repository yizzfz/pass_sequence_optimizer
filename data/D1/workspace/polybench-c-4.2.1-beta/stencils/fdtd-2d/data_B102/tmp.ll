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
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph41.preheader:
  br label %.lr.ph41

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3136.us = phi i64 [ %indvars.iv.next32.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv3136.us to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv35.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv35.us, 1
  %8 = trunc i64 %indvars.iv.next.us to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3136.us, i64 %indvars.iv35.us
  %11 = add nuw nsw i64 %indvars.iv35.us, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3136.us, i64 %indvars.iv35.us
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv35.us, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3136.us, i64 %indvars.iv35.us
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv35.us, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3136.us, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next32.us, 1000
  br i1 %exitcond1, label %._crit_edge38, label %.preheader.us

.lr.ph41:                                         ; preds = %.lr.ph41, %.lr.ph41.preheader
  %indvars.iv3339 = phi i64 [ 0, %.lr.ph41.preheader ], [ %indvars.iv.next34.4, %.lr.ph41 ]
  %27 = trunc i64 %indvars.iv3339 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv3339
  store double %28, double* %29, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3339, 1
  %30 = trunc i64 %indvars.iv.next34 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next34
  store double %31, double* %32, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv3339, 2
  %33 = trunc i64 %indvars.iv.next34.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next34.1
  store double %34, double* %35, align 8
  %indvars.iv.next34.2 = add nsw i64 %indvars.iv3339, 3
  %36 = trunc i64 %indvars.iv.next34.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next34.2
  store double %37, double* %38, align 8
  %indvars.iv.next34.3 = add nsw i64 %indvars.iv3339, 4
  %39 = trunc i64 %indvars.iv.next34.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next34.3
  store double %40, double* %41, align 8
  %exitcond44.4 = icmp eq i64 %indvars.iv.next34.3, 499
  %indvars.iv.next34.4 = add nsw i64 %indvars.iv3339, 5
  br i1 %exitcond44.4, label %.preheader.us.preheader, label %.lr.ph41

.preheader.us.preheader:                          ; preds = %.lr.ph41
  br label %.preheader.us

._crit_edge38:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.preheader78.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr.2 = ptrtoint double* %3 to i64
  %sunkaddr.3 = ptrtoint double* %3 to i64
  %sunkaddr.4 = ptrtoint double* %3 to i64
  br label %.preheader78

.preheader78:                                     ; preds = %._crit_edge108, %.preheader78.lr.ph
  %indvars.iv91109 = phi i64 [ 0, %.preheader78.lr.ph ], [ %indvars.iv.next92, %._crit_edge108 ]
  %sunkaddr128 = shl i64 %indvars.iv91109, 3
  %sunkaddr129 = add i64 %sunkaddr, %sunkaddr128
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i64*
  %sunkaddr128.1 = shl i64 %indvars.iv91109, 3
  %sunkaddr129.1 = add i64 %sunkaddr.1, %sunkaddr128.1
  %sunkaddr130.1 = inttoptr i64 %sunkaddr129.1 to i64*
  %sunkaddr128.2 = shl i64 %indvars.iv91109, 3
  %sunkaddr129.2 = add i64 %sunkaddr.2, %sunkaddr128.2
  %sunkaddr130.2 = inttoptr i64 %sunkaddr129.2 to i64*
  %sunkaddr128.3 = shl i64 %indvars.iv91109, 3
  %sunkaddr129.3 = add i64 %sunkaddr.3, %sunkaddr128.3
  %sunkaddr130.3 = inttoptr i64 %sunkaddr129.3 to i64*
  %sunkaddr128.4 = shl i64 %indvars.iv91109, 3
  %sunkaddr129.4 = add i64 %sunkaddr.4, %sunkaddr128.4
  %sunkaddr130.4 = inttoptr i64 %sunkaddr129.4 to i64*
  br label %46

.preheader74.us:                                  ; preds = %._crit_edge.us, %.preheader74.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader74.us.preheader ]
  %indvars.iv8196.us = phi i64 [ %indvars.iv.next82.us, %._crit_edge.us ], [ 1, %.preheader74.us.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep193 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add nuw nsw i64 %indvar, 2
  %scevgep195 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep197 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep199 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv8196.us, -1
  %bound0201 = icmp ult double* %scevgep193, %scevgep199
  %bound1202 = icmp ult double* %scevgep197, %scevgep195
  %memcheck.conflict204 = and i1 %bound0201, %bound1202
  br i1 %memcheck.conflict204, label %scalar.ph190.preheader, label %vector.body188.preheader

vector.body188.preheader:                         ; preds = %.preheader74.us
  br label %vector.body188

scalar.ph190.preheader:                           ; preds = %.preheader74.us
  br label %scalar.ph190

vector.body188:                                   ; preds = %vector.body188.preheader, %vector.body188
  %index207 = phi i64 [ %index.next208, %vector.body188 ], [ 0, %vector.body188.preheader ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8196.us, i64 %index207
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load215 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load216 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1, !noalias !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8196.us, i64 %index207
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load217 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load218 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !4
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %index207
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load219 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !4
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load220 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !4
  %19 = fsub <2 x double> %wide.load217, %wide.load219
  %20 = fsub <2 x double> %wide.load218, %wide.load220
  %21 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %22 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %23 = fsub <2 x double> %wide.load215, %21
  %24 = fsub <2 x double> %wide.load216, %22
  %25 = bitcast double* %7 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !1, !noalias !4
  %26 = bitcast double* %9 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !1, !noalias !4
  %index.next208 = add nuw nsw i64 %index207, 4
  %27 = icmp eq i64 %index.next208, 1200
  br i1 %27, label %._crit_edge.us.loopexit1, label %vector.body188, !llvm.loop !6

scalar.ph190:                                     ; preds = %scalar.ph190, %scalar.ph190.preheader
  %indvars.iv7994.us = phi i64 [ 0, %scalar.ph190.preheader ], [ %indvars.iv.next80.us.1, %scalar.ph190 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8196.us, i64 %indvars.iv7994.us
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8196.us, i64 %indvars.iv7994.us
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv7994.us
  %33 = load double, double* %32, align 8
  %34 = fsub double %31, %33
  %35 = fmul double %34, 5.000000e-01
  %36 = fsub double %29, %35
  store double %36, double* %28, align 8
  %indvars.iv.next80.us = or i64 %indvars.iv7994.us, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8196.us, i64 %indvars.iv.next80.us
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8196.us, i64 %indvars.iv.next80.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next80.us
  %42 = load double, double* %41, align 8
  %43 = fsub double %40, %42
  %44 = fmul double %43, 5.000000e-01
  %45 = fsub double %38, %44
  store double %45, double* %37, align 8
  %exitcond118.1 = icmp eq i64 %indvars.iv.next80.us, 1199
  %indvars.iv.next80.us.1 = add nsw i64 %indvars.iv7994.us, 2
  br i1 %exitcond118.1, label %._crit_edge.us.loopexit, label %scalar.ph190, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph190
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body188
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next82.us = add nuw nsw i64 %indvars.iv8196.us, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond2, label %.preheader73.us.preheader, label %.preheader74.us

.preheader73.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader73.us

; <label>:46:                                     ; preds = %46, %.preheader78
  %indvars.iv93 = phi i64 [ 0, %.preheader78 ], [ %indvars.iv.next.4, %46 ]
  %47 = load i64, i64* %sunkaddr130, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv93
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv93, 1
  %50 = load i64, i64* %sunkaddr130.1, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv93, 2
  %53 = load i64, i64* %sunkaddr130.2, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv93, 3
  %56 = load i64, i64* %sunkaddr130.3, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv93, 4
  %59 = load i64, i64* %sunkaddr130.4, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv93, 5
  br i1 %exitcond.4, label %.preheader74.us.preheader, label %46

.preheader74.us.preheader:                        ; preds = %46
  br label %.preheader74.us

.preheader73.us:                                  ; preds = %._crit_edge100.us, %.preheader73.us.preheader
  %indvars.iv85101.us = phi i64 [ %indvars.iv.next86.us, %._crit_edge100.us ], [ 0, %.preheader73.us.preheader ]
  %scevgep160 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv85101.us, i64 1
  %62 = add nuw nsw i64 %indvars.iv85101.us, 1
  %scevgep162 = getelementptr [1200 x double], [1200 x double]* %0, i64 %62, i64 0
  %scevgep164 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 0
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %2, i64 %62, i64 0
  %bound0168 = icmp ult double* %scevgep160, %scevgep166
  %bound1169 = icmp ult double* %scevgep164, %scevgep162
  %memcheck.conflict171 = and i1 %bound0168, %bound1169
  br i1 %memcheck.conflict171, label %scalar.ph157.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %.preheader73.us
  br label %vector.body155

vector.body155:                                   ; preds = %vector.body155.preheader, %vector.body155
  %index174 = phi i64 [ %index.next175, %vector.body155 ], [ 0, %vector.body155.preheader ]
  %offset.idx = or i64 %index174, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv85101.us, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load182 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load183 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10, !noalias !13
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load184 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load185 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !13
  %76 = fsub <2 x double> %wide.load184, %wide.load186
  %77 = fsub <2 x double> %wide.load185, %wide.load187
  %78 = fmul <2 x double> %76, <double 5.000000e-01, double 5.000000e-01>
  %79 = fmul <2 x double> %77, <double 5.000000e-01, double 5.000000e-01>
  %80 = fsub <2 x double> %wide.load182, %78
  %81 = fsub <2 x double> %wide.load183, %79
  %82 = bitcast double* %63 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !alias.scope !10, !noalias !13
  %83 = bitcast double* %65 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !10, !noalias !13
  %index.next175 = add nuw nsw i64 %index174, 4
  %84 = icmp eq i64 %index.next175, 1196
  br i1 %84, label %scalar.ph157.preheader.loopexit, label %vector.body155, !llvm.loop !15

scalar.ph157.preheader.loopexit:                  ; preds = %vector.body155
  br label %scalar.ph157.preheader

scalar.ph157.preheader:                           ; preds = %scalar.ph157.preheader.loopexit, %.preheader73.us
  %indvars.iv8398.us.ph = phi i64 [ 1, %.preheader73.us ], [ 1197, %scalar.ph157.preheader.loopexit ]
  br i1 true, label %scalar.ph157.prol.preheader, label %scalar.ph157.prol.loopexit.unr-lcssa

scalar.ph157.prol.preheader:                      ; preds = %scalar.ph157.preheader
  br label %scalar.ph157.prol

scalar.ph157.prol:                                ; preds = %scalar.ph157.prol.preheader
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv85101.us, i64 %indvars.iv8398.us.ph
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %indvars.iv8398.us.ph
  %88 = load double, double* %87, align 8
  %89 = add nsw i64 %indvars.iv8398.us.ph, -1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fsub double %88, %91
  %93 = fmul double %92, 5.000000e-01
  %94 = fsub double %86, %93
  store double %94, double* %85, align 8
  %indvars.iv.next84.us.prol = add nuw nsw i64 %indvars.iv8398.us.ph, 1
  br label %scalar.ph157.prol.loopexit.unr-lcssa

scalar.ph157.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph157.preheader, %scalar.ph157.prol
  %indvars.iv8398.us.unr.ph = phi i64 [ %indvars.iv.next84.us.prol, %scalar.ph157.prol ], [ %indvars.iv8398.us.ph, %scalar.ph157.preheader ]
  br label %scalar.ph157.prol.loopexit

scalar.ph157.prol.loopexit:                       ; preds = %scalar.ph157.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge100.us, label %scalar.ph157.preheader.new

scalar.ph157.preheader.new:                       ; preds = %scalar.ph157.prol.loopexit
  br label %scalar.ph157

scalar.ph157:                                     ; preds = %scalar.ph157, %scalar.ph157.preheader.new
  %indvars.iv8398.us = phi i64 [ %indvars.iv8398.us.unr.ph, %scalar.ph157.preheader.new ], [ %indvars.iv.next84.us.1, %scalar.ph157 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv85101.us, i64 %indvars.iv8398.us
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %indvars.iv8398.us
  %98 = load double, double* %97, align 8
  %99 = add nsw i64 %indvars.iv8398.us, -1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fsub double %98, %101
  %103 = fmul double %102, 5.000000e-01
  %104 = fsub double %96, %103
  store double %104, double* %95, align 8
  %indvars.iv.next84.us = add nuw nsw i64 %indvars.iv8398.us, 1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv85101.us, i64 %indvars.iv.next84.us
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %indvars.iv.next84.us
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85101.us, i64 %indvars.iv8398.us
  %110 = load double, double* %109, align 8
  %111 = fsub double %108, %110
  %112 = fmul double %111, 5.000000e-01
  %113 = fsub double %106, %112
  store double %113, double* %105, align 8
  %exitcond120.1 = icmp eq i64 %indvars.iv.next84.us, 1199
  %indvars.iv.next84.us.1 = add nsw i64 %indvars.iv8398.us, 2
  br i1 %exitcond120.1, label %._crit_edge100.us.unr-lcssa, label %scalar.ph157, !llvm.loop !16

._crit_edge100.us.unr-lcssa:                      ; preds = %scalar.ph157
  br label %._crit_edge100.us

._crit_edge100.us:                                ; preds = %scalar.ph157.prol.loopexit, %._crit_edge100.us.unr-lcssa
  %indvars.iv.next86.us = add nuw nsw i64 %indvars.iv85101.us, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next86.us, 1000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader73.us

.preheader.us.preheader:                          ; preds = %._crit_edge100.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge105.us, %.preheader.us.preheader
  %indvars.iv89106.us = phi i64 [ %115, %._crit_edge105.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv89106.us, i64 0
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv89106.us, i64 1199
  %scevgep134 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv89106.us, i64 0
  %114 = add nuw nsw i64 %indvars.iv89106.us, 1
  %scevgep136 = getelementptr [1200 x double], [1200 x double]* %0, i64 %114, i64 0
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv89106.us, i64 0
  %scevgep140 = getelementptr [1200 x double], [1200 x double]* %1, i64 %114, i64 1199
  %115 = add nuw nsw i64 %indvars.iv89106.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep136
  %bound1 = icmp ult double* %scevgep134, %scevgep132
  %found.conflict = and i1 %bound0, %bound1
  %bound0142 = icmp ult double* %scevgep, %scevgep140
  %bound1143 = icmp ult double* %scevgep138, %scevgep132
  %found.conflict144 = and i1 %bound0142, %bound1143
  %conflict.rdx = or i1 %found.conflict, %found.conflict144
  br i1 %conflict.rdx, label %._crit_edge116.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv89106.us, i64 %index
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !17, !noalias !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !17, !noalias !20
  %120 = or i64 %index, 1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv89106.us, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !23
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv89106.us, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !23
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !23
  %129 = fsub <2 x double> %wide.load147, %wide.load149
  %130 = fsub <2 x double> %wide.load148, %wide.load150
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %115, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !24
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !24
  %135 = fadd <2 x double> %129, %wide.load151
  %136 = fadd <2 x double> %130, %wide.load152
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv89106.us, i64 %index
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !24
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !24
  %141 = fsub <2 x double> %135, %wide.load153
  %142 = fsub <2 x double> %136, %wide.load154
  %143 = fmul <2 x double> %141, <double 7.000000e-01, double 7.000000e-01>
  %144 = fmul <2 x double> %142, <double 7.000000e-01, double 7.000000e-01>
  %145 = fsub <2 x double> %wide.load, %143
  %146 = fsub <2 x double> %wide.load146, %144
  %147 = bitcast double* %116 to <2 x double>*
  store <2 x double> %145, <2 x double>* %147, align 8, !alias.scope !17, !noalias !20
  %148 = bitcast double* %118 to <2 x double>*
  store <2 x double> %146, <2 x double>* %148, align 8, !alias.scope !17, !noalias !20
  %index.next = add nuw nsw i64 %index, 4
  %149 = icmp eq i64 %index.next, 1196
  br i1 %149, label %._crit_edge116.preheader.loopexit, label %vector.body, !llvm.loop !25

._crit_edge116.preheader.loopexit:                ; preds = %vector.body
  br label %._crit_edge116.preheader

._crit_edge116.preheader:                         ; preds = %._crit_edge116.preheader.loopexit, %.preheader.us
  %indvars.iv87103.us.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge116.preheader.loopexit ]
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.preheader, %._crit_edge116
  %indvars.iv87103.us = phi i64 [ %indvars.iv.next88.us, %._crit_edge116 ], [ %indvars.iv87103.us.ph, %._crit_edge116.preheader ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv89106.us, i64 %indvars.iv87103.us
  %151 = load double, double* %150, align 8
  %indvars.iv.next88.us = add nuw nsw i64 %indvars.iv87103.us, 1
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv89106.us, i64 %indvars.iv.next88.us
  %153 = load double, double* %152, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv89106.us, i64 %indvars.iv87103.us
  %155 = load double, double* %154, align 8
  %156 = fsub double %153, %155
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %115, i64 %indvars.iv87103.us
  %158 = load double, double* %157, align 8
  %159 = fadd double %156, %158
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv89106.us, i64 %indvars.iv87103.us
  %161 = load double, double* %160, align 8
  %162 = fsub double %159, %161
  %163 = fmul double %162, 7.000000e-01
  %164 = fsub double %151, %163
  store double %164, double* %150, align 8
  %165 = icmp slt i64 %indvars.iv.next88.us, 1199
  br i1 %165, label %._crit_edge116, label %._crit_edge105.us, !llvm.loop !26

._crit_edge105.us:                                ; preds = %._crit_edge116
  %exitcond4 = icmp eq i64 %115, 999
  br i1 %exitcond4, label %._crit_edge108, label %.preheader.us

._crit_edge108:                                   ; preds = %._crit_edge105.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91109, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next92, 500
  br i1 %exitcond5, label %._crit_edge110, label %.preheader78

._crit_edge110:                                   ; preds = %._crit_edge108
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader45.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader45.us

.preheader45.us:                                  ; preds = %._crit_edge68.us, %.preheader45.us.preheader
  %indvars.iv5469.us = phi i64 [ %indvars.iv.next55.us, %._crit_edge68.us ], [ 0, %.preheader45.us.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv5469.us, 1000
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge, %.preheader45.us
  %indvars.iv5266.us = phi i64 [ 0, %.preheader45.us ], [ %indvars.iv.next53.us, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv5266.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge75
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc43.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge75, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5469.us, i64 %indvars.iv5266.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next53.us = add nuw nsw i64 %indvars.iv5266.us, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next53.us, 1200
  br i1 %exitcond4, label %._crit_edge68.us, label %._crit_edge75

._crit_edge68.us:                                 ; preds = %._crit_edge
  %indvars.iv.next55.us = add nuw nsw i64 %indvars.iv5469.us, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next55.us, 1000
  br i1 %exitcond5, label %._crit_edge71, label %.preheader45.us

._crit_edge71:                                    ; preds = %._crit_edge68.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge62.us, %._crit_edge71
  %indvars.iv5063.us = phi i64 [ %indvars.iv.next51.us, %._crit_edge62.us ], [ 0, %._crit_edge71 ]
  %24 = mul nuw nsw i64 %indvars.iv5063.us, 1000
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge76, %.preheader44.us
  %indvars.iv4860.us = phi i64 [ 0, %.preheader44.us ], [ %indvars.iv.next49.us, %._crit_edge76 ]
  %25 = add nuw nsw i64 %indvars.iv4860.us, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge76

; <label>:29:                                     ; preds = %._crit_edge77
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc40.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge77, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5063.us, i64 %indvars.iv4860.us
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next49.us = add nuw nsw i64 %indvars.iv4860.us, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next49.us, 1200
  br i1 %exitcond2, label %._crit_edge62.us, label %._crit_edge77

._crit_edge62.us:                                 ; preds = %._crit_edge76
  %indvars.iv.next51.us = add nuw nsw i64 %indvars.iv5063.us, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next51.us, 1000
  br i1 %exitcond3, label %._crit_edge65, label %.preheader44.us

._crit_edge65:                                    ; preds = %._crit_edge62.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge65
  %indvars.iv4657.us = phi i64 [ %indvars.iv.next47.us, %._crit_edge.us ], [ 0, %._crit_edge65 ]
  %39 = mul nuw nsw i64 %indvars.iv4657.us, 1000
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge78, %.preheader.us
  %indvars.iv56.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge78 ]
  %40 = add nuw nsw i64 %indvars.iv56.us, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge78

; <label>:44:                                     ; preds = %._crit_edge79
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge79, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4657.us, i64 %indvars.iv56.us
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv56.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge79

._crit_edge.us:                                   ; preds = %._crit_edge78
  %indvars.iv.next47.us = add nuw nsw i64 %indvars.iv4657.us, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next47.us, 1000
  br i1 %exitcond1, label %._crit_edge59, label %.preheader.us

._crit_edge59:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
