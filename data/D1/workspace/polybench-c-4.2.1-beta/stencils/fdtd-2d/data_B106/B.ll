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
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %19

; <label>:19:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph10:
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph10, %.prol.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %.prol.preheader ], [ 0, %.lr.ph10 ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ 4, %.lr.ph10 ]
  %4 = trunc i64 %indvars.iv19.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv19.prol
  store double %5, double* %6, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph10.new.preheader, label %.prol.preheader, !llvm.loop !1

.lr.ph10.new.preheader:                           ; preds = %.prol.preheader
  br label %.lr.ph10.new

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv16 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %11 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %15 = add nuw nsw i64 %indvars.iv, 2
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fmul <2 x double> %10, %19
  %21 = fdiv <2 x double> %20, <double 1.000000e+03, double 1.200000e+03>
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  store double %22, double* %14, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  store double %23, double* %24, align 8
  %25 = add nuw nsw i64 %indvars.iv, 3
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = fmul double %8, %27
  %29 = fdiv double %28, 1.000000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  store double %29, double* %30, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %11
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond1, label %.preheader.preheader, label %.preheader.us

.lr.ph10.new:                                     ; preds = %.lr.ph10.new.preheader, %.lr.ph10.new
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.7, %.lr.ph10.new ], [ 4, %.lr.ph10.new.preheader ]
  %31 = trunc i64 %indvars.iv19 to i32
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %34 = bitcast double* %33 to <2 x double>*
  %35 = trunc i64 %indvars.iv19 to i32
  %36 = or i32 %35, 1
  %37 = sitofp i32 %36 to double
  %38 = insertelement <2 x double> undef, double %32, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  store <2 x double> %39, <2 x double>* %34, align 8
  %indvars.iv.next20.1 = or i64 %indvars.iv19, 2
  %40 = trunc i64 %indvars.iv.next20.1 to i32
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.1
  %43 = bitcast double* %42 to <2 x double>*
  %44 = trunc i64 %indvars.iv19 to i32
  %45 = or i32 %44, 3
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %41, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  store <2 x double> %48, <2 x double>* %43, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %49 = trunc i64 %indvars.iv.next20.3 to i32
  %50 = sitofp i32 %49 to double
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.3
  %52 = bitcast double* %51 to <2 x double>*
  %indvars.iv.next20.4 = add nsw i64 %indvars.iv19, 5
  %53 = trunc i64 %indvars.iv.next20.4 to i32
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %50, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  store <2 x double> %56, <2 x double>* %52, align 8
  %indvars.iv.next20.5 = add nsw i64 %indvars.iv19, 6
  %57 = trunc i64 %indvars.iv.next20.5 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next20.5
  %60 = bitcast double* %59 to <2 x double>*
  %indvars.iv.next20.6 = add nsw i64 %indvars.iv19, 7
  %61 = trunc i64 %indvars.iv.next20.6 to i32
  %62 = sitofp i32 %61 to double
  %63 = insertelement <2 x double> undef, double %58, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  store <2 x double> %64, <2 x double>* %60, align 8
  %indvars.iv.next20.7 = add nsw i64 %indvars.iv19, 8
  %exitcond22.7 = icmp eq i64 %indvars.iv.next20.6, 499
  br i1 %exitcond22.7, label %.preheader.us.preheader, label %.lr.ph10.new

.preheader.us.preheader:                          ; preds = %.lr.ph10.new
  br label %.preheader.us

.preheader.preheader:                             ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader13.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge33, %.preheader13.lr.ph
  %indvars.iv75 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next76, %._crit_edge33 ]
  %sunkaddr215 = shl i64 %indvars.iv75, 3
  %sunkaddr216 = add i64 %sunkaddr, %sunkaddr215
  %sunkaddr217 = inttoptr i64 %sunkaddr216 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %._crit_edge.us, %.preheader9.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep157 = getelementptr [1200 x double], [1200 x double]* %1, i64 %4, i64 0
  %5 = add nuw nsw i64 %indvar, 2
  %scevgep159 = getelementptr [1200 x double], [1200 x double]* %1, i64 %5, i64 0
  %scevgep161 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep163 = getelementptr [1200 x double], [1200 x double]* %2, i64 %5, i64 0
  %6 = add nsw i64 %indvars.iv59, -1
  %bound0165 = icmp ult double* %scevgep157, %scevgep163
  %bound1166 = icmp ult double* %scevgep161, %scevgep159
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %.preheader9.us.new.preheader, label %vector.body152.preheader

vector.body152.preheader:                         ; preds = %.preheader9.us
  br label %vector.body152

.preheader9.us.new.preheader:                     ; preds = %.preheader9.us
  br label %.preheader9.us.new

vector.body152:                                   ; preds = %vector.body152.preheader, %vector.body152
  %index171 = phi i64 [ %index.next172, %vector.body152 ], [ 0, %vector.body152.preheader ]
  %offset.idx175 = shl i64 %index171, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %offset.idx175
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec179 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !3, !noalias !6
  %strided.vec180 = shufflevector <4 x double> %wide.vec179, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec181 = shufflevector <4 x double> %wide.vec179, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %offset.idx175
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec182 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !6
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %offset.idx175
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec185 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = fsub <4 x double> %wide.vec182, %wide.vec185
  %14 = shufflevector <4 x double> %13, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec180, %15
  %17 = or i64 %offset.idx175, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %17
  %19 = fsub <4 x double> %wide.vec182, %wide.vec185
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec181, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec188 = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec188, <4 x double>* %24, align 8, !alias.scope !3, !noalias !6
  %index.next172 = add nuw nsw i64 %index171, 2
  %25 = icmp eq i64 %index.next172, 600
  br i1 %25, label %._crit_edge.us.loopexit1, label %vector.body152, !llvm.loop !8

.preheader9.us.new:                               ; preds = %.preheader9.us.new.preheader, %.preheader9.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.preheader9.us.new ], [ 0, %.preheader9.us.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv55
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv55
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv55
  %31 = load double, double* %30, align 8
  %32 = fsub double %29, %31
  %33 = fmul double %32, 5.000000e-01
  %34 = fsub double %27, %33
  store double %34, double* %26, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next56
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv.next56
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next56
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56, 1199
  br i1 %exitcond58.1, label %._crit_edge.us.loopexit, label %.preheader9.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader9.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body152
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 999
  br i1 %exitcond, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.preheader13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.preheader13 ]
  %44 = load i64, i64* %sunkaddr217, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = load i64, i64* %sunkaddr217, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %50 = load i64, i64* %sunkaddr217, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %53 = load i64, i64* %sunkaddr217, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, 1199
  br i1 %exitcond.3, label %.preheader9.us.preheader, label %.lr.ph.new

.preheader9.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 2
  %56 = add nuw nsw i64 %indvars.iv66, 1
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %0, i64 %56, i64 0
  %scevgep128 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 1
  %scevgep130 = getelementptr [1200 x double], [1200 x double]* %2, i64 %56, i64 0
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 1
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 1
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 0
  %62 = load double, double* %61, align 8
  %63 = fsub double %60, %62
  %64 = fmul double %63, 5.000000e-01
  %65 = fsub double %58, %64
  store double %65, double* %57, align 8
  %bound0132 = icmp ult double* %scevgep124, %scevgep130
  %bound1133 = icmp ult double* %scevgep128, %scevgep126
  %memcheck.conflict135 = and i1 %bound0132, %bound1133
  br i1 %memcheck.conflict135, label %.preheader8.us.new.preheader, label %vector.body119.preheader

vector.body119.preheader:                         ; preds = %.preheader8.us
  br label %vector.body119

vector.body119:                                   ; preds = %vector.body119.preheader, %vector.body119
  %index138 = phi i64 [ %index.next139, %vector.body119 ], [ 0, %vector.body119.preheader ]
  %66 = shl i64 %index138, 1
  %offset.idx = or i64 %66, 2
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %offset.idx
  %68 = bitcast double* %67 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %68, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec145 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %offset.idx
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <4 x double>*
  %wide.vec146 = load <4 x double>, <4 x double>* %71, align 8, !alias.scope !15
  %strided.vec147 = shufflevector <4 x double> %wide.vec146, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec148 = shufflevector <4 x double> %wide.vec146, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %72 = fsub <2 x double> %strided.vec148, %strided.vec147
  %73 = fmul <2 x double> %72, <double 5.000000e-01, double 5.000000e-01>
  %74 = fsub <2 x double> %strided.vec, %73
  %75 = or i64 %66, 3
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %75
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %75
  %78 = getelementptr double, double* %77, i64 -1
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec149 = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !15
  %strided.vec150 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec151 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = fsub <2 x double> %strided.vec151, %strided.vec150
  %81 = fmul <2 x double> %80, <double 5.000000e-01, double 5.000000e-01>
  %82 = fsub <2 x double> %strided.vec145, %81
  %83 = getelementptr double, double* %76, i64 -1
  %84 = bitcast double* %83 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %74, <2 x double> %82, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %index.next139 = add nuw nsw i64 %index138, 2
  %85 = icmp eq i64 %index.next139, 598
  br i1 %85, label %.preheader8.us.new.preheader.loopexit, label %vector.body119, !llvm.loop !17

.preheader8.us.new.preheader.loopexit:            ; preds = %vector.body119
  br label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.preheader8.us.new.preheader.loopexit, %.preheader8.us
  %indvars.iv62.ph = phi i64 [ 2, %.preheader8.us ], [ 1198, %.preheader8.us.new.preheader.loopexit ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader8.us.new ], [ %indvars.iv62.ph, %.preheader8.us.new.preheader ]
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv62
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv62
  %89 = load double, double* %88, align 8
  %90 = add nsw i64 %indvars.iv62, -1
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %90
  %92 = load double, double* %91, align 8
  %93 = fsub double %89, %92
  %94 = fmul double %93, 5.000000e-01
  %95 = fsub double %87, %94
  store double %95, double* %86, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv.next63
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv66, i64 %indvars.iv.next63
  %99 = load double, double* %98, align 8
  %100 = load double, double* %88, align 8
  %101 = fsub double %99, %100
  %102 = fmul double %101, 5.000000e-01
  %103 = fsub double %97, %102
  store double %103, double* %96, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63, 1199
  br i1 %exitcond65.1, label %._crit_edge22.us, label %.preheader8.us.new, !llvm.loop !18

._crit_edge22.us:                                 ; preds = %.preheader8.us.new
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge30.us, %.preheader.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge30.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 0
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 1199
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 0
  %104 = add nuw nsw i64 %indvars.iv73, 1
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %0, i64 %104, i64 0
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 0
  %scevgep104 = getelementptr [1200 x double], [1200 x double]* %1, i64 %104, i64 1199
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %bound0 = icmp ult double* %scevgep, %scevgep100
  %bound1 = icmp ult double* %scevgep98, %scevgep96
  %found.conflict = and i1 %bound0, %bound1
  %bound0106 = icmp ult double* %scevgep, %scevgep104
  %bound1107 = icmp ult double* %scevgep102, %scevgep96
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx = or i1 %found.conflict, %found.conflict108
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %index
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !19, !noalias !22
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !19, !noalias !22
  %109 = or i64 %index, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !25
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !25
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %index
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !25
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !25
  %118 = fsub <2 x double> %wide.load111, %wide.load113
  %119 = fsub <2 x double> %wide.load112, %wide.load114
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next74, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !26
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !26
  %124 = fadd <2 x double> %118, %wide.load115
  %125 = fadd <2 x double> %119, %wide.load116
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !26
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !26
  %130 = fsub <2 x double> %124, %wide.load117
  %131 = fsub <2 x double> %125, %wide.load118
  %132 = fmul <2 x double> %130, <double 7.000000e-01, double 7.000000e-01>
  %133 = fmul <2 x double> %131, <double 7.000000e-01, double 7.000000e-01>
  %134 = fsub <2 x double> %wide.load, %132
  %135 = fsub <2 x double> %wide.load110, %133
  %136 = bitcast double* %105 to <2 x double>*
  store <2 x double> %134, <2 x double>* %136, align 8, !alias.scope !19, !noalias !22
  %137 = bitcast double* %107 to <2 x double>*
  store <2 x double> %135, <2 x double>* %137, align 8, !alias.scope !19, !noalias !22
  %index.next = add nuw nsw i64 %index, 4
  %138 = icmp eq i64 %index.next, 1196
  br i1 %138, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv69.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph ], [ %indvars.iv69.ph, %scalar.ph.preheader ]
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  %140 = load double, double* %139, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv.next70
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv73, i64 %indvars.iv69
  %144 = load double, double* %143, align 8
  %145 = fsub double %142, %144
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next74, i64 %indvars.iv69
  %147 = load double, double* %146, align 8
  %148 = fadd double %145, %147
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv73, i64 %indvars.iv69
  %150 = load double, double* %149, align 8
  %151 = fsub double %148, %150
  %152 = fmul double %151, 7.000000e-01
  %153 = fsub double %140, %152
  store double %153, double* %139, align 8
  %exitcond72 = icmp eq i64 %indvars.iv69, 1198
  br i1 %exitcond72, label %._crit_edge30.us, label %scalar.ph, !llvm.loop !28

._crit_edge30.us:                                 ; preds = %scalar.ph
  %exitcond3 = icmp eq i64 %indvars.iv.next74, 999
  br i1 %exitcond3, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next76, 500
  br i1 %exitcond4, label %.loopexit, label %.preheader13

.loopexit:                                        ; preds = %._crit_edge33
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader13.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge32.us, %.preheader13.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next62, %._crit_edge32.us ]
  %7 = mul nuw nsw i64 %indvars.iv61, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader13.us
  %indvars.iv59 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next60, %15 ]
  %9 = add nuw nsw i64 %7, %indvars.iv59
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv59
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next60, 1200
  br i1 %exitcond4, label %._crit_edge32.us, label %8

._crit_edge32.us:                                 ; preds = %15
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next62, 1000
  br i1 %exitcond5, label %.preheader13.preheader, label %.preheader13.us

.preheader13.preheader:                           ; preds = %._crit_edge32.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge22.us, %.preheader13.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader13.preheader ], [ %indvars.iv.next57, %._crit_edge22.us ]
  %26 = mul nuw nsw i64 %indvars.iv56, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader12.us
  %indvars.iv54 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next55, %34 ]
  %28 = add nuw nsw i64 %26, %indvars.iv54
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %27, %32
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv54
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond2, label %._crit_edge22.us, label %27

._crit_edge22.us:                                 ; preds = %34
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next57, 1000
  br i1 %exitcond3, label %.preheader12.preheader, label %.preheader12.us

.preheader12.preheader:                           ; preds = %._crit_edge22.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader12.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader12.preheader ], [ %indvars.iv.next53, %._crit_edge.us ]
  %43 = mul nuw nsw i64 %indvars.iv52, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %51 ]
  %45 = add nuw nsw i64 %43, %indvars.iv
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %51

; <label>:51:                                     ; preds = %44, %49
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond1, label %.preheader.preheader, label %.preheader.us

.preheader.preheader:                             ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
