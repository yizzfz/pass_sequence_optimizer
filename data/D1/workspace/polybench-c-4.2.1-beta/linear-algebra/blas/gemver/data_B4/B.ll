; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  tail call fastcc void @print_array(i32 2000, double* %19)
  br label %30

; <label>:30:                                     ; preds = %26, %29, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  tail call void @free(i8* %10) #4
  tail call void @free(i8* %11) #4
  tail call void @free(i8* %12) #4
  tail call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph4:
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us, %.lr.ph4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4 ]
  %12 = trunc i64 %indvars.iv5 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %13, double* %14, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %15 = trunc i64 %indvars.iv.next6 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %6, i64 %indvars.iv5
  %18 = insertelement <2 x double> undef, double %16, i32 0
  %19 = fdiv <2 x double> %18, <double 2.000000e+03, double undef>
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = fdiv <2 x double> %20, <double 2.000000e+00, double 4.000000e+00>
  %22 = extractelement <2 x double> %21, i32 0
  %23 = extractelement <2 x double> %21, i32 1
  store double %22, double* %17, align 8
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv5
  store double %23, double* %24, align 8
  %25 = getelementptr inbounds double, double* %7, i64 %indvars.iv5
  %26 = fdiv <2 x double> %20, <double 6.000000e+00, double 8.000000e+00>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %25, align 8
  %29 = getelementptr inbounds double, double* %10, i64 %indvars.iv5
  store double %28, double* %29, align 8
  %30 = fdiv double %16, 2.000000e+03
  %31 = fdiv double %30, 9.000000e+00
  %32 = getelementptr inbounds double, double* %11, i64 %indvars.iv5
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %9, i64 %indvars.iv5
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv5
  store double 0.000000e+00, double* %34, align 8
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ 0, %.lr.ph.us ]
  %35 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 2.000000e+03
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %41 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 2000
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 2.000000e+03
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %45, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %.lr.ph.us.new

..loopexit_crit_edge.us:                          ; preds = %.lr.ph.us.new
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond8, label %._crit_edge, label %.lr.ph.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader8.us.preheader:
  %scevgep61 = getelementptr double, double* %5, i64 2000
  %scevgep63 = getelementptr double, double* %7, i64 2000
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge20.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge20.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv42, i64 0
  %12 = add i64 %indvars.iv42, 1
  %scevgep59 = getelementptr [2000 x double], [2000 x double]* %3, i64 %12, i64 0
  %13 = getelementptr inbounds double, double* %4, i64 %indvars.iv42
  %14 = getelementptr inbounds double, double* %6, i64 %indvars.iv42
  %bound0 = icmp ult double* %scevgep, %13
  %bound1 = icmp ult double* %13, %scevgep59
  %found.conflict = and i1 %bound0, %bound1
  %bound066 = icmp ult double* %scevgep, %scevgep61
  %bound167 = icmp ugt double* %scevgep59, %5
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  %bound071 = icmp ult double* %scevgep, %14
  %bound172 = icmp ult double* %14, %scevgep59
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx, %found.conflict73
  %bound075 = icmp ult double* %scevgep, %scevgep63
  %bound176 = icmp ugt double* %scevgep59, %7
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx78 = or i1 %conflict.rdx74, %found.conflict77
  br i1 %conflict.rdx78, label %.preheader8.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader8.us
  br label %vector.body

.preheader8.us.new.preheader:                     ; preds = %.preheader8.us
  br label %.preheader8.us.new

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv42, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec79 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = load double, double* %13, align 8, !alias.scope !9
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec80 = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !10
  %strided.vec81 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec82 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %19, %strided.vec81
  %23 = fadd <2 x double> %strided.vec, %22
  %24 = load double, double* %14, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !12
  %strided.vec84 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fmul <2 x double> %26, %strided.vec84
  %30 = fadd <2 x double> %23, %29
  %31 = or i64 %offset.idx, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv42, i64 %31
  %33 = load double, double* %13, align 8, !alias.scope !9
  %34 = insertelement <2 x double> undef, double %33, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = fmul <2 x double> %35, %strided.vec82
  %37 = fadd <2 x double> %strided.vec79, %36
  %38 = load double, double* %14, align 8, !alias.scope !11
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = fmul <2 x double> %40, %strided.vec85
  %42 = fadd <2 x double> %37, %41
  %43 = getelementptr double, double* %32, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %30, <2 x double> %42, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %45 = icmp eq i64 %index.next, 1000
  br i1 %45, label %._crit_edge20.us.loopexit149, label %vector.body, !llvm.loop !13

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.preheader8.us.new ], [ 0, %.preheader8.us.new.preheader ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv38
  %47 = load double, double* %46, align 8
  %48 = load double, double* %13, align 8
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv38
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %47, %51
  %53 = load double, double* %14, align 8
  %54 = getelementptr inbounds double, double* %7, i64 %indvars.iv38
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %52, %56
  store double %57, double* %46, align 8
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv.next39
  %59 = load double, double* %58, align 8
  %60 = load double, double* %13, align 8
  %61 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next39
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %59, %63
  %65 = load double, double* %14, align 8
  %66 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next39
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %64, %68
  store double %69, double* %58, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next39.1, 2000
  br i1 %exitcond41.1, label %._crit_edge20.us.loopexit, label %.preheader8.us.new, !llvm.loop !16

._crit_edge20.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge20.us

._crit_edge20.us.loopexit149:                     ; preds = %vector.body
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit149, %._crit_edge20.us.loopexit
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond45, label %.preheader6.us.preheader, label %.preheader8.us

.preheader6.us.preheader:                         ; preds = %._crit_edge20.us
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge16.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  %70 = getelementptr inbounds double, double* %9, i64 %indvars.iv34
  %.pre = load double, double* %70, align 8
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us, %.preheader6.us.new
  %71 = phi double [ %85, %.preheader6.us.new ], [ %.pre, %.preheader6.us ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader6.us.new ], [ 0, %.preheader6.us ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv34
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %2
  %75 = getelementptr inbounds double, double* %10, i64 %indvars.iv30
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %71, %77
  store double %78, double* %70, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next31, i64 %indvars.iv34
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %2
  %82 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next31
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %78, %84
  store double %85, double* %70, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, 2000
  br i1 %exitcond33.1, label %._crit_edge16.us, label %.preheader6.us.new

._crit_edge16.us:                                 ; preds = %.preheader6.us.new
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond37, label %vector.memcheck127, label %.preheader6.us

vector.memcheck127:                               ; preds = %._crit_edge16.us
  %scevgep119 = getelementptr double, double* %9, i64 2000
  %scevgep121 = getelementptr double, double* %11, i64 2000
  %bound0123 = icmp ugt double* %scevgep121, %9
  %bound1124 = icmp ugt double* %scevgep119, %11
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  br i1 %memcheck.conflict126, label %.lr.ph13.preheader, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %vector.memcheck127
  br label %vector.body114

.lr.ph13.preheader:                               ; preds = %vector.memcheck127
  br label %.lr.ph13

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index129 = phi i64 [ %index.next130, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %offset.idx133 = shl i64 %index129, 2
  %86 = getelementptr inbounds double, double* %9, i64 %offset.idx133
  %87 = bitcast double* %86 to <8 x double>*
  %wide.vec137 = load <8 x double>, <8 x double>* %87, align 8, !alias.scope !17, !noalias !20
  %88 = getelementptr inbounds double, double* %11, i64 %offset.idx133
  %89 = bitcast double* %88 to <8 x double>*
  %wide.vec142 = load <8 x double>, <8 x double>* %89, align 8, !alias.scope !20
  %90 = fadd <8 x double> %wide.vec137, %wide.vec142
  %91 = shufflevector <8 x double> %90, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %92 = fadd <8 x double> %wide.vec137, %wide.vec142
  %93 = shufflevector <8 x double> %92, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %94 = fadd <8 x double> %wide.vec137, %wide.vec142
  %95 = shufflevector <8 x double> %94, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %96 = or i64 %offset.idx133, 3
  %97 = getelementptr inbounds double, double* %9, i64 %96
  %98 = fadd <8 x double> %wide.vec137, %wide.vec142
  %99 = shufflevector <8 x double> %98, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %100 = getelementptr double, double* %97, i64 -3
  %101 = bitcast double* %100 to <8 x double>*
  %102 = shufflevector <2 x double> %91, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %103 = shufflevector <2 x double> %95, <2 x double> %99, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec147 = shufflevector <4 x double> %102, <4 x double> %103, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec147, <8 x double>* %101, align 8, !alias.scope !17, !noalias !20
  %index.next130 = add i64 %index129, 2
  %104 = icmp eq i64 %index.next130, 500
  br i1 %104, label %.preheader.us.preheader.loopexit148, label %vector.body114, !llvm.loop !22

.preheader.us.preheader.loopexit:                 ; preds = %.lr.ph13
  br label %.preheader.us.preheader

.preheader.us.preheader.loopexit148:              ; preds = %vector.body114
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit148, %.preheader.us.preheader.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %105 = getelementptr inbounds double, double* %8, i64 %indvars.iv22
  %.pre57 = load double, double* %105, align 8
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %106 = phi double [ %120, %.preheader.us.new ], [ %.pre57, %.preheader.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %1
  %110 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fadd double %106, %112
  store double %113, double* %105, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %1
  %117 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %113, %119
  store double %120, double* %105, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond25, label %._crit_edge11, label %.preheader.us

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.3, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %121 = getelementptr inbounds double, double* %9, i64 %indvars.iv26
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %11, i64 %indvars.iv26
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  store double %125, double* %121, align 8
  %indvars.iv.next27 = or i64 %indvars.iv26, 1
  %126 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  store double %130, double* %126, align 8
  %indvars.iv.next27.1 = or i64 %indvars.iv26, 2
  %131 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27.1
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27.1
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  store double %135, double* %131, align 8
  %indvars.iv.next27.2 = or i64 %indvars.iv26, 3
  %136 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27.2
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27.2
  %139 = load double, double* %138, align 8
  %140 = fadd double %137, %139
  store double %140, double* %136, align 8
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  %exitcond29.3 = icmp eq i64 %indvars.iv.next27.3, 2000
  br i1 %exitcond29.3, label %.preheader.us.preheader.loopexit, label %.lr.ph13, !llvm.loop !23

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %11
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
