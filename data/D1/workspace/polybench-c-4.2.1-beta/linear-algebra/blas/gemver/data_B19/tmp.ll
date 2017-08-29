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
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %31

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge2

._crit_edge2:                                     ; preds = %26
  br label %31

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(i32 2000, double* %30)
  br label %31

; <label>:31:                                     ; preds = %._crit_edge2, %._crit_edge, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph6.split.us.preheader, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %12
  br label %._crit_edge7

.lr.ph6.split.us.preheader:                       ; preds = %12
  %wide.trip.count14 = zext i32 %0 to i64
  %15 = insertelement <2 x double> undef, double %13, i32 0
  %xtraiter = and i64 %wide.trip.count14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %16 = icmp eq i32 %0, 1
  %17 = fdiv double 0.000000e+00, %13
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us..lr.ph6.split.us_crit_edge, %.lr.ph6.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us..lr.ph6.split.us_crit_edge ]
  %20 = trunc i64 %indvars.iv12 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv12
  store double %21, double* %22, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %23 = trunc i64 %indvars.iv.next13 to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %6, i64 %indvars.iv12
  %26 = insertelement <2 x double> undef, double %24, i32 0
  %27 = fdiv <2 x double> %26, %15
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = fmul <2 x double> %28, <double 5.000000e-01, double 2.500000e-01>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  store double %30, double* %25, align 8
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv12
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %7, i64 %indvars.iv12
  %34 = fdiv double %24, %13
  %35 = fmul double %34, 1.250000e-01
  %36 = getelementptr inbounds double, double* %10, i64 %indvars.iv12
  store double %35, double* %36, align 8
  %37 = fdiv <2 x double> %28, <double 6.000000e+00, double 9.000000e+00>
  %38 = extractelement <2 x double> %37, i32 0
  %39 = extractelement <2 x double> %37, i32 1
  store double %38, double* %33, align 8
  %40 = getelementptr inbounds double, double* %11, i64 %indvars.iv12
  store double %39, double* %40, align 8
  %41 = getelementptr inbounds double, double* %9, i64 %indvars.iv12
  store double 0.000000e+00, double* %41, align 8
  %42 = getelementptr inbounds double, double* %8, i64 %indvars.iv12
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod, label %.lr.ph6.split.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph6.split.us..prol.loopexit_crit_edge:        ; preds = %.lr.ph6.split.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph6.split.us
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv12, i64 0
  store double %17, double* %43, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph6.split.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph6.split.us..prol.loopexit_crit_edge ]
  br i1 %16, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph6.split.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.lr.ph6.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us.new..lr.ph6.split.us.new_crit_edge, %.lr.ph6.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new..lr.ph6.split.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new.preheader ]
  %44 = mul nuw nsw i64 %indvars.iv12, %indvars.iv
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = mul nuw nsw i64 %indvars.iv12, %indvars.iv.next
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = insertelement <2 x double> undef, double %47, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fdiv <2 x double> %54, %19
  %56 = bitcast double* %48 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count14
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph6.split.us.new..lr.ph6.split.us.new_crit_edge

.lr.ph6.split.us.new..lr.ph6.split.us.new_crit_edge: ; preds = %.lr.ph6.split.us.new
  br label %.lr.ph6.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge7.loopexit, label %._crit_edge.us..lr.ph6.split.us_crit_edge

._crit_edge.us..lr.ph6.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph6.split.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %._crit_edge7.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %..preheader11.us_crit_edge, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %12
  br label %._crit_edge13

..preheader11.us_crit_edge:                       ; preds = %12
  %14 = and i32 %0, 1
  %lcmp.mod85 = icmp eq i32 %14, 0
  %15 = icmp eq i32 %0, 1
  %.pre86 = zext i32 %0 to i64
  %sunkaddr95 = ptrtoint double* %4 to i64
  %sunkaddr99 = ptrtoint double* %6 to i64
  %wide.trip.count66.1 = zext i32 %0 to i64
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr91 = ptrtoint double* %6 to i64
  %16 = add nsw i64 %wide.trip.count66.1, -2
  %17 = add nsw i64 %wide.trip.count66.1, -2
  %scevgep126 = getelementptr double, double* %5, i64 2
  %scevgep131 = getelementptr double, double* %7, i64 2
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge32.us..preheader11.us_crit_edge, %..preheader11.us_crit_edge
  %indvars.iv68 = phi i64 [ 0, %..preheader11.us_crit_edge ], [ %indvars.iv.next69, %._crit_edge32.us..preheader11.us_crit_edge ]
  %scevgep121 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 2
  br i1 %lcmp.mod85, label %.preheader11.us..prol.loopexit83_crit_edge, label %.prol.preheader82

.preheader11.us..prol.loopexit83_crit_edge:       ; preds = %.preheader11.us
  br label %.prol.loopexit83

.prol.preheader82:                                ; preds = %.preheader11.us
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 0
  %19 = load double, double* %18, align 8
  %sunkaddr88 = shl i64 %indvars.iv68, 3
  %sunkaddr89 = add i64 %sunkaddr, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  %20 = load double, double* %sunkaddr90, align 8
  %21 = load double, double* %5, align 8
  %22 = fmul double %20, %21
  %23 = fadd double %19, %22
  %sunkaddr92 = shl i64 %indvars.iv68, 3
  %sunkaddr93 = add i64 %sunkaddr91, %sunkaddr92
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to double*
  %24 = load double, double* %sunkaddr94, align 8
  %25 = load double, double* %7, align 8
  %26 = fmul double %24, %25
  %27 = fadd double %23, %26
  store double %27, double* %18, align 8
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.preheader11.us..prol.loopexit83_crit_edge, %.prol.preheader82
  %indvars.iv64.unr.ph = phi i64 [ 1, %.prol.preheader82 ], [ 0, %.preheader11.us..prol.loopexit83_crit_edge ]
  br i1 %15, label %.prol.loopexit83.._crit_edge32.us_crit_edge, label %.prol.loopexit83..preheader11.us.new_crit_edge

.prol.loopexit83.._crit_edge32.us_crit_edge:      ; preds = %.prol.loopexit83
  br label %._crit_edge32.us

.prol.loopexit83..preheader11.us.new_crit_edge:   ; preds = %.prol.loopexit83
  %sunkaddr96 = shl i64 %indvars.iv68, 3
  %sunkaddr97 = add i64 %sunkaddr95, %sunkaddr96
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  %sunkaddr100 = shl i64 %indvars.iv68, 3
  %sunkaddr101 = add i64 %sunkaddr99, %sunkaddr100
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to double*
  %28 = sub nsw i64 %16, %indvars.iv64.unr.ph
  %29 = lshr i64 %28, 1
  %30 = add nuw i64 %29, 1
  %min.iters.check = icmp ult i64 %30, 2
  br i1 %min.iters.check, label %.prol.loopexit83..preheader11.us.new_crit_edge..preheader11.us.new.preheader_crit_edge, label %min.iters.checked

.prol.loopexit83..preheader11.us.new_crit_edge..preheader11.us.new.preheader_crit_edge: ; preds = %.prol.loopexit83..preheader11.us.new_crit_edge
  br label %.preheader11.us.new.preheader

min.iters.checked:                                ; preds = %.prol.loopexit83..preheader11.us.new_crit_edge
  %n.mod.vf = and i64 %30, 1
  %n.vec = sub i64 %30, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked..preheader11.us.new.preheader_crit_edge, label %vector.memcheck

min.iters.checked..preheader11.us.new.preheader_crit_edge: ; preds = %min.iters.checked
  br label %.preheader11.us.new.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv64.unr.ph
  %scevgep119120 = bitcast double* %scevgep119 to i8*
  %31 = sub nsw i64 %17, %indvars.iv64.unr.ph
  %32 = and i64 %31, -2
  %33 = or i64 %indvars.iv64.unr.ph, %32
  %scevgep122 = getelementptr double, double* %scevgep121, i64 %33
  %scevgep122123 = bitcast double* %scevgep122 to i8*
  %scevgep124 = getelementptr double, double* %5, i64 %indvars.iv64.unr.ph
  %scevgep127 = getelementptr double, double* %scevgep126, i64 %33
  %scevgep129 = getelementptr double, double* %7, i64 %indvars.iv64.unr.ph
  %scevgep132 = getelementptr double, double* %scevgep131, i64 %33
  %bc = inttoptr i64 %sunkaddr97 to i8*
  %bc134 = inttoptr i64 %sunkaddr97 to i8*
  %bound0 = icmp ult i8* %scevgep119120, %bc134
  %bound1 = icmp ult i8* %bc, %scevgep122123
  %found.conflict = and i1 %bound0, %bound1
  %bound0135 = icmp ult double* %scevgep119, %scevgep127
  %bound1136 = icmp ult double* %scevgep124, %scevgep122
  %found.conflict137 = and i1 %bound0135, %bound1136
  %conflict.rdx = or i1 %found.conflict, %found.conflict137
  %bc138 = inttoptr i64 %sunkaddr101 to i8*
  %bc139 = inttoptr i64 %sunkaddr101 to i8*
  %bound0140 = icmp ult i8* %scevgep119120, %bc139
  %bound1141 = icmp ult i8* %bc138, %scevgep122123
  %found.conflict142 = and i1 %bound0140, %bound1141
  %conflict.rdx143 = or i1 %conflict.rdx, %found.conflict142
  %bound0144 = icmp ult double* %scevgep119, %scevgep132
  %bound1145 = icmp ult double* %scevgep129, %scevgep122
  %found.conflict146 = and i1 %bound0144, %bound1145
  %conflict.rdx147 = or i1 %conflict.rdx143, %found.conflict146
  %34 = or i64 %indvars.iv64.unr.ph, 2
  %35 = shl nuw i64 %29, 1
  %36 = add i64 %34, %35
  %37 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %36, %37
  br i1 %conflict.rdx147, label %vector.memcheck..preheader11.us.new.preheader_crit_edge, label %vector.body.preheader

vector.memcheck..preheader11.us.new.preheader_crit_edge: ; preds = %vector.memcheck
  br label %.preheader11.us.new.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %38 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv64.unr.ph, %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 %offset.idx
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec148 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %41 = load double, double* %sunkaddr98, align 8, !alias.scope !9
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec149 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !10
  %strided.vec150 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec151 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fmul <2 x double> %43, %strided.vec150
  %47 = fadd <2 x double> %strided.vec, %46
  %48 = load double, double* %sunkaddr102, align 8, !alias.scope !11
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec152 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !12
  %strided.vec153 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec154 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fmul <2 x double> %50, %strided.vec153
  %54 = fadd <2 x double> %47, %53
  %55 = add nuw nsw i64 %offset.idx, 1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 %55
  %57 = load double, double* %sunkaddr98, align 8, !alias.scope !9
  %58 = insertelement <2 x double> undef, double %57, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = fmul <2 x double> %59, %strided.vec151
  %61 = fadd <2 x double> %strided.vec148, %60
  %62 = load double, double* %sunkaddr102, align 8, !alias.scope !11
  %63 = insertelement <2 x double> undef, double %62, i32 0
  %64 = shufflevector <2 x double> %63, <2 x double> undef, <2 x i32> zeroinitializer
  %65 = fmul <2 x double> %64, %strided.vec154
  %66 = fadd <2 x double> %61, %65
  %67 = getelementptr double, double* %56, i64 -1
  %68 = bitcast double* %67 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %54, <2 x double> %66, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %68, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %69 = icmp eq i64 %index.next, %n.vec
  br i1 %69, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge32.us_crit_edge, label %middle.block..preheader11.us.new.preheader_crit_edge

middle.block..preheader11.us.new.preheader_crit_edge: ; preds = %middle.block
  br label %.preheader11.us.new.preheader

middle.block.._crit_edge32.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge32.us

.preheader11.us.new.preheader:                    ; preds = %middle.block..preheader11.us.new.preheader_crit_edge, %vector.memcheck..preheader11.us.new.preheader_crit_edge, %min.iters.checked..preheader11.us.new.preheader_crit_edge, %.prol.loopexit83..preheader11.us.new_crit_edge..preheader11.us.new.preheader_crit_edge
  %indvars.iv64.ph = phi i64 [ %indvars.iv64.unr.ph, %vector.memcheck..preheader11.us.new.preheader_crit_edge ], [ %indvars.iv64.unr.ph, %min.iters.checked..preheader11.us.new.preheader_crit_edge ], [ %indvars.iv64.unr.ph, %.prol.loopexit83..preheader11.us.new_crit_edge..preheader11.us.new.preheader_crit_edge ], [ %ind.end, %middle.block..preheader11.us.new.preheader_crit_edge ]
  br label %.preheader11.us.new

.preheader11.us.new:                              ; preds = %.preheader11.us.new..preheader11.us.new_crit_edge, %.preheader11.us.new.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %.preheader11.us.new..preheader11.us.new_crit_edge ], [ %indvars.iv64.ph, %.preheader11.us.new.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv64
  %71 = load double, double* %70, align 8
  %72 = load double, double* %sunkaddr98, align 8
  %73 = getelementptr inbounds double, double* %5, i64 %indvars.iv64
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %71, %75
  %77 = load double, double* %sunkaddr102, align 8
  %78 = getelementptr inbounds double, double* %7, i64 %indvars.iv64
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %76, %80
  store double %81, double* %70, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv.next65
  %83 = load double, double* %82, align 8
  %84 = load double, double* %sunkaddr98, align 8
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next65
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %83, %87
  %89 = load double, double* %sunkaddr102, align 8
  %90 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next65
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fadd double %88, %92
  store double %93, double* %82, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next65.1, %wide.trip.count66.1
  br i1 %exitcond67.1, label %._crit_edge32.us.loopexit, label %.preheader11.us.new..preheader11.us.new_crit_edge, !llvm.loop !16

.preheader11.us.new..preheader11.us.new_crit_edge: ; preds = %.preheader11.us.new
  br label %.preheader11.us.new

._crit_edge32.us.loopexit:                        ; preds = %.preheader11.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %middle.block.._crit_edge32.us_crit_edge, %.prol.loopexit83.._crit_edge32.us_crit_edge, %._crit_edge32.us.loopexit
  %wide.trip.count70.pre-phi = phi i64 [ %.pre86, %.prol.loopexit83.._crit_edge32.us_crit_edge ], [ %wide.trip.count66.1, %middle.block.._crit_edge32.us_crit_edge ], [ %wide.trip.count66.1, %._crit_edge32.us.loopexit ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70.pre-phi
  br i1 %exitcond71, label %.preheader10..preheader9.us_crit_edge, label %._crit_edge32.us..preheader11.us_crit_edge

._crit_edge32.us..preheader11.us_crit_edge:       ; preds = %._crit_edge32.us
  br label %.preheader11.us

.preheader10..preheader9.us_crit_edge:            ; preds = %._crit_edge32.us
  %94 = icmp eq i32 %14, 0
  %95 = icmp eq i32 %0, 1
  %sunkaddr107 = ptrtoint double* %9 to i64
  %sunkaddr103 = ptrtoint double* %9 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge23.us..preheader9.us_crit_edge, %.preheader10..preheader9.us_crit_edge
  %indvars.iv59 = phi i64 [ 0, %.preheader10..preheader9.us_crit_edge ], [ %indvars.iv.next60, %._crit_edge23.us..preheader9.us_crit_edge ]
  %96 = getelementptr inbounds double, double* %9, i64 %indvars.iv59
  %.pre = load double, double* %96, align 8
  br i1 %94, label %.preheader9.us..prol.loopexit78_crit_edge, label %.prol.preheader77

.preheader9.us..prol.loopexit78_crit_edge:        ; preds = %.preheader9.us
  br label %.prol.loopexit78

.prol.preheader77:                                ; preds = %.preheader9.us
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv59
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, %2
  %100 = load double, double* %10, align 8
  %101 = fmul double %99, %100
  %102 = fadd double %.pre, %101
  %sunkaddr104 = shl i64 %indvars.iv59, 3
  %sunkaddr105 = add i64 %sunkaddr103, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  store double %102, double* %sunkaddr106, align 8
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.preheader9.us..prol.loopexit78_crit_edge, %.prol.preheader77
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader77 ], [ 0, %.preheader9.us..prol.loopexit78_crit_edge ]
  %.unr81.ph = phi double [ %102, %.prol.preheader77 ], [ %.pre, %.preheader9.us..prol.loopexit78_crit_edge ]
  br i1 %95, label %.prol.loopexit78.._crit_edge23.us_crit_edge, label %.prol.loopexit78..preheader9.us.new_crit_edge

.prol.loopexit78.._crit_edge23.us_crit_edge:      ; preds = %.prol.loopexit78
  br label %._crit_edge23.us

.prol.loopexit78..preheader9.us.new_crit_edge:    ; preds = %.prol.loopexit78
  %sunkaddr108 = shl i64 %indvars.iv59, 3
  %sunkaddr109 = add i64 %sunkaddr107, %sunkaddr108
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to double*
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new..preheader9.us.new_crit_edge, %.prol.loopexit78..preheader9.us.new_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %.prol.loopexit78..preheader9.us.new_crit_edge ], [ %indvars.iv.next56.1, %.preheader9.us.new..preheader9.us.new_crit_edge ]
  %103 = phi double [ %.unr81.ph, %.prol.loopexit78..preheader9.us.new_crit_edge ], [ %117, %.preheader9.us.new..preheader9.us.new_crit_edge ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv55, i64 %indvars.iv59
  %105 = load double, double* %104, align 8
  %106 = fmul double %105, %2
  %107 = getelementptr inbounds double, double* %10, i64 %indvars.iv55
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fadd double %103, %109
  store double %110, double* %sunkaddr110, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next56, i64 %indvars.iv59
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, %2
  %114 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next56
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fadd double %110, %116
  store double %117, double* %sunkaddr110, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count70.pre-phi
  br i1 %exitcond58.1, label %._crit_edge23.us.loopexit, label %.preheader9.us.new..preheader9.us.new_crit_edge

.preheader9.us.new..preheader9.us.new_crit_edge:  ; preds = %.preheader9.us.new
  br label %.preheader9.us.new

._crit_edge23.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %.prol.loopexit78.._crit_edge23.us_crit_edge, %._crit_edge23.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count70.pre-phi
  br i1 %exitcond62, label %.lr.ph19, label %._crit_edge23.us..preheader9.us_crit_edge

._crit_edge23.us..preheader9.us_crit_edge:        ; preds = %._crit_edge23.us
  br label %.preheader9.us

.lr.ph19:                                         ; preds = %._crit_edge23.us
  %118 = add nsw i64 %wide.trip.count70.pre-phi, -1
  %xtraiter75 = and i64 %wide.trip.count70.pre-phi, 3
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod76, label %.lr.ph19..prol.loopexit74_crit_edge, label %.prol.preheader73.preheader

.lr.ph19..prol.loopexit74_crit_edge:              ; preds = %.lr.ph19
  br label %.prol.loopexit74

.prol.preheader73.preheader:                      ; preds = %.lr.ph19
  br label %.prol.preheader73

.prol.preheader73:                                ; preds = %.prol.preheader73..prol.preheader73_crit_edge, %.prol.preheader73.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.prol.preheader73..prol.preheader73_crit_edge ], [ 0, %.prol.preheader73.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader73..prol.preheader73_crit_edge ], [ %xtraiter75, %.prol.preheader73.preheader ]
  %119 = getelementptr inbounds double, double* %9, i64 %indvars.iv51.prol
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %11, i64 %indvars.iv51.prol
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  store double %123, double* %119, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit74.loopexit, label %.prol.preheader73..prol.preheader73_crit_edge, !llvm.loop !17

.prol.preheader73..prol.preheader73_crit_edge:    ; preds = %.prol.preheader73
  br label %.prol.preheader73

.prol.loopexit74.loopexit:                        ; preds = %.prol.preheader73
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.lr.ph19..prol.loopexit74_crit_edge, %.prol.loopexit74.loopexit
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph19..prol.loopexit74_crit_edge ], [ %indvars.iv.next52.prol, %.prol.loopexit74.loopexit ]
  %124 = icmp ult i64 %118, 3
  br i1 %124, label %.prol.loopexit74..preheader7..preheader.us_crit_edge_crit_edge, label %.lr.ph19.new.preheader

.prol.loopexit74..preheader7..preheader.us_crit_edge_crit_edge: ; preds = %.prol.loopexit74
  br label %.preheader7..preheader.us_crit_edge

.lr.ph19.new.preheader:                           ; preds = %.prol.loopexit74
  %125 = add nsw i64 %wide.trip.count70.pre-phi, -4
  %126 = sub i64 %125, %indvars.iv51.unr
  %127 = lshr i64 %126, 2
  %128 = add nuw nsw i64 %127, 1
  %min.iters.check158 = icmp ult i64 %128, 2
  br i1 %min.iters.check158, label %.lr.ph19.new.preheader..lr.ph19.new.preheader198_crit_edge, label %min.iters.checked159

.lr.ph19.new.preheader..lr.ph19.new.preheader198_crit_edge: ; preds = %.lr.ph19.new.preheader
  br label %.lr.ph19.new.preheader198

.lr.ph19.new.preheader198:                        ; preds = %middle.block156..lr.ph19.new.preheader198_crit_edge, %vector.memcheck176..lr.ph19.new.preheader198_crit_edge, %min.iters.checked159..lr.ph19.new.preheader198_crit_edge, %.lr.ph19.new.preheader..lr.ph19.new.preheader198_crit_edge
  %indvars.iv51.ph = phi i64 [ %indvars.iv51.unr, %vector.memcheck176..lr.ph19.new.preheader198_crit_edge ], [ %indvars.iv51.unr, %min.iters.checked159..lr.ph19.new.preheader198_crit_edge ], [ %indvars.iv51.unr, %.lr.ph19.new.preheader..lr.ph19.new.preheader198_crit_edge ], [ %ind.end181, %middle.block156..lr.ph19.new.preheader198_crit_edge ]
  br label %.lr.ph19.new

min.iters.checked159:                             ; preds = %.lr.ph19.new.preheader
  %n.mod.vf160 = and i64 %128, 1
  %n.vec161 = sub nsw i64 %128, %n.mod.vf160
  %cmp.zero162 = icmp eq i64 %n.vec161, 0
  br i1 %cmp.zero162, label %min.iters.checked159..lr.ph19.new.preheader198_crit_edge, label %vector.memcheck176

min.iters.checked159..lr.ph19.new.preheader198_crit_edge: ; preds = %min.iters.checked159
  br label %.lr.ph19.new.preheader198

vector.memcheck176:                               ; preds = %min.iters.checked159
  %scevgep164 = getelementptr double, double* %9, i64 %indvars.iv51.unr
  %129 = add nsw i64 %wide.trip.count70.pre-phi, -4
  %130 = sub i64 %129, %indvars.iv51.unr
  %131 = and i64 %130, -4
  %132 = add i64 %indvars.iv51.unr, %131
  %133 = add i64 %132, 4
  %scevgep166 = getelementptr double, double* %9, i64 %133
  %scevgep168 = getelementptr double, double* %11, i64 %indvars.iv51.unr
  %scevgep170 = getelementptr double, double* %11, i64 %133
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  %134 = shl nuw i64 %127, 2
  %135 = add i64 %indvars.iv51.unr, %134
  %136 = add i64 %135, 4
  %137 = shl nuw nsw i64 %n.mod.vf160, 2
  %ind.end181 = sub i64 %136, %137
  br i1 %memcheck.conflict175, label %vector.memcheck176..lr.ph19.new.preheader198_crit_edge, label %vector.body155.preheader

vector.memcheck176..lr.ph19.new.preheader198_crit_edge: ; preds = %vector.memcheck176
  br label %.lr.ph19.new.preheader198

vector.body155.preheader:                         ; preds = %vector.memcheck176
  br label %vector.body155

vector.body155:                                   ; preds = %vector.body155.vector.body155_crit_edge, %vector.body155.preheader
  %index178 = phi i64 [ %index.next179, %vector.body155.vector.body155_crit_edge ], [ 0, %vector.body155.preheader ]
  %138 = shl i64 %index178, 2
  %139 = add i64 %indvars.iv51.unr, %138
  %140 = getelementptr inbounds double, double* %9, i64 %139
  %141 = bitcast double* %140 to <8 x double>*
  %wide.vec187 = load <8 x double>, <8 x double>* %141, align 8, !alias.scope !19, !noalias !22
  %142 = getelementptr inbounds double, double* %11, i64 %139
  %143 = bitcast double* %142 to <8 x double>*
  %wide.vec192 = load <8 x double>, <8 x double>* %143, align 8, !alias.scope !22
  %144 = fadd <8 x double> %wide.vec187, %wide.vec192
  %145 = shufflevector <8 x double> %144, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %146 = fadd <8 x double> %wide.vec187, %wide.vec192
  %147 = shufflevector <8 x double> %146, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %148 = fadd <8 x double> %wide.vec187, %wide.vec192
  %149 = shufflevector <8 x double> %148, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %150 = add nsw i64 %139, 3
  %151 = getelementptr inbounds double, double* %9, i64 %150
  %152 = fadd <8 x double> %wide.vec187, %wide.vec192
  %153 = shufflevector <8 x double> %152, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %154 = getelementptr double, double* %151, i64 -3
  %155 = bitcast double* %154 to <8 x double>*
  %156 = shufflevector <2 x double> %145, <2 x double> %147, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %157 = shufflevector <2 x double> %149, <2 x double> %153, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec197 = shufflevector <4 x double> %156, <4 x double> %157, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec197, <8 x double>* %155, align 8, !alias.scope !19, !noalias !22
  %index.next179 = add i64 %index178, 2
  %158 = icmp eq i64 %index.next179, %n.vec161
  br i1 %158, label %middle.block156, label %vector.body155.vector.body155_crit_edge, !llvm.loop !24

vector.body155.vector.body155_crit_edge:          ; preds = %vector.body155
  br label %vector.body155

middle.block156:                                  ; preds = %vector.body155
  %cmp.n182 = icmp eq i64 %n.mod.vf160, 0
  br i1 %cmp.n182, label %middle.block156..preheader7..preheader.us_crit_edge_crit_edge, label %middle.block156..lr.ph19.new.preheader198_crit_edge

middle.block156..lr.ph19.new.preheader198_crit_edge: ; preds = %middle.block156
  br label %.lr.ph19.new.preheader198

middle.block156..preheader7..preheader.us_crit_edge_crit_edge: ; preds = %middle.block156
  br label %.preheader7..preheader.us_crit_edge

.preheader7..preheader.us_crit_edge.loopexit:     ; preds = %.lr.ph19.new
  br label %.preheader7..preheader.us_crit_edge

.preheader7..preheader.us_crit_edge:              ; preds = %middle.block156..preheader7..preheader.us_crit_edge_crit_edge, %.prol.loopexit74..preheader7..preheader.us_crit_edge_crit_edge, %.preheader7..preheader.us_crit_edge.loopexit
  %159 = icmp eq i32 %14, 0
  %160 = icmp eq i32 %0, 1
  %sunkaddr115 = ptrtoint double* %8 to i64
  %sunkaddr111 = ptrtoint double* %8 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader7..preheader.us_crit_edge
  %indvars.iv46 = phi i64 [ 0, %.preheader7..preheader.us_crit_edge ], [ %indvars.iv.next47, %._crit_edge.us..preheader.us_crit_edge ]
  %161 = getelementptr inbounds double, double* %8, i64 %indvars.iv46
  %.pre42 = load double, double* %161, align 8
  br i1 %159, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 0
  %163 = load double, double* %162, align 8
  %164 = fmul double %163, %1
  %165 = load double, double* %9, align 8
  %166 = fmul double %164, %165
  %167 = fadd double %.pre42, %166
  %sunkaddr112 = shl i64 %indvars.iv46, 3
  %sunkaddr113 = add i64 %sunkaddr111, %sunkaddr112
  %sunkaddr114 = inttoptr i64 %sunkaddr113 to double*
  store double %167, double* %sunkaddr114, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %167, %.prol.preheader ], [ %.pre42, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 %160, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.prol.loopexit..preheader.us.new_crit_edge

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.prol.loopexit..preheader.us.new_crit_edge:       ; preds = %.prol.loopexit
  %sunkaddr116 = shl i64 %indvars.iv46, 3
  %sunkaddr117 = add i64 %sunkaddr115, %sunkaddr116
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to double*
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.prol.loopexit..preheader.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.prol.loopexit..preheader.us.new_crit_edge ], [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ]
  %168 = phi double [ %.unr.ph, %.prol.loopexit..preheader.us.new_crit_edge ], [ %182, %.preheader.us.new..preheader.us.new_crit_edge ]
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv
  %170 = load double, double* %169, align 8
  %171 = fmul double %170, %1
  %172 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %173 = load double, double* %172, align 8
  %174 = fmul double %171, %173
  %175 = fadd double %168, %174
  store double %175, double* %sunkaddr118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next
  %177 = load double, double* %176, align 8
  %178 = fmul double %177, %1
  %179 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %180 = load double, double* %179, align 8
  %181 = fmul double %178, %180
  %182 = fadd double %175, %181
  store double %182, double* %sunkaddr118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count70.pre-phi
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count70.pre-phi
  br i1 %exitcond49, label %._crit_edge13.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph19.new:                                     ; preds = %.lr.ph19.new..lr.ph19.new_crit_edge, %.lr.ph19.new.preheader198
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.3, %.lr.ph19.new..lr.ph19.new_crit_edge ], [ %indvars.iv51.ph, %.lr.ph19.new.preheader198 ]
  %183 = getelementptr inbounds double, double* %9, i64 %indvars.iv51
  %184 = load double, double* %183, align 8
  %185 = getelementptr inbounds double, double* %11, i64 %indvars.iv51
  %186 = load double, double* %185, align 8
  %187 = fadd double %184, %186
  store double %187, double* %183, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %188 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next52
  %189 = load double, double* %188, align 8
  %190 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next52
  %191 = load double, double* %190, align 8
  %192 = fadd double %189, %191
  store double %192, double* %188, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %193 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next52.1
  %194 = load double, double* %193, align 8
  %195 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next52.1
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  store double %197, double* %193, align 8
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %198 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next52.2
  %199 = load double, double* %198, align 8
  %200 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next52.2
  %201 = load double, double* %200, align 8
  %202 = fadd double %199, %201
  store double %202, double* %198, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %exitcond54.3 = icmp eq i64 %indvars.iv.next52.3, %wide.trip.count70.pre-phi
  br i1 %exitcond54.3, label %.preheader7..preheader.us_crit_edge.loopexit, label %.lr.ph19.new..lr.ph19.new_crit_edge, !llvm.loop !25

.lr.ph19.new..lr.ph19.new_crit_edge:              ; preds = %.lr.ph19.new
  br label %.lr.ph19.new

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %..lr.ph_crit_edge, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

..lr.ph_crit_edge:                                ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge4, %..lr.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next, %..lr.ph_crit_edge4 ]
  %8 = phi i32 [ 0, %..lr.ph_crit_edge ], [ %18, %..lr.ph_crit_edge4 ]
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph._crit_edge, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = add nuw nsw i32 %8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %..lr.ph_crit_edge4

..lr.ph_crit_edge4:                               ; preds = %13
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}
