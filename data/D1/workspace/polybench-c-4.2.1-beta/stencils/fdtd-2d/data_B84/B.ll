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
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
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
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph4.preheader:
  br label %.lr.ph4.prol

.lr.ph4.prol:                                     ; preds = %.lr.ph4.prol, %.lr.ph4.preheader
  %indvars.iv11.prol = phi i64 [ 0, %.lr.ph4.preheader ], [ %indvars.iv.next12.prol, %.lr.ph4.prol ]
  %prol.iter = phi i32 [ 4, %.lr.ph4.preheader ], [ %prol.iter.sub, %.lr.ph4.prol ]
  %7 = trunc i64 %indvars.iv11.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv11.prol
  store double %8, double* %9, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph4.preheader17, label %.lr.ph4.prol, !llvm.loop !1

.lr.ph4.preheader17:                              ; preds = %.lr.ph4.prol
  br label %.lr.ph4

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv6 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
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
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %11, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond15, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4.preheader17, %.lr.ph4
  %indvars.iv11 = phi i64 [ %indvars.iv.next12.7, %.lr.ph4 ], [ 4, %.lr.ph4.preheader17 ]
  %34 = trunc i64 %indvars.iv11 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv11
  %37 = bitcast double* %36 to <2 x double>*
  %38 = trunc i64 %indvars.iv11 to i32
  %39 = or i32 %38, 1
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  store <2 x double> %42, <2 x double>* %37, align 8
  %indvars.iv.next12.1 = or i64 %indvars.iv11, 2
  %43 = trunc i64 %indvars.iv.next12.1 to i32
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.1
  %46 = bitcast double* %45 to <2 x double>*
  %47 = trunc i64 %indvars.iv11 to i32
  %48 = or i32 %47, 3
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %44, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  store <2 x double> %51, <2 x double>* %46, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %52 = trunc i64 %indvars.iv.next12.3 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.3
  %55 = bitcast double* %54 to <2 x double>*
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv11, 5
  %56 = trunc i64 %indvars.iv.next12.4 to i32
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  store <2 x double> %59, <2 x double>* %55, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv11, 6
  %60 = trunc i64 %indvars.iv.next12.5 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12.5
  %63 = bitcast double* %62 to <2 x double>*
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv11, 7
  %64 = trunc i64 %indvars.iv.next12.6 to i32
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %61, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv11, 8
  %exitcond14.7 = icmp eq i64 %indvars.iv.next12.7, 500
  br i1 %exitcond14.7, label %.preheader.us.preheader, label %.lr.ph4

.preheader.us.preheader:                          ; preds = %.lr.ph4
  br label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double* nocapture readonly) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv50
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv25, -1
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep142 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0150 = icmp ult double* %scevgep139, %scevgep148
  %bound1151 = icmp ult double* %scevgep145, %scevgep142
  %memcheck.conflict153 = and i1 %bound0150, %bound1151
  br i1 %memcheck.conflict153, label %.preheader2.us.new.preheader, label %vector.body129.preheader

vector.body129.preheader:                         ; preds = %.preheader2.us
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129.preheader, %vector.body129
  %index156 = phi i64 [ %index.next157, %vector.body129 ], [ 0, %vector.body129.preheader ]
  %11 = shl i64 %index156, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec165 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec166 = shufflevector <4 x double> %wide.vec165, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec167 = shufflevector <4 x double> %wide.vec165, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec168 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec171 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec168, %wide.vec171
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec166, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %22
  %24 = fsub <4 x double> %wide.vec168, %wide.vec171
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec167, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec174 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec174, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next157 = add i64 %index156, 2
  %30 = icmp eq i64 %index.next157, 600
  br i1 %30, label %middle.block130, label %vector.body129, !llvm.loop !8

middle.block130:                                  ; preds = %vector.body129
  br i1 true, label %._crit_edge.us, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %middle.block130, %.preheader2.us
  %indvars.iv17.ph = phi i64 [ 0, %.preheader2.us ], [ 1200, %middle.block130 ]
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader, %.preheader2.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new ], [ %indvars.iv17.ph, %.preheader2.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv17
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv17
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv17
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next18
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next18
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next18
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block130
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next26, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond54, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.preheader6, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader6 ]
  %49 = load i64, i64* %8, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %52 = load i64, i64* %8, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %55 = load i64, i64* %8, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %58 = load i64, i64* %8, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %61 = load i64, i64* %8, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %64 = load i64, i64* %8, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %67 = load i64, i64* %8, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %70 = load i64, i64* %8, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 2
  %scevgep101 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1200
  %scevgep104 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %scevgep107 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1200
  %bound0109 = icmp ult double* %scevgep98, %scevgep107
  %bound1110 = icmp ult double* %scevgep104, %scevgep101
  %memcheck.conflict112 = and i1 %bound0109, %bound1110
  br i1 %memcheck.conflict112, label %.preheader1.us.new.preheader, label %vector.body88.preheader

vector.body88.preheader:                          ; preds = %.preheader1.us
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88.preheader, %vector.body88
  %index115 = phi i64 [ %index.next116, %vector.body88 ], [ 0, %vector.body88.preheader ]
  %82 = shl i64 %index115, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec122 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec123 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !15
  %strided.vec124 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec125 = shufflevector <4 x double> %wide.vec123, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec125, %strided.vec124
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec126 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !15
  %strided.vec127 = shufflevector <4 x double> %wide.vec126, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec128 = shufflevector <4 x double> %wide.vec126, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec128, %strided.vec127
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec122, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !12, !noalias !15
  %index.next116 = add i64 %index115, 2
  %101 = icmp eq i64 %index.next116, 598
  br i1 %101, label %middle.block89, label %vector.body88, !llvm.loop !17

middle.block89:                                   ; preds = %vector.body88
  br i1 false, label %._crit_edge9.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %middle.block89, %.preheader1.us
  %indvars.iv29.ph = phi i64 [ 2, %.preheader1.us ], [ 1198, %middle.block89 ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader, %.preheader1.us.new
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv29
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv29, -1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fsub double %105, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %103, %110
  store double %111, double* %102, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next30
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %115 = load double, double* %114, align 8
  %116 = load double, double* %104, align 8
  %117 = fsub double %115, %116
  %118 = fmul double %117, 5.000000e-01
  %119 = fsub double %113, %118
  store double %119, double* %112, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us.loopexit, label %.preheader1.us.new, !llvm.loop !18

._crit_edge9.us.loopexit:                         ; preds = %.preheader1.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %middle.block89
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 0
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 1199
  %scevgep67 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 0
  %scevgep69 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 1200
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 0
  %120 = add i64 %indvars.iv46, 1
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %4, i64 %120, i64 1199
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %bound0 = icmp ult double* %scevgep, %scevgep69
  %bound1 = icmp ult double* %scevgep67, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bound075 = icmp ult double* %scevgep, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep65
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx = or i1 %found.conflict, %found.conflict77
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %index
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !19, !noalias !22
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !19, !noalias !22
  %125 = or i64 %index, 1
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %125
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !25
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %index
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !25
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !25
  %134 = fsub <2 x double> %wide.load80, %wide.load82
  %135 = fsub <2 x double> %wide.load81, %wide.load83
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %index
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !26
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = fadd <2 x double> %134, %wide.load84
  %141 = fadd <2 x double> %135, %wide.load85
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %index
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !26
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !26
  %146 = fsub <2 x double> %140, %wide.load86
  %147 = fsub <2 x double> %141, %wide.load87
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fsub <2 x double> %wide.load, %148
  %151 = fsub <2 x double> %wide.load79, %149
  %152 = bitcast double* %121 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !19, !noalias !22
  %153 = bitcast double* %123 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %154 = icmp eq i64 %index.next, 1196
  br i1 %154, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv42.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %indvars.iv42.ph, %scalar.ph.preheader ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv42
  %156 = load double, double* %155, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next43
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv42
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv42
  %166 = load double, double* %165, align 8
  %167 = fsub double %164, %166
  %168 = fmul double %167, 7.000000e-01
  %169 = fsub double %156, %168
  store double %169, double* %155, align 8
  %exitcond55 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond55, label %._crit_edge11.us, label %scalar.ph, !llvm.loop !28

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 999
  br i1 %exitcond49, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next51, 500
  br i1 %exitcond56, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader10.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us, %.preheader10.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next41, %._crit_edge17.us ]
  %9 = mul nsw i64 %indvars.iv40, 1000
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.us, %.preheader10.us
  %indvars.iv36 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next37, %._crit_edge.us ]
  %11 = add nsw i64 %indvars.iv36, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond48, label %._crit_edge17.us, label %10

._crit_edge17.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond49, label %._crit_edge18, label %.preheader10.us

._crit_edge18:                                    ; preds = %._crit_edge17.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge14.us, %._crit_edge18
  %indvars.iv31 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next32, %._crit_edge14.us ]
  %27 = mul nsw i64 %indvars.iv31, 1000
  br label %28

; <label>:28:                                     ; preds = %._crit_edge7.us, %.preheader9.us
  %indvars.iv27 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next28, %._crit_edge7.us ]
  %29 = add nsw i64 %indvars.iv27, %27
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %._crit_edge7.us

; <label>:33:                                     ; preds = %28
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #5
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %33, %28
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv27
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond46, label %._crit_edge14.us, label %28

._crit_edge14.us:                                 ; preds = %._crit_edge7.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond47, label %._crit_edge15, label %.preheader9.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv22 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next23, %._crit_edge11.us ]
  %43 = mul nsw i64 %indvars.iv22, 1000
  br label %44

; <label>:44:                                     ; preds = %._crit_edge8.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge8.us ]
  %45 = add nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %._crit_edge8.us

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %49, %44
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond45, label %._crit_edge11.us, label %44

._crit_edge11.us:                                 ; preds = %._crit_edge8.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
